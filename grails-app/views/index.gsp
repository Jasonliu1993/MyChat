<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login Page</title>
    <asset:stylesheet src="loginPage.css"/>
</head>

<body>
<div>
    <g:form controller="Login" action="mainPage">
        <div>
            <table>
                <tr>
                    <td>用户名：</td>
                    <td>
                        <input type="text" id="name" name="name" value= ${params.name}>
                    </td>
                </tr>
                <tr>
                    <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                    <td>
                        <input type="password" id="password" name="password" value= ${params.password}>
                    </td>
                </tr>
            </table>
        </div>

        <div align="center">
            <input type="button" value="注册" onclick='window.open("/MyGrailsTraining/login/register")'/>
            <g:submitButton name="Login"
                            value="${message(code: 'default.button.login.label', default: '登录')}"
                            class="btn btn-blue"/>
        </div>
    </g:form>
</div>
</body>
</html>
