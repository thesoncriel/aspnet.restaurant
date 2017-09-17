<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Restaurant.Account" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">
    <link rel="Stylesheet" type="text/css" href="theme/default/account.css" />
    <script type="text/javascript" src="script/account.js">
    </script>
</asp:Content>
<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <form id="frmAccount" onmouseover="setPopCate()">
<asp:SqlDataSource ID="sqlDataCate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" SelectCommand="select distinct category from menu
order by category desc;
"></asp:SqlDataSource>
    <table cellspacing="0" cellpadding="0">
        <tr>
            <td colspan="2" class="accFrame">
                <asp:Literal ID="litTitle" runat="server" Text="></asp:Literal>
                
            </td>
        </tr>
        <tr>
            <td valign="top"><div id="popCate">
                    <!--
                    <asp:Literal ID="setCate" runat="server"></asp:Literal>
                    -->
                    <asp:GridView ID="GridViewCate" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="sqlDataCate" ShowHeader="False" Width="180px" 
                        BorderStyle="None" GridLines="None">
                        <RowStyle CssClass="cateMember0" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <input type="button" class="btnCate" value="<%# Eval("category") %>" onclick="popCate_Click('<%# Eval("category") %>')" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle CssClass="cateMember1" />
                    </asp:GridView>
                </div>
                <div id="popMenu">
                </div>
            </td>
            <td id="popContent" valign="top">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <div class="sumLabel">합계&nbsp;:&nbsp;<asp:TextBox ID="txtSum" runat="server">0</asp:TextBox>&nbsp;원</div>
                <asp:Button ID="btnBack" runat="server" Text="잠시 저장하기" onclientclick="return btnBack_Click()" onclick="btnBack_Click" 
                    />
                <asp:Button ID="btnComp" runat="server" Text="계산종료 및 저장" onclientclick="return btnComp_Click()" onclick="btnComp_Click" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="sqlTempD" runat="server" />
    <asp:HiddenField ID="sqlTemp" runat="server" />
    <asp:HiddenField ID="sqlTempU" runat="server" />
    <!--<img src="image/hdn.gif" width="1" height="1" onload="nowTablePrint()" />-->
    <iframe width="0" height="0" onload="nowTablePrint()"></iframe>
    </form>
</asp:Content>