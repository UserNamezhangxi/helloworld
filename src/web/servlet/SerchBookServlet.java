package web.servlet;

import domain.Book;
import service.BookService;
import service.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SerchBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        String category = req.getParameter("category");
        String name = req.getParameter("name");
        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");

        String sql = "select * from book where 1=1";
        List list = new ArrayList();
        if (!"".equals(id)){
            list.add("%"+id+"%");
            sql = sql + " and id like ?";
        }

        if (!"".equals(category)){
            list.add(category);
            sql = sql + " and category=?";
        }

        if (!"".equals(name)){
            list.add("%"+name+"%");
            sql = sql + " and name like ?";
        }

        if (!"".equals(minPrice)){
            list.add(minPrice);
            sql = sql + " and price>?";
        }

        if (!"".equals(maxPrice)){
            list.add(maxPrice);
            sql = sql + " and price<?";
        }

        BookService bs = new BookServiceImpl();
        List<Book> list1 = bs.searchBookWidthCondition(sql,list);
        req.setAttribute("books",list1);
        req.getRequestDispatcher("/admin/products/bookList.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
