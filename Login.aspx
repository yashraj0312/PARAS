<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Project Assessment and Review Automation System(PARAS) | Login</title>
        <link href="css/core.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="frmLogin" runat="server">
            <ajaxToolkit:ToolkitScriptManager ID="smLogin" runat="server" />
            <div style="border-top: Solid 2px Gray; height:2px; line-height:2px;">
                <table width="100%" cellpadding="0px" cellspacing="0px">
                    <tr>
                        <td style="width:5%;">&nbsp;</td>
                        <td style="width:90%; padding-top:10px;">
                            <table width="100%" cellpadding="0px" cellspacing="0px">
                                <tr>
                                    <td style="width:60%; text-align:left;">
                                        <table width="100%" cellpadding="0px" cellspacing="0px">
                                            <tr>
                                                <td style="width:20%; text-align:left; vertical-align:top;"><img src="images/logoItm.png" alt="BVICAM" /></td>
                                                <td style="width:87%; text-align:left; vertical-align:middle; padding-top:10px;">
                                                    <div style="font-family:Arial Unicode MS; font-size:30px; color:#BD3220;"><span style="font-size:25px;">Bharati Vidyapeeth's</span></div>
                                                    <div style="font-family:Arial Unicode MS; font-size:30px; color:#BD3220; padding-top:25px;"><span style="font-size:25px;">Institute of Computer Applications and Management</span></div>
                                                    <div style="font-family:Ebrima; font-size:20px; color:#BD3220; padding-top:25px;">Project Assessment and Review Automation System(PARAS)</div>
                                                </td>
                                            </tr>
                                        </table>                                
                                    </td>
                                    <td style="width:20%; text-align:left; vertical-align:top; padding-top:10px;">Hello Guest, <a href="Login.aspx">Login</a><!--&nbsp;|&nbsp;<a href="Register.aspx">Register</a></td>-->
                                   <!-- <td style="width:20%; text-align:right; vertical-align:top;"><img src="images/BVICAM.png" alt="Swachchh Bharat"/></td> -->
                                </tr>
                                <tr>
                                    <td style="width:100%; text-align:left; padding-top:15px; padding-bottom:10px;" colspan="3">
                                        <ul>
                                            <li><a href="Default.aspx">Home</a></li>
                                            <li class="active"><a href="Login.aspx" style="color:White;">Login</a></li>
                                            <li></li>
                                            <!--<li><a href="Register.aspx">Register</a></li>
                                            <li><a href="#">News & Events</a></li>-->                                                                                        
                                           <!-- <li style="float:right;"><a href="#">Govt. Website</a></li>-->
                                        </ul>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <td style="width:100%; height:30px; line-height:11px; text-align:left; vertical-align:middle; border:Solid 1px #990000; background-color:#FFBABA; color:#D8000C; padding-left:10px;" colspan="3">                                        
                                        <marquee><asp:Label ID="lblScrollingText" runat="server" Font-Size="11px" Text="WE EXPECT HEAVY LOAD ON THE WEBSITE TOWARDS THE LAST DATE FOR APPLYING. PLEASE APPLY WELL BEFORE THE CLOSING DATE TO AVOID NETWORK PROBLEM & INABILITY TO REGISTER YOUR APPLICATION."></asp:Label></marquee>
                                    </td>
                                </tr> -->
                                <tr>
                                    <td style="width:100%; line-height:10px;" colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:100%; line-height:30px; background-color:#F6F6F6; padding:10px 10px 10px 10px; border:Solid 1px #DFDFDF;" colspan="3">
                                        <table width="100%" cellpadding="0px" cellspacing="0px">
                                            <tr>
                                                <td style="width:100%; font-size:22px; padding-bottom:5px;">Login Information</td>
                                            </tr>
                                            <tr>
                                                <td style="width:100%; background-color:White; border:Solid 1px #DFDFDF; text-align:justify; padding:10px; line-height:25px;">
                                                    <asp:UpdatePanel ID ="upLogin" runat="server">
                                                        <ContentTemplate>
                                                            <table width="100%" cellpadding="0px" cellspacing="0px">
                                                                <tr>
                                                                    <td style="width:55%; vertical-align:top; text-align:left;">
                                                                        <table width="50%" cellpadding="0px" cellspacing="0px">
                                                                            <tr>
                                                                                <td style="width:20%; padding:10px 0px 10px 10px;">
                                                                                    <b>User Id</b><span style="color:Red;"> *</span>
                                                                                </td>
                                                                                <td style="width:50%; padding:10px 0px 10px 0px;">
                                                                                    <asp:TextBox ID="txtLoginId" runat="server" Width="50%" CssClass="txtClassLogin"></asp:TextBox>
                                                                                </td>
                                                                                <td style="width:30%; padding:0px 0px 10px 0px;">
                                                                                    <asp:RequiredFieldValidator ID="rfvLoginId" runat="server" ControlToValidate="txtLoginId" Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnLogin">Required</asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width:20%; padding:0px 0px 0px 10px;">
                                                                                    <b>Password</b><span style="color:Red;"> *</span>
                                                                                </td>
                                                                                <td style="width:50%; padding:0px 0px 0px 0px;">
                                                                                    <asp:TextBox ID="txtPassword" runat="server" Width="50%" CssClass="txtClassLogin" TextMode="Password"></asp:TextBox>
                                                                                </td>
                                                                                <td style="width:30%; padding:0px 0px 0px 0px;">
                                                                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnLogin">Required</asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td style="width:20%; padding:15px 0px 5px 0px;">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td style="width:80%; padding:15px 0px 5px 0px;" colspan="2">
                                                                                    <asp:Button ID="btnLogin" runat="server" Text="LOGIN" Width="70px" CssClass="btnClass" ValidationGroup="btnLogin" onclick="btnLogin_Click"/>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width:20%; border-bottom:Dotted 1px #DFDFDF;padding-bottom:10px;">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td style="width:80%; border-bottom:Dotted 1px #DFDFDF; padding-bottom:10px;" colspan="2">
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="100%" Font-Size="11px" ForeColor="Red"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                           
                                                                         <!--   <tr>
                                                                                <td style="width:20%;">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td style="width:80%;" colspan="2">
                                                                                    <b>First Time User? <a href="Register.aspx"><b>Click Here</b></a></b>
                                                                                </td>
                                                                            </tr> -->
                                                                        </table>
                                                                    </td>
                                                                   <!-- <td style="width:45%; vertical-align:top; line-height:30px; padding-left:50px; padding-top:10px;">
                                                                        <span style="font-size:16px;"><b>Forget Password?</b></span><br />
                                                                        <span><b><a href="ForgetPassword.aspx">Click Here</a> to Recover the Password</span></b>
                                                                    </td> -->
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table> 
                                    </td>           
                                </tr>
                            </table>
                        </td>
                        <td style="width:5%;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:100%; height:20px;" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:100%; background:url('images/footerBg.png') #f2f2f2; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight: normal; padding-top:20px;" colspan="3">
                            <table width="100%" cellpadding="0px" cellspacing="0px">
                                <tr>
                                    <td style="width:5%;">&nbsp;</td>
                                    <td style="width:90%; padding:20px; background-color:White; line-height:25px;">
                                        <table width="100%" cellpadding="0px" cellspacing="0px">
                                            <tr>
                                                <td style="width:60%; padding-right:40px; vertical-align:top;">
                                                    <table width="100%" cellpadding="0px" cellspacing="0px">
                                                        <tr>
                                                            <td style="width:100%; font-size:18px; color:Black; padding-bottom:15px;">
                                                                About Project Assessment and Review Automation System(PARAS) 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:10px; color:#8A8A8A; text-align:justify; line-height:18px;">
                                                               The Extra Mural Research scheme of Ministry of AYUSH strives to promote research and development in priority areas based on disease burden in alignment to national health programme. 
                                                                It aims to utilize the vast research infrastructure available within the country for standardization and validation of classical drugs.<br /><br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <!--  <td style="width:15%; vertical-align:top; padding-right:20px;">
                                                   <table width="100%" cellpadding="0px" cellspacing="0px">
                                                        <tr>
                                                            <td style="width:100%; font-size:18px; color:Black; padding-bottom:15px;">
                                                                More Info 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:11px; text-align:justify; line-height:22px;"><a href="#">&raquo; Sample Menu 1</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:11px; text-align:justify; line-height:22px;"><a href="#">&raquo; Sample Menu 2</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:11px; text-align:justify; line-height:22px;"><a href="#">&raquo; Sample Menu 3</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:11px; text-align:justify; line-height:22px;"><a href="#">&raquo; Sample Menu 4</a></td>
                                                        </tr>                                                        
                                                    </table>
                                                </td> -->
                                                <td style="width:25%; vertical-align:top;">
                                                    <table width="100%" cellpadding="0px" cellspacing="0px">
                                                        <tr>
                                                            <td style="width:100%; font-size:18px; color:Black; padding-bottom:15px;" colspan="2">
                                                                Contact 
                                                            </td>
                                                        </tr>
                                                        <tr>                                                                
                                                            <td valign="top" style="padding-left:10px;text-align:justify; line-height:16px; width:12%; vertical-align:top;">
                                                                <img src="images/contactAddress.png" alt="Contact Address" />
                                                            </td>
                                                            <td valign="top" style="text-align:justify; line-height:16px; width:88%">                                                                    
                                                                A-4, Paschim Vihar, Opp. Paschim Vihar (East) Metro Station,
                                                                Rohtak Road, New Delhi - 110063                                 
                                                            </td>
                                                        </tr>
                                                          
                                                        <tr>                                                                
                                                            <td valign="top" style="padding-top:10px; padding-left:10px; line-height:18px; width:12%; vertical-align:middle;">
                                                                <img src="images/contactTeliphone.png" alt="Phone Number" />
                                                            </td>
                                                            <td valign="top" style="padding-top:10px; text-align:justify; line-height:16px; width:88%">
                                                              <b>Phone:</b> &nbsp; 011-25275055, 9212022066
                                                            </td>
                                                        </tr>
                                                          
                                                        <tr>                                                                
                                                            <td valign="top" style="padding-top:10px; padding-left:10px; line-height:18px; width:12%; vertical-align:middle;">
                                                                <img src="images/contactFax.png" alt="Fax Number" />
                                                            </td>
                                                            <td valign="top" style="padding-top:10px; text-align:justify; line-height:16px; width:88%">
                                                              <b>Fax:</b> &nbsp; 011-25255056
                                                            </td>
                                                        </tr>
                                                          
                                                        <tr>                                                                
                                                            <td valign="top" style="padding-top:10px; padding-left:10px; line-height:18px; width:12%; vertical-align:middle;">
                                                                <img src="images/contactEmail.png" alt="Email Address" />
                                                            </td>
                                                            <td valign="top" style="padding-top:10px; text-align:justify; line-height:16px; width:88%" colspan="2">
                                                                <b>Email:</b> &nbsp;<a href="http://mca@bvicam.ac.in">mca@bvicam.ac.in</a><a href="http://mca.hoda@gmail.com">mca.hoda@gmail.com</a>
                                                            </td>
                                                        </tr>
                                                         <tr>                                                                
                                                            <td valign="top" style="padding-top:10px; text-align:justify; line-height:16px; width:88%" colspan="2">
                                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                Website:</b> &nbsp;<a href="http://www.bvicam.ac.in">www.bvicam.ac.in</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width:5%;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:100%; height:20px;" colspan="3">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:5%;">&nbsp;</td>
                        <td style="width:90%; background-color:White; font-size:10px; height:40px; line-height:40px;">
                            <table width="100%" cellpadding="0px" cellspacing="0px">
                                <tr>
                                    <!--<td style="width:50%; text-align:left; vertical-align:top;">POWERED BY: BVICAM_007 (FOR SMART INDIA HACKATHON - 2018)</td>-->
                                    <td style="width:50%; text-align:right; padding-top:10px; padding-bottom:10px; vertical-align:middle;">POWERED AT: <img src="images/logoItm.png" alt="BVICAM, NEW DELHI" align="middle"/></td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:5%;">&nbsp;</td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
