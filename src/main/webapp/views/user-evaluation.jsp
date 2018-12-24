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

    <link href="<%=basePath%>views/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/personal.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>views/assets/css/appstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery-1.7.2.min.js"></script>
</head>

<body>
<div class="nav-table">
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="#">首页</a></li>
        </ul>
    </div>
</div>

<b class="line"></b>
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
                                <img src="<%=basePath%>views/image/productSingle/${productImage}.jpg" class="itempic">
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
                            <textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
                        </div>
                    </div>
                    <div class="info-btn">
                        <div class="am-btn am-btn-danger">发表评论</div>
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


</body>
</html>
