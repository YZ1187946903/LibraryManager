package cn.ysl.library.service;


import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.BookLog;

/**
 * 出入库记录表服务层
 * @author YSL
 * @date 2021/4/28
 */
public interface BookLogService {
	PageVO<BookLog> getByPage(PageVO<BookLog> pageVO, String type);

	boolean saveBookLog(BookLog bookLog);
}
