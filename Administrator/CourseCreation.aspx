<%@ Page Title="Course Creation" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="CourseCreation.aspx.cs" Inherits="Administrator_CourseCreation" %>
<asp:Content ID="cntCourseCreation" ContentPlaceHolderID="cphAdminMaster" Runat="Server">
    <asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Course Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                        <asp:LinkButton ID ="lbtnView" runat ="server" Text="DISPLAY COURSE LIST" CssClass ="lbtnViewClass" PostBackUrl="~/Administrator/CourseDetails.aspx"></asp:LinkButton></td>
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
                        <th>Course Name (Full)<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtFullCourseName" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFullCourseName" runat="server" ControlToValidate="txtFullCourseName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>Course Name (Short)<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtShortCourseName" runat="server" Width="40%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvShortCourseName" runat="server" ControlToValidate="txtShortCourseName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>Duration (Years) <span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtDurationYear" runat="server" Width="20%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revDurationYear" runat="server" ControlToValidate="txtDurationYear" ValidationGroup="btnSubmit" ValidationExpression="\S{1,1}" SetFocusOnError="true" CssClass="invalid-side-note">Incorrect Number</asp:RegularExpressionValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fteDurationYear" runat="server" TargetControlID="txtDurationYear" ValidChars="1234567890"/>                            
                        </td>
                    </tr>
                    
                    <tr>
                        <th>Duration (Semester) <span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtDurationSemester" runat="server" Width="20%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revDurationSemester" runat="server" ControlToValidate="txtDurationSemester" ValidationGroup="btnSubmit" ValidationExpression="\S{1,1}" SetFocusOnError="true" CssClass="invalid-side-note">Incorrect Number</asp:RegularExpressionValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fteDurationSemester" runat="server" TargetControlID="txtDurationSemester" ValidChars="1234567890"/>                            
                        </td>
                    </tr>
                                                              
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnClass" ValidationGroup="btnSubmit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Administrator/CourseDetails.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

