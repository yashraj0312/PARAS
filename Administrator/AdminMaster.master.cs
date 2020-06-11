using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Administrator_AdminMaster : System.Web.UI.MasterPage
{
    Utility objUtl = new Utility();
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
