<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/25
  Time: 8:41
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

    <title>结算页面</title>

    <link href="<%=basePath%>views/assets/css/Amazeui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <link href="<%=basePath%>views/assets/css/payDemo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/payCartstyle.css" rel="stylesheet" type="text/css" />

    <link href="<%=basePath%>views/assets/css/payJsstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=basePath%>views/assets/js/payAddress.js"></script>
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/countUp.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>

</head>

<body>

<!--顶部导航条 -->
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">商城</h1>
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


<!--订单 -->
<div class="concent">
    <div id="payTable">
        <h3>确认订单信息</h3>
        <div class="cart-table-th">
            <div class="wp">

                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <%--<div class="th th-sum">--%>
                    <%--<div class="td-inner">金额</div>--%>
                <%--</div>--%>
                <%--<div class="th th-oplist">--%>
                    <%--<div class="td-inner">配送方式</div>--%>
                <%--</div>--%>

            </div>
        </div>
        <div class="clear"></div>

    <tr id="J_BundleList_s_1911116345_1" class="item-list">
        <div id="J_Bundle_s_1911116345_1_0" class="bundle  bundle-last">
            <div class="bundle-main">
                <ul class="item-content clearfix">
                    <div class="pay-phone">
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" class="J_MakePoint">
                                    <img src="<%=basePath%>${productimage.path}" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="${product.name}" class="item-title J_MakePoint" data-point="tbcart.8.11">${product.name}</a>
                                </div>
                            </div>
                        </li>

                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <em class="J_Price price-now">${product.promoteprice}</em>
                                </div>
                            </div>
                        </li>
                    </div>

                    <li class="td td-amount">
                        <div class="amount-wrapper ">
                            <div class="item-amount ">
                                <span class="phone-title">购买数量</span>
                                <div class="sl">

                                    <span style="width:30px;" >${productNum}</span>

                                </div>
                            </div>
                        </div>
                    </li>
                                   <%--<li class="td td-sum">--%>
                    <%--<div class="td-inner">--%>
                    <%--<em tabindex="0" class="J_ItemSum number">117.00</em>--%>
                    <%--</div>--%>
                    <%--</li>--%>
                    <%--<li class="td td-oplist">--%>
                    <%--<div class="td-inner">--%>
                    <%--<span class="phone-title">配送方式</span>--%>
                    <%--<div class="pay-logis">--%>
                    <%--包邮--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</li>--%>

                </ul>
                <div class="clear"></div>

            </div>
    </tr>
</div>
<div class="clear"></div>
<div class="pay-total">
    <!--留言-->
    <div class="order-extra">
        <div class="order-user-info">
            <div id="holyshit257" class="memo">
                <label>买家留言：</label>
                <input id="usermessage" type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
                <div class="msg hidden J-msg">
                    <p class="error">最多输入500个字符</p>
                </div>
            </div>
        </div>

    </div>

    <!--含运费小计 -->


    <!--信息 -->
    <div class="order-go clearfix">
        <div class="pay-confirm clearfix">
            <div class="box">
                <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                    <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${amount}</em>
											</span>
                </div>
                <div id="holyshit268" class="pay-address">

                    <p class="buy-footer-address">
                        <span class="buy-line-title buy-line-title-type">寄送至：</span>
                        <span class="buy--address-detail">
								   <span class="province"><input id="addressis"  type="text" title="请填写收货地址" placeholder="请填写收货地址" class="memo-input J_MakePoint c2c-text-default memo-close" style="width: 70px"></span>
												</span>
                        </span>
                    </p>
                    <p class="buy-footer-address">
                        <span class="buy-line-title">收货人：</span>
                        <span class="buy-address-detail">
												<input id="receiveris" type="text" title="必填，请填写您的姓名" placeholder="必填，请填写您的姓名" class="memo-input J_MakePoint c2c-text-default memo-close" style="width: 70px">
												</span>
                    </p>
                    <p class="buy-footer-address">
                        <span class="buy-line-title">电话号码：</span>
                        <span class="buy-address-detail">
												<input id="mobile" type="text" title="必填，请填写收货人的电话号码" placeholder="必填，请填写收货人的电话号码" class="memo-input J_MakePoint c2c-text-default memo-close" style="width: 70px">
												</span>
                    </p>
                </div>
            </div>

            <div id="holyshit269" class="submitOrder">
                <div class="go-btn-wrap">
                    <a id="successful"  class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<div class="clear"></div>
</div>
</div>
<div class="footer">

    <%--<div class="footer-bd">--%>
        <p>
            <a href="#">石立军</a>
            <a href="#">肖枢贤</a>
            <a href="#">陈俊卿</a>
            <a href="#">简斌兵</a>
            <a href="#">黄宁</a>
            <em>计算机科学与技术161班 </em>
        </p>
    <%--</div>--%>
</div>
</div>
<div class="theme-popover-mask"></div>
<div class="theme-popover">



</div>

<div class="clear"></div>
<%--//跳转购物车--%>
<script>
    $("#mc-menu-hd").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showShoppingCart";
    });
</script>

<%--//跳转我的订单--%>
<script>
    $("#myorders").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showUserOrders";
    });
</script>

<script type="text/javascript">
    $("#successful").click(function () {
        console.log(this.id);

        var productNum = ${productNum}
        var product_id =${product.id}
        var userMessage=$("#usermessage")[0].value;
        var mobile = $("#mobile")[0].value;
        var receiver = $("#receiveris")[0].value;
        var address = $("#addressis")[0].value;

        var json_data = {
            "product_id":product_id,
            "productNum":productNum,
            "receiver":receiver,
            "address":address,
            "mobile":mobile,
            "userMessage":userMessage
        };
        var jason_str = JSON.stringify(json_data);

        $.ajax({
            url :"<%=basePath%>userPage/ordAndCart/submitOrder",
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