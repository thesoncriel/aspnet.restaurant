//--메뉴 정보 구조체 선언
function OrderInfo(){
    var name = "";
    var price = 0;
    var imgurl = "";
    var quant = 0;
    var enable = false;
}
var orderInfo = new Array(50);
var oiSP = 0;   //orderInfoSeekPoint : DB에서 데이터를 읽어오는 동안 몇번째 열을 읽는지 저장.
//--
var cate;
var menu;
var price;
var imgurl;
var sum = 0;
var save = false;

for(var i = 0; i < orderInfo.length; i++){
    orderInfo[i] = new OrderInfo();
}

function setPopCate(){
    var popCate = document.getElementById("popCate");
    var accTitle = document.getElementById("accTitle");
    
    //accTitle.innerHTML = tblNum + "# 테이블 계산 내역";
    //tblNum = parseInt(this.opener.document.getElementById("hdnTMC").value);
    //alert(this.opener.document.getElementById("hdnTMC"));
    cate = new Array();
    cate = getDbCate();
    
    for(var i = 0; i < cate.length; i++){
        popCate.innerHTML += "<input type='button' class='cateMember" + (i % 2) + "' onclick='popCate_Click(" + i + ")' value='" + cate[i] + "' /><br />";
    }
}
//--팝업창의 카테고리를 클릭했을 때 이벤트
function popCate_Click(cateName){
    //alert(cateNum + "\n" + cate[cateNum]);
    var popMenu = document.getElementById("popMenu");
    setDbMenu(cateName);
    
    popMenu.innerHTML = "";
    for(var i = 0; i < menu.length; i++){
        popMenu.innerHTML += "<input type='button' class='menuMember" + (i % 2) + "' onClick=\"popMenu_Click('" + menu[i] + "', " + price[i] + ", '" + imgurl[i] + "')\" value='" + menu[i] + "' />";
    }
}

function setOrderInfo(name, price, imgurl, quant){
    orderInfo[oiSP].name = name;
    orderInfo[oiSP].price = parseInt(price);
    orderInfo[oiSP].imgurl = imgurl;
    orderInfo[oiSP].quant = parseInt(quant);
    orderInfo[oiSP].enable = true;
}

