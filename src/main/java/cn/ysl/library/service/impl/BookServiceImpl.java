package cn.ysl.library.service.impl;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.dao.BookDao;
import cn.ysl.library.pojo.entity.Book;
import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("BookServiceImpl")
@Transactional
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;

	@Override
	public PageVO<Book> getByPage(PageVO<Book> pageVO, Integer status) throws Exception {
		Book query = new Book();
		query.setStatus(status);
		query.setBegin((pageVO.getPageNo() - 1) * pageVO.getPageSize());
		query.setSize(pageVO.getPageSize());
		// 分页查询列表
		List<Book> bookList = bookDao.findListByQuery(query);
		// 进行不分页查询，获得总的条数
		query.setBegin(null);
		query.setSize(null);
		Long totalCount = Long.valueOf(bookDao.findListByQuery(query).size());
		Integer totalPage = (int) ((totalCount % pageVO.getPageSize() == 0) ? (totalCount / pageVO.getPageSize()) :
				(totalCount / pageVO.getPageSize()) + 1);
		// 封装参数
		pageVO.setList(bookList);
		pageVO.setTotalCount(totalCount);
		pageVO.setTotalPage(totalPage);
		return pageVO;
	}

	@Override
	public boolean updateBook(Book book) {
		if (bookDao.updateBook(book) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Book findBookById(Long id) {
		Book book = new Book();
		book.setId(id);
		List<Book> bookList = bookDao.findListByQuery(book);
		if (bookList != null && !bookList.isEmpty()) {
			return bookList.get(0);
		}
		return null;
	}
}
