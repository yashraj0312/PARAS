<%@ Page Title="Semester Creation" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="SemesterCreation.aspx.cs" Inherits="Administrator_SemesterCreation" %>
<asp:Content ID="cntSemesterCreation" ContentPlaceHolderID="cphAdminMaster" Runat="Server">
 <asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Semester Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                        <asp:LinkButton ID ="lbtnView" runat ="server" Text="DISPLAY SEMESTER LIST" CssClass ="lbtnViewClass" PostBackUrl="~/Administrator/SemesterDetails.aspx"></asp:LinkButton></td>
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
                        <th>Course<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlCourse" runat="server" Width="50%" CssClass="drpClass" 
                                Height="30px"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                     <tr>
                        <th>Semester<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtSemesterNumber" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSemesterNumber" runat="server" ControlToValidate="txtSemesterNumber"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fteSemesterNumber" runat="server" TargetControlID="txtSemesterNumber" ValidChars="1234567890semesterSEMESTER -"/>  
                        </td>
                    </tr>

                    <tr>
                        <th>Type<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" Heigh="28px" Width="150px">
                                <asp:ListItem Text ="&nbsp;&nbsp;Odd" Value="Odd" Selected="True"></asp:ListItem>
                                <asp:ListItem Text ="&nbsp;&nbsp;Even" Value="Even"></asp:ListItem>
                            </asp:RadioButtonList>

                        </td>
                    </tr>

                    <tr>
                        <th>Session<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtSession" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="txtSession"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Comments<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtComments" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvComments" runat="server" ControlToValidate="txtComments"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>                                  
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnClass" ValidationGroup="btnSubmit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Administrator/SemesterDetails.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>