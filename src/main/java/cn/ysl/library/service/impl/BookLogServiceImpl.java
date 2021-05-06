package cn.ysl.library.service.impl;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.dao.BookLogDao;
import cn.ysl.library.pojo.entity.BookLog;
import cn.ysl.library.service.BookLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author YSL
 * @date 2021/4/28
 */
@Service("BookLogServiceImpl")
@Transactional
public class BookLogServiceImpl implements BookLogService {
	@Autowired
	private BookLogDao bookLogDao;

	@Override
	public PageVO<BookLog> getByPage(PageVO<BookLog> pageVO, String type) {
		// 1、创建 BookLog 对象，进行赋值
		BookLog query = new BookLog();
		query.setType(type);
		query.setBegin((pageVO.getPageNo() - 1) * pageVO.getPageSize());
		query.setSize(pageVO.getPageSize());
		// 2、进行分页查询：获取列表集合信息
		List<BookLog> list = bookLogDao.findListByQuery(query);
		// 3、进行不分页查询：获取总条数总页数
		query.setBegin(null);
		query.setSize(null);
		Long totalCount = Long.valueOf(bookLogDao.findListByQuery(query).size());
		Integer totalPage = (int) ((totalCount % pageVO.getPageSize() == 0) ? (totalCount / pageVO.getPageSize()) :
				(totalCount / pageVO.getPageSize()) + 1);
		// 4、封装到 PageVO对象
		pageVO.setList(list);
		pageVO.setTotalCount(totalCount);
		pageVO.setTotalPage(totalPage);
		return pageVO;
	}

	@Override
	public boolean saveBookLog(BookLog bookLog) {
		if (bookLogDao.saveBookLog(bookLog) > 0) {
			return true;
		}
		return false;
	}
}
