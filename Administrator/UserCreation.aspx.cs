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

public partial class Administrator_UserCreation : System.Web.UI.Page
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
            objUtl.FillDropDownList("Select eId, RoleRolName From RoleDetails Order By RoleName", ddlRole, "RoleName", "RoleId");
            if (Session["uId"] == null)
            {
                ViewState["opCode"] = 0;
                ViewState["uId"] = "";
            }
            else
            {
                ViewState["opCode"] = 1;
                ViewState["uId"] = Session["uId"];
                FillDataInControls(ViewState["uId"].ToString());
                Session["uId"] = null;
                btnSubmit.Text = "UPDATE";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string uId = ViewState["uId"].ToString();
        if (objUtl.CheckExistence("LoginId", "UserDetails", "LoginId = '" + txtLoginId.Text + "' And UserId <> '" + ViewState["uId"].ToString() + "' "))
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> GIVEN LOGIN ID (" + txtLoginId.Text + ") ALREADY EXIST IN DATABASE!", lblMessage);
        }
        else
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            string sqlQuery = "";
            if (ViewState["opCode"].Equals(0))
            {
                sqlQuery = "Select * From UserDetails Where 1 = 2";
                uId = System.Guid.NewGuid().ToString();
            }
            else if (ViewState["opCode"].Equals(1))
            {
                sqlQuery = "Select * From UserDetails Where UserId = '" + uId + "'";
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
                encryptionText = objEnc.EncryptText(txtPassword.Text, encryptionKey, encryptionIv);

                dtRow["UserId"] = uId.ToString();
                dtRow["UserName"] = txtName.Text;
                dtRow["UserRole"] = ddlRole.SelectedValue;
                dtRow["LoginStatus"] = 1;
                dtRow["Email"] = txtEmail.Text;
                dtRow["PhoneNo"] = txtPhoneNo.Text;
                if (ViewState["opCode"].Equals(0))
                {                    
                    dtRow["LoginId"] = txtLoginId.Text;
                    dtRow["LoginPassword"] = encryptionText.ToString();
                    dtRow["PasswordKey"] = encryptionKey.ToString();
                    dtRow["PasswordIv"] = encryptionIv.ToString();
                    dtRow["CreationDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow["CreationBy"] = Session["UserId"].ToString();
                    dtRow["LastLoginDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                    dtRow["LastPasswordChangeDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
                }
                else
                {
                    dtRow["ModificationDate"] = System.DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss");
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
                ViewState["uId"] = "";
            }
            catch (Exception ex)
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN SAVING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
            sCon.Close();
            sCon.Dispose();
        }
    }

    public void FillDataInControls(string uId)
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select * from UserDetails Where UserId = '" + uId + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtName.Text = sDtr["UserName"].ToString();
                ddlRole.SelectedValue  = sDtr["UserRole"].ToString();
                txtEmail.Text = sDtr["Email"].ToString();
                txtPhoneNo.Text  = sDtr["PhoneNo"].ToString();
                txtLoginId.Enabled = false;
                txtPassword.Enabled = false;
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
        txtName.Text = "";
        txtLoginId.Text = "";
        txtPassword.Text = "";
        txtEmail.Text = "";
        txtPhoneNo.Text  = "";
        ddlRole.SelectedIndex = 0;
        txtName.Focus();
        btnSubmit.Text = "SUBMIT";
    }
}
