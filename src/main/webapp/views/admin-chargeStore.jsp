<%--
  Created by IntelliJ IDEA.
  User: danchun
  Date: 2018/12/22
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>网上商城</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="<%=basePath%>views/assets/i/book.png">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/admin.css">

</head>
<body>
<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <strong>网上商城</strong> <small>后台管理系统</small>
    </div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="<%=basePath%>Admin/outLogin"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">

            <ul class="am-list admin-sidebar-list">
                <li><a href="<%=basePath%>adminPage/"><span class="am-icon-home"></span> 商品分类管理 </a></li>
                <li><a href="<%=basePath%>adminPage/getAllOrders"><span class="am-icon-table"></span> 店铺管理 </a></li>
                <li><a href="<%=basePath%>adminPage/addBook"><span class="am-icon-pencil-square-o"></span> 论坛管理 </a></li>
                <li><a href="<%=basePath%>adminPage/chargeUser"><span class="am-icon-users"></span> 用户管理 </a></li>
            </ul>

        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">店铺管理</strong> / <small>Charge Store</small>
                </div>
            </div>

            <hr>

            <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-5 am-margin gallery-list">
                <c:if test="${stores != null}">
                    <c:forEach var="store" items="${stores}">
                        <li>
                            <a>
                                <img class="am-img-thumbnail am-img-bdrs" src="<%=basePath%>${store.image}" alt=""/>
                                <div class="gallery-title"><h1 style="text-align: center">《${store.name}》</h1></div>
                                <div class="gallery-desc">
                                    <p style="font-size: 15px">
                                        店主：${store.userName}<br>
                                        商品数量：${store.productNum}<br>
                                        分类：${store.storeType}<br>
                                        状态：${store.status==0?"未审核":"审核通过"}<br>
                                    </p>
                                </div>
                                <div class="gallery-desc">
                                    <p>店铺描述：${store.description}</p><br>
                                </div>
                            </a>
                            <button type="button" class="am-btn am-btn-default am-btn-sm am-fl doc-prompt-toggle" id="doc-prompt-toggle-${store.id}">通过审核</button>
                            <button type="button" id="${store.id}" class="am-btn am-btn-warning am-btn-sm am-fr delete-btn">删除店铺</button>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>

        </div>

        <footer class="admin-content-footer" style="text-align: center">
            <hr>
            <h3>by 计算机161班</h3>
            <p>肖枢贤 简斌兵 陈俊卿 石立军 黄宁</p>
        </footer>

    </div>
    <!-- content end -->
</div>

<script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
</body>
</html>

