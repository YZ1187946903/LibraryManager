package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.BookLog;

import java.util.List;

/**
 * 图书记录数据持久层
 * @author YSL
 * @date 2021/4/28
 */
public interface BookLogDao {
	List<BookLog> findListByQuery(BookLog query);
	int saveBookLog(BookLog bookLog);
}
