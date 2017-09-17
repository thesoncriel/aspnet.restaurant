<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="Restaurant.Food" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

<script type="text/javascript">        
</script>
</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <br />
    <div class="contentTitle">식재료 재고 관리</div>
    <br />
    <asp:SqlDataSource ID="SqlDataFood" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" 
        SelectCommand="select * from food"></asp:SqlDataSource>
    <asp:GridView ID="GridViewFood" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="name" 
        DataSourceID="SqlDataFood" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridViewFood_SelectedIndexChanged">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="fdate" DataFormatString="{0:yyyy-MM-dd}" 
                HeaderText="구입날짜" SortExpression="fdate" />
            <asp:BoundField DataField="name" HeaderText="식재료명" ReadOnly="True" 
                SortExpression="name" />
            <asp:BoundField DataField="fleft" HeaderText="남은량" SortExpression="fleft" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:Panel ID="panEdit" runat="server" CssClass="editArea" Width="330px">
    
    <div class="editLeft">
        <span class="editLabel">최근 구입 날짜</span><br />
        <span class="editLabel">식재료명</span><br />
        <span class="editLabel">남은 개수(중량)</span><br />
    </div>
    <div class="editRight">
        <asp:TextBox ID="txtDate" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtName" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtLeft" runat="server" CssClass="editText"></asp:TextBox><br />
    </div>
    <div style="clear:both; margin-left:120px">
        <asp:Button ID="btnInsert" runat="server" Text="삽입" onclick="btnInsert_Click" CssClass="editBtn" />
        <asp:Button ID="btnUpdate" runat="server" Text="갱신" onclick="btnUpdate_Click" CssClass="editBtn" />
        <asp:Button ID="btnDelete" runat="server" Text="삭제" onclick="btnDelete_Click" CssClass="editBtn" />
        
    </div>
    <asp:Literal ID="litResult" runat="server"></asp:Literal>
    </asp:Panel>
<br />
</asp:Content>