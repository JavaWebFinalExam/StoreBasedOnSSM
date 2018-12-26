<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/21
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/countUp.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>
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
        <h3>用户注册</h3>
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
                  <input type="button" id="login" value="登 录" class="am-btn am-btn-default am-round am-btn-sm am-fl">
                  <input type="button" id="sign" value="注 册" class="am-btn am-btn-danger am-round am-btn-sm am-fr">
            </div>
        </form>
        <br/><br/><br/>
        <br/><br/><br/>
        <br/><br/><br/>
        <br/><br/><br/>

        <hr>

        <footer class="am_footer">
            <p style="text-align:center"><b>by 计算机科学与技术161班<br/>石立军&nbsp;&nbsp;肖枢贤&nbsp;&nbsp;简斌兵&nbsp;&nbsp;陈俊卿&nbsp;&nbsp;黄宁</b></p>
        </footer>
    </div>
</div>

<script>
    $("#sign").click(function () {
       let username = $("#username")[0].value;
       let password = $("#password")[0].value;

       if (username != "" && password != "") {
           console.log(username + " : " + password);

           let json_data = {
               "username": username,
               "password": password
           };

        //js对象转换成JSON字符串
        let jason_str = JSON.stringify(json_data);

        console.log(jason_str);

       $.ajax({
         url: "<%=basePath%>account/register",
         cache: true,
         type: "post",
         datatype: "json",
         contentType: "application/json; charset=utf-8",
         data: jason_str,

           success: function (data) {
               if(data.status==true){
                   alert(data.message);
                   window.location.href = "<%=basePath%>adminPage/login";
               }
               else{
                   alert(data.message);
                   location.reload();
               }
           },
           error: function (data) {
                console.log(data);
                alert("请求出错，请检查网络或服务器是否开启");
           },
         });
       }
    });
    $("#login").click(function () {
        window.location.href = "<%=basePath%>adminPage/login";
    });
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#register').click();
        }
    });
</script>

</body>
</html>


