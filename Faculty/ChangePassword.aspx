<%@ Page Language="C#" MasterPageFile="~/Faculty/FacultyMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Faculty_ChangePassword" Title="Faculty | Change Password" %>
<asp:Content ID="cntChangePassword" ContentPlaceHolderID="cphFacultyMaster" Runat="Server">
    <asp:UpdatePanel ID="upChangePassword" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Password Information</span></td>
                        <td style="width:50%; text-align:right; color:#BD3220;">(*) Required Fields</td>
                    </tr>
                </table>
            </div>
            <table class="tblView" width="100%" cellpadding="0px" cellspacing="0px">
                <colgroup>
                    <col width="160"/>
                    <col width="30%"/>
                    <col width="160"/>
                    <col width="*"/>
                </colgroup>
                <tbody>                           
                    <tr>
                        <th>Old Password<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtOldPassword" runat="server" Width="40%" CssClass ="txtRequiredClass" TextMode="Password" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword" Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required Field</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>New Password<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtNewPassword" runat="server" Width="40%" CssClass ="txtRequiredClass" TextMode="Password" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required Field</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Confirm New Password<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">                            
                            <asp:TextBox ID="txtConfirmPassword" runat="server" Width="40%" CssClass ="txtRequiredClass" TextMode="Password" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required Field</asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="cvConfirmPassword" runat="server" Display="Dynamic" ValidationGroup="btnSubmit" SetFocusOnError="true" ErrorMessage="NEW AND CONFIRM PASSWORDS ARE NOT SAME!" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" Font-Size="11px"></asp:CompareValidator>
                        </td>
                    </tr>                                    
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="CHANGE" CssClass="btnClass" ValidationGroup="btnSubmit" onclick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Administrator/Default.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

