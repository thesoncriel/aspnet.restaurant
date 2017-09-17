<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="Restaurant.Sales" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <asp:SqlDataSource ID="SqlDataSales" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" 
        SelectCommand="select * from sales
order by sdate desc, stime desc;"></asp:SqlDataSource>
    <br />
    <div class="contentTitle">매출 현황</div>
    <br />
    <table cellpadding="0" cellspacing="0" border="0">
    <tr><td align="right">
        
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSales" AllowPaging="True" Width="550px" 
            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
            PageSize="15" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowediting="GridView1_RowEditing">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="sdate" HeaderText="날짜" SortExpression="sdate" 
                DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="stime" HeaderText="시간" SortExpression="stime" />
            <asp:BoundField DataField="menu" HeaderText="품목" SortExpression="menu" />
            <asp:BoundField DataField="amount" HeaderText="구입가" 
                SortExpression="amount" />
            <asp:BoundField DataField="tblnum" HeaderText="테이블번호" 
                SortExpression="tblnum" />
            <asp:BoundField DataField="discnt" HeaderText="할인" 
                SortExpression="discnt" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        <asp:CheckBox ID="chkGroup" runat="server" Text="그룹 보기" TextAlign="Left" 
            Visible="False" />
        <asp:DropDownList ID="cmbSearch" runat="server">
            <asp:ListItem>날짜별</asp:ListItem>
            <asp:ListItem>시간별</asp:ListItem>
            <asp:ListItem>품목별</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server"
        Text="검색" onclick="btnSearch_Click" />
    </td></tr>
    </table>
</asp:Content>