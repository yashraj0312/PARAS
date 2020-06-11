<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="Administrator_StudentRegistration" %>
<asp:Content ID="cntStudentRegistration" ContentPlaceHolderID="cphAdminMaster" Runat="Server">
<asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Student Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                        <asp:LinkButton ID ="lbtnView" runat ="server" Text="DISPLAY STUDENT LIST" CssClass ="lbtnViewClass" PostBackUrl="~/Administrator/StudentDetails.aspx"></asp:LinkButton></td>
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
                            <asp:DropDownList ID="ddlCourse" runat="server" Width="50%" CssClass="drpClass" Height="30px"  ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                        <th>Batch<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlBatch" runat="server" Width="50%" CssClass="drpClass" 
                                Height="30px" AutoPostBack = "true" 
                                onselectedindexchanged="ddlBatch_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBatch" runat="server" ControlToValidate="ddlBatch" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     
                    <tr>
                        <th>Semester<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlSemester" runat="server" Width="50%" 
                                CssClass="drpClass" Height="30px" AutoPostBack = "true" 
                                onselectedindexchanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Section<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlSection" runat="server" Width="50%" 
                                CssClass="drpClass" Height="30px" AutoPostBack = "true" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSection" runat="server" ControlToValidate="ddlSection" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Enrollment Number<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtEnrollmentNumber" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEnrollmentNumber" runat="server" ControlToValidate="txtEnrollmentNumber"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>Student Name<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtStudentName" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ControlToValidate="txtStudentName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                      <tr>
                        <th>Phone Number<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtPhone" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ValidationGroup="btnSubmit" ValidationExpression="\S{10,10}" SetFocusOnError="true" CssClass="invalid-side-note">Incorrect Number</asp:RegularExpressionValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="ftePhone" runat="server" TargetControlID="txtPhone" ValidChars="1234567890"/>                            
                        </td>
                    </tr>
                    <tr>
                        <th>Email<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtEmail" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="btnSubmit" SetFocusOnError="true" ValidationExpression ="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" CssClass="invalid-side-note">Incorrect Email</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
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

