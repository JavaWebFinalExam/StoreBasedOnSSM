<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/23
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>

    <link href="<%=basePath%>views/assets/css/adminproduct.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/amazeuiproduct.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>views/assets/css/demoproduct.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="<%=basePath%>views/assets/css/productoptstyle.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath%>views/assets/css/productstyle.css" rel="stylesheet" />

    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery17.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>views/assets/js/quick_links.js"></script>

    <script type="text/javascript" src="<%=basePath%>views/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>views/assets/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="<%=basePath%>views/assets/js/list.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <a href="#" target="_top" class="h">亲，请登录</a>
                <a href="#" target="_top">免费注册</a>
            </div>
        </div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="<%=basePath%>product/products" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a id="myorders" href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd"  target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
        </div>
        <div class="topMessage favorite">
    </ul>
</div>

<!--悬浮搜索框-->



<!--分类-->
<div class="nav-table">
    <div class="long-title"><span class="all-goods">首页</span></div>
    <div class="nav-cont">


    </div>
</div>
<ol class="am-breadcrumb am-breadcrumb-slash">
    <li><a href="<%=basePath%>product/products">首页</a></li>

    <li class="am-active">内容</li>
</ol>
<script type="text/javascript">
    $(function() {});
    $(window).load(function() {
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
<div class="scoll">
    <section class="slider">
        <div class="flexslider">
            <ul class="slides">
                <li>
                    <img src="<%=basePath%>${productimage[0].path}" title="pic" />
                </li>
                <li>
                    <img src="<%=basePath%>${productimage[1].path}" />
                </li>
                <li>
                    <img src="<%=basePath%>${productimage[2].path}" />
                </li>
            </ul>
        </div>
    </section>
</div>

<!--放大镜-->

<div class="item-inform">
    <div class="clearfixLeft" id="clearcontent">

        <div class="box">
            <script type="text/javascript">
                $(document).ready(function() {
                    $(".jqzoom").imagezoom();
                    $("#thumblist li a").click(function() {
                        $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                        $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                        $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                    });
                });
            </script>

            <div class="tb-booth tb-pic tb-s310">
                <a href="<%=basePath%>${productimage[0].path}"><img src="<%=basePath%>${productimage[0].path}" alt="细节展示放大镜特效" rel="<%=basePath%>${productimage[0].path}" class="jqzoom" /></a>
            </div>

        </div>

        <div class="clear"></div>
    </div>
    <br>
    <br>


    <div class="clearfixRight">

    <div class="clearfixRight">
        <br>
        <br>
        <!--规格属性-->
        <!--名称-->
        <div class="tb-detail-hd">
            <h1>
               ${product.name}
            </h1>
        </div>
        <div class="tb-detail-list">
            <!--价格-->
            <div class="tb-detail-price">
                <li class="price iteminfo_price">
                    <dt>促销价</dt>
                    <dd><em>¥</em><b class="sys_item_price">${product.promoteprice}</b>  </dd>
                </li>
                <li class="price iteminfo_mktprice">
                    <dt>原价</dt>
                    <dd><em>¥</em><b class="sys_item_mktprice">${product.originalprice}</b></dd>
                </li>
                <div class="clear"></div>
            </div>



            <!--销量-->
            <ul class="tm-ind-panel">
                <li class="tm-ind-item tm-ind-sellCount canClick">
                </li>
                <li class="tm-ind-item tm-ind-sumCount canClick">
                </li>
                <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                </li>
            </ul>
            <div class="clear"></div>

            <!--各种规格-->
            <dl class="iteminfo_parameter sys_item_specpara">
                <dt class="theme-login"><div class="cart-title"><span class="am-icon-angle-right"></span></div></dt>
                <dd>
                    <!--操作页面-->

                    <div class="theme-popover-mask"></div>

                    <div class="theme-popover">
                        <div class="theme-span"></div>
                        <div class="theme-poptit">
                            <a href="javascript:;" title="关闭" class="close">×</a>
                        </div>
                        <div class="theme-popbod dform">
                            <form class="theme-signin" name="loginform" action="" method="post">

                                <div class="theme-signin-left">

                                    <div class="theme-options">

                                    </div>
                                    <div class="theme-options">

                                    </div>
                                    <div class="theme-options">
                                        <div class="cart-title number">数量</div>
                <dd>
                    <input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
                    <input id="number_box" name="" type="text" value="1" style="width:30px;" />
                    <input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
                    <span id="Stock" class="tb-hidden">库存<span class="stock">${product.stock}</span>件</span>
                </dd>

        </div>
        <div class="clear"></div>

    </div>


    </form>
</div>
</div>

</dd>
</dl>
<div class="clear"></div>
<!--活动	-->

</div>

<div class="pay">
    <div class="pay-opt">
        <a href="<%=basePath%>/product/products.html"><span class="am-icon-home am-icon-fw">首页</span></a>
        <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

    </div>
    <li>
        <div class="clearfix tb-btn tb-btn-buy theme-login">
            <a id="LikBuy" title="点此按钮到下一步确认购买信息">立即购买</a>
        </div>
    </li>
    <li>
        <div class="clearfix tb-btn tb-btn-basket theme-login">
            <a id="LikBasket" title="加入购物车"><i></i>加入购物车</a>
        </div>
    </li>
</div>

</div>

<div class="clear"></div>

</div>




<!-- introduce-->
<br>
<br>

<div class="introduce">

    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">


                        <span class="index-needs-dt-txt">宝贝详情</span></a>
                </li>
                <li>
                    <a href="#">
                        <span class="index-needs-dt-txt">全部评价</span></a>

                </li>


            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">
                    <div class="J_Brand">

                        <div class="attr-list-hd tm-clear">
                            <h4>产品参数：</h4></div>
                        <div class="clear"></div>
                        <ul id="J_AttrUL">
                            <c:if test="${commodityCategories!=null}">

                                <c:forEach items="${commodityCategories}" var="commodityCategory" >
                                <li title=""> ${commodityCategory.property.propertyname}:${commodityCategory.propertyvalue.value}</li>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <div class="clear"></div>
                    </div>

                    <div class="details">
                        <div class="attr-list-hd after-market-hd">
                            <h4>商品细节</h4>
                        </div>
                        <div class="twlistNews">
                            <img src="<%=basePath%>${productimage[3].path}" />
                            <img src="<%=basePath%>${productimage[2].path}" />
                            <img src="<%=basePath%>${productimage[1].path}" />
                            <img src="<%=basePath%>${productimage[0].path}" />
                        </div>
                    </div>
                    <div class="clear"></div>

                </div>

                <div class="am-tab-panel am-fade">




                        <c:forEach items="${evaluation}" var="onevaluation" >
                        <ul class="am-comments-list am-comments-list-flip">
                            <li class="am-comment">
                                <!-- 评论容器 -->
                                <a href="">
                                    <img class="am-comment-avatar" src="<%=basePath%>/views/image/productSingle/1.jpg" />
                                    <!-- 评论者头像 -->
                                </a>

                                <div class="am-comment-main">
                                    <!-- 评论内容容器 -->
                                    <header class="am-comment-hd">
                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                        <div class="am-comment-meta">
                                            <!-- 评论元数据 -->
                                            <a href="#link-to-user" class="am-comment-author">(匿名)</a>

                                        </div>
                                    </header>

                                    <div class="am-comment-bd">
                                        <div class="tb-rev-item " data-id="255095758792">
                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                ${onevaluation.content}
                                            </div>
                                            <div class="tb-r-act-bar">

                                            </div>
                                        </div>

                                    </div>
                                    <!-- 评论内容 -->
                                </div>
                            </li>
                        </c:forEach>



                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->



                    <div class="tb-reviewsft">
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
                    </div>






                </div>


                    <!--分页 -->

                    <div class="clear"></div>

                </div>

            </div>

        </div>

        <div class="clear"></div>

        <div class="footer">

            <div class="">
                <p >
                    <a href="#">石立军</a>
                    <a href="#">肖枢贤</a>
                    <a href="#">陈俊卿</a>
                    <a href="#">简斌兵</a>
                    <a href="#">黄宁</a>
                    <em>© 计算机科学与技术161班</em>
                </p>
            </div>
        </div>
    </div>

</div>
</div>


<script>//购买商品
    $("#LikBuy").click(function () {
        var productNum = $("#number_box")[0].value;
        console.log(productNum);

        window.location.href="<%=basePath%>userPage/ordAndCart/showTransction?product_id=${product.id}&productNum="+productNum;
    });
</script>

<%--//跳转购物车--%>
<script>
    $("#mc-menu-hd").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showShoppingCart";
    });
</script>

<%--//我的订单--%>
<script>
    $("#myorders").click(function () {
        // var productNum = $("#text_box")[0].value;
        // console.log(productNum);
        window.location.href="<%=basePath%>userPage/ordAndCart/showUserOrders";
    });
</script>

<%--加入购物车--%>
<script type="text/javascript">
    $("#LikBasket").click(function () {
        var productNum = $("#number_box")[0].value;

        if (productNum != "") {
            console.log(productNum);

        var json_data = {
            "productNum": productNum,
            "product_id":${product.id}
        };
        var jason_str = JSON.stringify(json_data);

        $.ajax({
            url :"<%=basePath%>/userPage/ordAndCart/addProductToShoppingCart",
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
        }});


</script>



</body>

</html>