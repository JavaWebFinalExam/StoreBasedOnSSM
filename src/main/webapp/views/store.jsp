<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商城</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/petshow.css?6">
    <link rel="stylesheet" href="css/animate.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/amazeui.min.js"></script>
    <script src="js/countUp.min.js"></script>
    <script src="js/amazeui.lazyload.min.js"></script>


</head>
<body>
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">商城</h1>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                data-am-collapse="{target: '#doc-topbar-collapse-5'}">
            <span class="am-sr-only">
                导航切换
            </span>
            <span class="am-icon-bars">
            </span>
        </button>
        <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
                <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-fl am-active">
                    <a href="#">
                        首页
                    </a>
                </li>
                <li class="am-dropdown" data-am-dropdown="">
                     <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
                        商品种类
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                        <c:if test="${types != null}">
                            <c:forEach var="type" items="${types}">
                                <li><a href="<%=basePath%>userPage/bookPage?bookType=${type}">${type}</a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
				</li>
				</ul>
				<ul class="am-nav  am-topbar-right am-topbar-nav am-nav-pills">
				<li><a class="am-round am-topbar-right" href="<%=basePath%>userPage/getShoppingCart">
						<i class="am-icon-shopping-cart"></i>&nbsp;购物车
					</a>
				</li>

				<li class="am-dropdown am-fr" data-am-dropdown>
					<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
					<i class="am-icon-user"></i> &nbsp;用户<span class="am-icon-caret-down"></span>
					</a>
					<ul class="am-dropdown-content">
						<li><a href="#">查看订单</a></li>
						<li><a href="#">退出登录</a></li>
					</ul>
				</li>
				</ul>
        </div>
    </div>
</header>
<div class="get">
    <div class="am-g">
        <div class="am-u-lg-12">
        </div>
    </div>
</div>

<div class="am-g am-imglist">
    <div class="am-u-md-12 am-u-sm-12">
        <article class="am-g blog-entry-article">
            <div class="am-u-lg-4 am-u-md-12 am-u-sm-12 blog-entry-img">
                <img class="am-img-thumbnail am-img-bdrs" src="<%=basePath%>${produces.image}" alt=""/>
            </div>
            <div class="am-u-lg-8 am-u-md-12 am-u-sm-12">
                <div class="gallery-title">
                    <h1>《${book.bookName}》</h1>
                </div>
                <div class="gallery-desc"><small>店铺：${book.store}</small></div>
                <div class="gallery-desc"><small>单价：￥${book.price}</small>&nbsp;&nbsp;&nbsp;&nbsp;
                    <small>库存数量：${book.press}</small></div>
                <button type="button" class="am-btn am-btn-danger am-btn-sm doc-prompt-toggle" id="doc-prompt-toggle-${book.bookId}">加入购物车</button>
            </div>
        </article>
            <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-${book.bookId}">
                <div class="am-modal-dialog">
                    <div class="am-modal-hd">将《${book.bookName}》加入购物车</div>
                    <div class="am-modal-bd">
                        请输入添加数量：
                        <input id="input-${book.bookId}" required type="number" pattern="[0-9]*" class="am-modal-prompt-input">
                    </div>
                    <div class="am-modal-footer">
                        <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                        <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                    </div>
                </div>
            </div>	
	</div>
</div>
<footer class="am_footer">
    <p style="text-align:center"><b>by 计算机科学与技术161班<br/>石立军&nbsp;&nbsp;肖枢贤&nbsp;&nbsp;简斌兵&nbsp;&nbsp;陈俊卿&nbsp;&nbsp;黄宁</b></p>
    <div class="am_info_line">Copyright(c)2018 <span>stroe</span> All Rights Reserved</div>
</footer>
<script src="js/petshow.js"></script>
</body>
</html>