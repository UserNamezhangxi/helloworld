<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        .td{
            font-size:14px;
            style:"CURSOR" hand;
            HEIGHT: 20px;
            align:"center";
        }
    </style>
    <script type="text/javascript">

        function setProductCategory(t) {
            var category = document.getElementById("category");//得到下拉列表

            var ops = category.options;//得到下拉列表中的所有option标签数组
            for ( var i = 0; i < ops.length; i++) {

                if (ops[i].value == t) {//判断哪一个option选项中的value值与t(当前书的类名称)相等
                    ops[i].selected = true;//相等则把selected=selected加上
                    return;
                }
            }
        };
    </script>

</head>
<body onload="setProductCategory('${book.category}')">

<form  action="/updateBook" method="post">
    <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td colspan="4" class="tg_01" bgcolor="#AFD1F3" align="center"> 修改商品 </td>
        </tr>

        <tr>
            <td class="td">商品名称</td>
            <td class="td"><input name="name" type="text" value="${book.name}"></td>
            <td class="td">商品价格</td>
            <td class="td"><input name="price" type="text" value="${book.price}"></td>
        </tr>
        <tr>
            <td class="td">商品数量</td>
            <td class="td"><input name="pnum" type="text" value="${book.pnum}"></td>
            <td class="td">商品类别</td>
            <td class="td">
                <select name="category" id="category">
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
            <td class="td" >商品图片</td>
            <td class="td" >
                <input type="file" name="upload">
            </td>
            <td class="td" >商品ID</td>
            <td class="td" >
                <input type="text" name="id" value="${book.id}">
            </td>
        </tr>
        <tr>
            <td class="td">商品描述</td>
            <td class="td" colspan="3">
                   <textarea  id="description"
                             name="description" cols="30" rows="3"
                             style="WIDTH: 96%">
                       ${book.description}
                   </textarea>
            </td>
        </tr>

        <tr>
            <td colspan="4" align="center">
                <input type="submit" value="确定"> &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置"> &nbsp;&nbsp;&nbsp;&nbsp;
                <input onclick="history.go(-1)" type="button" value="返回">
            </td>
        </tr>

    </table>

</form>
</body>
</html>
