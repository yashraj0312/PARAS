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

public partial class Administrator_StudentRegistration : System.Web.UI.Page
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
        if (objUtl.CheckExistence("StudentId", "StudentDetails", "EnrollmentNumber = '" + txtEnrollmentNumber.Text + "' And CourseId = '" + ddlCourse.SelectedValue + "' And BatchId = '" + ddlBatch.SelectedValue + "' And SemesterId = '" + ddlSemester.SelectedValue + "'    And StudentId <> '" + ViewState["sId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN Student (" + txtStudentName.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlConnection sCon1 = objUtl.CreateSqlConnection(new SqlConnection());
            string sqlQuery = "";
            string sqlQuery1 = "";

            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery = "Select * From StudentDetails Where 1 = 2";
                sqlQuery1 = "Select * From UserDetails Where 1 = 2";

                sId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery = "Select * From StudentDetails Where StudentId = '" + sId + "'";
                sqlQuery1 = "Select * From UserDetails Where UserId = '"+ sId + "'";
            }
            SqlDataAdapter sDta = new SqlDataAdapter(sqlQuery, sCon);
            SqlDataAdapter sDta1 = new SqlDataAdapter(sqlQuery1, sCon1);
            SqlCommandBuilder sCmb = new SqlCommandBuilder(sDta);
            SqlCommandBuilder sCmb1 = new SqlCommandBuilder(sDta1);
            DataTable dtTable = new DataTable();
            DataTable dtTable1 = new DataTable();
            sDta.Fill(dtTable);
            sDta1.Fill(dtTable1);
            DataRow dtRow;
            DataRow dtRow1;

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
                dtRow["StudentId"] = sId.ToString();
                dtRow["BatchId"] = ddlBatch.SelectedValue;
                dtRow["CourseId"] = ddlCourse.SelectedValue;
                dtRow["SectionId"] = ddlSection.SelectedValue;
                dtRow["SemesterId"] = ddlSemester.SelectedValue;
                dtRow["EnrollmentNumber"] = txtEnrollmentNumber.Text;
                dtRow["StudentName"] = txtStudentName.Text;
                dtRow["PhoneNumber"] = txtPhone.Text;
                dtRow["Email"] = txtEmail.Text;
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
                //ClearText();
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




          if (dtTable1.Rows.Count > 0)
            {
                dtRow1 = dtTable1.Rows[0];
            }
            else
            {
                dtRow1 = dtTable1.NewRow();
            }
            try
            {
                RijndaelManaged obRjm = new RijndaelManaged();
                obRjm.GenerateKey();
                obRjm.GenerateIV();
                byte[] myKey = null;
                byte[] myIv = null;
                myKey = obRjm.Key;
                myIv = obRjm.IV;
                string encryptionText, encryptionKey, encryptionIv;
                encryptionKey = Convert.ToBase64String(myKey);
                encryptionIv = Convert.ToBase64String(myIv);
                encryptionText = objEnc.EncryptText(txtEnrollmentNumber.Text, encryptionKey, encryptionIv);



                dtRow1["UserId"] = sId.ToString();
                dtRow1["UserName"] = txtStudentName.Text;
                dtRow1["UserRole"] = "6";
                dtRow1["LoginStatus"] = 1;
                dtRow1["Email"] = txtEmail.Text;
                dtRow1["PhoneNo"] = txtPhone.Text;
                dtRow1["LastLoginDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                dtRow1["LastPasswordChangeDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");

                if (ViewState["opCode"].Equals(0))
                {
                    dtRow1["LoginId"] = txtEnrollmentNumber.Text;
                    dtRow1["LoginPassword"] = encryptionText.ToString();
                    dtRow1["PasswordKey"] = encryptionKey.ToString();
                    dtRow1["PasswordIv"] = encryptionIv.ToString();
                    dtRow1["CreationDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow1["CreationBy"] = Session["UserId"].ToString();
                }
                else
                {
                    dtRow1["ModificationDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow1["ModificationBy"] = Session["UserId"].ToString();
                }
                if (dtTable1.Rows.Count == 0)
                {
                    dtTable1.Rows.Add(dtRow1);
                }
                sDta1.Update(dtTable1);
                objUtl.ShowMessage("Success", "<b>SUCCESS!</b> USER HAS BEEN SAVED SUCCESSFULLY.", lblMessage);
                ClearText();
                sDta1.Dispose();
                dtTable1 = null;
                ViewState["opCode"] = 0;
                ViewState["sId"] = "";
            }
            catch (Exception ex)
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN CREATING USER, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
            sCon1.Close();
            sCon1.Dispose();

        }
    }

    public void FillDataInControls(string sId)
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select a.*, b.CourseId, b.CourseShortName, c.BatchId, c.Batch, d.SemesterId, d.SemesterName, e.SectionId, e.SectionName from StudentDetails a, CourseDetails b, BatchDetails c, SemesterDetails d, SectionDetails e where a.CourseId = b.CourseId And a.BatchId = c.BatchId And a.SemesterId = d.SemesterId And a.SectionId = e.SectionId And a.StudentnId = '" + sId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtStudentName.Text = sDtr["StudentName"].ToString();
                txtEnrollmentNumber.Text = sDtr["EnrollmentNumber"].ToString();
                txtEmail.Text = sDtr["Email"].ToString();
                ddlCourse.SelectedValue = sDtr["CourseId"].ToString();
                ddlBatch.SelectedValue = sDtr["BatchId"].ToString();
                ddlSection.SelectedValue = sDtr["SectionId"].ToString();
                ddlSemester.SelectedValue = sDtr["SemesterId"].ToString();
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
        txtStudentName.Text = "";
        txtEnrollmentNumber.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = null;
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