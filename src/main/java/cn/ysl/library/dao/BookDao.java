package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.Book;

import java.util.List;
import java.util.Map;

/**
 * 图书数据持久层接口
 */
public interface BookDao {
	/**
	 * 根据图书对象查询图书信息
	 * @return
	 */
	List<Book> findListByQuery(Map<String,Object> map);

	int updateBook(Book book);

	int backBook(Map<String, Long> map);

	int borrowBook(Map<String, Long> map);
}
