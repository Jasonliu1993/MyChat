<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 12/21/16
  Time: 23:44
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Register Page</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<div>
    <g:form controller="Login" action="saveRegister">
        <table>
            <tr>
                <td>用户名：</td>
                <td>
                    <input type="text" id="name" name="name" value= ${params.name}>
                </td>
            </tr>
            <tr>
                <td>登陆ID：</td>
                <td>
                    <input type="text" id="UID" name="UID" value= ${params.UID}>
                </td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                <td>
                    <input type="password" id="password" name="password" value= ${params.password}>
                </td>
            </tr>
            <tr>
                <td>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                <td>
                    <input type="text" id="emailAddress" name="emailAddress" value= ${params.emailAddress}>
                </td>
            </tr>
            <tr>
                <td>电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
                <td>
                    <input type="text" id="phoneNumber" name="phoneNumber" value= ${params.phoneNumber}>
                </td>
            </tr>
        </table>

        <div align="center">
            <g:submitButton name="Register"
                            value="${message(code: 'default.button.login.label', default: '注册')}"
                            class="btn btn-blue"/>
        </div>
    </g:form>
</div>
</body>
</html>