//--현재 팝업된 창의 카테고리의 필터링에 의해 나타난 차림표 메뉴를 클릭했을 때의 이벤트.
function popMenu_Click(name, price, imgurl){
    for(var i = 0; i < oiSP; i++){
        if(orderInfo[i].name == name && orderInfo[i].enable){
            var subViewQuant = document.getElementById("subViewQuant" + i);
            var subViewTotal = document.getElementById("subViewTotal" + i);
            orderInfo[i].quant = parseInt(subViewQuant.innerHTML) + 1;
            subViewQuant.innerHTML = orderInfo[i].quant;
            subViewTotal.innerHTML = orderInfo[i].quant * orderInfo[i].price;
            txtSum_Value(orderInfo[i].price);
            return;
        }
    }
    
    setOrderInfo(name, price, imgurl, 1);
    
    var popContent = document.getElementById("popContent");
    for(var i = 0; i <= oiSP; i++){
        if(orderInfo[i].enable){
            popContent.innerHTML += createSubView(oiSP);
            oiSP++;
            //alert(orderInfo[0+oiSP-1].name);
            return;
        }
    }
}
//--subView의 X단추를 클릭했을 때의 이벤트. 해당 항목이 삭제된다.
function btnX_Click(num){
    orderInfo[num].enable = false;
    var popContent = document.getElementById("popContent");
    popContent.innerHTML = "";
    txtSum_Value(0);    //합계를 초기화 시킨다
    for(var i = 0; i < oiSP; i++){
        if(orderInfo[i].enable){
            popContent.innerHTML += createSubView(i);
            
        }
    }
}
//--subView의 ▲단추를 클릭했을 때의 이벤트
function btnUp_Click(num){
    document.getElementById("subViewQuant" + num).innerHTML = ++orderInfo[num].quant;
    document.getElementById("subViewTotal" + num).innerHTML = orderInfo[num].quant * orderInfo[num].price;
    txtSum_Value(orderInfo[num].price);
}
//--subView의 ▼단추를 클릭했을 때의 이벤트
function btnDn_Click(num){
    if(orderInfo[num].quant - 1 < 1){
        btnX_Click(num);
    }
    else{
        document.getElementById("subViewQuant" + num).innerHTML = --orderInfo[num].quant;
        document.getElementById("subViewTotal" + num).innerHTML = orderInfo[num].quant * orderInfo[num].price;
        txtSum_Value(-orderInfo[num].price);
        //alert(-orderInfo[num].price);
    }
}
//--차림표 메뉴의 카테고리를 menuDB에서 뽑아오고 그 데이터를 배열로써 리턴시킨다.
function getDbCate(){
    var arr = new Array();
    arr[0] = menuDB[0][0];
    var j = 0;

    for(var i = 1; i < menuDB.length; i++){
        if(arr[j] != menuDB[i][0]){
            j++;
            arr[j] = menuDB[i][0];
            
        }
    }
    return arr;
}
//--차림표 메뉴의 값을 가진 menu, price, imgurl 각각의 배열을 초기화 한다.
function setDbMenu(cateName){
    var arr = new Array();
    var j = 0;

    menu = new Array();
    price = new Array();
    imgurl = new Array();
    
    for(var i = 0; i < menuDB.length; i++){
        if(menuDB[i][0] == cateName){
            menu[j] = menuDB[i][1];
            price[j] = menuDB[i][2];
            imgurl[j] = menuDB[i][3];
            j++;
        }
    }
    //alert(dd);
}
//--계산 할 항목들을 각각 SubView로 묶고 그에 따른 정보를 보여준다.
//--이러한 SubView를 HTML태그 형태로 만드는 메서드 이다.
function createSubView(i){
    var str = "<table cellspacing='0' class='subView' id='subView" + i + "'>" +
        "<tr>" +
            "<td rowspan='2'>" +
                "<img id='subViewImg" + i + "' src='" + orderInfo[i].imgurl + "' alt='그림' class='subViewImg' />" +
            "</td>" +
            "<td rowspan='2'>" +
                "<span id='subViewName" + i + "' class='subViewName'>" + orderInfo[i].name + "</span>" +
                "&nbsp;x&nbsp;" +
                "<span id='subViewQuant" + i + "' class='subViewQuant'>" + orderInfo[i].quant + "</span>&nbsp;" +
                "<input type='button' class='btnUp' value='▼' onclick='btnDn_Click(" + i + ")' />" +
                "<input type='button' class='btnDn' value='▲' onclick='btnUp_Click(" + i + ")' />" +
                "<div class='subViewPrice'>단가 : <span id='subViewPrice" + i + "'>" + orderInfo[i].price + "</span></div>"+
            "</td>" +
            "<td style='height:25' align='right'>" +
                "<input type='button' class='btnX' value='x' onclick='btnX_Click(" + i + ")' />"+
            "</td>" +
        "</tr>" +
        "<tr>" +
            "<td valign='top'>" +
                "<span id='subViewTotal" + i + "' class='subViewTotal'>" + (orderInfo[i].price * orderInfo[i].quant) + "</span>" +
            "</td>" +
        "</tr>" +
    "</table>";
    txtSum_Value(orderInfo[i].price * orderInfo[i].quant);
    return str;

}
//--각 컨트롤의 이벤트 메서드에 심겨져 총 합계를 누적시키고 초기화 하는 역할을 한다.
function txtSum_Value(num){
    var txtSum = document.getElementById("ctl00_cphMain_txtSum");
    if(num > 0){
        sum += num;
    }
    else if(num < 0){
        sum += num;
    }
    else{
        sum = 0;
    }
    txtSum.value = sum;
}

