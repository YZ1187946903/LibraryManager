package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.Book;

import java.util.List;

/**
 * 图书数据持久层接口
 */
public interface BookDao {
	/**
	 * 根据图书对象查询图书信息
	 * @param query
	 * @return
	 */
	List<Book> findListByQuery(Book query);
}
