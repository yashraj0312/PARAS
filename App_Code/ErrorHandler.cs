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
using System.IO;
using System.Globalization;

public class ErrorHandler
{
	public ErrorHandler()
	{		
	}

    public static void WriteError(string errorMessage)
    {
        try
        {
            string filePath = "~/Error/" + DateTime.Today.ToString("dd-MM-yy") + ".txt";
            if(!File.Exists(System.Web.HttpContext.Current.Server.MapPath(filePath)))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(filePath)).Close();
            }            
            using (StreamWriter sW = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(filePath))) 
            {
	            sW.WriteLine("\n\nLog Entry : ");
                sW.WriteLine("{0}", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                string errText = "Error in: " + System.Web.HttpContext.Current.Request.Url.ToString() + ". Error Message: " + errorMessage;
                sW.WriteLine(errText);
                sW.WriteLine("***********************************");
                sW.Flush();
                sW.Close();
            }
        }
        catch (Exception ex)
        {
            WriteError(ex.Message);
        }
    }
}
