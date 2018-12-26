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
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.js"></script>

    <link href="<%=basePath%>views/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/personal.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/appstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.min.js"></script>
</head>

<body>
<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="<%=basePath%>product/products" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a id="myorders" href="<%=basePath%>userPage/ordAndCart/showUserOrders" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="<%=basePath%>userPage/ordAndCart/showShoppingCart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i class=""></i><span></span></a></div>
        </div>
    </ul>
</div>

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
