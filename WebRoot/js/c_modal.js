/**modal框触发*/
function toalert(result, infotext) {
    var c_modal = document.getElementById('c_modal');
    var info = document.getElementById('info');
    var c_alert = document.getElementsByClassName('c_alert')[0];
    var info_icon = document.getElementsByClassName('info_icon')[0];
    // 初始化位置
    c_alert.style.transform = "rotate(-25deg) translateY(-88px)  translateX(-56px) ";
    if (!result) {
        c_modal.style.color = 'red';
    } else {
        c_modal.style.color = 'green';
        info_icon.style.backgroundImage = "url(images/true.png)";
    }
    info.innerHTML = infotext;
    c_modal.style.display = "block";
    // 防止没有动画效果
    setTimeout(function() {
        c_alert.style.transform = "rotate(25deg) translateY(88px)  translateX(56px) ";
    }, 20)

}

/**modal关闭*/
var c_modal = document.getElementById('c_modal');
var c_close = document.getElementsByClassName('c_close')[0];
c_close.onclick = function() {
    c_modal.style.display = "none";
}