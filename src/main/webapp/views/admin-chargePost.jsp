<%--
  Created by IntelliJ IDEA.
  User: danchun
  Date: 2018/12/22
  Time: 21:57
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
                <li><a href="<%=basePath%>adminPage/categoryCharge/"><span class="am-icon-home"></span> 商品分类管理 </a></li>
                <li><a href="<%=basePath%>adminPage/storeCharge/"><span class="am-icon-table"></span> 店铺管理 </a></li>
                <li><a href="<%=basePath%>adminPage/postCharge/"><span class="am-icon-pencil-square-o"></span> 论坛管理 </a></li>
                <li><a href="<%=basePath%>adminPage/userCharge/"><span class="am-icon-users"></span> 用户管理 </a></li>
            </ul>

        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">论坛管理</strong> / <small>Charge Post</small></div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-5 am-u-md-push-10"></div>
                <div class="am-u-sm-12 am-u-md-7 am-u-md-pull-3">

                    <div class="am-panel-group" id="accordion">

                    <%--循环显示数据--%>
                    <c:if test="${posts != null}">
                        <c:forEach var="post" items="${posts}">

                        <div class="am-panel am-panel-default">
                            <div class="am-panel-hd">
                                <article class="am-comment">
                                    <header class="am-comment-hd" data-am-collapse="{parent: '#accordion', target: '#do-not-say-${post.id}'}">
                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                        <div class="am-comment-meta">
                                            <a class="am-comment-author">${post.username}</a>
                                            发表于 <time>${post.createDate}</time>
                                        </div>
                                    </header>
                                    <div class="am-comment-bd">
                                        ${post.content}
                                    </div>
                                    <div class="am-fr">
                                        <button type="button" id="${post.id}" class="am-btn am-btn-warning am-btn-xs delete-btn">删除</button>
                                    </div>
                                </article>
                            </div>

                                <%--循环显示数据--%>
                            <c:if test="${post.unthemePosts[0] != null}">
                            <div id="do-not-say-${post.id}" class="am-panel-collapse am-collapse">
                                <div class="am-panel-bd">
                                    <ul class="am-comments-list am-comments-list-flip">

                                        <c:forEach var="unthemePost" items="${post.unthemePosts}">
                                        <li class="am-comment">
                                            <article class="am-comment">
                                                <header class="am-comment-hd">
                                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                    <div class="am-comment-meta">
                                                        <a class="am-comment-author">${unthemePost.username}</a>
                                                        评论于 <time>${unthemePost.createDate}</time>
                                                    </div>
                                                </header>
                                                <div class="am-comment-bd">
                                                    ${unthemePost.content}
                                                </div>
                                                <div class="am-fr">
                                                    <button type="button" id="${unthemePost.id}" class="am-btn am-btn-warning am-btn-xs delete-btn">删除</button>
                                                </div>
                                            </article>
                                        </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                            </c:if>
                        </div>

                        </c:forEach>
                    </c:if>

                    </div>

                </div>
            </div>
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
<script type="text/javascript">
    $(".delete-btn").click(function () {
        console.log(this.id);
        var ID = this.id;

        var json_data = {
            "postId": ID
        };
        var jason_str = JSON.stringify(json_data);

        $.ajax({
            url :"<%=basePath%>Post/deletePostById",
            cache : true,
            type : "post",
            datatype : "json",
            contentType : "application/json; charset=utf-8",
            data : jason_str,

            success : function (data){
                console.log(data.state + data.message);
                if (data.state == true){
                    alert(data.message);
                    location.reload();
                } else {
                    alert(data.message);
                    location.reload();
                }
            },
            error:function (data) {
                console.log(data);
                alert("请求出错，请检查网络或服务器是否开启");
            }
        });
    });
</script>
</body>
</html>
