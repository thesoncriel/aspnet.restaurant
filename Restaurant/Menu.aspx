<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Restaurant.Menu" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

    <script type="text/javascript">
        
    </script>
</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <asp:SqlDataSource ID="SqlDataMenu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" 
        SelectCommand="select * from menu"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataCmb" runat="server" 
    ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
    ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" SelectCommand="select distinct category from menu
order by category desc"></asp:SqlDataSource>
    <br />
    <div class="contentTitle">&nbsp;상품 메뉴 관리</div>
    <br />
    <table border="0"><tr><td align="right">
    <asp:GridView ID="GridViewMenu" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="menu" DataSourceID="SqlDataMenu" ForeColor="#333333" 
        GridLines="None" Width="600px" 
            onselectedindexchanged="GridViewSpend_SelectedIndexChanged">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="category" 
                HeaderText="분류" SortExpression="category" />
            <asp:BoundField DataField="menu" HeaderText="메뉴" ReadOnly="True" 
                SortExpression="menu" />
            <asp:BoundField DataField="price" HeaderText="가격" 
                SortExpression="price" />
            <asp:BoundField DataField="food1" HeaderText="식재료" 
                SortExpression="food1" />
            <asp:BoundField DataField="quant1" HeaderText="개수" SortExpression="quant1" />
            <asp:BoundField DataField="imgurl" HeaderText="이미지" 
                SortExpression="imgurl" />
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
        <span class="editLabel">분류</span><br />
        <span class="editLabel">메뉴</span><br />
        <span class="editLabel">가격</span><br />
        <span class="editLabel">식재료</span><br />
        <span class="editLabel">개수</span><br />
        <span class="editLabel">이미지</span><br />
    </div>
    <div class="editRight">
        <asp:DropDownList ID="txtCate" runat="server" CssClass="editText" 
            DataSourceID="SqlDataCmb" DataTextField="category" DataValueField="category">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList><br />
        <asp:TextBox ID="txtMenu" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtFood" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtQuant" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtImgurl" runat="server" CssClass="editText"></asp:TextBox><br />
    </div>
    <div style="clear:both; margin-left:120px">
        <asp:Button ID="btnInsert" runat="server" Text="삽입" onclick="btnInsert_Click" CssClass="editBtn" />
        <asp:Button ID="btnUpdate" runat="server" Text="갱신" onclick="btnUpdate_Click" CssClass="editBtn" />
        <asp:Button ID="btnDelete" runat="server" Text="삭제" onclick="btnDelete_Click" CssClass="editBtn" />
    </div>
    <asp:Literal ID="litResult" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>