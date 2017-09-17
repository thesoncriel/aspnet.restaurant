<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Restaurant._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="content-type" content="text/xhtml; charset=utf-8" />
    <title>:::: 식당 영업 관리 솔루션을 이용해 주셔서 감사합니다 ::::</title>
    <link rel="stylesheet" type="text/css" href="theme/default/login.css" />
    <link rel="stylesheet" type="text/css" href="theme/common.css" />
    <script type="text/javascript" src="script/common.js">
        //alert(navigator.appName + "\n" + navigator.appVersion);
        

    </script>
</head>
<body style="background-image:url(image/default/bgimg.gif)" onload="setBgFrame()">

    <table id="bgFrame">
        <tr>
            <td class="pageTop">
                <br />
                ::::: Restaurant Bussiness Management Program :::::</td>
            </td>
        </tr>
        <tr>
            <td>
                <form id="frmLogin" runat="server" style="background-image:url('image/default/login.gif');">
                    <div><br /><br /><br />
                        <table>
                            <tr>
                                <td>
                                    Name:<br />
                                    <br />
                                    Passwd:
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtID" runat="server">사장님</asp:TextBox><br />
                                    <br />
                                    <asp:TextBox ID="TxtPW" runat="server" TextMode="Password"></asp:TextBox><br />
                                    
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center">
                                <asp:button id="btnAC" runat="server" text="새로생성" onclick="btnAC_Click" />
                                <asp:Button id="btnOK" runat="server" text="로그인" onclick="btnOK_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:SqlDataSource id="sqlDataLogin" runat="server" 
                        ConnectionString="server=210.110.121.54;port=3309;User Id=theson;password=1234tr;Persist Security Info=True;database=theson" 
                        ProviderName="MySql.Data.MySqlClient" 
                        SelectCommand="select * from theson.admin;"></asp:SqlDataSource>
                </form>
            </td>
        </tr>
        <tr>
            <td class="pageBottom">
                GyeongNam Provincial Namhae College<br />
                Computer Infomation System<br />
                Son Jun-Hyeon
            </td>
        </tr>
    </table>
</body>
</html>
