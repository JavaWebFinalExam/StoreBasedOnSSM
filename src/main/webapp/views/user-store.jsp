<%--
  Created by IntelliJ IDEA.
  User: 简斌兵
  Date: 2018/12/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css?6">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/countUp.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>



</head>
<body>
<!--顶部导航条 -->
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">${store.name}</h1>
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


<div class="get" style="background-image: url(<%=basePath%>${store.image})">
</div>


<div class="am-g am-imglist">
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  am-avg-md-3 am-avg-lg-6 am-gallery-default">
        <c:if test="${commoditydDtails!=null}">
            <c:forEach items="${commoditydDtails}" var="commoditydDtail" >
                <li>
                    <div class="am-gallery-item am_list_block">
                        <a href="/userPage/ordAndCart/productDetail?product_id=${commoditydDtail.productId}" class="am_img_bg">
                            <img class="am_img" src="<%=basePath%>${commoditydDtail.productImage.path}"
                                 alt="404"/>
                        </a>
                        <div class="am_listimg_info" style="text-align: center;color: blue">${commoditydDtail.productName}</div>
                        <div class="am_listimg_info" style="text-align: center;color: red"><small>原价：￥<s>${commoditydDtail.originalPrice}</s></small></div>
                        <div class="am_listimg_info" style="text-align: center;color: red">优惠价：￥${commoditydDtail.promotePrice}</div>
                    </div>

                </li>
            </c:forEach>
        </c:if>
    </ul>
</div>

<ul class="am-pagination am-pagination-centered">
    <c:forEach items="${lengths}" var="length" >
        <li><a href="/userPage/postPage/storePage?storeId=${store.id}&currIndex=${length+1}">${length+1}</a></li>
    </c:forEach>
</ul>

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


<script src="<%=basePath%>views/assets/js/petshow.js"></script>
</body>
</html>