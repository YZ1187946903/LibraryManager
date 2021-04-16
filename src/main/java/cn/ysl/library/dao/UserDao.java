package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.User;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 用户数据持久层
 */
public interface UserDao {
	/**
	 * 查询 User集合
	 * @param query
	 * @return
	 */
	List<User> findListByQuery(User query);

	int saveUser(User user);

	int updateUser(User user);
}
