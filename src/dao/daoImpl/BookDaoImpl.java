package dao.daoImpl;

import dao.BookDao;
import domain.Book;
import manager.ThreadLocalManager;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.List;

public class BookDaoImpl implements BookDao {
    @Override
    public List<Book> query() throws Exception {
        QueryRunner qr = new QueryRunner();
        return qr.query(ThreadLocalManager.getConnection(),"select * from book",new BeanListHandler<Book>(Book.class));
    }

    @Override
    public void insert(Book book) throws Exception {
        QueryRunner qr = new QueryRunner();
        qr.update(ThreadLocalManager.getConnection(),"INSERT into book VALUES(?,?,?,?,?,?)",
                book.getId(),
                book.getName(),
                book.getPrice(),
                book.getPnum(),
                book.getCategory(),
                book.getDescription());
    }

    @Override
    public Book queryOneBook(String id) throws Exception {
        QueryRunner qr = new QueryRunner();
        return qr.query(ThreadLocalManager.getConnection(),"select * from book where id=?",new BeanHandler<Book>(Book.class),id);
    }

    @Override
    public void updataBook(Book book) throws Exception {
        QueryRunner qr = new QueryRunner();
        qr.update(ThreadLocalManager.getConnection(),"UPDATE book set id=?,name=?,price=?,pnum=?,category=?,description=? WHERE id=?",
                book.getId(),
                book.getName(),
                book.getPrice(),
                book.getPnum(),
                book.getCategory(),
                book.getDescription(),
                book.getId());
    }

    @Override
    public void delete(String id) throws Exception {
        QueryRunner qr = new QueryRunner();
        qr.update(ThreadLocalManager.getConnection(),"DELETE FROM book WHERE id = ?",id);
    }

    @Override
    public void deleteBitch(String[] str) throws Exception {
        QueryRunner qr = new QueryRunner();
        Object[][] parm = new Object[str.length][];
        for (int i =0;i<parm.length;i++){
            parm[i] = new Object[]{str[i]};
        }
        qr.batch(ThreadLocalManager.getConnection(),"DELETE FROM book WHERE id = ?",parm);

    }

    @Override
    public List<Book> conditionQuery(String sql ,List parm) throws Exception {
        QueryRunner qr = new QueryRunner();
        return qr.query(ThreadLocalManager.getConnection(),sql,new BeanListHandler<Book>(Book.class),parm.toArray());
    }

    @Override
    public int queryBooksCount() throws Exception {
        QueryRunner qr = new QueryRunner();
        long l = (Long)qr.query(ThreadLocalManager.getConnection(),"select count(*) from book",new ScalarHandler(1));
        return (int)l;
    }

    @Override
    public List<Book> queryBooks(int currPage, int pageSize) throws Exception {
        QueryRunner qr = new QueryRunner();
        return qr.query(ThreadLocalManager.getConnection(),"SELECT * FROM book LIMIT ?,?",new BeanListHandler<Book>(Book.class),currPage,pageSize);
    }

    @Override
    public List<Object> queryBooksByName(String name) throws Exception {
        QueryRunner qr = new QueryRunner();
        return qr.query(ThreadLocalManager.getConnection(),"SELECT name FROM book where name like ?",new ColumnListHandler(1),"%"+name+"%");
    }

}
