<%--
  Created by IntelliJ IDEA.
  User: xsx10
  Date: 2018/12/23
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品管理</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath%>/views/business/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>/views/business/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath%>/views/business/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>/views/business/assets/css/admin.css">
    <script src="<%=basePath%>/views/business/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>/views/business/assets/js/app.js"></script>


</head>

<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="<%=basePath%>/views/business/assets/i/logo.png"></div>

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
                <li>
                    <button type="button" class="am-btn am-btn-default am-radius am-btn-xs"></button>
                        首页
                </li>
            </ul>
        </div>



        <!--弹窗-->
        <c:forEach var="product" items="${products}">
        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups-${product.id}">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改商品</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical " style="height: 450px;">
                <form class="am-form tjlanmu" action="<%=basePath%>/Product/UpdateProduct" method="post" enctype="multipart/form-data">
                    <div class="am-form-group">
                        <div class="zuo">商品名称：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="name-${product.id}" value="${product.name}" name="name" required>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo"> </div>
                        <div class="you">
                            <!-- <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题"> -->
                            <input type="hidden" class="am-input-sm" id="id-${product.id}" value="${product.id}" name="id" required>
                            <input type="hidden" class="am-input-sm" id="storeid-${product.id}" value="${product.storeid}" name="storeid" required>
                            <input type="hidden" class="am-input-sm" id="storeid-${product.id}" value="${product.createdate}" name="createdate" required>

                        </div>
                    </div>
                    <!--商品id，隐藏-->
                    <%--<div class="am-form-group">--%>
                        <%--<div class="zuo"></div>--%>
                        <%--<div class="you">--%>
                            <%--<input type="hidden" class="am-input-sm" id="id-${product.id}" value="${product.id}" name="id" required>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!--商品的店铺id,隐藏-->
                    <%--<div class="am-form-group">--%>
                        <%--<div class="zuo"></div>--%>
                        <%--<div class="you">--%>
                            <%--<input type="hidden" class="am-input-sm" id="storeid-${product.id}" value="${product.storeid}" name="storeid" required>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--商品的添加时间，隐藏--%>
                    <%--<div class="am-form-group">--%>
                        <%--<div class="zuo"></div>--%>
                        <%--<div class="you">--%>
                            <%--<input type="hidden" class="am-input-sm" id="storeid-${product.id}" value="${product.storeid}" name="storeid" required>--%>
                        <%--</div>--%>
                    <%--</div>--%>


                    <div class="am-form-group">
                        <div class="zuo">商品原价：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="originalPrice-${product.id}" value="${product.originalprice}" name="originalprice" required>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">商品优惠价：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="promoteprice-${product.id}" value="${product.promoteprice}" name="promoteprice" required>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">商品库存：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="stock-${product.id}" value="${product.stock}" name="stock" required>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">种类：</div>
                        <div class="you">
                            <select id="doc-select-1" name="categoryid">
                                <c:forEach var="category" items="${categories}">
                                    <c:if test="${product.categoryid==category.id}">
                                        <option value="${category.id}">${category.typeName}</option>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.typeName}</option>
                                </c:forEach>
                            </select>
                            <span class="am-form-caret"></span>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品描述：</div>
                        <div class="you">
                            <textarea class="" rows="5" id="description-${product.id}" name="description" required>${product.description}</textarea>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">原始图片：</div>
                        <div class="you">
                            <c:forEach var="productImage" items="${productImages}">
                                <c:if test="${productImage.productid==product.id}">
                                <img class="am-img-thumbnail am-radius" src="<%=basePath%>${productImage.path}" width="400" height="400"/><br>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品图片1：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture1" required >
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品图片2：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture2" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品图片3：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture3" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品图片4：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture4" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
                        </div>
                    </div>
                    <div class="am-form-group am-cf">
                        <div class="zuo">商品图片5：</div>
                        <div class="you" style="height: 45px;">
                            <input type="file" name="picture5" required>
                            <p class="am-form-help">请选择要上传的文件...</p>
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
        </c:forEach>

        <!--弹窗结束-->


        <div class="admin-biaogelist">
            <div class="listbiaoti am-cf">
                <ul class="am-icon-flag on">
                    商品栏目管理
                </ul>
                <dl class="am-icon-home" style="float: right;">
                    当前位置： 首页 > <a href="#">商品列表</a>
                </dl>

            </div>
            <form class="am-form am-g">
                <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                    <thead>
                    <tr class="am-success">
                        <th class="table-id am-text-center">ID</th>
                        <th class="table-author am-hide-sm-only">商品</th>
                        <th class="table-author am-hide-sm-only">原价</th>
                        <th class="table-author am-hide-sm-only">优惠价</th>
                        <th class="table-author am-hide-sm-only">库存</th>
                        <th class="table-title">商品描述</th>
                        <th class="table-type">种类</th>
                        <th class="table-date am-hide-sm-only">添加时间</th>
                        <th width="163px" class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                    <tr id="product-${product.id}">
                        <td class="am-text-center" id="id-${product.id}">${product.id}</td>
                        <td class="am-hide-sm-only" id="name-${product.id}">${product.name}</td>
                        <td class="am-hide-sm-only" id="originalPrice-${product.id}">${product.originalprice}</td>
                        <td class="am-hide-sm-only" id="promotePrice-${product.id}">${product.promoteprice}</td>
                        <td class="am-hide-sm-only" id="stock-${product.id}">${product.stock}</td>
                        <td class="am-hide-sm-only" id="description-${product.id}">${product.description}</td>
                        <c:forEach var="category" items="${categories}">
                            <c:if test="${product.categoryid==category.id}">
                            <td class="am-hide-sm-only"><option value="${category.id}" id="category-${product.id}">${category.typeName}</option></td>
                            </c:if>
                        </c:forEach>
                        <td class="am-hide-sm-only">${product.createdate}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups-${product.id}'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除" onclick="deleteProduct(this)" id="${product.id}"><span class="am-icon-trash-o"></span></button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <script type="text/javascript">
                    function deleteProduct(bt) {
                        let id = bt.id;

                        let product_json = {
                            "id" : id,
                        }

                        let order = JSON.stringify(product_json);
                        alert("确认删除")

                        $.ajax({
                            url: "<%=basePath%>/Product/DeleteProduct",
                            cache: true,
                            type: "post",
                            datatype: "json",
                            contentType: "application/json; charset=utf-8",
                            data: order,

                            success: function (data) {
                                if (data.status == true) {
                                    window.location.href="<%=basePath%>BusinessPage/ShowProductByStoreId";
                                    alert(data.message);
                                } else {
                                    alert(data.message);
                                }
                            },
                            error: function (data) {
                                console.log(data);
                                alert("请求出错，请检查网络或服务器是否开启");
                            }
                        });
                    }

                </script>
                <ul class="am-pagination am-fr">
                    <li class="am-disabled"><a href="#">«</a></li>
                    <li class="am-active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                </ul>
                <hr />
            </form>

            <div class="foods">
                <ul>
                    版权所有@2015
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
<script src="<%=basePath%>/views/business/assets/js/polyfill/rem.min.js"></script>
<script src="<%=basePath%>/views/business/assets/js/polyfill/respond.min.js"></script>
<script src="<%=basePath%>/views/business/assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=basePath%>/views/business/assets/js/amazeui.min.js"></script>
<!--<![endif]-->

</body>

</html>
