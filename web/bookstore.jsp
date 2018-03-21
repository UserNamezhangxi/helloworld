<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/myJS.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript">
        window.onload = function () {
            var search = document.getElementById("inputSearch");
            var searchContent = document.getElementById("searchContent");
            search.onkeyup = function () {
                    var name = this.value;
                    if(name==""){
                        searchContent.style.display = "none";
                        return;
                    }
                    var xmr = getXMLHttpRequest();
                    // 处理结果
                    xmr.onreadystatechange = function(){

                        if (xmr.readyState == 4 && xmr.status == 200){
                            var str = xmr.responseText; // 获取结果
                            var strList = eval("("+str+")");
                            var childDiv = "";
                            for(var i=0;i<strList.length;i++){
                                childDiv+="<div onclick='onNameClick(this)' onmouseover='onMouse_in(this)' onmouseout='onMouse_out(this)'>"+strList[i]+"</div>";
                            }
                            searchContent.innerHTML = childDiv;
                        }
                    };
                    xmr.open("get","/searchServlet?name="+name + "&time="+new Date().getTime());
                    xmr.send(null);
                }
        };

        function onMouse_in(div){
            div.style.backgroundColor = "gray";
        }

        function onMouse_out(div){
            div.style.backgroundColor = "";
        }

        function onNameClick(div) {
            var inputsearch = document.getElementById("inputSearch");
            inputsearch.value = div.innerHTML;
            //TODO 此处存在疑问，第二次搜索，无法展示下面的 div
            div.parentNode.style.display = "none";
        }


    </script>
    <link rel="stylesheet" type="text/css" href="css/comm.css" />

</head>
<body>

        <div id="page">

            <jsp:include page="top.jsp" />
            <jsp:include page="search.jsp" />

                <div id="content_body">
                    <h1>商品目录</h1><hr/>
                    <h1 id="content_body_h1">计算机类</h1> <span id="content_body_span">共100种商品</span>
                    <div class="clear"></div>
                    <hr/>

                    <div id="product_list">
                        <img src="images/productlist.gif">
                    </div>

                    <table width="100%">
                        <tr  align="center">
                            <c:forEach items="${pb.books}" var="b">
                               <td class="book">
                                   <img style="width: 120px;height: 160px" src="${pageContext.request.contextPath}/images/107.jpg" alt="书图"><br/>
                                   书名：<a href="${pageContext.request.contextPath}/showBookInfoServlet?id=${b.id}" >${b.name}</a><br/>
                                   价格：<a href="#" >${b.price}</a><br/>
                               </td>
                            </c:forEach>
                        </tr>
                    </table>
                    <div id="gotopage">
                        <a href="/showProductServlet?currentPage=${pb.currentPage==1 ? pb.currentPage:pb.currentPage-1}" >上一页</a>
                        第${pb.currentPage}页/共${pb.totalPage}页
                        <a href="/showProductServlet?currentPage=${pb.currentPage==pb.totalPage? pb.totalPage:pb.currentPage+1}" >下一页</a>
                    </div>
                </div>
            </div>
            <div id="bottom">
                <div id="bottom_left">
                    <img src="images/logo.png">
                </div>
                <div id="bottom_right">
                    <div>
                        CONTACT US <br>
                        copyright 2008&nbsp;&copy;&nbsp;BookStore All Rights RESERVED
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
</body>
</html>