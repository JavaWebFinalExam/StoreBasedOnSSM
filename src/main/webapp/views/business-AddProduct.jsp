<%--
  Created by IntelliJ IDEA.
  User: xsx10
  Date: 2018/12/22
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加新商品</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath%>views/business/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>views/business/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath%>views/business/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>views/business/assets/css/admin.css">
    <script src="<%=basePath%>views/business/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/business/assets/js/app.js"></script>
</head>

<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="<%=basePath%>views/business/assets/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="kuanjie">
                <a href="/BusinessPage/PersonalCenter">个人中心</a>
                <<a href="/account/outLogin">退出登录</a>            </li>
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
                <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页</button> </li>
            </ul>
        </div>
        <div class="admin-biaogelist">

            <div class="listbiaoti am-cf">
                <ul class="am-icon-flag on"> 添加商品</ul>
                <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > <a href="#">添加商品</a></dl>

            </div>

            <div class="fbneirong">
                <form class="am-form" action="<%=basePath%>/Product/AddProduct" method="post"  enctype="multipart/form-data">
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm"  placeholder="请输入商品标题" name="name" required>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">原价：</div>
                        <div class="you">
                            <input type="number" class="am-input-sm"  placeholder="请输入原价" name="originalprice" required>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">优惠价：</div>
                        <div class="you">
                            <input type="number" class="am-input-sm"  placeholder="请输入优惠价" name="promoteprice" required>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">库存：</div>
                        <div class="you">
                            <input type="number" class="am-input-sm"  placeholder="请输入库存数量" name="stock" required>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">描述：</div>
                        <div class="you">
                            <textarea class="" rows="2" id="doc-ta-1" name="description" required></textarea>
                        </div>
                    </div>

                    <div class="am-form-group am-cf">
                        <div class="zuo">种类：</div>
                        <div class="you">
                            <select id="doc-select-1" name="categoryid">
                                <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.typeName}</option>
                                </c:forEach>
                            </select>
                            <span class="am-form-caret"></span>
                        </div>
                    </div>

                    <div class="am-form-group am-cf">
                        <div class="zuo">图片1：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture1">
                            <p class="am-form-help" required>请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">图片2：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture2" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">图片3：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture3" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">图片4：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture4" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">图片5：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture5" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="you" style="margin-left: 11%;">
                            <button type="submit" class="am-btn am-btn-success am-radius">上传商品</button>
                        </div>
                    </div>
                </form>
            </div>



            <div class="foods">
                <ul>
                    版权所有肖枢贤，石立军，陈俊卿，黄宁，简兵兵
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
<script src="<%=basePath%>views/business/assets/js/polyfill/rem.min.js"></script>
<script src="<%=basePath%>views/business/assets/js/polyfill/respond.min.js"></script>
<script src="<%=basePath%>views/business/assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=basePath%>views/business/assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>

</html>
