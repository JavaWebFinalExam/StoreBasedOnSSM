<%--
  Created by IntelliJ IDEA.
  User: danchun
  Date: 2018/12/26
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">编辑分类</strong> / <small>Charge Category</small></div>
                <div class="am-fr am-cf" style="margin-right: 25%"><button type="button" id="doc-prompt-toggle-x" class="am-btn am-btn-default am-btn-lg"><span class="am-icon-plus">
                </span> 新增属性 </button></div>
            </div>

            <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-x">
                <div class="am-modal-dialog">
                    <div class="am-modal-hd">新增属性</div>
                    <div class="am-modal-bd">
                        <form id="form-x" class="am-form" action="<%=basePath%>category/admin/addProperty" method="post">
                            <fieldset>
                                <input type="hidden" name="categoryId" value="${categoryId}">
                                <div class="am-form-group am-g">
                                    <div class="am-u-lg-4"><label for="doc-input-x1">属性名称：</label></div>
                                    <div class="am-u-lg-8">
                                        <input required name="propertyName" type="text" id="doc-input-x1">
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="am-modal-footer">
                        <span class="am-modal-btn">取消</span>
                        <span class="am-modal-btn" id="btn-x">提交</span>
                    </div>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-5 am-u-md-push-10"></div>
                <div class="am-u-sm-12 am-u-md-7 am-u-md-pull-3">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-type">属性id</th>
                            <th class="table-type">属性名称</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%--循环显示数据--%>
                        <c:if test="${properties != null}">
                            <c:forEach var="property" items="${properties}">
                                <tr>
                                    <td>${property.id}</td>
                                    <td>${property.propertyname}</td>

                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button id="btn-${property.id}" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑 </button>

                                                <button id="${property.id}" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete-btn">
                                                    <span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        </tbody>
                    </table>
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

<script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
    $(".delete-btn").click(function () {
        console.log(this.id);
        var ID = this.id;

        var json_data = {
            "propertyId": ID
        };
        var jason_str = JSON.stringify(json_data);

        $.ajax({
            url :"<%=basePath%>category/admin/deleteProperty",
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

    $(function() {
        $('#doc-prompt-toggle-x').on('click', function() {
            $('#my-prompt-x').modal();
        });
    });
    $('#btn-x').click(function () {
        $('#form-x').submit();
    });
</script>
</body>
</html>
