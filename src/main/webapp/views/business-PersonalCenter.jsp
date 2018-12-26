<%--
  Created by IntelliJ IDEA.
  User: xsx10
  Date: 2018/12/21
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/views/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人中心</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath%>/business/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>/business/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath%>/business/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>/business/assets/css/admin.css">
    <script src="<%=basePath%>/business/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>/business/assets/js/app.js"></script>
</head>

<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="<%=basePath%>/business/assets/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
            <li class="kuanjie">
                <a href="/BusinessPage/PersonalCenter">个人中心</a>
                <<a href="/account/outLogin">退出登录</a>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <div class="nav-navicon admin-main admin-sidebar">
        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎商家：${username}</div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
            <ul>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/BusinessPage/ShowProductByStoreId">商品列表</a></li>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/Product/AddProduct">添加新商品</a></li>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="">用户评论</a></li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
            <ul>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/BusinessPage/ShowOrdersByStoreId">订单列表</a></li>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/BusinessPage/CompletedOrder">已完成订单</a></li>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="/BusinessPage/UnfulfilledOrder">已完成订单</a></li>
            </ul>
        </div>
        <!-- sideMenu End -->

        <script type="text/javascript">
            jQuery(".sideMenu").slide({
                titCell: "h3", //鼠标触发对象
                targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect: "slideDown", //targetCell下拉效果
                delayTime: 300, //效果时间
                triggerTime: 150, //鼠标延迟触发时间（默认150）
                defaultPlay: true, //默认是否执行效果（默认true）
                returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>

    </div>
    <div class=" admin-content">
        <div class="daohang">
            <ul>
                <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">首页</button></li>
            </ul>
        </div>

        <!-- 修改类别 -->
        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改类别</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical" style="height: 450px;">
                <form class="am-form tjlanmu" action="/Store/UpdateStore" method="post">
                    <div class="am-form-group">
                        <div class="zuo">种类：</div>
                        <div class="you">
                            <input type="text" name="storetype" class="am-input-sm" value="${store.storetype}" required>
                            <span class="am-form-caret"></span>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="you">
                            <p>
                                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- 修改简介 -->

        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups-des">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改店铺简介</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical" style="height: 450px;">
                <form class="am-form tjlanmu" action="/Store/UpdateStore" method="post">
                    <div class="am-form-group am-cf">
                        <div class="zuo">店铺简介：</div>
                        <div class="you">
                            <textarea class="" rows="10" id="doc-ta-1" name="description" required>${store.description}</textarea>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="you">
                            <p>
                                <button type="submit" class="am-btn am-btn-success am-radius" >提交</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- 修改店铺图片 -->

        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups-img">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改封面</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical" style="height: 450px;">
                <form class="am-form tjlanmu" enctype="multipart/form-data" action="/Store/UpdateStorePicture" method="post">
                    <div class="am-form-group am-cf">
                        <div class="zuo">店铺封面：</div>
                        <img class="am-img-thumbnail am-radius" src="${store.image}" width="140" height="140"/>
                        <br>
                        <br>
                        <div class="you" style="height: 45px;">
                            <input type="file" id="doc-ipt-file-1" name="picture" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="am-form-group am-cf">
                        <div class="you">
                            <p>
                                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- 修改店铺名字 -->

        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups-name">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改店铺名字</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical" style="height: 450px;">
                <form class="am-form tjlanmu" action="/Store/UpdateStore" method="post">
                    <div class="am-form-group">
                        <div class="zuo">店铺名字：</div>
                        <div class="you">
                            <input type="text" name="name" class="am-input-sm" id="doc-ipt-pwd-1" value="${store.name}" required>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="you">
                            <p>
                                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- 显示相关信息 -->


        <div class="admin-biaogelist">
            <div class="listbiaoti am-cf">
                <ul class="am-icon-flag on">
                    店铺信息管理
                </ul>
                <dl class="am-icon-home" style="float: right;">
                    当前位置： 首页 > <a href="#">个人中心</a>
                </dl>

            </div>
            <form class="am-form am-g">
                <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                    <thead>
                    <tr class="am-success">
                        <th class="table-author am-hide-sm-only">属性</th>
                        <th class="table-author am-hide-sm-only">信息</th>
                        <th width="163px" class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="am-hide-sm-only">店铺id</td>
                        <td class="am-hide-sm-only">${store.id}</td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">用户id</td>
                        <td class="am-hide-sm-only">${store.userid}</td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">店铺名字</td>
                        <td class="am-hide-sm-only">${store.name}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups-name'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">店铺类别</td>
                        <td class="am-hide-sm-only">${store.storetype}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">店铺简介</td>
                        <td class="am-hide-sm-only">${store.description}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups-des'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">店铺状态</td>
                        <c:if test="${store.status == 0}">
                        <td class="am-hide-sm-only"><c:out value="未通过审核"/></td>
                        </c:if>
                        <c:if test="${store.status == 1}">
                            <td class="am-hide-sm-only"><c:out value="通过审核"/></td>
                        </c:if>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td class="am-hide-sm-only">店铺封面</td>
                        <td class="am-hide-sm-only"><img class="am-img-thumbnail am-radius" src="${store.image}" width="140" height="140"/></td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups-img'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <hr />
            </form>

            <div class="foods">
                <ul>
                    版权所有肖枢贤，石立军，陈俊卿，黄宁，简斌兵
                </ul>
                <dl>
                    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
                </dl>
            </div>
        </div>
    </div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=basePath%>/business/assets/js/polyfill/rem.min.js"></script>
<script src="<%=basePath%>/business/assets/js/polyfill/respond.min.js"></script>
<script src="<%=basePath%>/business/assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=basePath%>/business/assets/js/amazeui.min.js"></script>
<!--<![endif]-->

</body>

</html>
