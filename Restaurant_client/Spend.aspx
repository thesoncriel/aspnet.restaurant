<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Spend.aspx.cs" Inherits="Restaurant.Spend" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

<script type="text/javascript">
        
    </script>
</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <asp:SqlDataSource ID="SqlDataSpend" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" 
        SelectCommand="select * from spend
order by sdate desc"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataCmb" runat="server" 
    ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
    ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" SelectCommand="select distinct category from category
where ref = '식재료' or ref = '소모품'
order by ref desc, category;"></asp:SqlDataSource>
    <br />
    <div class="contentTitle">지출 현황</div>
    <br />
    <table border="0"><tr><td align="right">
    <asp:GridView ID="GridViewSpend" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sdate,content" DataSourceID="SqlDataSpend" ForeColor="#333333" 
        GridLines="None" Width="550px" 
            onselectedindexchanged="GridViewSpend_SelectedIndexChanged">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="sdate" DataFormatString="{0:yyyy-MM-dd}" 
                HeaderText="날짜" ReadOnly="True" SortExpression="sdate" />
            <asp:BoundField DataField="content" HeaderText="내역" ReadOnly="True" 
                SortExpression="content" />
            <asp:BoundField DataField="category" HeaderText="분류" 
                SortExpression="category" />
            <asp:BoundField DataField="weight" HeaderText="중량(g)" 
                SortExpression="weight" />
            <asp:BoundField DataField="price" HeaderText="가격" SortExpression="price" />
            <asp:BoundField DataField="quant" HeaderText="개수" SortExpression="quant" />
            <asp:BoundField DataField="store" HeaderText="구입처" SortExpression="store" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        
    </td></tr></table>
    <asp:Panel ID="panEdit" runat="server" CssClass="editArea" Width="330px">
    
    <div class="editLeft">
        <span class="editLabel">날짜</span><br />
        <span class="editLabel">내역</span><br />
        <span class="editLabel">분류</span><br />
        <span class="editLabel">중량(g)</span><br />
        <span class="editLabel">가격</span><br />
        <span class="editLabel">개수</span><br />
        <span class="editLabel">구입처</span><br />
    </div>
    <div class="editRight">
        <asp:TextBox ID="txtDate" runat="server" CssClass="editText" Enabled="False"></asp:TextBox><br />
        <asp:TextBox ID="txtCont" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:DropDownList ID="txtCate" runat="server" CssClass="editText" 
            DataSourceID="SqlDataCmb" DataTextField="category" DataValueField="category"></asp:DropDownList><br />
        <asp:TextBox ID="txtWeight" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtQuant" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtStore" runat="server" CssClass="editText"></asp:TextBox><br />
    </div>
    <div style="clear:both; margin-left:120px">
        <asp:Button ID="btnInsert" runat="server" Text="입력" onclick="btnInsert_Click" 
            CssClass="editBtn" />
        <asp:Button ID="btnUpdate" runat="server" Text="갱신" onclick="btnUpdate_Click" 
            CssClass="editBtn" Visible="False" />
        <asp:Button ID="btnDelete" runat="server" Text="삭제" onclick="btnDelete_Click" 
            CssClass="editBtn" Visible="False" />
    </div>
    <asp:Literal ID="litResult" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>