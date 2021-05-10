package cn.ysl.library.service.impl;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.dao.BookDao;
import cn.ysl.library.dao.UserDao;
import cn.ysl.library.pojo.entity.Book;
import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.service.BookService;
import cn.ysl.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("BookServiceImpl")
@Transactional
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserService userService;

	@Override
	public PageVO<Book> getByPage(PageVO<Book> pageVO, Integer status,Long id) throws Exception {
		Book query = new Book();
		query.setStatus(status);
		query.setBegin((pageVO.getPageNo() - 1) * pageVO.getPageSize());
		query.setSize(pageVO.getPageSize());
		// 分页查询列表
		Map<String,Object> map = new HashMap<>();
		map.put("query",query);
		map.put("id",id);
		List<Book> bookList = bookDao.findListByQuery(map);
		// 进行不分页查询，获得总的条数
		query.setBegin(null);
		query.setSize(null);
		Long totalCount = Long.valueOf(bookDao.findListByQuery(map).size());
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
		Map<String,Object> map = new HashMap<>();
		map.put("query",book);
		List<Book> bookList = bookDao.findListByQuery(map);
		if (bookList != null && !bookList.isEmpty()) {
			return bookList.get(0);
		}
		return null;
	}

	@Override
	public Book findBookByNo(String no) {
		Book book = new Book();
		book.setNo(no);
		Map<String,Object> map = new HashMap<>();
		map.put("query",book);
		List<Book> bookList = bookDao.findListByQuery(map);
		if (bookList != null && !bookList.isEmpty()) {
			return bookList.get(0);
		}
		return null;
	}

	@Override
	public boolean backBook(Long id, Long userId,Integer number) {
		Map<String,Long> map = new HashMap<>();
		map.put("id",id);
		map.put("userId",userId);
		if (bookDao.backBook(map) > 0) {
			User user = new User();
			user.setId(userId);
			user.setNumber(number - 1);
			if (userDao.updateUser(user) > 0) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean borrowBook(Long id, Long userId, Integer number,Integer price) {
		User user = userService.getUserById(userId);
		Map<String,Object> map = new HashMap<>();
		map.put("id",userId);
		List<Book> list = bookDao.findListByQuery(map);
		for (Book b: list) {
			// 已经借阅了该书不允许在借阅
			if (b.getId()==id) {
				return false;
			}
		}
		// 保证余额足够
		if (price < user.getMoney()) {
			Map<String,Long> borrowMap = new HashMap<>();
			borrowMap.put("userId",userId);
			borrowMap.put("id",id);
			if (bookDao.borrowBook(borrowMap) > 0) {
				user.setId(userId);
				user.setNumber(number + 1);
				user.setMoney(user.getMoney()-price);
				if (userDao.updateUser(user) > 0) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean saveBook(Book book) {
		if (bookDao.saveBook(book) > 0) {
			return true;
		}
		return false;
	}
}
