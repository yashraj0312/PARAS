﻿<%@ Page Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Administrator_UserDetails" Title="Administrator | User List" %>
<asp:Content ID="cntUserDetails" ContentPlaceHolderID="cphAdminMaster" Runat="Server">
    <script type="text/javascript">
        function Select(chkId) {           
            var gridId = document.getElementById("<%= gridUserDetails.ClientID %>");          
            var cell;
            if (gridId.rows.length > 0) {                
                for (i = 1; i < gridId.rows.length; i++) {                    
                    cell = gridId.rows[i].cells[0];                    
                    for (j = 0; j < cell.childNodes.length; j++) {                                     
                        if (cell.childNodes[j].type == "checkbox") {                          
                            cell.childNodes[j].checked = document.getElementById(chkId).checked;
                        }
                    }
                }
            }
        }
    </script>
    
    <asp:UpdatePanel ID="upUserDetails" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="lbtnPrint" />
        </Triggers>
        <ContentTemplate>
            <div style="width:100%; vertical-align:top; padding-bottom:4px;"> 
	            <asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>	    
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0">
                    <tr>
                        <td style="width:50%; text-align:left;"><span class="pageTitle">User List</span></td>
                        <td style="width:50%; text-align:right; color:#6D0D00;">
                            <asp:LinkButton id="lbtnPrint" runat="server" Text="PRINT LIST" CssClass="lbtnPrintClass" onclick="lbtnPrint_Click"></asp:LinkButton></td>
                    </tr>
                </table>
            </div>
            
            <table class="tblView" cellspacing="0" cellpadding="0" width="100%">                
                <tr>
                    <td style="WIDTH: 100%; PADDING-TOP: 0px; BORDER-BOTTOM: white 1px solid">
                        <asp:GridView id="gridUserDetails" runat="server" Width="100%" DataKeyNames="UserId" EmptyDataText="NO RECORDS!" CssClass="infotable" GridLines="None" ShowHeader="true" ShowFooter="false" AutoGenerateColumns="False" EmptyDataRowStyle-Width="100%" Height="100%" OnRowDataBound="gridUserDetails_RowDataBound" OnRowCommand="gridUserDetails_RowCommand">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign ="left">
                                    <ItemStyle CssClass ="infotable" Width ="5%"/>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect"  runat="server"/>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </HeaderTemplate>
                                    <AlternatingItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </AlternatingItemTemplate>
                                </asp:TemplateField>   
                                <asp:BoundField DataField="UserName" HeaderText="Name" ReadOnly="True">
                                    <ItemStyle Wrap="True" Width="25%" CssClass="infotable"></ItemStyle>                                    
                                </asp:BoundField>
                                <asp:BoundField DataField="LoginId" HeaderText="Login Id" ReadOnly="True">
                                    <ItemStyle Wrap="True" Width="25%" CssClass="infotable"></ItemStyle>                                    
                                </asp:BoundField>
                                <asp:BoundField DataField="RoleName" HeaderText="Role" ReadOnly="True">
                                    <ItemStyle Wrap="True" Width="25%" CssClass="infotable"></ItemStyle>                                    
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Status" DataTextField="Status" Text="Status" HeaderText="Status">
                                    <ItemStyle Wrap="True" Width="10%" CssClass="infotable"></ItemStyle>
                                </asp:ButtonField>
                                <asp:TemplateField HeaderText="&nbsp;&nbsp;Options" ShowHeader="True">
                                    <ItemStyle width="10%" CssClass="infotable" /> 
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnView" runat ="server" OnClick="ibtnView_Click" CausesValidation="false" ImageUrl="~/images/icons/icoView.png" ToolTip="View"/>&nbsp;
                                        <asp:ImageButton ID="ibtnEdit" runat ="server" OnClick="ibtnEdit_Click" CausesValidation="false" ImageUrl="~/images/icons/icoEdit.png" ToolTip="Edit"/>&nbsp;
                                        <asp:ImageButton ID="ibtnDelete" runat="server" OnClick="ibtnDelete_Click" CausesValidation="false" ImageUrl="~/images/icons/icoDelete.png" ToolTip="Delete" OnClientClick="return confirm('DO YOU WANT TO DELETE THIS RECORD?')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            
            <div style="PADDING-LEFT: 0px; PADDING-TOP: 0px; TEXT-ALIGN: left; padding-bottom:15px; width:100%;">
                <table width="100%" cellpadding="0px" cellspacing="0px">
                    <tr>
                        <td style="width:47%; text-align:left; vertical-align:middle;">
                            <asp:Button id="btnDelete" runat="server" CssClass="btnClass" Text="DELETE" OnClick="btnDelete_Click"></asp:Button>&nbsp;&nbsp;<asp:Button id="btnAdd" runat="server" CssClass="btnClass" Text="REGISTER STUDENT" PostBackUrl="~/Administrator/StudentRegistration.aspx"></asp:Button>&nbsp;&nbsp;<asp:Button id="Button1" runat="server" CssClass="btnClass" Text="REGISTER FACULTY" PostBackUrl="~/Administrator/FacultyRegistration.aspx"></asp:Button>
                        </td>
                        
                        <td style="width:18%; text-align:right; vertical-align:top;">
                            <asp:DropDownList ID="ddlPageSize" runat ="server" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" AutoPostBack ="true" Width ="100%" CssClass="drpClass">
                                <asp:ListItem Text="&nbsp;SHOW 15 RECORDS" Value="15" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="&nbsp;SHOW 25 RECORDS" Value="25"></asp:ListItem>                                                                                                                
                                <asp:ListItem Text="&nbsp;SHOW 50 RECORDS" Value="50"></asp:ListItem>                                
                                <asp:ListItem Text="&nbsp;SHOW ALL RECORDS" Value="5000"></asp:ListItem>
                            </asp:DropDownList>            
                        </td>
                        <td style="width:5%; text-align:right; vertical-align:middle;" class="pagingClass">
                            <asp:LinkButton ID="lnkbtnNext" runat ="server" Text ="&raquo;" OnClick="lnkbtnNext_Click" CssClass="btnClass"></asp:LinkButton>
                        </td>
                        <td style="width:25%; text-align:center; vertical-align:middle;" class="pagingClass">                            
                            <asp:DataList ID="dlPaging" runat="server" OnItemDataBound="dlPaging_ItemDataBound" OnItemCommand="dlPaging_ItemCommand" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %> &nbsp;&nbsp;' CssClass="btnClass"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:DataList>                            
                        </td>
                        <td style="width:5%; text-align:right; vertical-align:middle;" class ="pagingClass">
                            <asp:LinkButton ID="lnkbtnPrevious" runat ="server" Text ="&laquo;" OnClick="lnkbtnPrevious_Click" CssClass="btnClass"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Button id="btnShowPopup" runat="server" style="display:none" />
    <ajaxToolKit:ModalPopupExtender ID="mdlPopup" 
                                    runat="server" 
                                    TargetControlID="btnShowPopup" 
                                    PopupControlID="pnlPopup" 
                                    CancelControlID="btnClose" 
                                    BackgroundCssClass="modalBackground"/>
    <asp:Panel ID="pnlPopup" runat="server" Width="700px">
        <div>
            <table width="100%" cellpadding="0px" cellspacing="0px">
                <tr>
                    <td style="width:70%; text-align:left; background-color:White; padding:15px 0px 5px 15px"><span class="pageTitle">User Detail</span></td>
                    <td style="width:30%; text-align:right; background-color:White; padding:15px 15px 5px 0px"><asp:ImageButton ID="btnClose" ImageUrl ="~/images/btnClose.gif" runat ="server"/></td>
                </tr>
            </table>            
        </div>
        <asp:UpdatePanel ID="upUserDetailView" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table width="100%" cellpadding="0px" cellspacing="0px">                                            
                    <tr>
                        <td style="width:100%; background-color:White; padding:0px 15px 15px 15px;">
                            <asp:DataList ID="dlUserDetail" runat="server" Width="100%">
                                <ItemTemplate>
                                    <table class="tblView" width="100%" cellpadding="0px" cellspacing="0px">
                                        <colgroup>
                                            <col width="18%"/>
                                            <col width="3%"/>
                                            <col width="29%"/>                                                
                                            <col width="18%"/>
                                            <col width="3%"/>
                                            <col width="29%"/>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Name</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;" colspan="4">
                                                    <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Login Id</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "LoginId")%>
                                                </td>
                                                <td class="td" style="padding-left:0px; height:28px;">Login Status</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "LoginStatus")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Email</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;" colspan="4">
                                                    <%#DataBinder.Eval(Container.DataItem, "Email")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Phone No.</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "PhoneNo")%>
                                                </td>
                                                <td class="td" style="padding-left:0px; height:28px;">Role</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "RoleName")%>
                                                </td>
                                            </tr>                                                                                                                       
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Creation Date</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "CreationDate", "{0:MMM dd, yyyy hh:mm:ss}")%>
                                                </td>
                                                <td class="td" style="padding-left:0px; height:28px;">Creation By</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "CreationBy")%>
                                                </td>
                                            </tr>                                                
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Modification Date</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "ModificationDate", "{0:MMM dd, yyyy hh:mm:ss}")%>
                                                </td>
                                                <td class="td" style="padding-left:0px; height:28px;">Modification By</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;" colspan="3">                                                
                                                    <%#DataBinder.Eval(Container.DataItem, "ModificationBy")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td" style="padding-left:0px; height:28px;">Last Login Date</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;">
                                                    <%#DataBinder.Eval(Container.DataItem, "LastLoginDate", "{0:MMM dd, yyyy hh:mm:ss}")%>
                                                </td>
                                                <td class="td" style="padding-left:0px; height:28px;">Pwd Change Date</td>
                                                <td class="td" style="text-align:center; height:28px;">:</td>
                                                <td class="td" style="height:28px;" colspan="3">                                                
                                                    <%#DataBinder.Eval(Container.DataItem, "LastPasswordChangeDate", "{0:MMM dd, yyyy hh:mm:ss}")%>
                                                </td>
                                            </tr>                                                
                                        </tbody>
                                    </table>                                    
                                </ItemTemplate>
                            </asp:DataList>
                            <br /><br />
                        </td>                                        
                    </tr>
                </table>                                   
            </ContentTemplate>
        </asp:UpdatePanel>  
    </asp:Panel>
</asp:Content>

