<%--
  Created by IntelliJ IDEA.
  User: 15327
  Date: 2018/12/22
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${productimage!=null}">
    <c:forEach items="${productimage}" var="oneProductimage" >
        <h1>${oneProductimage}</h1>
    </c:forEach>
</c:if>

<br>
${product.name}<br>
${product.originalprice}<br>
${product.promoteprice}<br>
${product.stock}<br>
${product.description}<br>
${product.createdate}<br>




</body>
</html>
