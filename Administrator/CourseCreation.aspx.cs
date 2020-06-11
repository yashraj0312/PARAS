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

public partial class Administrator_CourseCreation : System.Web.UI.Page
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
           if (Session["cId"] == null)
            {
                ViewState["opCode"] = 0;
                ViewState["cId"] = "";
            }
            else
            {
                ViewState["opCode"] = 1;
                ViewState["cId"] = Session["cId"];
                FillDataInControls(ViewState["cId"].ToString());
                Session["cId"] = null;
                btnSubmit.Text = "UPDATE";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string cId = ViewState["cId"].ToString();
        if (objUtl.CheckExistence("CourseId", "CourseDetails", "CourseShortName = '" + txtShortCourseName.Text +"' And CourseId <> '" + ViewState["cId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN COURSE (" + txtShortCourseName.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            string sqlQuery = "";
            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery = "Select * From CourseDetails Where 1 = 2";
                cId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery = "Select * From CourseDetails Where CourseId = '" + cId + "'";
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
                dtRow["CourseId"] = cId.ToString();
                dtRow["CourseFullName"] = txtFullCourseName.Text;
                dtRow["CourseShortName"] = txtShortCourseName.Text;
                dtRow["CourseDurationYear"] = Convert.ToInt32(txtDurationYear.Text);
                dtRow["CourseDurationSemester"] = Convert.ToInt32(txtDurationSemester.Text);                
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
                ViewState["cId"] = "";
            }
            catch (Exception ex)
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN SAVING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
            sCon.Close();
            sCon.Dispose();
        }
    }

    public void FillDataInControls(string cId)
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select * from CourseDetails Where CourseId = '" + cId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtFullCourseName.Text = sDtr["CourseFullName"].ToString();
                txtShortCourseName.Text = sDtr["CourseShortName"].ToString();
                txtDurationYear.Text = sDtr["CourseDurationYear"].ToString();
                txtDurationSemester.Text = sDtr["CourseDurationSemester"].ToString();                
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
        txtFullCourseName.Text = "";
        txtShortCourseName.Text = "";
        txtDurationYear.Text = "";
        txtDurationSemester.Text = "";
        txtFullCourseName.Focus();
        btnSubmit.Text = "SUBMIT";
    }
}