function getSqlCmd_saInsert(name, price){
    var _date = new Date();
    return "insert into sales(sdate, stime, menu, amount, tblnum) " +
            "values('" +
            _date.getFullYear() + "-" + (_date.getMonth() +1) + "-" + _date.getDate() + "', '" +
            _date.getHours() + ":" + _date.getMinutes() + ":" + _date.getSeconds() + "', '" +
            name + "', " + price + ", " + ":::" + "); ";
}
function getSqlCmd_ntInsert(menu, price, quant){
    var _date = new Date();
    return "insert into nowtable " +
            "values(" + ":::" + ", '" + menu + "', " + price + ", " + quant + "); ";
}
function getSqlCmd_ntDelete(){
    return "delete from nowtable where tblnum = " + ":::" + "; ";
}
function getSqlCmd_ntUpdate(menu, num){
    for(var i = 0; i < foodDB.length; i++){
        //alert(menu + "\n" + foodDB[i][0] + "\n" +foodDB[i][1]);
        //alert(menu + "\n" + orderInfo[num].name + "\n" + orderInfo[num].quant);
        if(menu == foodDB[i][0]){
            //alert(menu + "\n" + orderInfo[num].name + "\n" + orderInfo[num].quant);
            return "update food set fleft = fleft - " + (parseInt(foodDB[i][2]) * orderInfo[num].quant) + " where name = '" + foodDB[i][1] + "'; ";
        }
    }
    return "";
}
function btnBack_Click(){
    var pci = document.getElementById("popContent").innerHTML
    if(pci.indexOf("table") < 0){
        if(pci.indexOf("TABLE") < 0){
            alert("메뉴를 선택 해 주세요 :)");
            return false;
        }
    }
    var ctl00_cphMain_sqlTemp = document.getElementById("ctl00_cphMain_sqlTemp");
    //var ctl00_cphMain_sqlTempD = document.getElementById("ctl00_cphMain_sqlTempD");
    var str = "";
    //ctl00_cphMain_sqlTempD.value = getSqlCmd_ntDelete();
    //alert(ctl00_cphMain_sqlTempD.value);
    for(var i = 0; i < orderInfo.length; i++){
        if(orderInfo[i].enable){
        //alert("하하");
            str += getSqlCmd_ntInsert(orderInfo[i].name, orderInfo[i].price, orderInfo[i].quant);
        }
    }
    
    ctl00_cphMain_sqlTemp.value = str;
    nowtblDataClear();
    //alert(ctl00_cphMain_sqlTempD.value + "\n" + ctl00_cphMain_sqlTemp.value);
    save = true;
    return true;
    //return confirm("하하");
}
function btnComp_Click(){
    var pci = document.getElementById("popContent").innerHTML
    //alert(pci);
    if(pci.indexOf("table") < 0){
        if(pci.indexOf("TABLE") < 0){
            alert("메뉴를 선택 해 주세요 :)");
            return false;
        }
    }
    
    var ctl00_cphMain_sqlTemp = document.getElementById("ctl00_cphMain_sqlTemp");
    
    var ctl00_cphMain_sqlTempU = document.getElementById("ctl00_cphMain_sqlTempU");
    
    var str = "";
    var fstr = "";
    
    for(var i = 0; i < orderInfo.length; i++){
        if(orderInfo[i].enable){
        
            str += getSqlCmd_saInsert(orderInfo[i].name, orderInfo[i].price);
            //alert(getSqlCmd_ntUpdate(orderInfo[i].name, i));
            fstr += getSqlCmd_ntUpdate(orderInfo[i].name, i);
        }
    }
    //alert("하하ㅋ");
    ctl00_cphMain_sqlTemp.value = str;
    
    ctl00_cphMain_sqlTempU.value = fstr;
    
    nowtblDataClear();
    //alert("통과\n" + pci + "통과\n");
    save = true;
    return true;
}
function nowtblDataClear(){
    var ctl00_cphMain_sqlTempD = document.getElementById("ctl00_cphMain_sqlTempD");
    ctl00_cphMain_sqlTempD.value = getSqlCmd_ntDelete();
}
function nowTablePrint(){
    
        for(var i = 0; i < ntblDB.length; i++){
            for(var j = 0; j < menuDB.length; j++){
                if(ntblDB[i][0] == menuDB[j][1]){
                    //alert("히하");
                    popMenu_Click(menuDB[j][1], menuDB[j][2], menuDB[j][3]);
                }
            }
        }
    
}