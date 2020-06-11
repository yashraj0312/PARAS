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

public partial class Faculty_Profile : System.Web.UI.Page
{
    Label lblForm;
    LinkButton lbtnActiveMenu;
    Utility objUtl = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            LoadUserProfile();
        }
        lblForm = (Label)Master.FindControl("lblFormName");
        //lblForm.Text = "FACULTY > <span style='font-size:12px;'>USER PROFILE</span>";        
    }
    public void LoadUserProfile()
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;
            selectQuery = "Select a.*, b.RoleName from UserDetails a, RoleDetails b Where a.UserRole = b.RoleId AND a.UserId = '" + Session["UserId"].ToString() + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtName.Text = sDtr["UserName"].ToString();
                txtRole.Text = sDtr["RoleName"].ToString();
                txtEmail.Text = sDtr["Email"].ToString();
                txtPhone.Text = sDtr["PhoneNo"].ToString();
                txtLastLogin.Text = Convert.ToDateTime(sDtr["LastLoginDate"].ToString()).ToString("MMMM dd, yyyy - hh:mm:ss");
                txtLastPasswordChange.Text = Convert.ToDateTime(sDtr["LastPasswordChangeDate"].ToString()).ToString("MMMM dd, yyyy - hh:mm:ss");
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
}
