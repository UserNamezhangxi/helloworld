package web.servlet;

import domain.Book;
import org.apache.commons.beanutils.BeanUtils;
import service.BookService;
import service.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

public class AddBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        Book book = new Book();

        try {
            BeanUtils.populate(book,req.getParameterMap());
            book.setId(UUID.randomUUID().toString());
            BookService bs = new BookServiceImpl();
            bs.addOneBook(book);
            req.getRequestDispatcher("/bookListServlet").forward(req,resp);
        } catch (Exception e) {
            System.out.print("解析一场了");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
