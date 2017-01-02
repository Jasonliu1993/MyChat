<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 16/10/8
  Time: 19:46
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <asset:stylesheet src="mainPage.css"/>
    <asset:javascript src="mainPage.js"/>
    <script>
        /**
         * 接收消息
         */
        function ajax2ReceiveMessage() {
            $.ajax({
                url: '${createLink(controller: 'Chat',action: 'receiveMessage')}',
                type: "POST",//请求方式：get或post
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'F_ID': '${session.userName}',
                    'test': 'test'
                },//自定义提交的数据
                success: function (json) {
                    if (json.Message !== null || json.Message !== undefined || json.Message !== '') {
                        /*document.getElementById('inputText').value = '';*/
                        for (var i = 0; i < json.length; i++) {
                            var ID = randomString(15)
                            document.getElementById('displayArea').innerHTML += '<div align="left"><p id="' + ID + '">' + json[i].message + '</p></div>';
                        }
                    }
                },
                error: function (json) {
                    alert("This is Error!")
                }
            })
        }

        /**
         * 获取好友
         */
        function ajax2GetFriends() {
            $.ajax({
                url: '${createLink(controller: 'Chat',action: 'getFriendsList')}',
                type: "POST",//请求方式：get或post
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'F_ID': '${session.userName}',
                    'status': 'A'
                },//自定义提交的数据
                success: function (json) {

                },
                error: function (json) {
                    alert("Change status to offline!")
                }
            })
        }
        setInterval('ajax2ReceiveMessage();ajax2GetFriends();', 5000);

        /**
         * 页面初始化加载好友列表
         */
        window.onload = function () {
            $.ajax({
                url: '${createLink(controller: 'Chat',action: 'initializeFriendList')}',
                type: "POST",//请求方式：get或post
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'F_ID': '${session.userName}',
                    'status': 'A'
                },//自定义提交的数据
                success: function (json) {
                    for (var i = 0; i < json.length; i++) {
                        var ID = randomString(15)
                        document.getElementById('listOfFriend_ul').innerHTML += '<li style="list-style-type:none;"><div align="left"><p id="' + ID + '" onclick="addF_name(&apos;' + ID + 'V' + '&apos;);setFocusPerson(&apos;' + ID + '&apos;)">' + json[i].f_name + '</p><input type="hidden" id="' + ID + 'V" value="' + json[i].f_uid + '"/></div></li>';
                    }
                },
                error: function (json) {
                    alert("Change status to offline!")
                }
            })
        }

        function addF_name(itemID) {
            var value = document.getElementById(itemID).value;
            document.getElementById('inputTo').value = value;
            var divOfDisplay = document.getElementById("displayArea").getElementsByTagName("div");//清除table  下的东西
            var lenAboutdivOfDisplay = divOfDisplay.length;
            for (var i = 0; i < lenAboutdivOfDisplay; i++)
                divOfDisplay[0].remove();
        }
        /**
         * 全局变量显示当前聚焦人
         * @type {string}
         */
        FocusPerson = ""
        function setFocusPerson(newPerson) {
            if (FocusPerson != "") {
                document.getElementById(FocusPerson).style.backgroundColor = 'transparent';
            }
            document.getElementById(newPerson).style.backgroundColor = '#BEBFC3';
            FocusPerson = newPerson
        }
    </script>
</head>

<body>
<div class="displayFrame">
    <div class="friendsArea">
        <table>
            <tr>
                <td id="listOfFriend" class="friendsArea">
                    <ul id="listOfFriend_ul"></ul>
                </td>
            </tr>
        </table>
    </div>

    <div class="displayText">
        <table>
            <tr>
                <td id="displayArea">

                </td>
            </tr>
        </table>
    </div>

    <div class="inputText">
        <table>
            <tr>
                <g:formRemote name="AjaxForm" url="[controller: 'Chat', action: 'sendMessage']"
                              onSuccess="ajaxSuccess()" onFailure="ajaxFailed()">
                    <td class="inputTextCSS">
                        <input type="text" id="inputText" name="inputText" class="inputTextCSS"
                               value="${params.inputText}"/>
                        <input type="hidden" id="inputTo" name="inputTo" value="${params.inputTo}"/>
                    </td>
                    <td class="inputButtonCSS">
                        %{--<input type="submit" id="inputButton" value="发送" onclick="commitText()"/>--}%
                        <input type="submit" id="inputButton" value="发送"/>
                    </td>
                </g:formRemote>
            </tr>
        </table>
    </div>
</div>
</body>
</html>