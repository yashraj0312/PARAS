using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_FacultyMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUserName.Text = Session["UserName"].ToString();
        lblUserRole.Text = Session["UserRole"].ToString();
        lblDate.Text = System.DateTime.Now.ToString("MMM dd, yyyy");
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("~/Default.aspx");
    }
}
