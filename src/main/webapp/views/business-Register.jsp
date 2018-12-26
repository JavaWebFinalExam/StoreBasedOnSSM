<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/21
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<%
    if (request.getParameter("exist")!=null){
        out.print(" <script type=\"text/javascript\">");
        out.print(" alert(\"用户名已存在\")");
        out.print("</script>");
    }
%>


<div class="header">
    <div class="am-g">
        <h1>商&nbsp;&nbsp;城</h1>
        <p>we have anything</p>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>商家注册</h3>
        <hr>
        <br>
        <br>

        <form class="am-form" enctype="multipart/form-data" action="/Store/StoreRegister" method="post">
            <fieldset class="am-form-set">
                <input type="text" placeholder="用户名" name="username" required><br>
                <input type="password" placeholder="密码" name="password" required><br>
                <input type="text" placeholder="店铺名字" name="name" required><br>
                <input type="text" placeholder="店铺类型" name="storetype" required><br>
                <input type="text" placeholder="店铺描述" name="description" required><br>
                <div class="am-form-group am-cf">
                    <div class="zuo">封面：</div>
                    <div class="you" style="height: 45px;">
                        <input type="file" name="picture" required><br>
                        <p class="am-form-help" required>请选择要上传的文件...</p>
                    </div>
                </div>

            </fieldset>
            <button type="submit" class="am-btn am-btn-primary am-btn-block">注册</button>
        </form>
        <br/><br/><br/>
        <hr>

        <footer class="am_footer">
            <p style="text-align:center"><b>by 计算机科学与技术161班<br/>石立军&nbsp;&nbsp;肖枢贤&nbsp;&nbsp;简斌兵&nbsp;&nbsp;陈俊卿&nbsp;&nbsp;黄宁</b></p>
        </footer>
    </div>
</div>

</body>
</html>


