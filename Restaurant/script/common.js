function setBgFrame(){
    var bgFrame = document.getElementById("bgFrame");
    bgFrame.style.height = (screen.availHeight - 160) + "px";
    //alert(bgFrame.style.height);
}
function loginError(){
    alert("이미 ID가 할당되어 있습니다");
}

function getNav() {
    var ver=navigator.appVersion;
    if (navigator.appName.indexOf("Microsoft")!=-1 && ver.indexOf("MSIE 4")==-1 && ver.indexOf("MSIE 3")==-1) {
        return 1;
    } 
    else if (navigator.appName.indexOf("Netscape")!=-1){
        return 2;
    }
    else{
        return 0;
    }
}