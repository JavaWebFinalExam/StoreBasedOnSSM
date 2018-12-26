<%--
  Created by IntelliJ IDEA.
  User: danchun
  Date: 2018/12/22
  Time: 21:09
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

    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>Charge user</small></div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-5 am-u-md-push-10"></div>
                <div class="am-u-sm-12 am-u-md-7 am-u-md-pull-3">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-type">id</th>
                                <th class="table-type">用户名</th>
                                <th class="table-type">账户身份</th>
                                <th class="table-type">订单数</th>
                                <th class="table-type">评价数</th>
                                <th class="table-type">帖子数</th>

                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--循环显示数据--%>
                            <c:if test="${users != null}">
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.username}</td>
                                        <td>${user.identity<2?"普通用户":(user.identity>2?"管理员":"商家")}</td>
                                        <td>${user.orderNum}</td>
                                        <td>${user.evaluationNum}</td>
                                        <td>${user.postNum}</td>

                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button type="button" id="doc-prompt-toggle-${user.id}" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                    <button id="${user.id}" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete-btn">
                                                        <span class="am-icon-trash-o"></span> 删除</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-${user.id}">
                                        <div class="am-modal-dialog">
                                            <div class="am-modal-hd">修改用户信息</div>
                                            <div class="am-modal-bd">
                                                <form id="form-${user.id}" class="am-form">
                                                    <fieldset>
                                                        <div class="am-form-group am-g">
                                                            <div class="am-u-lg-4"><label for="doc-input-${user.id}">用户名：</label></div>
                                                            <div class="am-u-lg-8">
                                                                <input required name="userName" type="text" id="doc-input-${user.id}" value="${user.username}">
                                                            </div>
                                                        </div>
                                                        <div class="am-form-group am-g">
                                                            <div class="am-u-lg-4"><label for="doc-select-${user.id}">用户身份：</label></div>
                                                            <div class="am-u-lg-8">
                                                                <select name="identity" id="doc-select-${user.id}">
                                                                    <option value="1">普通用户</option>
                                                                    <option value="2">商家</option>
                                                                    <option value="3">管理员</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <div class="am-modal-footer">
                                                <span class="am-modal-btn">取消</span>
                                                <span class="am-modal-btn" id="btn-${user.id}">提交</span>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        $(function() {
                                            $('#doc-prompt-toggle-${user.id}').on('click', function() {
                                                $('#my-prompt-${user.id}').modal();
                                            });
                                            $('#btn-${user.id}').click(function () {
                                                var userName = $('#doc-input-${user.id}')[0].value;
                                                var identity = $('#doc-select-${user.id}')[0].value;

                                                var json_data = {
                                                    "userId": ${user.id},
                                                    "userName": userName,
                                                    "identity": identity
                                                };
                                                var jason_str = JSON.stringify(json_data);

                                                $.ajax({
                                                    url :"<%=basePath%>account/admin/changeUserInformation",
                                                    cache : true,
                                                    type : "post",
                                                    datatype : "json",
                                                    contentType : "application/json; charset=utf-8",
                                                    data : jason_str,

                                                    success : function (data){
                                                        console.log(data.state + data.message);
                                                        if (data.state == true){
                                                            console.log(data.message);
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
                                            })
                                        });
                                    </script>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>
                    </form>
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

<script>
    $(".delete-btn").click(function () {
        var userId = this.id;

        var json_data = {
            "userId": userId
        };
        var jason_str = JSON.stringify(json_data);

        $.ajax({
            url :"<%=basePath%>account//Admin/deleteUserById",
            cache : true,
            type : "post",
            datatype : "json",
            contentType : "application/json; charset=utf-8",
            data : jason_str,

            success : function (data){
                console.log(data.state + data.message);
                if (data.state == true){
                    console.log(data.message);
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


