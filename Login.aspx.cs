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
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    Utility objUtl = new Utility();
    Encryption objEnc = new Encryption();
    SqlConnection sCon;
    SqlDataReader sDtr;
    SqlCommand sCmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (GetAuthentication())
        {
            string returnUrl = "Default.aspx";            
            if (Session["UserRole"].ToString() == "ADMINISTRATOR")
            {                
                returnUrl = "~/Administrator/";                
            }
            else if (Session["UserRole"].ToString() == "RESEARCHER")
            {
                returnUrl = "~/Researcher/Default.aspx";
            }           
            else if (Session["UserRole"].ToString() == "ISC")
            {
                returnUrl = "~/Isc/";
            }
            else if (Session["UserRole"].ToString() == "PEC")
            {
                returnUrl = "~/Pec/";
            }
            else if (Session["UserRole"].ToString() == "REVIEWER")
            {
                returnUrl = "~/Reviewer/";
            }
            else if (Session["UserRole"].ToString() == "STUDENT")
            {
                returnUrl = "~/Student/";
            }
            else if (Session["UserRole"].ToString() == "FACULTY")
            {
                returnUrl = "~/Faculty/";
            }
            else
            {
                txtPassword.Focus();
            }
            Response.Redirect(returnUrl);
        }
    }
    public bool GetAuthentication()
    {
        bool isAuthenticate = false;
        sCon = objUtl.CreateSqlConnection(new SqlConnection());
        sCmd = new SqlCommand("Select a.UserId, a.UserName, a.LoginId , a.LoginStatus, a.LoginPassword, a.PasswordKey, a.PasswordIv, b.RoleName From UserDetails a, RoleDetails b Where a.UserRole = b.RoleId AND LoginId = '" + txtLoginId.Text + "'", sCon);
        sDtr = sCmd.ExecuteReader();
        if (!sDtr.HasRows)
        {
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
            lblMessage.Text = "YOU ARE NOT REGISTERED WITH THIS SYSTEM";
            return false;
        }
        sDtr.Read();
        if (sDtr["LoginStatus"].ToString() == "False")
        {
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
            lblMessage.Text = "YOUR ACCOUNT IS LOCKED, PLEASE WAIT FOR ACTIVATION OR CONTACT THE ADMINISTRATOR";
            return false;
        }

        Session["UserId"] = sDtr["UserId"].ToString();
        Session["UserName"] = sDtr["UserName"].ToString();
        Session["UserRole"] = sDtr["RoleName"].ToString();
        Session["LoginId"] = sDtr["LoginId"].ToString();

        string encodeKey; string encodeIv; string encodePassword;
        encodeKey = sDtr["PasswordKey"].ToString();
        encodeIv = sDtr["PasswordIv"].ToString();
        encodePassword = objEnc.EncryptText(txtPassword.Text, encodeKey, encodeIv);

        if (encodePassword.Equals(sDtr["LoginPassword"].ToString()))
        {
            //objUtl.UpdateRecord("Update UserDetails Set LastLoginDate = '" + System.DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "' Where UserId = '" + Session["UserId"] + "'");
            isAuthenticate = true;
        }
        else
        {
            lblMessage.Text = "WRONG PASSWORD! PLEASE TRY AGAIN WITH CORRECT PASSWORD";
            isAuthenticate = false;
        }
        sDtr.Close();
        sCmd.Dispose();
        sCon.Close();
        sCon.Dispose();
        return isAuthenticate;
    }
}
