<%--
  Created by IntelliJ IDEA.
  User: 简斌兵
  Date: 2018/12/23
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link href="<%=basePath%>views/assets/css/amazeuishoppingCart1.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/shoppingCartdemo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartOptstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.js"></script>

    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css?6">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>

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



<div class="am-g ztlb_nr">
    <div class="am-u-sm-12">


        <c:if test="${userPosts!=null}">
            <c:forEach items="${userPosts}" var="userPost" >
                <article class="am-comment"> <!-- 评论容器 -->
                    <a href="">
                        <img class="am-comment-avatar" alt="404" src="<%=basePath%>${userPost.headPortrait}"/> <!-- 评论者头像 -->
                    </a>

                    <div class="am-comment-main"> <!-- 评论内容容器 -->
                        <header class="am-comment-hd">
                            <!--<h3 class="am-comment-title">评论标题</h3>-->
                            <div class="am-comment-meta"> <!-- 评论元数据 -->
                                <a href="#link-to-user" class="am-comment-author">${userPost.userName}</a> <!-- 评论者 -->
                                评论于 <time datetime="">${userPost.time}</time>
                            </div>
                        </header>

                        <div class="am-comment-bd">${userPost.content}</div> <!-- 评论内容 -->
                    </div>
                </article>
            </c:forEach>
        </c:if>

    </div>
</div>



<footer class="am_footer">
    <div class="am_footer_con">
        <div class="am_footer_link">
            <span>关于商城</span>
            <ul>
                <li><a href="###">关于我们</a></li>
                <li><a href="###">友情链接</a></li>
            </ul>
        </div>


        <div class="am_footer_don">

        </div>

        <div class="am_footer_erweima">
            <div class="am_footer_weixin"><img src="img/wx.jpg" alt=""><div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div></div>
            <div class="am_footer_ddon"><img src="img/wx.jpg" alt=""><div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div></div>

        </div>

    </div>
</footer>


<script>
    $(function(){
        auto_window_height();
        ZhuanTi_list_user()
        $(window).resize(function() {
            auto_window_height();
            ZhuanTi_list_user()
        });
        function ZhuanTi_list_user(){
            if($(window).width() < 810)
                $('.ztlb_nr_blockc_r_user').each(function(){$(this).children().each(function(index){if(index>3){$(this).hide()}else{$(this).show()}})});
        }
        function auto_window_height(){
            $('.ztlb_nr').css('min-height',$(window).height() - 52 - 220);
        }
    });

</script>
</body>
</html>
