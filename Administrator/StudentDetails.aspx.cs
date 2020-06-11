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
using System.IO;
using System.Data.SqlClient;
using System.Text;
using System.Web.SessionState;
//using Microsoft.Reporting.WebForms 

public partial class Administrator_StudentDetails : System.Web.UI.Page
{
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
        lblMessage.Visible = false;
        selectQuery = "Select a.*,b.BatchId,b.Batch,c.CourseId,c.CourseShortName,d.sectionId,d.SectionName,e.SemesterId,e.SemesterNumber from StudentDetails a,BatchDetails b,CourseDetails c, SectionDetails d, SemesterDetails e where a.BatchId=b.BatchId and a.CourseId=c.CourseId and a.SectionId=d.SectionId and a.SemesterId=e.SemesterId Order by StudentName";
        if (!IsPostBack)
        {
            selectQuery = "Select a.*,b.BatchId,b.Batch,c.CourseId,c.CourseShortName,d.sectionId,d.SectionName,e.SemesterId,e.SemesterNumber from StudentDetails a,BatchDetails b,CourseDetails c, SectionDetails d, SemesterDetails e where a.BatchId=b.BatchId and a.CourseId=c.CourseId and a.SectionId=d.SectionId and a.SemesterId=e.SemesterId Order by StudentName";
            FillGridView(selectQuery);
        }
    }

    private void FillGridView(string selectQuery)
    {
        SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
        SqlDataAdapter sDta = new SqlDataAdapter(selectQuery, sCon);
        DataTable dtTable = new DataTable();
        sDta.Fill(dtTable);
        pDs.DataSource = dtTable.DefaultView;
        pDs.AllowPaging = true;
        pDs.PageSize = Convert.ToInt16(ddlPageSize.SelectedValue);
        if (CurrentPage >= pDs.PageCount)
        {
            CurrentPage = CurrentPage - 1;
        }
        pDs.CurrentPageIndex = CurrentPage;
        lnkbtnNext.Enabled = !(pDs.IsLastPage);
        lnkbtnPrevious.Enabled = !(pDs.IsFirstPage);
        gridStudentDetails.DataSource = pDs;
        gridStudentDetails.DataBind();
        sCon.Close();
        DoPaging();
    }
    protected void ibtnView_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibtnView = sender as ImageButton;
        GridViewRow gvRow = (GridViewRow)ibtnView.NamingContainer;
        String sId;
        sId = gridStudentDetails.DataKeys[gvRow.RowIndex].Value.ToString();
        String selectQuery = "Select a.*,b.BatchId,b.Batch,c.CourseId,c.CourseShortName,d.sectionId,d.SectionName,e.SemesterId,e.SemesterNumber from StudentDetails a,BatchDetails b,CourseDetails c, SectionDetails d, SemesterDetails e where a.BatchId=b.BatchId and a.CourseId=c.CourseId and a.SectionId=d.SectionId and a.SemesterId=e.SemesterId And a.StudentId = '" + sId + "'";
        DataSet dtSet = new DataSet();
        objUtl.SelectRecords(selectQuery, dtSet, "UserDetail");
        dlStudentDetail.DataSource = dtSet;
        dlStudentDetail.DataBind();
        upStudentDetailView.Update();
        mdlPopup.Show();
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibtnEdit = sender as ImageButton;
        GridViewRow gvRow = (GridViewRow)ibtnEdit.NamingContainer;
        String sId;
        sId = gridStudentDetails.DataKeys[gvRow.RowIndex].Value.ToString();
        Session["sId"] = sId;
        Response.Redirect("StudentRegistration.aspx");
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibtnDelete = sender as ImageButton;
        GridViewRow gvRow = (GridViewRow)ibtnDelete.NamingContainer;
        //if (objUtl.CheckExistence("UserRole", "UserDetails", "UserRole = '" + gridStatusDetails.DataKeys[gvRow.RowIndex].Value + "'") == false)
        //{
        if (objUtl.DeleteRecord("Delete from StudentDetails Where StudentId = '" + gridStudentDetails.DataKeys[gvRow.RowIndex].Value.ToString() + "'") == true)
        {
            objUtl.ShowMessage("Success", "<b>SUCCESS!</b> RECORD DELETED SUCCESSFULLY.", lblMessage);
            FillGridView(selectQuery);
        }
        else
        {
            objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN DELETING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
        }
        //}
        //else
        //{
        //    objUtl.ShowMessage("Information", "<b>INFORMATION!</b> THIS ROLE CAN NOT BE DELETED AS IT IS BEING USED IN OTHER TABLE(S).", lblMessage);
        //}
    }

    protected void btnDelete_Click(object sender, System.EventArgs e)
    {
        SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
        SqlTransaction sTrn;
        sTrn = sCon.BeginTransaction();
        try
        {
            string sId = "";
            string deleteQuery = "";
            SqlCommand sCmd;
            int deleteCount = 0;
            foreach (GridViewRow gvRow in gridStudentDetails.Rows)
            {
                chkRole = (CheckBox)gvRow.FindControl("chkSelect");
                if ((chkRole.Checked == true) /*&& (objUtl.CheckExistence("UserRole", "UserDetails", "UserRole = '" + gridRoleDetails.DataKeys[gvRow.RowIndex].Value + "'") == false)*/)
                {
                    sId = gridStudentDetails.DataKeys[gvRow.RowIndex].Value.ToString();
                    deleteQuery = "Delete from StudentDetails Where StudentId = '" + sId + "' ";
                    sCmd = new SqlCommand(deleteQuery, sCon, sTrn);
                    sCmd.ExecuteNonQuery();
                    deleteCount = deleteCount + 1;
                }
            }
            sTrn.Commit();
            sCon.Close();
            if (deleteCount > 0)
            {
                objUtl.ShowMessage("Success", "<b>SUCCESS!</b> " + deleteCount + " RECORD(S) DELETED SUCCESSFULLY.", lblMessage);
                FillGridView(selectQuery);
            }
        }

        catch (Exception ex)
        {
            sTrn.Rollback();
            objUtl.ShowMessage("Error", "<b>ERROR!</b> ERROR IN DELETING RECORD, PLEASE TRY AGAIN OR CONTACT THE ADMINISTRATOR.", lblMessage);
        }
    }

    protected void gridStudentDetails_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            ((CheckBox)e.Row.FindControl("chkSelect")).Attributes.Add("onclick", "javascript:Select('" + ((CheckBox)e.Row.FindControl("chkSelect")).ClientID + "')");
        }
    }

    public int CurrentPage
    {
        get
        {
            if (this.ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt16(this.ViewState["CurrentPage"].ToString());
            }
        }
        set
        {
            this.ViewState["CurrentPage"] = value;
        }
    }
    private void DoPaging()
    {
        DataTable dtTable = new DataTable();
        dtTable.Columns.Add("PageIndex");
        dtTable.Columns.Add("PageText");
        for (int i = 0; i <= pDs.PageCount - 1; i++)
        {
            DataRow dtRow = dtTable.NewRow();
            dtRow[0] = i;
            dtRow[1] = i + 1;
            dtTable.Rows.Add(dtRow);
        }
        dlPaging.DataSource = dtTable;
        dlPaging.DataBind();
    }
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkbtnPage.Enabled = false;
            lnkbtnPage.Font.Bold = true;
        }
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        FillGridView(selectQuery);
    }
    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("lnkbtnPaging"))
        {
            CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
            FillGridView(selectQuery);
        }
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        FillGridView(selectQuery);
    }
    protected void lnkbtnPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        FillGridView(selectQuery);
    }
    protected void lbtnPrint_Click(object sender, System.EventArgs e)
    {
        //string selectQuery = null;
        //selectQuery = "SELECT * FROM UserDetails";
        //SqlConnection sCon = objUtl.CreateSqlConnection(new SqlConnection());
        //DataSet dtSet = new DataSet();
        //SqlDataAdapter sDta = new SqlDataAdapter(selectQuery, sCon);
        //sDta.Fill(dtSet);

        //ReportDataSource rDs = new ReportDataSource("UserList_UserDetails", dtSet.Tables[0]);

        //Warning[] warnings = null;
        //string[] streamids = null;
        //string mimeType = null;
        //string encoding = null;
        //string extension = null;
        ////ReportParameter [] myParam = new ReportParameter[1];
        ////myParam[0] = new ReportParameter("UnitName", "Ministry of Ayush");
        //ReportViewer rptViewer = new ReportViewer();
        //rptViewer.ProcessingMode = ProcessingMode.Local;

        //rptViewer.LocalReport.ReportPath = "RoleList.rdlc";
        //rptViewer.LocalReport.DataSources.Add(rDs);
        ////rptViewer.LocalReport.SetParameters(myParam);
        //rptViewer.LocalReport.Refresh();
        //byte[] bytes = rptViewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamids, out warnings);

        //Response.Buffer = true;
        //Response.Clear();
        //Response.ContentType = mimeType;
        ////Response.ContentType = "application/pdf"
        //Response.AddHeader("Content-disposition", "attachment; filename=Report.pdf");
        //Response.BinaryWrite(bytes);
        //Response.Flush();
    }
}