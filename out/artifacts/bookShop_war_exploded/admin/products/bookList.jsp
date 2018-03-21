<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style type="text/css">
        @import url(../css/style.css);
        .td{
            font-size:14px;
            style:"CURSOR" hand;
            HEIGHT: 20px;
            align:"center";
        }
    </style>

    <script type="text/javascript">
        function ckeckAll() {
            var ckStatus = document.getElementById("ckAll").checked;
            var ids = document.getElementsByName("ids");
            for(var i=0;i<ids.length;i++){
                ids[i].checked = ckStatus;
            }
        }

        function delAllBooks () {
            var ids = document.getElementsByName("ids");
            var str="";
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    str+="ids="+ids[i].value+"&";
                }
            }
            str = str.substr(0,str.length-1);

            location.href = "${pageContext.request.contextPath}/deleteSelectBooksServlet?"+str;
        }

    </script>

</head>
<body>

    <form method="post" action="/serchBookServlet">
        <table align="center" width="100%" >
            <tr >
                <td colspan="4" class="td" align="center" style="background-color: #AFD1F3">
                    查询条件
                </td>
            </tr>
            <tr>
                <td class="td"  align="center">
                    商品编号：
                </td>
                <td>
                    <input class="td" type="text" name="id">
                </td>
                <td class="td" align="center">
                    商品类别：
                </td>
                <td >
                    <select name="category" name="category" class="td">
                        <option value="" selected="selected">--选择商品类别--</option>
                        <option value="文学">文学</option>
                        <option value="生活">生活</option>
                        <option value="计算机">计算机</option>
                        <option value="外语">外语</option>
                        <option value="经营">经营</option>
                        <option value="励志">励志</option>
                        <option value="社科">社科</option>
                        <option value="学术">学术</option>
                        <option value="少儿">少儿</option>
                        <option value="艺术">艺术</option>
                        <option value="原版">原版</option>
                        <option value="科技">科技</option>
                        <option value="考试">考试</option>
                        <option value="生活百科">生活百科</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="td" align="center" >
                    商品名称：
                </td>
                <td>
                    <input class="td" type="text" name="name">
                </td>

                    <td class="td" align="center" >
                        价格区间：
                    </td>
                    <td>
                        <input class="td" type="number" name="minPrice" />&nbsp;&nbsp;-&nbsp;&nbsp;
                        <input class="td" type="number" name="maxPrice" />
                    </td>
            </tr>
            </table>
            <div align="right" style="margin-right: 100px">
                <input class="btn" style="font-size: 14px" type="submit" value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="btn" style="font-size: 14px" type="reset" value="重置" />
            </div>
    </form>

<%-----------------------------------------------------------------------------------------------%>

    <div class="tg_01" align="center" style="background-color: #AFD1F3">
        商品列表
    </div>
    <div style="margin-top: 3px;margin-bottom: 3px;width: 80px">
        <input class="btn" style="font-size: 14px" type="button"  value="删除选中" onclick="delAllBooks()">
    </div>
    <table cellspacing="0" cellpadding="1" rules="all"
           bordercolor="gray" border="1" id="DataGrid1"
           style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
        <tr  align = "center" style="background-color: #AFD1F3">
            <td class="td">
                <input type="checkbox" id="ckAll" width="8%" onclick="ckeckAll()" />全选/反选
            </td>
            <td class="td" width="22%">商品编号</td>
            <td class="td" width="20%">商品名称</td>
            <td class="td" width="10%">商品价格</td>
            <td class="td" width="10%">商品数量</td>
            <td class="td" width="10%">商品类别</td>
            <td class="td" width="10%">商品编辑</td>
            <td class="td" width="10%">商品删除</td>
        </tr>

        <c:forEach items="${books}" var="b">

            <tr  onmouseover="this.style.backgroundColor = 'white'"
                 onmouseout="this.style.backgroundColor = '#F5FAFE'"
                 align = "center">
                <td class="td">
                    <input type="checkbox" name="ids" value="${b.id}"/>
                </td>
                <td class="td">${b.id}</td>
                <td class="td">${b.name}</td>
                <td class="td">${b.price}</td>
                <td class="td">${b.pnum}</td>
                <td class="td">${b.category}</td>
                <td class="td">
                    <a class="td" href="${pageContext.request.contextPath}/findBookServlet?id=${b.id}">
                        <img src="${pageContext.request.contextPath}/admin/images/i_edit.gif">
                    </a>
                </td>
                <td>
                    <a class="td" href="${pageContext.request.contextPath}/deleteServlet?id=${b.id}">
                        <img src="${pageContext.request.contextPath}/admin/images/i_del.gif">
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
