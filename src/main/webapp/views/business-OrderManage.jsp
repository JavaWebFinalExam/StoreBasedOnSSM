<%--
  Created by IntelliJ IDEA.
  User: xsx10
  Date: 2018/12/22
  Time: 15:55
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
    <title>订单管理</title>
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
                <a href="#">个人中心</a>
            </li>
            <li class="soso">
                <p>
                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">产品</option>
                        <option value="o">会员</option>
                    </select>
                </p>
                <p class="ycfg"><input type="text" class="am-form-field am-input-sm" /></p>
                <p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <div class="nav-navicon admin-main admin-sidebar">
        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：${username}</div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
            <ul>
                <li>商品列表</li>
                <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="">添加新商品</a></li>
                <li>商品分类</li>
                <li>用户评论</li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
            <ul>
                <li>订单列表</li>
                <li>已完成订单</li>
                <li>未完成订单</li>
            </ul>
            <h3 class="am-icon-users"><em></em> <a href="#">会员管理</a></h3>
            <ul>
                <li>会员列表 </li>

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



        <!--淡出框-->
        <c:forEach items="${orders}" var="order" >
        <div class="am-popup am-popup-inner am-scrollable-vertical" id="my-popups-${order.id}">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">修改订单</h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd am-scrollable-vertical " style="height: 450px;">
                <form class="am-form tjlanmu">
                    <div class="am-form-group">
                        <div class="zuo">商品数量：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="productNum_${order.id}" value="${order.productnum}" >
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo"> </div>
                        <div class="you">
                            <%--<input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">--%>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">收货地址：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm"  id="address_${order.id}" value="${order.address}">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">收货人：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm"  id="receiver_${order.id}" value="${order.receiver}">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">手机号码：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm" id="mobile_${order.id}" value="${order.mobile}">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">备注信息：</div>
                        <div class="you">
                            <input type="text" class="am-input-sm"  id="userMessage_${order.id}" value="${order.userMessage}">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="zuo">种类：</div>
                        <div class="you">
                            <select id="status_${order.id}">
                                <option value="0">请选择订单状态</option>
                                <option value="0">未完成</option>
                                <option value="1">已经完成</option>
                            </select>
                            <span class="am-form-caret"></span>
                        </div>
                    </div>

                    <div class="am-form-group am-cf">
                        <div class="you">
                            <p>
                                <button type="button" class="am-btn am-btn-success am-radius" id="${order.id}" onclick="updateOrder(this)">提交</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        </c:forEach>

        <!--修改订单-->
        <script type="text/javascript">
            function updateOrder(bt) {
                let id = bt.id;
                let productNum = document.getElementById("productNum_" + id).value;
                let address = document.getElementById("address_" + id).value;
                let receiver = document.getElementById("receiver_" + id).value;
                let mobile = document.getElementById("mobile_" + id).value;
                let userMessage = document.getElementById("userMessage_" + id).value;
                let status = document.getElementById("status_" + id).value;
                let order_json = {
                "id" : id,
                "productNum" : productNum,
                "address" : address,
                "receiver" : receiver,
                "mobile" : mobile,
                "userMessage":userMessage,
                "status" : status
                }

                let order = JSON.stringify(order_json);

                $.ajax({
                    url: "<%=basePath%>Order/updateOrder",
                    cache: true,
                    type: "post",
                    datatype: "json",
                    contentType: "application/json; charset=utf-8",
                    data: order,

                    success: function (data) {
                        if (data.status == true) {
                            window.location.href="<%=basePath%>BusinessPage/showOrdersByStoreId";
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


        <!--淡出框结束-->


        <div class="admin-biaogelist">
            <div class="listbiaoti am-cf">
                <ul class="am-icon-flag on">
                    订单栏目管理
                </ul>
                <dl class="am-icon-home" style="float: right;">
                    当前位置： 首页 > <a href="#">订单列表</a>
                </dl>

            </div>
            <form class="am-form am-g">
                <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
                    <thead>
                    <tr class="am-success">
                        <th class="table-id am-text-center">ID</th>
                        <th class="table-author am-hide-sm-only">订单号</th>
                        <th class="table-author am-hide-sm-only">商品数量</th>
                        <th class="table-author am-hide-sm-only">收货地址</th>
                        <th class="table-author am-hide-sm-only">收货人</th>
                        <th class="table-author am-hide-sm-only">手机号码</th>
                        <th class="table-author am-hide-sm-only">备注信息</th>
                        <th class="table-author am-hide-sm-only">创建时间</th>
                        <th class="table-author am-hide-sm-only">支付时间</th>
                        <th class="table-author am-hide-sm-only">发货日期</th>
                        <th class="table-author am-hide-sm-only">确认收货日期</th>
                        <th class="table-author am-hide-sm-only">订单状态</th>
                        <th class="table-author am-hide-sm-only">用户id</th>
                        <th class="table-author am-hide-sm-only">商品id</th>
                        <th width="163px" class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="order" >
                    <tr>
                        <td class="am-text-center">${order.id}</td>
                        <td class="am-hide-sm-only">${order.ordercode}</td>
                        <td class="am-hide-sm-only">${order.productnum}</td>
                        <td class="am-hide-sm-only">${order.address}</td>
                        <td class="am-hide-sm-only">${order.receiver}</td>
                        <td class="am-hide-sm-only">${order.mobile}</td>
                        <td class="am-hide-sm-only">${order.userMessage}</td>
                        <td class="am-hide-sm-only">${order.createdate}</td>
                        <td class="am-hide-sm-only">${order.paydate}</td>
                        <td class="am-hide-sm-only">${order.deliverydate}</td>
                        <td class="am-hide-sm-only">${order.confirmdate}</td>
                        <c:if test="${order.status==0}">
                            <td class="am-hide-sm-only">未完成</td>
                        </c:if>
                        <c:if test="${order.status==1}">
                            <td class="am-hide-sm-only">已完成</td>
                        </c:if>
                        <td class="am-hide-sm-only">${order.userid}</td>
                        <td class="am-hide-sm-only">${order.productid}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round" data-am-modal="{target: '#my-popups-${order.id}'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除" id="${order.id}" onclick="deleteOrder(this)"><span class="am-icon-trash-o"></span></button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <script type="text/javascript">
                    function deleteOrder(bt) {
                        let id = bt.id;
                        let order_json = {
                            "id" : id,
                        }

                        let order = JSON.stringify(order_json);
                        alert("确认删除")

                        $.ajax({
                            url: "<%=basePath%>Order/deleteOrder",
                            cache: true,
                            type: "post",
                            datatype: "json",
                            contentType: "application/json; charset=utf-8",
                            data: order,

                            success: function (data) {
                                if (data.status == true) {
                                    window.location.href="<%=basePath%>BusinessPage/showOrdersByStoreId";
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
