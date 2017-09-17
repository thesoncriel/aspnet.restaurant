<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataQuary.aspx.cs" Inherits="Restaurant.DataQuary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>제목 없음</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" Height="211px" TextMode="MultiLine" 
            Width="680px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Height="55px" onclick="Button1_Click" 
            Text="Button" Width="120px" />
    
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="server=localhost;User Id=root;password=1234tr;Persist Security Info=True;port=3309;database=theson" 
        ProviderName="MySql.Data.MySqlClient" 
        SelectCommand="select * from theson.menu;"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="item" DataSourceID="SqlDataSource1" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="category" HeaderText="category" 
                SortExpression="category" />
            <asp:BoundField DataField="item" HeaderText="item" ReadOnly="True" 
                SortExpression="item" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="using1" HeaderText="using1" 
                SortExpression="using1" />
            <asp:BoundField DataField="amount1" HeaderText="amount1" 
                SortExpression="amount1" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>

    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>ddd</asp:ListItem>
        <asp:ListItem>aaa</asp:ListItem>
        <asp:ListItem>bbb</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>ggg</asp:ListItem>
        <asp:ListItem>yyy</asp:ListItem>
        <asp:ListItem>jjjj</asp:ListItem>
    </asp:DropDownList>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>

    </form>
</body>
</html>
