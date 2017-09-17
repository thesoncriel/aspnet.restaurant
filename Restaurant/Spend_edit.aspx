<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="Spend_edit.aspx.cs" Inherits="Restaurant.Spend_edit" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" SelectCommand="SELECT category FROM theson.category
where ref = '식재료' or ref = '소모품'
order by ref desc, category asc"></asp:SqlDataSource>
    <br />
    <div></div><asp:Label ID="lblTitle" runat="server" Text="지출 내역 입력" CssClass="contentTitle"></asp:Label></div>
    <br />
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
        <asp:TextBox ID="txtName" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:DropDownList ID="cmbCate" runat="server" CssClass="editText" 
            DataSourceID="SqlDataSource1" DataTextField="category" 
            DataValueField="category">
        </asp:DropDownList>
        <asp:TextBox ID="txtWeight" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtQuant" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtStore" runat="server" CssClass="editText"></asp:TextBox><br />
    </div>
    <div style="clear:both; margin-left:120px">
        <asp:Button ID="btnComp" runat="server" Text="완료" onclick="btnComp_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="취소" onclick="btnCancel_Click" />
    </div>
    <asp:Literal ID="litResult" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>