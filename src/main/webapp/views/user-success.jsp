<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/27
  Time: 0:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link rel="stylesheet"  type="text/css" href="<%=basePath%>views/assets/css/successamazeui.css"/>
    <link href=".<%=basePath%>views/assets/css/successadmin.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/successdemo.css" rel="stylesheet" type="text/css" />

    <link href="<%=basePath%>views/assets/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery-1.7.min.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <a href="#" target="_top" class="h">亲，请登录</a>
                <a href="#" target="_top">免费注册</a>
            </div></div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home"><div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div></div>
        <div class="topMessage my-shangcheng"><div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div></div>
        <div class="topMessage mini-cart"><div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div></div>
        <div class="topMessage favorite"><div class="menu-hd"></i><span></span></a></div>
    </ul>
</div>

<!--悬浮搜索框-->


<div class="clear"></div>


<hr class="footer">
<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em>¥9.90</em></li>
                <div class="user-info">
                    <p>收货人：艾迪</p>
                    <p>联系电话：15871145629</p>
                    <p>收货地址：湖北省 武汉市 武昌区 东湖路75号众环大厦</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服

            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
                <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
            </div>
        </div>
    </div>
</div>


<div class="footer" >
    <p>
        <a href="#">石立军</a>
        <a href="#">肖枢贤</a>
        <a href="#">陈俊卿</a>
        <a href="#">简斌兵</a>
        <a href="#">黄宁</a>
        <em>计算机科学与技术161班 </em>
    </p>

</div>


</body>
</html>

