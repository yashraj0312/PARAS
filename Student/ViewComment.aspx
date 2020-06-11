<%@ Page Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeFile="ViewComment.aspx.cs" Inherits="Student_ViewComment" Title="View Review" %>
<asp:Content ID="cntViewComment" ContentPlaceHolderID="cphStudentMaster" Runat="Server">
    <div style="width:100%; vertical-align:top; padding-bottom:4px;">
        <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>
        <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
            <tr>
                <td style="width:50%; text-align:left;"><span class="pageTitle">Submitted Projects</span></td>
                <td style="width:50%; text-align:right; color:#6D0D00;">&nbsp;</td>
            </tr>
        </table>
    </div>

    <div style="width:100%; vertical-align:top; padding-bottom:4px;">
        <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
           <asp:Button ID="btnCancel" runat="server" Text="BACK" CssClass="btnClass" PostBackUrl="~/Student/SubmittedProjects.aspx"/>
        </table>
    </div>

    <asp:Label ID="lblTest" runat="server"></asp:Label>

    <table class="tblView" width="100%" cellpadding="0px" cellspacing="0px">
        <colgroup>
            <col width="300"/>
            <col width="30%"/>
            <col width="160"/>
            <col width="*"/>
        </colgroup>
        <tbody>
        
            <tr>
                <th>Enrollment Number</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtEnrollmentNumber" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Student Name</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtStudentName" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>Course</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtCourse" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>                             
            <tr>
                <th>Batch</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtBatch" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <th>Semester</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtSemester" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            
             <tr>
                <th>Section</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtSection" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr> 
            
            <tr>
                <th>Project Name</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtProjectName" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr> 
            
            <tr>
                <th>Technology Used</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtTechnologyUsed" runat="server" Width="70%" Height="30px" ReadOnly="true" BorderColor="White" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <th>H/W and S/W Requirements For Running</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtRunReq" runat="server" Width="100%" Height="70px" ReadOnly="true" BorderColor="White" BorderStyle="None" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            
           <tr>
                <th>H/W and S/W Requirements For Development</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtDevReq" runat="server" Width="100%" Height="70px" ReadOnly="true" BorderColor="White" BorderStyle="None" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>Comments</th>
                <td class="td" colspan="3">
                    <asp:TextBox ID="txtComments" runat="server" Width="100%" Height="70px" ReadOnly="true" BorderColor="White" BorderStyle="None" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
                                                         
        </tbody>
    </table>
</asp:Content>

