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

public partial class Student_ChangePassword : System.Web.UI.Page
{
    Encryption objEnc = new Encryption();
    Utility objUtl = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GetAuthentication())
        {
            if (ChangePassword())
            {
                objUtl.ShowMessage("Success", "<b>SUCCESS!</b> YOUR PASSWORD HAS BEEN CHANGED SUCCESSFULLY.", lblMessage);
            }
            else
            {
                objUtl.ShowMessage("Error", "<b>ERROR!</b> PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
            }
        }
        else
        {
            objUtl.ShowMessage("Information", "<b>INFORMATION!</b> YOUR OLD PASSWORD IS INCORRECT, PLEASE TRY AGAIN WITH YOUR CORRECT OLD PASSWORD.", lblMessage);
        }
    }

    public bool GetAuthentication()
    {
        SqlConnection sCon;
        SqlCommand sCmd;
        SqlDataReader sDtr;
        bool isAuthenticate = false;
        string storedPassword;
        sCon = objUtl.CreateSqlConnection(new SqlConnection());
        sCmd = new SqlCommand("Select UserId, LoginStatus, LoginPassword, PasswordKey, PasswordIv From UserDetails Where UserId = '"+ Session["UserId"] +"' ", sCon);
        sDtr = sCmd.ExecuteReader();
        if (!sDtr.HasRows)
        {
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
            return false;
        }
        sDtr.Read();
        storedPassword = objEnc.EncryptText(txtOldPassword.Text, sDtr["PasswordKey"].ToString(), sDtr["PasswordIv"].ToString());
        if (storedPassword.Equals(sDtr["LoginPassword"].ToString()))
        {
            isAuthenticate = true;
        }
        else
        {
            isAuthenticate = false;
        }
        sDtr.Close();
        sCmd.Dispose();
        sCon.Close();
        sCon.Dispose();
        return isAuthenticate;
    }

    private bool ChangePassword()
    {
        RijndaelManaged objRjm = new RijndaelManaged();
        byte[] myKey = null;
        byte[] myIv = null;
        objRjm.GenerateKey();
        objRjm.GenerateIV();
        myKey = objRjm.Key;
        myIv = objRjm.IV;
        string encKey; string encIv; string encText;
        encKey = Convert.ToBase64String(myKey);
        encIv = Convert.ToBase64String(myIv);
        encText = objEnc.EncryptText(txtNewPassword.Text, encKey, encIv);
        SqlConnection sCon;
        SqlTransaction sTran;
        SqlCommand sCmd;
        sCon = objUtl.CreateSqlConnection(new SqlConnection());
        sTran = sCon.BeginTransaction();
        try
        {
            //String current_date = System.DateTime.Now.ToString("MM - dd - yyyy hh: mm:ss");
            sCmd = new SqlCommand("Update UserDetails Set LoginPassword = '" + encText + "', PasswordKey = '" + encKey + "', PasswordIv = '" + encIv + "' Where UserId = '" + Session["UserId"] + "' ", sCon, sTran);
            sCmd.ExecuteNonQuery();
            sTran.Commit();
            return true;
        }
        catch (SqlException sEx)
        {
            sTran.Rollback();
            return false;
        }
        finally
        {
            sCon.Close();
            sCon.Dispose();
        }
    }
}
