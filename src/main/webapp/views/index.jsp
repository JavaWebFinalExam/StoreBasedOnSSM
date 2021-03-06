<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/petshow.css">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/animate.min.css">
    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath%>views/assets/js/countUp.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.lazyload.min.js"></script>
</head>
<body>
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
                <li class="am-dropdown" data-am-dropdown="">
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
                        商品种类
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                      <c:forEach var="category" items="${categories}">
                          <li><a href="<%=basePath%>product/getProductsByType?categoryId=${category.id}">${category.typeName}</a></li>
                      </c:forEach>
                    </ul>
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

<div style="max-width: 1200px;margin: 0 auto;">
  <ul class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default">
    <c:forEach items="${commodityInformation}" var="information">
    <li>
      <div class="am-gallery-item">
        <a href="<%=basePath%>userPage/ordAndCart/productDetail?product_id=${information.product.id}" class="">
          <img src="<%=basePath%>${information.productImage.path}"  alt=""/>
          <h3>${information.product.name}</h3>
        </a>
        <h1 class="am-gallery-title">
          优惠价：￥${information.product.originalprice}<br>
          优惠价：￥${information.product.promoteprice}<br>
          库存数量：${information.product.stock}<br>
        </h1>
          <div class="gallery-desc"><a href="<%=basePath%>userPage/postPage/storePage?storeId=${information.product.storeid}">
            店铺：${information.storeName}</a><br></div>
          <button type="button" class="am-btn am-btn-danger am-btn-sm doc-prompt-toggle" id="doc-prompt-toggle-${information.product.id}">加入购物车</button>
      </div>
    </li>

      <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-${information.product.id}">
        <div class="am-modal-dialog">
          <div class="am-modal-hd">将${information.product.name}加入购物车</div>
          <div class="am-modal-bd">
            请输入添加数量：
            <input id="input-${information.product.id}" required type="number" pattern="[0-9]*" class="am-modal-prompt-input">
          </div>
          <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>提交</span>
          </div>
        </div>
      </div>
      <script>
          $(function() {
              $('#doc-prompt-toggle-${information.product.id}').on('click', function() {
                  $('#my-prompt-${information.product.id}').modal({
                      relatedTarget: this,
                      onConfirm: function(e) {
                          console.log(e.data);
                          var length = $("#input-${information.product.id}")[0].value.length;

                          if (0 < length && length <= 11){
                              var ID = ${information.product.id};
                              var productNum = parseInt(e.data);

                              var json_data = {
                                  "product_id": ID,
                                  "productNum":productNum
                              };
                              var jason_str = JSON.stringify(json_data);
                              console.log(jason_str);

                              $.ajax({
                                  url :"<%=basePath%>userPage/ordAndCart/addProductToShoppingCart",
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
                                      }
                                  },
                                  error:function (data) {
                                      console.log(data);
                                      alert("请求出错，请检查网络或服务器是否开启");
                                  }
                              });
                          }else{
                              alert("请输入合法的数据！");
                          }
                      },
                      onCancel: function(e) {
                      }
                  });
              });
          });
      </script>
    </c:forEach>
  </ul>

  <c:if test="${isPage!=null}">
    <div class="am-margin am-cf">
      <hr/>
      <ol class="am-pagination am-fr">
        <c:forEach items="${lengths}" var="length">
          <li ${page==length?"class=\"am-active\"":""}><a href="<%=basePath%>product/products?page=${length}">${length}</a></li>
        </c:forEach>
      </ol>
    </div>
  </c:if>
</div>


<hr>
<footer class="am_footer">
    <p style="text-align:center"><b>by 计算机科学与技术161班<br/>石立军&nbsp;&nbsp;肖枢贤&nbsp;&nbsp;简斌兵&nbsp;&nbsp;陈俊卿&nbsp;&nbsp;黄宁</b></p>
</footer>

</body>
</html>