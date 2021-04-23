package cn.ysl.library.service;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Book;

/**
 * 图书信息业务层
 */
public interface BookService {
	/**
	 * <b>分页查询列表</b>
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	PageVO<Book> getByPage(PageVO<Book> pageVO, Integer status,Long id) throws Exception;

	boolean updateBook(Book book);

	Book findBookById(Long id);

	boolean backBook(Long id, Long userId,Integer number);

	boolean borrowBook(Long id, Long userId, Integer number);
}
