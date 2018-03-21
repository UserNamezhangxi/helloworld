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

</head>
<body>

    <form action="/addBookServlet" method="post">
        <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
            <tr>
                <td colspan="4" class="tg_01" bgcolor="#AFD1F3" align="center"> 添加商品 </td>
            </tr>

            <tr>
                <td class="td" align="center">商品名称</td>
                <td class="td"><input name="name" type="text"></td>
                <td class="td" align="center">商品价格</td>
                <td class="td"><input name="price" type="text"></td>
            </tr>
            <tr>
                <td class="td" align="center">商品数量</td>
                <td class="td"><input name="pnum" type="text"></td>
                <td class="td" align="center">商品类别</td>
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
                <td class="td" align="center">商品图片</td>
                <td class="td" colspan="3">
                    <input type="file" name="upload">
                </td>
            </tr>
            <tr>
                <td class="td" align="center">商品描述</td>
                <td class="td" colspan="3">
                   <textarea id="description"
                           name="description" cols="30" rows="3"
                           style="WIDTH: 96%">
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
