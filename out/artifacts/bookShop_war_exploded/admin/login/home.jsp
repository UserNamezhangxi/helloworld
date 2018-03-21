<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>book store home</title>
</head>


    <frameset  rows="103,*,43" frameborder=0 border="0" framespacing="0">
        <frame src="${pageContext.request.contextPath}/admin/login/top.jsp" name="topFrame" scrolling="NO" noresize>
        <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
            <frame src="left.jsp" name="leftFrame" noresize scrolling="YES">
            <frame src="right.jsp" name="rightFrame"/>
        </frameset>
        <frame src="bottom.jsp" scrolling="NO"  noresize>
    </frameset>

</html>
