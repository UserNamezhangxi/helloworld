package service;

import dao.BookDao;
import dao.daoImpl.BookDaoImpl;
import domain.Book;
import domain.PageBean;

import java.util.List;

public class BookServiceImpl implements BookService {
    @Override
    public List<Book> findAllBooks() {
        BookDao dao = new BookDaoImpl();
        try {
           return dao.query();
        } catch (Exception e) {
            System.out.print("查询失败");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void addOneBook(Book book) {
        BookDao dao = new BookDaoImpl();
        try {
            dao.insert(book);
        } catch (Exception e) {
            System.out.print("添加失败");
            e.printStackTrace();
        }
    }

    @Override
    public Book findBookById(String id) {
        BookDao dao = new BookDaoImpl();
        try {
           return dao.queryOneBook(id);
        } catch (Exception e) {
            System.out.print("查找一本书失败");
            System.out.print(e.getMessage());
        }
        return null;
    }

    @Override
    public void updataBook(Book book) {
        BookDao dao = new BookDaoImpl();
        try {
            dao.updataBook(book);
        } catch (Exception e) {
            System.out.print("修改一书失败");
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOneBookById(String id) {
        BookDao dao = new BookDaoImpl();
        try {
            dao.delete(id);
        } catch (Exception e) {
            System.out.print("删除一书失败");
            e.printStackTrace();
        }
    }

    @Override
    public void deleteSelectBooks(String[] ids) {
        BookDao dao = new BookDaoImpl();
        try {
            dao.deleteBitch(ids);
        } catch (Exception e) {
            System.out.print("批量删除失败");
            e.printStackTrace();
        }
    }

    @Override
    public List<Book>  searchBookWidthCondition(String sql, List parm) {
        BookDao dao = new BookDaoImpl();
        try {
           return dao.conditionQuery(sql,parm);
        } catch (Exception e) {
            System.out.print("search conditon 失败");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int queryBookCount() {
        BookDao dao = new BookDaoImpl();
        try {
           return dao.queryBooksCount();
        } catch (Exception e) {
            System.out.print("search count 失败");
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public PageBean findBooksPage(int curPage, int pageSize) {
        PageBean pb = new PageBean();
        BookDao dao = new BookDaoImpl();
        try {
           int totalCount = dao.queryBooksCount();
           int totalPage = (int)Math.ceil(totalCount*1.0/pageSize);
           List<Book> list = dao.queryBooks((curPage-1)*pageSize,pageSize);
           pb.setBooks(list);
           pb.setCount(totalCount);
           pb.setCurrentPage(curPage);
           pb.setPageSize(pageSize);
           pb.setTotalPage(totalPage);
           return pb;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @Override
    public List<Object> findBookByName(String name) {
        BookDao dao = new BookDaoImpl();
        try {
           return dao.queryBooksByName(name);
        } catch (Exception e) {
            System.out.print("search 失败");
            e.printStackTrace();
        }
        return null;
    }

}
