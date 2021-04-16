package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.Menu;
import cn.ysl.library.pojo.entity.Role;

import java.util.List;
import java.util.Map;

public interface MenuDao {
	/**
	 * <b>根据角色和上级菜单查询对应的下级菜单</b>
	 * @param queryMap
	 * @return
	 * @throws Exception
	 */
	List<Menu> findMenuListByRoleAndParent(Map<String, Object> queryMap) throws Exception;

	/**
	 * <b>根据角色信息获得全部菜单集合</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	List<Menu> findMenuListByRole(Role role) throws Exception;

	/**
	 * <b>根据查询对象查询集合</b>
	 * @param query
	 * @return
	 * @throws Exception
	 */
	List<Menu> findMenuListByQuery(Menu query) throws Exception;
}
