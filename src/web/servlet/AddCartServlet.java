package web.servlet;

import domain.Book;
import service.BookService;
import service.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

public class AddCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        BookService bs = new BookServiceImpl();
        Book book = bs.findBookById(id);
        HttpSession session = req.getSession();
        HashMap<Book,String> cart = (HashMap<Book, String>) session.getAttribute("cart");

        int bookNum = 1;
        if (cart == null){
            cart = new HashMap<Book,String>();
        }
        if (cart.containsKey(book)){
            bookNum = Integer.parseInt(cart.get(book));
            bookNum++;
        }
        cart.put(book,bookNum+"");
        // 把cart 对象放回到seesion 作用域
        session.setAttribute("cart",cart);
        resp.getWriter().print("<a href='"+req.getContextPath()+"/showProductServlet"+"' >继续购物</a>，<a href='"+req.getContextPath()+"/cart.jsp"+"' >查看购物车</a>");

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
