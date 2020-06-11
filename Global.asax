<%@ Application Language="C#" %>
<script runat="server">      
    public void Application_Error(object sender, EventArgs e)
    {
	    Exception objEx = Server.GetLastError().GetBaseException();
	    string errText = "Error in: " + Request.Url.ToString() + ". Error Message: " + objEx.Message.ToString();
	    ErrorHandler.WriteError(errText);
    }    
</script>