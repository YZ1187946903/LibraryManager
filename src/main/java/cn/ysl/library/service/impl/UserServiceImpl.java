package cn.ysl.library.service.impl;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.dao.UserDao;
import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public User getUserByCellphone(String cellphone) throws Exception {
		User query = new User();
		query.setCellphone(cellphone);
		// 进行列表查询
		List<User> list = userDao.findListByQuery(query);
		if (list != null && !list.isEmpty()) {
			// 根据手机号码查询到相关信息
			return list.get(0);
		}
		return null;
	}

	/**
	 * <b>分页查询列表</b>
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageVO<User> getByPage(PageVO<User> pageVO, Integer status) throws Exception {
		User query = new User();
		query.setStatus(status);
		query.setBegin((pageVO.getPageNo() - 1) * pageVO.getPageSize());
		query.setSize(pageVO.getPageSize());
		// 1、分页查询列表
		List<User> userList = userDao.findListByQuery(query);
		// 2、进行不分页查询，获得总的条数
		query.setBegin(null);
		query.setSize(null);
		Long totalCount = Long.valueOf(userDao.findListByQuery(query).size());
		Integer totalPage = (int) ((totalCount % pageVO.getPageSize() == 0) ? (totalCount / pageVO.getPageSize()) :
				(totalCount / pageVO.getPageSize()) + 1);
		// 3、封装参数
		pageVO.setList(userList);
		pageVO.setTotalCount(totalCount);
		pageVO.setTotalPage(totalPage);
		return pageVO;
	}

	@Override
	public boolean saveUser(User user) {
		if (userDao.saveUser(user) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public User getUserById(Long id) {
		User query = new User();
		query.setId(id);
		// 进行列表查询
		List<User> list = userDao.findListByQuery(query);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean updateUser(User user) {
		if (userDao.updateUser(user) > 0) {
			return true;
		}
		return false;
	}
}
