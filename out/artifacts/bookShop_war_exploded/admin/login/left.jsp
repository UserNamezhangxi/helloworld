<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        #div1{background-color:#E6E6E6;}
    </style>
</head>
<body id="div1">

    <a href="/bookListServlet" target="rightFrame">商品查看</a> <br/>
    <a href="${pageContext.request.contextPath}/admin/products/add.jsp" target="rightFrame">添加商品</a> <br/>

</body>
</html>
