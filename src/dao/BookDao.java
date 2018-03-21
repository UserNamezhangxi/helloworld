package dao;

import domain.Book;
import domain.PageBean;

import java.util.List;

public interface BookDao {

    public List<Book> query() throws Exception;

    public void insert(Book book) throws Exception;

    public Book queryOneBook(String id) throws Exception;

    public void updataBook(Book book) throws Exception;

    public void delete(String id) throws Exception;

    public void deleteBitch(String [] str) throws Exception;

    public List<Book> conditionQuery(String sql ,List parm) throws Exception;

    public int queryBooksCount() throws Exception;

    public List<Book> queryBooks(int currPage, int pageSize) throws Exception;

    public List<Object> queryBooksByName(String name) throws Exception;

}
