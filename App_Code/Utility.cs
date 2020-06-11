using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public class Utility
{
    public Utility()
    {
    }
    public SqlConnection CreateSqlConnection(SqlConnection sCon)
    {
        sCon = new SqlConnection();
        sCon.ConnectionString = ConfigurationManager.ConnectionStrings["conString"].ToString();
        if (sCon.State.Equals("1"))
        {
            sCon.Close();
        }
        sCon.Open();
        return sCon;
    }

    public bool InsertRecord(string insertQuery)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());
        SqlCommand sCmd = new SqlCommand(insertQuery, sCon);
        if (sCmd.ExecuteNonQuery() == 1)
        {
            sCon.Close();
            return true;
        }
        else
        {
            sCon.Close();
            return false;
        }
    }

    public void ShowMessage(string v)
    {
        throw new NotImplementedException();
    }

    public bool UpdateRecord(string updateQuery)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());
        SqlCommand sCmd = new SqlCommand(updateQuery, sCon);
        if (sCmd.ExecuteNonQuery() == 1)
        {
            sCon.Close();
            return true;
        }
        else
        {
            sCon.Close();
            return false;
        }
    }
    public bool DeleteRecord(string deleteQuery)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());        
        SqlCommand sCmd = new SqlCommand(deleteQuery, sCon);
        if (sCmd.ExecuteNonQuery() == 1)
        {
            sCon.Close();
            return true;
        }
        else
        {
            sCon.Close();
            return false;
        }
    }

    public string GetSingleRecord(string columnName, string tableName, string filterString)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());
        string selectQuery = "Select " + columnName + " From " + tableName + " Where " + filterString;
        SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
        SqlDataReader sDtr = sCmd.ExecuteReader();
        try
        {
            if (sDtr.Read())
            {
                return sDtr[0].ToString();
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
        }
    }

    public bool CheckExistence(string columnName, string tableName, string filterString)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());
        string selectQuery = "Select " + columnName + " From " + tableName + " Where " + filterString;
        SqlCommand sCmd = new SqlCommand(selectQuery, sCon);
        SqlDataReader sDtr = sCmd.ExecuteReader();
        try
        {
            if (sDtr.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            sDtr.Close();
            sCmd.Dispose();
            sCon.Dispose();
        }
    }

    public void FillDropDownList(string selectQuery, DropDownList objDdl, string columnToShow, string columnToBound)
    {
        objDdl.Items.Clear();
        DataSet dtSet = new DataSet();
        SelectRecords(selectQuery, dtSet, "cTable");
        DataView dtView = dtSet.Tables["cTable"].DefaultView;
        objDdl.DataSource = dtView;
        objDdl.DataTextField = columnToShow;
        objDdl.DataValueField = columnToBound;
        objDdl.DataBind();
        objDdl.Items.Insert(0, new ListItem("Select"));
        objDdl.SelectedIndex = 0;
    }

    public bool SelectRecords(string selectQuery, DataSet dtSet, string tableName)
    {
        SqlConnection sCon = CreateSqlConnection(new SqlConnection());
        SqlDataAdapter sDta = new SqlDataAdapter();
        sDta.SelectCommand = new SqlCommand();
        sDta.SelectCommand.Connection = sCon;
        sDta.SelectCommand.CommandType = CommandType.Text;
        sDta.SelectCommand.CommandText = selectQuery;
        try
        {
            sDta.SelectCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            return false;
        }
        sDta.Fill(dtSet, tableName);
        sDta = null;
        return true;
        sCon.Close();
    }

    public void ShowMessage(string msgType, string msgText, Label lblMessage)
    {
        lblMessage.Visible = true;
        lblMessage.Text = msgText;
        if (msgType.Equals("Success"))
        {
            lblMessage.CssClass = "message success";
        }
        else if (msgType.Equals("Warning"))
        {
            lblMessage.CssClass = "message warning";
        }
        else if (msgType.Equals("Information"))
        {
            lblMessage.CssClass = "message information";
        }
        else if (msgType.Equals("Error"))
        {
            lblMessage.CssClass = "message error";
        }
    }

    public bool sendEmail(System.Net.Mail.MailMessage obMsg)
    {
        bool funValue = false;
        try{
            System.Net.Mail.SmtpClient obSmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            System.Net.NetworkCredential obUserInfo = new System.Net.NetworkCredential("yourEmail","yourPassword");
            obSmtp.UseDefaultCredentials = false;
            obSmtp.Credentials = obUserInfo;
            obSmtp.EnableSsl = true;
            obSmtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            obSmtp.Send(obMsg);
            obMsg = null;
            funValue = true;
        }
        catch(Exception ex)
        {
            funValue = false;
        }
        return funValue;
    }   
}
