<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/23
  Time: 17:29
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="<%=basePath%>views/assets/css/amazeui.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">

    <link href="<%=basePath%>views/assets/css/shoppingCartdemo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/cartOptstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.js"></script>
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
              <li class="am-fl">
                <a href="<%=basePath%>userPage/postPage/PostPage">
                  帖子
                </a>
              </li>
            </ul>
            <ul class="am-nav  am-topbar-right am-topbar-nav am-nav-pills">
                <li><a class="am-round am-topbar-right" href="<%=basePath%>userPage/ordAndCart/showShoppingCart">
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

<!--悬浮搜索框-->

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
                    <div class="td-inner">&nbsp;&nbsp;</div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>



<c:if test="${products!=null}">
    <c:forEach items="${products}" var="productPiece" >
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
                                <a href="#" target="_blank" data-title= "${productPiece.product.name}"class="J_MakePoint" data-point="tbcart.8.12">
                                    <img width="80px" height="80px" src="<%=basePath%>${productPiece.productimage.path}" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="${productPiece.product.name}" class="item-title J_MakePoint" data-point="tbcart.8.11">${productPiece.product.name}</a>
                                </div>
                            </div>
                        </li>

                        <li class="td td-info">
                            <div class="item-props item-props-can">
                            </div>
                        </li>


                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="price-original">${productPiece.product.originalprice}</em>
                                    </div>
                                    <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">${productPiece.product.promoteprice}</em>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <input class="min am-btn" name="" type="button" value="-" />
                                        <input id="numberbox-${productPiece.product.id}" class="text_box numberbox" name="" type="text" value="1" style="width:30px;" />
                                        <input class="add am-btn" name="" type="button" value="+" />
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li class="td td-sum">
                            <div class="td-inner">
                                <%--<em tabindex="0" class="J_ItemSum number">${productPiece.product.promoteprice*productPiece.productnum}</em>--%>
                            </div>
                        </li>
                        <li class="td td-op">
                            <div class="td-inner">

                                    <button id="${productPiece.cartid}" type="button" class="am-btn am-btn-default delete-btn">删除</button>
                                    <%--<a href="pay.html" id="J_Go" class="-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">--%>
                                        <%--<span>删&nbsp;除</span></a>--%>
                                <br/>
                                <br/>
                                    <button id="${productPiece.product.id}" type="button" class="am-btn am-btn-warning payingbtn">结算</button>
                                    <%--<a href="pay.html" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">--%>
                                        <%--<span>结&nbsp;算</span></a>--%>

                            </div>
                        </li>
                        <li>

                        </li>
                    </ul>

                </div>
            </div>
        </tr>
        <div class="clear"></div>
    </c:forEach>
</c:if>


    <div class="footer">

            <p>
                <a href="#">石立军</a>
                <a href="#">肖枢贤</a>
                <a href="#">陈俊卿</a>
                <a href="#">简斌兵</a>
                <a href="#">黄宁</a>
                <em>© 计算机科学与技术161班 版权所有</em>
            </p>

    </div>

</div>
    <%--//跳转我的订单--%>
    <script>
        $("#myorders").click(function () {
            // var productNum = $("#text_box")[0].value;
            // console.log(productNum);
            window.location.href="<%=basePath%>userPage/ordAndCart/showUserOrders";
        });
    </script>

    <%--结算--%>
    <script>
        $(".payingbtn").click(function () {
            var product_id=this.id;
            var productNum = $("#numberbox-"+product_id)[0].value;
            console.log(productNum);

            window.location.href="<%=basePath%>userPage/ordAndCart/showTransction?product_id="+product_id+"&productNum="+productNum;
        });
    </script>

<%--删除购物车--%>
    <script type="text/javascript">
        $(".delete-btn").click(function () {
            console.log(this.id);

            var ID = this.id;

            var json_data = {
                "shoppingCart_id": ID
            };
            var jason_str = JSON.stringify(json_data);

            $.ajax({
                url :"<%=basePath%>userPage/ordAndCart/deleteShoppingCart",
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
<!--引导 -->

</body>

</html>
