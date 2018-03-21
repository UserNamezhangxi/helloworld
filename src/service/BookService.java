package service;

import domain.Book;
import domain.PageBean;

import java.util.List;

public interface BookService {

    public List<Book> findAllBooks();

    public void addOneBook(Book book);

    public Book findBookById(String id);

    public void updataBook(Book book);

    public void deleteOneBookById(String id);

    public void deleteSelectBooks(String [] ids);

    public List<Book> searchBookWidthCondition(String sql,List parm);

    public int queryBookCount();

    public PageBean findBooksPage(int curPage, int pageSize);


    public List<Object> findBookByName(String name);
}
