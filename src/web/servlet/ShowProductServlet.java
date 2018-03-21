package web.servlet;

import domain.Book;
import domain.PageBean;
import service.BookService;
import service.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ShowProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        int currentPage = 1;
        int pageSize = 4;

        String curpage = req.getParameter("currentPage");
        if (null!= curpage){
            currentPage = Integer.valueOf(curpage);
        }
        BookService bs = new BookServiceImpl();
        PageBean pb = bs.findBooksPage(currentPage,pageSize);

        req.setAttribute("pb",pb);
        req.getRequestDispatcher("/bookstore.jsp").forward(req,resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
