<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="sales_edit.aspx.cs" Inherits="Restaurant.sales_edit" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">

</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
    <br />
    <div></div><asp:Label ID="lblTitle" runat="server" Text="매출 내역 수정" CssClass="contentTitle"></asp:Label></div>
    <br />
    <asp:Panel ID="panEdit" runat="server" CssClass="editArea">
    
    <div class="editLeft">
        <span class="editLabel">날짜</span><br />
        <span class="editLabel">시간</span><br />
        <span class="editLabel">품목</span><br />
        <span class="editLabel">구입가</span><br />
        <span class="editLabel">테이블번호</span><br />
        <span class="editLabel">할인</span><br />
    </div>
    <div class="editRight">
        <asp:TextBox ID="txtDate" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtTime" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtName" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="TextBox6" runat="server" CssClass="editText"></asp:TextBox><br />
    </div>
    <div style="clear:both; margin-left:120px">
        <asp:Button ID="btnCancel" runat="server" Text="취소" />
        <asp:Button ID="btnComp" runat="server" Text="완료" />
    </div>
    </asp:Panel>
</asp:Content>