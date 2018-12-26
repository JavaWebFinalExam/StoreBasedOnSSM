<%--
  Created by IntelliJ IDEA.
  User: 简斌兵
  Date: 2018/12/23
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>发表评论</title>
    <link href="<%=basePath%>views/assets/css/amazeuishoppingCart1.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/shoppingCartdemo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartOptstyle.css" rel="stylesheet" type="text/css" />

    <link href="<%=basePath%>views/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <link href="<%=basePath%>views/assets/css/personal.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/appstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/countUp.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>
</head>

<body>
<!--顶部导航条 -->
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">商城</h1>
        <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-fl">
                    <a href="<%=basePath%>product/products">
                        首页
                    </a>
                </li>
            </ul>
            <ul class="am-nav  am-topbar-right am-topbar-nav am-nav-pills">
                <li><a class="am-round am-topbar-right" href="<%=basePath%>/userPage/ordAndCart/showShoppingCart">
                    <i class="am-icon-shopping-cart"></i>&nbsp;购物车
                </a>
                </li>

                <li class="am-dropdown am-fr" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                        <i class="am-icon-user"></i> &nbsp;用户<span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="<%=basePath%>userPage/ordAndCart/showUserOrders">查看订单</a></li>
                        <li><a href="<%=basePath%>account/outLogin">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-comment">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
                </div>
                <hr/>

                <div class="comment-main">
                    <div class="comment-list">
                        <div class="item-pic">
                            <a href="#" class="J_MakePoint">
                                <img src="<%=basePath%>${productImage.path}" class="itempic">
                            </a>
                        </div>

                        <div class="item-title">

                            <div class="item-name">
                                <a href="#">
                                    <p class="item-basic-info">${product.name}</p>
                                </a>
                            </div>
                            <div class="item-info">
                                <div class="info-little">
                                    <span>${product.description}</span>
                                </div>
                                <div class="item-price">
                                    价格：<strong style="color: red">${product.promoteprice}</strong>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="item-comment">
                            <textarea id="user-input" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
                        </div>
                    </div>
                    <div class="info-btn">
                        <div id="say" class="am-btn am-btn-danger">发表评论</div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            $(".comment-list .item-opinion li").click(function() {
                                $(this).prevAll().children('i').removeClass("active");
                                $(this).nextAll().children('i').removeClass("active");
                                $(this).children('i').addClass("active");

                            });
                        })
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#say").click(function () {
        var user_input = $("#user-input")[0].value;

        if (user_input != "") {
            console.log(user_input);

            var json_data = {
                "content": user_input,
                "productId": ${product.id}
            };

            //js对象转换成JSON字符串
            var jason_str = JSON.stringify(json_data);

            console.log(jason_str);

            $.ajax({
                url: "<%=basePath%>Evaluation/userEvaluation",
                cache: true,
                type: "post",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                data: jason_str,

                success: function (data) {
                    console.log(data.state);

                    if (data.state == true) {
                        window.location.href = "<%=basePath%>userPage/postPage/PostPage";
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
            alert("请求出错！");
        }
    });
</script>

</body>
</html>
