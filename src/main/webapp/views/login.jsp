<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/21
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Login Page | Amaze UI Example</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="am-g">
        <h1>商&nbsp;&nbsp;城</h1>
        <p>we have anything</p>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>登录</h3>
        <hr>
        <br>
        <br>

        <form method="post" class="am-form">
            <label for="username">用户名:</label>
            <input type="text" name="username" id="username" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="" id="password" value="">
            <br>
            <br />
            <div class="am-cf">
                <input type="submit" name="" value="登 录" class="am-btn am-btn-warning am-btn-sm am-fl">
                <input type="submit" name="" value="注 册" class="am-btn am-btn-default am-btn-sm am-fr">
            </div>
        </form>
        <br/><br/><br/>
        <hr>

        <footer>
            <p style="text-align:center"><b>by 计算机科学与技术161班<br/>石立军&nbsp;&nbsp;肖枢贤&nbsp;&nbsp;简斌兵&nbsp;&nbsp;陈俊卿&nbsp;&nbsp;黄宁</b></p>
        </footer>
    </div>
</div>

<script>
    $("#login").click(function () {
        var username = $("#username")[0].value;
        var password = $("#password")[0].value;

        if (username != "" && password != "") {

            console.log(username + " : " + password);

            var json_data = {
                "username": username,
                "password": password
            };

            //js对象转换成JSON字符串
            var jason_str = JSON.stringify(json_data);

            console.log(jason_str);

            $.ajax({
                url: "<%=basePath%>account/checkLogin",
                cache: true,
                type: "post",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                data: jason_str,

                success: function (data) {
                    console.log(data.state);

                    if (data.state == true) {
                        if (data.isManager == true)
                            window.location.href = "<%=basePath%>adminPage/";
                        else
                            window.location.href = "<%=basePath%>userPage/";
                    } else {
                        alert(data.message);
                    }
                },
                error: function (data) {
                    console.log(data);
                    alert("请求出错，请检查网络或服务器是否开启");
                }
            });
        }else {
            alert("请填写正确的用户名和密码");
        }
    });

    $("#sign").click(function () {
        var username = $("#username")[0].value;
        var password = $("#password")[0].value;


        if (username != "" && password != "") {
            console.log(username + " : " + password);

            var json_data = {
                "username": username,
                "password": password
            };

            //js对象转换成JSON字符串
            var jason_str = JSON.stringify(json_data);

            console.log(jason_str);

            $.ajax({
                url: "<%=basePath%>account/register",
                cache: true,
                type: "post",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                data: jason_str,

                success: function (data) {
                    console.log(data.state);
                    alert(data.message);
                },
                error: function (data) {
                    console.log(data);
                    alert("请求出错，请检查网络或服务器是否开启");
                }
            });
        }else {
            alert("请填写正确的用户名和密码");
        }
    });
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#login').click();
        }
    });
</script>
</body>
</html>


