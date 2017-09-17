<%@ Page Language="C#" MasterPageFile="MasterPage.master" Title=":::: 식당 경영 관리 시스템 ::::" AutoEventWireup="true" CodeBehind="TableManager.aspx.cs" Inherits="Restaurant.TableManager" %>

<asp:Content id="ContentTableManagerHead" ContentPlaceHolderiD="head" runat="server">
    <link rel="stylesheet" type="text/css" href="theme/default/TableManager.css" />
    <style type="text/css">
        #popupCate{
            background-color:#8aa1c5;
        }
        #popupMenu{
            background-color:#b2bfd3;
        }
    </style>
    <script type="text/javascript">
        /*
        var clickedTblCell = "";
        function tblManCell_Click(tblCell){
            //tblCell.innerHTML = "하하하";
            //alert(tblCell.innerHTML);
            //alert(tblCell.id);
            var popupCate = document.getElementById("popupCate");
            
            clickedTblCell = tblCell.id;
            
            popupCate.innerHTML = "상위메뉴<br />" +
                                    "<div onClick=\"popupCate_Click(0)\">불고기류</div>";
            
        }
        
        function popupCate_Click(cateNum){
            
            var popupMenu = document.getElementById("popupMenu");
            var str = "하위메뉴<br />";
            
            switch(cateNum){
                case 0:
                    popupMenu.innerHTML = "하위메뉴<br />"+
                                    "<div onClick=\"popupMenu_Click(this)\">등심구이</div>";
            }
        }
        
        function popupMenu_Click(obj){
            var str = obj.innerHTML;
            var obj = document.getElementById(clickedTblCell);
            
            //obj.innerHTML = "<div class='tableNum'>" + obj.id.replace("tmc","") + "</div>"+
        }
        function popupData(){
            
        }
        
        function popWinAcc(num){
            var hdn = document.getElementById("hdnTMC");
            hdn.value = num;
            window.open('Account.aspx','popWin','width=500,height=500,left=210,top=100,resizable=no,scrollbars=yes');
        }
        */
    </script>
</asp:Content>

<asp:Content Id="ContentTableManagerBody" ContentPlaceHolderID="cphMain" runat="server">
        <asp:SqlDataSource ID="sqlDataTM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:thesonConn %>" 
        ProviderName="<%$ ConnectionStrings:thesonConn.ProviderName %>" SelectCommand="select tblnum, sum(price) as sum from nowtable
group by tblnum;"></asp:SqlDataSource>

            <asp:Label ID="lblTitle" runat="server" Text="테이블 현황" CssClass="contentTitle"></asp:Label>
            <asp:Table ID="tblStatus" runat="server" GridLines="Both"></asp:Table>
            <input id="hdnTMC" type="hidden" />

</asp:Content>