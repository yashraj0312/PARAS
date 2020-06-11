<%@ Page Title="Section Creation" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="SectionCreation.aspx.cs" Inherits="Administrator_SectionCreation" %>
<asp:Content ID="cntSectionCreation" ContentPlaceHolderID="cphAdminMaster" Runat="Server">

<asp:UpdatePanel ID="upUserCreation" runat="server">
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">Section Information</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                        <asp:LinkButton ID ="lbtnView" runat ="server" Text="DISPLAY SECTION LIST" CssClass ="lbtnViewClass" PostBackUrl="~/Administrator/SectionDetails.aspx"></asp:LinkButton></td>
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
                            <asp:DropDownList ID="ddlCourse" runat="server" Width="50%" CssClass="drpClass" Height="30px" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                      <tr>
                        <th>Batch<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:DropDownList ID="ddlBatch" runat="server" Width="50%" CssClass="drpClass" Height="30px"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBatch" runat="server" ControlToValidate="ddlBatch" InitialValue="Select"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass ="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Section Name<span style="color:Red;"> *</span></th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtSectionName" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSectionName" runat="server" ControlToValidate="txtSectionName"  Font-Bold="False" SetFocusOnError="True" ValidationGroup="btnSubmit" CssClass="invalid-side-note">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Comments</th>
                        <td class="td" colspan="3">
                            <asp:TextBox ID="txtComments" runat="server" Width="70%" CssClass="txtRequiredClass" Height="30px"></asp:TextBox>                            
                        </td>
                    </tr>                                  
                </tbody>
            </table>            
            <div style="text-align:left; padding-top:15px; padding-left:0px;">    
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btnClass" ValidationGroup="btnSubmit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnClass" PostBackUrl="~/Administrator/SectionDetails.aspx"/>                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>