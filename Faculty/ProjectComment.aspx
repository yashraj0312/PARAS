<%@ Page Title="ProjectSubmission" Language="C#" MasterPageFile="~/Faculty/FacultyMaster.master" AutoEventWireup="true" CodeFile="ProjectComment.aspx.cs" Inherits="Faculty_ProjectSubmission" %>
<asp:Content ID="cntProjectSubmission" ContentPlaceHolderID="cphFacultyMaster" Runat="Server">
<asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Project Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                        <asp:LinkButton ID ="lbtnView" runat ="server" Text="DISPLAY PROJECT LIST" CssClass ="lbtnViewClass" PostBackUrl="~/Faculty/ProjectReview.aspx"></asp:LinkButton></td>
                    </tr>
                </table>
            </div>
            
            <table class="tblView" width="100%" cellpadding="0px" cellspacing="0px">
                <colgroup>
                    <col width="300"/>
                    <col width="30%"/>
                    <col width="160"/>
                    <col width="*"/>
                </colgroup>
                <tbody>                      
                                     
                    <tr>
                        <th>Course<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlCourse" runat="server" Width="71.5%" CssClass="drpClass" Height="30px" AutoPostBack = "true"  ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                        <th>Batch<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlBatch" runat="server" Width="71.5%" CssClass="drpClass" 
                                Height="30px" AutoPostBack = "true" 
                                onselectedindexchanged="ddlBatch_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBatch" runat="server" ControlToValidate="ddlBatch" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     
                    <tr>
                        <th>Semester<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlSemester" runat="server" Width="71.5%" 
                                CssClass="drpClass" Height="30px" AutoPostBack = "true" 
                                onselectedindexchanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Section<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlSection" runat="server" Width="71.5%" 
                                CssClass="drpClass" Height="30px" AutoPostBack = "true" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSection" runat="server" ControlToValidate="ddlSection" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Project Name<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtProjectName" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProjectName" runat="server" ControlToValidate="txtProjectName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Technology Used<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtTechnologyUsed" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTechnologyUsed" runat="server" ControlToValidate="txtTechnologyUsed"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>H/W and S/W Requirements For Running<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtRunReq" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRunReq" runat="server" ControlToValidate="txtRunReq"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                      <tr>
                        <th>H/W and S/W Requirements For Development</th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtDevReq" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px" TextMode="MultiLine" ></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>Comments</th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtComments" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px" TextMode="MultiLine" ></asp:TextBox>
                        </td>
                    </tr>
                                                                        
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnClass" ValidationGroup="btnSubmit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Faculty/ProjectReview.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

