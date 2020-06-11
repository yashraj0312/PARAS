<%@ Page Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="UserCreation.aspx.cs" Inherits="Administrator_UserCreation" Title="Administrator | User Creation" %>
<asp:Content ID="cntUserCreation" ContentPlaceHolderID="cphAdminMaster" Runat="Server">
    <asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">User Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;"><asp:LinkButton id="lbtnView" runat="server" Text="DISPLAY USER LIST" CssClass="lbtnViewClass" PostBackUrl="~/Administrator/UserDetails.aspx"></asp:LinkButton></td>
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
                        <th>User Name<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtName" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Role<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlRole" runat="server" Width="20%" CssClass="drpClass" Height="30px"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Login Id<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtLoginId" runat="server" Width="40%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLoginId" runat="server" ControlToValidate="txtLoginId"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Password<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtPassword" runat="server" Width="40%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Phone No.</th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtPhoneNo" runat="server" Width="40%" CssClass="txtClass" Height="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtPhoneNo" ValidationGroup="btnSubmit" ValidationExpression="\S{10,10}" SetFocusOnError="true" CssClass="invalid-side-note">Incorrect Number</asp:RegularExpressionValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="ftePhoneNo" runat="server" TargetControlID="txtPhoneNo" ValidChars="1234567890"/>                            
                        </td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtEmail" runat="server" Width="40%" CssClass="txtClass" Height="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="btnSubmit" SetFocusOnError="true" ValidationExpression ="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" CssClass="invalid-side-note">Incorrect Email</asp:RegularExpressionValidator>
                        </td>
                    </tr>                                                   
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnClass" ValidationGroup="btnSubmit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Administrator/UserDetails.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

