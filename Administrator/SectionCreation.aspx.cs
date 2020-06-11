using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Data.SqlClient;

public partial class Administrator_SectionCreation : System.Web.UI.Page
{
    Utility objUtl = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
           
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            objUtl.FillDropDownList("Select CourseId, CourseShortName From CourseDetails Order By CourseShortname", ddlCourse, "CourseShortName", "CourseId");
            objUtl.FillDropDownList("Select BatchId, Batch From BatchDetails Order By Batch", ddlBatch, "Batch", "BatchId");
            if (Session["sId"] == null)
            {
                ViewState["opCode"] = 0;
                ViewState["sId"] = "";
            }
            else
            {
                ViewState["opCode"] = 1;
                ViewState["sId"] = Session["sId"];
                FillDataInControls(ViewState["sId"].ToString());
                Session["sId"] = null;
                btnSubmit.Text = "UPDATE";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sId = ViewState["sId"].ToString();
        if (objUtl.CheckExistence("SectionId", "SectionDetails", "SectionName = '" + txtSectionName.Text + "' And CourseId = '" + ddlCourse.SelectedValue + "' And BatchId = '" + ddlBatch.SelectedValue + "' And SectionId <> '" + ViewState["sId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN SECTION (" + txtSectionName.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            string sqlQuery = "";
            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery = "Select * From SectionDetails Where 1 = 2";
                sId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery = "Select * From SectionDetails Where SectionId = '" + sId + "'";
            }
            SqlDataAdapter sDta = new SqlDataAdapter(sqlQuery, sCon);
            SqlCommandBuilder sCmb = new SqlCommandBuilder(sDta);
            DataTable dtTable = new DataTable();
            sDta.Fill(dtTable);
            DataRow dtRow;
            if (dtTable.Rows.Count > 0)
            {
                dtRow = dtTable.Rows[0];
            }
            else
            {
                dtRow = dtTable.NewRow();
            }
            try
            {
                dtRow["SectionId"] = sId.ToString();
                dtRow["CourseId"] = ddlCourse.SelectedValue;
                dtRow["BatchId"] = ddlBatch.SelectedValue;
                dtRow["SectionName"] = txtSectionName.Text;
                dtRow["Comments"] = txtComments.Text;
                if (ViewState["opCode"].Equals(0))
                {
                    dtRow["CreationDate"] = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                    dtRow["CreationBy"] = Session["UserId"].ToString();
                }
                else
                {
                    dtRow["ModificationDate"] = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                    dtRow["ModificationBy"] = Session["UserId"].ToString();
                }
                if (dtTable.Rows.Count == 0)
                {
                    dtTable.Rows.Add(dtRow);
                }
                sDta.Update(dtTable);
                objUtl.ShowMessage("Success", "<b>SUCCESS!</b> RECORD HAS BEEN SAVED SUCCESSFULLY.", lblMessage);
                ClearText();
                sDta.Dispose();
                dtTable = null;
                ViewState["opCode"] = 0;
                ViewState["sId"] = "";
            }
            catch (Exception ex)
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN SAVING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
            sCon.Close();
            sCon.Dispose();
        }
    }

    public void FillDataInControls(string sId)
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select a.*, b.CourseId, b.CourseShortName, c.BatchId, c.Batch from SectionDetails a, CourseDetails b, BatchDetails c where a.CourseId = b.CourseId and a.BatchId=c.BatchId And a.SectionId = '" + sId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtSectionName.Text = sDtr["SectionName"].ToString();
                txtComments.Text = sDtr["Comments"].ToString();
                ddlCourse.SelectedValue = sDtr["CourseId"].ToString();
                ddlBatch.SelectedValue = sDtr["BatchId"].ToString();
            }
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
        }
        catch (Exception ex)
        {
            objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN LOADING THE DATA, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
        }
    }
    public void ClearText()
    {
        txtSectionName.Text = "";
        ddlCourse.SelectedIndex = 0;
        ddlBatch.SelectedIndex = 0;        
        txtComments.Text = "";
        btnSubmit.Text = "SUBMIT";
    }   
}