<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>BVICAM Project Assessment and Review Automation System(PARAS)(PARAS) | Home</title>
        <link href="css/core.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="frmHome" runat="server">
            <ajaxToolkit:ToolkitScriptManager ID="smHome" runat="server" />
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
                                            <li class="active"><a href="Default.aspx" style="color:White;">Home</a></li>
                                            <li><a href="Login.aspx">Login</a></li>
                                            <!--<li><a href="Register.aspx">Register</a></li>
                                            <li><a href="#">News & Events</a></li>                                                                                        
                                            <li style="float:right;"><a href="#">Govt. Website</a></li>-->
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
                                                <td style="width:100%; font-size:22px; padding-bottom:5px;">Introduction</td>
                                            </tr>
                                            <tr>
                                                <td style="width:100%; background-color:White; border:Solid 1px #DFDFDF; text-align:justify; padding:10px; line-height:25px;">
                                                    Project Assessment and Review Automation System(PARAS) is a service offered by BVICAM which manages the semester project submission and review. Users interact with this system using standard web browsers.<br />
                                                    <span style="margin-top:20px;">
                                                        The objectives of  Project Assessment and Review Automation System(PARAS) are as follows:<br />
                                                        <span style="line-height:15px; height:15px; font-size:11px;">
                                                            &nbsp;&nbsp; &raquo; Student can upload their semester projects details and presentations.<br />                              
                                                            &nbsp;&nbsp; &raquo; Faculty can view and review the student projects and presentations.<br />                               
                                                            &nbsp;&nbsp; &raquo; Student can view the comments given by the faculty.<br />                               
                                                        </span>                                                        
                                                    </span>
                                                </td>
                                            </tr>
                                           <!-- <tr>
                                                <td style="width:100%; font-size:22px; padding-bottom:5px; padding-top:15px;">Time Line for Receipt of Project Applications</td>
                                            </tr>
                                            <tr>
                                                <td style="width:100%; background-color:White; border:Solid 1px #DFDFDF; text-align:justify; padding:10px; line-height:25px;">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td style="width:15%; border-bottom:Dashed 1px #DFDFDF"><b>Quarter</b></td>
                                                            <td style="width:50%; border-bottom:Dashed 1px #DFDFDF"><b>Processing by PSC</b></td>
                                                            <td style="width:35%; border-bottom:Dashed 1px #DFDFDF"><b>Processing by PAC</b></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:15%;">First</td>
                                                            <td style="width:50%;">First Week of March</td>
                                                            <td style="width:35%;">Last Week of March</td>
                                                        </tr> 
                                                        <tr>
                                                            <td style="width:15%;">Second</td>
                                                            <td style="width:50%;">First Week of June</td>
                                                            <td style="width:35%;">Last Week of June</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:15%;">Third</td>
                                                            <td style="width:50%;">First Week of September</td>
                                                            <td style="width:35%;">Last Week of September</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:15%;">Fourth</td>
                                                            <td style="width:50%;">First Week of December</td>
                                                            <td style="width:35%;">Last Week of December</td>
                                                        </tr>  
                                                     </table>
                                                </td>
                                            </tr> -->
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
                                                                About Project Assessment and Review Management System(PARAS) 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:100%; font-size:10px; color:#8A8A8A; text-align:justify; line-height:18px;">
                                                               Project Assessment and Review Automation System(PARAS) is a service offered by BVICAM which manages the semester project submission and review. Users interact with this system using standard web browsers.<br /><br />
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
                                    <td style="width:50%; text-align:right; padding-top:10px; padding-bottom:10px; vertical-align:middle;">POWERED AT: <img src="images/logoItm.png" alt="BVICAM" align="middle"/></td>
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
