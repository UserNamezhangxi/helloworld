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

public class ChangeNumServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String num = req.getParameter("num");

        Book b = new Book();
        b.setId(id);

        HttpSession session = req.getSession();
        HashMap<Book,String> cart = (HashMap<Book, String>) session.getAttribute("cart");

        if (Integer.parseInt(num) == 0){
            cart.remove(b);
        }

        if(cart.containsKey(b)){
            cart.put(b,num);
        }

        session.setAttribute("cart",cart);
        resp.sendRedirect(req.getContextPath()+"/cart.jsp");
//        req.getRequestDispatcher(req.getContextPath()+"/cart.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
