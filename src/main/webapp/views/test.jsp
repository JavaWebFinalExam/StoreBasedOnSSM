<%--
  Created by IntelliJ IDEA.
  User: 简斌兵
  Date: 2018/12/21
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${commoditydDtails!=null}">
    <c:forEach items="${commoditydDtails}" var="commoditydDtail" >
        <h1>${commoditydDtail.productName}</h1>
        <h1>${commoditydDtail.originalPrice}</h1>
        <h1>${commoditydDtail.productImage}</h1>
    </c:forEach>
</c:if>



</body>
</html>
