<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>电子书城</title>
    <script type="text/javascript">
        function btnNum(id,num,totalCount) {

            var num = parseInt(num);
            var totalCount = parseInt(totalCount);

            if (num > totalCount){
                alert("购买数量不能大于库存！");
                num=totalCount;
            }
            if (num<1){
                if (confirm("确定删除此商品吗？")){
                    num = 0;
                }else{
                    num = 1;
                }
            }

            location.href = "${pageContext.request.contextPath}/changeNumServlet?id="+id+"&num="+num;
        }




    </script>
    <link rel="stylesheet" type="text/css" href="css/comm.css" />

</head>
<body align="center">
    <jsp:include page="top.jsp" />
    <jsp:include page="search.jsp" />
    <div align="center" style="background-color: #FCFDEF;width: 80%;height: 100%">
        <div align="center">
            <img style="width:666px;height: 89px;" src="images/page_ad.jpg" alt="buy">
        </div>
        <div align="center">
            <img src="images/buy1.gif" alt="buy">
        </div>

        <table align="center" style="width: 666px">
            <tr align="center" style="font-size: 14px;background-color: #E1FFE1 ">
                <td>
                    序号
                </td>
                <td>
                    商品名称
                </td>
                <td>
                    价格
                </td>
                <td>
                    数量
                </td>
                <td>
                    库存
                </td>
                <td>
                    小计
                </td>
                <td>
                    取消
                </td>
            </tr>
            <c:set var="sum" value="0" > </c:set>
            <c:forEach items="${cart}" var="book" varStatus="vs">

                <tr align="center" style="font-size: 14px">
                    <td>
                        ${vs.count}
                    </td>
                    <td>
                        ${book.key.name}
                    </td>
                    <td>
                        ${book.key.price}
                    </td>
                    <td>
                        <input type="button" value="-" style="width: 19px;height: 19px;font-size: 15px" onclick="btnNum('${book.key.id}','${book.value -1}','${book.key.pnum}')">
                        <input type="text" value="${book.value}"  style="width: 20px; font-size: 15px" id="input_num">
                        <input type="button" value="+" style="width: 19px;height: 19px ;font-size: 15px" onclick="btnNum('${book.key.id}','${book.value +1}','${book.key.pnum}')">
                    </td>
                    <td>
                        ${book.key.pnum}
                    </td>
                    <td>
                        ${book.value * book.key.price}
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/changeNumServlet?id=${book.key.id}&num=0" style="color:#FF0000; font-weight:bold">X</a>
                    </td>
                </tr>
                <c:set var="sum" value="${sum+ book.value * book.key.price}" > </c:set>
            </c:forEach>

            <tr  style="font-size: 14px;background-color: #E1FFE1">
                <td colspan="7" align="right">
                    合计 :&nbsp;&nbsp;${sum}&nbsp;元
                </td>
            </tr>


        </table>



    </div>
</body>
</html>
