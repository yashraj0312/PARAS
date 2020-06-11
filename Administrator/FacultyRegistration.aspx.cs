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

public partial class Administrator_FacultyRegistration : System.Web.UI.Page
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
        if (objUtl.CheckExistence("LoginId", "UserDetails", "LoginId = '" + txtRegistrationNumber.Text + "' And UserId <> '" + ViewState["sId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN LOGIN ID (" + txtRegistrationNumber.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
           SqlConnection sCon1 = objUtl.CreateSqlConnection(new SqlConnection());
            string sqlQuery1 = "";

            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery1 = "Select * From UserDetails Where 1 = 2";

                sId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery1 = "Select * From UserDetails Where UserId = '" + sId + "'";
            }
            SqlDataAdapter sDta1 = new SqlDataAdapter(sqlQuery1, sCon1);
            
            SqlCommandBuilder sCmb1 = new SqlCommandBuilder(sDta1);
            
            DataTable dtTable1 = new DataTable();
           
            sDta1.Fill(dtTable1);
            
            DataRow dtRow1;

            
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
                encryptionText = objEnc.EncryptText(txtRegistrationNumber.Text, encryptionKey, encryptionIv);



                dtRow1["UserId"] = sId.ToString();
                dtRow1["UserName"] = txtFacultyName.Text;
                dtRow1["UserRole"] = "7";
                dtRow1["LoginStatus"] = 1;
                dtRow1["Email"] = txtEmail.Text;
                dtRow1["PhoneNo"] = txtPhone.Text;
               
                if (ViewState["opCode"].Equals(0))
                {
                    dtRow1["LoginId"] = txtRegistrationNumber.Text;
                    dtRow1["LoginPassword"] = encryptionText.ToString();
                    dtRow1["PasswordKey"] = encryptionKey.ToString();
                    dtRow1["PasswordIv"] = encryptionIv.ToString();
                    dtRow1["CreationDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow1["CreationBy"] = Session["UserId"].ToString();
                    dtRow1["LastLoginDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow1["LastPasswordChangeDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
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
            selectQuery = "Select * from UserDetails Where UserId = '" + sId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtFacultyName.Text = sDtr["UserName"].ToString();
                txtRegistrationNumber.Text = sDtr["LoginId"].ToString();
                txtEmail.Text = sDtr["Email"].ToString();
                txtPhone.Text = sDtr["PhoneNo"].ToString();
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
        txtFacultyName.Text = "";
        txtRegistrationNumber.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtFacultyName.Focus();
        btnSubmit.Text = "SUBMIT";
    }
    
}