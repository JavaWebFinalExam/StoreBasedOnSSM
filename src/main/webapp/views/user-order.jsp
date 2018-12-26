<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/25
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>订单页面</title>


    <link href="<%=basePath%>views/assets/css/Amazeui.css" rel="stylesheet" type="text/css" />

    <link href="<%=basePath%>views/assets/css/orderDemo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="<%=basePath%>views/assets/css/optstyle.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript" src="<%=basePath%>views/assets/js/orderAddress.js"></script>

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
    </ul>
</div>


<div class="clear"></div>

<!--购物车 -->
<div class="concent">
    <div id="cartTable">
        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">

                    </div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>

        <c:if test="${products!=null}">
        <c:forEach items="${products}" var="product" >
        <tr class="item-list">
            <div class="bundle  bundle-last ">

                <div class="clear"></div>
                <div class="bundle-main">
                    <ul class="item-content clearfix">
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" target="_blank" data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint" data-point="tbcart.8.12">
                                    <img src="<%=basePath%>${product.productimage.path}" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色" class="item-title J_MakePoint" data-point="tbcart.8.11">${product.product.name}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                            <div class="item-props item-props-can">
                                <span class="sku-line">${product.product.description}</span>
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="price-original">${product.product.originalprice}</em>
                                    </div>
                                    <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">${product.product.promoteprice}</em>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <input class="text_box" name="" type="text" value="${product.oneOrder.productnum}" style="width:30px;" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <em tabindex="0" class="J_ItemSum number">${product.price}</em>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <button id="${product.oneOrder.id}" type="button" class="am-btn am-btn-default evaluation-btn">评价</button>
                            </div>
                        </li>
                    </ul>


                </div>
            </div>
        </tr>
        </c:forEach>
        </c:if>


        <div class="footer">
                <p>
                    <a href="#">石立军</a>
                    <a href="#">肖枢贤</a>
                    <a href="#">陈俊卿</a>
                    <a href="#">简斌兵</a>
                    <a href="#">黄宁</a>
                    <em>计算机科学与技术161班 </em>
                </p>
        </div>


    </div>
</div>
<%--跳转购物车--%>
<script>
    $("#mc-menu-hd").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showShoppingCart";
    });
</script>
<%--跳转我的订单--%>
<script>
    $("#myorders").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showUserOrders";
    });
</script>

<script>
    $(".evaluation-btn").click(function () {
        var storeId = this.id;
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/postPage/evaluationPage?order_id="+storeId;
    });
</script>

</body>

</html>