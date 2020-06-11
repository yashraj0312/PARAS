<%@ Page Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Student_Profile" Title="Student | Profile" %>
<asp:Content ID="cntProfile" ContentPlaceHolderID="cphStudentMaster" Runat="Server">
    <div style="width:100%; vertical-align:top; padding-bottom:4px;">
        <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>
        <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
            <tr>
                <td style="width:50%; text-align:left;"><span class="pageTitle">Profile</span></td>
                <td style="width:50%; text-align:right; color:#6D0D00;">&nbsp;</td>
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
                <th>Name</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtName" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Role</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtRole" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Email</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtEmail" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Phone</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtPhone" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Last Login</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtLastLogin" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Last Password Change</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtLastPasswordChange" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>                                              
        </tbody>
    </table>
</asp:Content>

