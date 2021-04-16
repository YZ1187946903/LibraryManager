package cn.ysl.library.service;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.User;

public interface UserService {
	/**
	 * 通过手机号码查询 User对象
	 * @param cellphone
	 * @return
	 * @throws Exception
	 */
	User getUserByCellphone(String cellphone) throws Exception;
	/**
	 * <b>分页查询列表</b>
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	PageVO<User> getByPage(PageVO<User> pageVO, Integer status) throws Exception;

	boolean saveUser(User user);

	User getUserById(Long id);

	boolean updateUser(User user);
}
