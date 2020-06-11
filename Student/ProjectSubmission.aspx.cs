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

public partial class Student_ProjectSubmission : System.Web.UI.Page
{
    Utility objUtl = new Utility();
    Encryption objEnc = new Encryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {

            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            objUtl.FillDropDownList("Select BatchId, Batch From BatchDetails Order By Batch", ddlBatch, "Batch", "BatchId");
            objUtl.FillDropDownList("Select CourseId, CourseShortName From CourseDetails Order By CourseShortName", ddlCourse, "CourseShortName", "CourseId");
            //objUtl.FillDropDownList("Select SectionId, SectionName From SectionDetails Order By SectionName", ddlSection, "SectionName", "SectionId");
            //objUtl.FillDropDownList("Select SemesterId, SemesterNumber From SemesterDetails Order By SemesterNumber", ddlSemester, "SemesterNumber", "SemesterId");

            if (Session["pId"] == null)
            {
                ViewState["opCode"] = 0;
                ViewState["pId"] = "";
            }
            else
            {
                ViewState["opCode"] = 1;
                ViewState["pId"] = Session["pId"];
                FillDataInControls(ViewState["pId"].ToString());
                Session["pId"] = null;
                btnSubmit.Text = "UPDATE";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string pId = ViewState["pId"].ToString();
        if (objUtl.CheckExistence("ProjectId", "ProjectDetails", "EnrollmentNumber = '" + Session["LoginId"].ToString() + "' And CourseId = '" + ddlCourse.SelectedValue + "' And BatchId = '" + ddlBatch.SelectedValue + "' And SemesterId = '" +ddlSemester.SelectedValue+ "' And ProjectId <> '" + ViewState["pId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN PROJECT (" + txtProjectName.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            
            string sqlQuery = "";
            

            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery = "Select * From ProjectDetails Where 1 = 2";
            

                pId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery = "Select * ProjectDetails Where StudentId = '" + pId + "'";
            
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
                dtRow["ProjectId"] = pId.ToString();
                dtRow["BatchId"] = ddlBatch.SelectedValue;
                dtRow["CourseId"] = ddlCourse.SelectedValue;
                dtRow["SemesterId"] = ddlSemester.SelectedValue;
                dtRow["SectionId"] = ddlSection.SelectedValue;                
                dtRow["EnrollmentNumber"] = Session["LoginId"].ToString();
                dtRow["StudentName"] = Session["UserName"].ToString();
                dtRow["ProjectName"] = txtProjectName.Text;
                dtRow["TechnologyUsed"] = txtTechnologyUsed.Text;
                dtRow["RunReq"] = txtRunReq.Text;
                dtRow["DevReq"] = txtDevReq.Text;
                
                if (ViewState["opCode"].Equals(0))
                {
                    dtRow["CreationDate"] = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                    dtRow["CreationBy"] = Session["UserName"].ToString();
                }
                else
                {
                    dtRow["ModificationDate"] = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                    dtRow["ModificationBy"] = Session["UserName"].ToString();
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
                ViewState["pId"] = "";
            }
            catch (Exception ex)
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN SAVING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
            sCon.Close();
            sCon.Dispose();

        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        String fName = FileUpload1.FileName;
        FileUpload1.SaveAs(Server.MapPath("~/Presentations/" + fName));
        lblMessage1.Text = "File Uploaded";
    }

    public void FillDataInControls(string pId)
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select a.*, b.CourseId, b.CourseShortName, c.BatchId, c.Batch, d.SemesterId, d.SemesterName, e.SectionId, e.SectionName from ProjectDetails a, CourseDetails b, BatchDetails c, SemesterDetails d, SectionDetails e where a.CourseId = b.CourseId And a.BatchId = c.BatchId And a.SemesterId = d.SemesterId And a.SectionId = e.SectionId And a.ProjectId = '" + pId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                ddlCourse.SelectedValue = sDtr["CourseId"].ToString();
                ddlBatch.SelectedValue = sDtr["BatchId"].ToString();
                ddlSection.SelectedValue = sDtr["SectionId"].ToString();
                ddlSemester.SelectedValue = sDtr["SemesterId"].ToString();
                txtProjectName.Text = sDtr["ProjectName"].ToString();
                txtTechnologyUsed.Text = sDtr["TechnologyUsed"].ToString();
                txtRunReq.Text = sDtr["RunReq"].ToString();
                txtDevReq.Text = sDtr["DevReq"].ToString();
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
        txtProjectName.Text = "";
        txtTechnologyUsed.Text = "";
        txtRunReq.Text = "";
        txtDevReq.Text = null;
        ddlCourse.SelectedIndex = 0;
        ddlBatch.SelectedIndex = 0;
        ddlSemester.SelectedIndex = 0;
        ddlSection.SelectedIndex = 0;
        btnSubmit.Text = "SUBMIT";
    }
    protected void ddlBatch_SelectedIndexChanged(object sender, EventArgs e)
    {
        objUtl.FillDropDownList("Select SemesterId, SemesterNumber From SemesterDetails where CourseId = '" + ddlCourse.SelectedValue + "' Order By SemesterNumber", ddlSemester, "SemesterNumber", "SemesterId");

    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        objUtl.FillDropDownList("Select SectionId, SectionName From SectionDetails where CourseId = '" + ddlCourse.SelectedValue + "' And BatchId = '" + ddlBatch.SelectedValue + "' Order By SectionName", ddlSection, "SectionName", "SectionId");
    }
}