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

public partial class Student_ViewComment : System.Web.UI.Page
{
    Label lblForm;
    LinkButton lbtnActiveMenu;
    Utility objUtl = new Utility();
    Label formName = new Label();
    static CheckBox chkRole = new CheckBox();
    PagedDataSource pDs = new PagedDataSource();
    string selectQuery = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            LoadProjectInfo();
        }
        lblForm = (Label)Master.FindControl("lblFormName");
        //lblForm.Text = "RESEARCHER > <span style='font-size:12px;'>USER PROFILE</span>";
        //lblTest.Text = Session["pId"].ToString();        
    }
  public void LoadProjectInfo()
    {
        try
        {
            SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
            SqlDataReader sDtr;
            string selectQuery;

            selectQuery = "Select a.*, b.CourseId, b.CourseShortName, c.BatchId, c.Batch, d.SemesterId, d.SemesterNumber, e.SectionId, e.SectionName from ProjectDetails a, CourseDetails b, BatchDetails c, SemesterDetails d, SectionDetails e where a.CourseId = b.CourseId And a.BatchId = c.BatchId And a.SemesterId = d.SemesterId And a.SectionId = e.SectionId And a.CreationBy = '" + Session["UserName"].ToString() + "' And a.ProjectId = '" + Session["pId"].ToString() + "'";
            SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
            sDtr = sCmd.ExecuteReader();
            sDtr.Read();
            if (sDtr.HasRows)
            {
                txtCourse.Text = sDtr["CourseShortName"].ToString();
                txtBatch.Text = sDtr["Batch"].ToString();
                txtSection.Text = sDtr["SectionName"].ToString();
                txtSemester.Text = sDtr["SemesterNumber"].ToString();
                txtEnrollmentNumber.Text = sDtr["EnrollmentNumber"].ToString();
                txtStudentName.Text = sDtr["StudentName"].ToString();
                txtProjectName.Text = sDtr["ProjectName"].ToString();
                txtTechnologyUsed.Text = sDtr["TechnologyUsed"].ToString();
                txtRunReq.Text = sDtr["RunReq"].ToString();
                txtDevReq.Text = sDtr["DevReq"].ToString();
                txtComments.Text = sDtr["Comments"].ToString();
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
