<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/25
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>订单页面</title>

    <link href="../assets/css/orderAmazeui.css" rel="stylesheet" type="text/css" />

    <link href="../assets/css/orderDemo.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/orderStyle.css" rel="stylesheet" type="text/css" />

    <link href="../assets/css/orderJsstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../assets/js/orderAddress.js"></script>

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
            <div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"></a></div>
    </ul>
</div>


<!--订单 -->
<div class="concent">
    <div id="payTable">
        <h3>订单信息</h3>
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
                <div class="th th-sum">
                    <div class="td-inner">原价</div>
                </div>
                <div class="th th-oplist">
                    <div class="td-inner">实付金额</div>
                </div>

            </div>
        </div>
        <div class="clear"></div>

        <tr class="item-list">
            <div class="bundle  bundle-last">

                <div class="bundle-main">
                    <ul class="item-content clearfix">
                        <div class="pay-phone">
                            <li class="td td-item">
                                <div class="item-pic">
                                    <a href="#" class="J_MakePoint">
                                        <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
                                </div>
                                <div class="item-info">
                                    <div class="item-basic-info">
                                        <a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-info">
                                <div class="item-props">
                                    <span class="sku-line">颜色：12#川南玛瑙</span>
                                    <span class="sku-line">包装：裸装</span>
                                </div>
                            </li>
                            <li class="td td-price">
                                <div class="item-price price-promo-promo">
                                    <div class="price-content">
                                        <em class="J_Price price-now">39.00</em>
                                    </div>
                                </div>
                            </li>
                        </div>

                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <span class="phone-title">购买数量</span>
                                    <div class="price-content">
                                        <em class="J_Price price-now">3</em>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li class="td td-sum">
                            <div class="td-inner">
                                <em tabindex="0" class="J_ItemSum number">117.00</em>
                            </div>
                        </li>
                        <li class="td td-oplist">
                            <div class="td-inner">
                                <span class="phone-title">配送方式</span>
                                <div class="pay-logis">
                                    实付金额<b class="sys_item_freprice">10</b>元
                                </div>
                            </div>
                        </li>

                    </ul>
                    <div class="clear"></div>

                </div>
        </tr>
        <div class="clear"></div>
    </div>

    <tr id="J_BundleList_s_1911116345_1" class="item-list">
        <div id="J_Bundle_s_1911116345_1_0" class="bundle  bundle-last">
            <div class="bundle-main">
                <ul class="item-content clearfix">
                    <div class="pay-phone">
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" class="J_MakePoint">
                                    <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                            <div class="item-props">
                                <span class="sku-line">颜色：10#蜜橘色+17#樱花粉</span>
                                <span class="sku-line">包装：两支手袋装（送彩带）</span>
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <em class="J_Price price-now">39.00</em>
                                </div>
                            </div>
                        </li>
                    </div>

                    <li class="td td-amount">
                        <div class="amount-wrapper ">
                            <div class="item-amount ">
                                <span class="phone-title">购买数量</span>
                                <div class="sl">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">

                                            <div class="price-content">
                                                <em class="J_Price price-now">3</em>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="td td-sum">
                        <div class="td-inner">
                            <em tabindex="0" class="J_ItemSum number">117.00</em>
                        </div>
                    </li>
                    <li class="td td-oplist">
                        <div class="td-inner">
                            <span class="phone-title">总金额</span>
                            <div class="pay-logis">
                                包邮
                            </div>
                        </div>
                    </li>

                </ul>
                <div class="clear"></div>

            </div>
    </tr>
</div>
<div class="clear"></div>
<div class="pay-total">





</div>

<div class="clear"></div>
</div>
</div>
<div class="footer">

    <div class="footer-bd">
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
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="user-name" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" id="user-name" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="user-phone" placeholder="手机号必填" type="email">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <select data-am-selected>
                        <option value="a">浙江省</option>
                        <option value="b">湖北省</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">温州市</option>
                        <option value="b">武汉市</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">瑞安区</option>
                        <option value="b">洪山区</option>
                    </select>
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-intro" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                    <small>100字以内写出你的详细地址...</small>
                </div>
            </div>

            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <div class="am-btn am-btn-danger">保存</div>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="clear"></div>
</body>

</html>