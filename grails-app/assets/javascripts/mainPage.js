/**
 * 获取随机数来标识是哪一行<p>
 * @param len
 * @returns {string}
 */
function randomString(len) {
    len = len || 32;
    var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
    var maxPos = $chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
}

/**
 * 在显示页面上添加上发送的内容
 */
/*function commitText(){
    var text = document.getElementById('inputText').value;
    var ID = randomString(15)
    document.getElementById('inputText').value = '';
    document.getElementById('displayArea').innerHTML+='<div align="right"><p id="' + ID + '">' + text + '</p></div>';
}*/

/**
 *ajax执行成功执行
 */
function ajaxSuccess(){
    var text = document.getElementById('inputText').value;
    var ID = randomString(15)
    document.getElementById('inputText').value = '';
    document.getElementById('displayArea').innerHTML+='<div align="right"><p id="' + ID + '">' + text + '</p></div>';
    /*alert('Successful!')*/
}

/**
 * ajax执行失败执行
 */
function ajaxFailed(){
    alert('Failed!')
}


