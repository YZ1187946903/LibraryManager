package cn.ysl.library.dao;

import cn.ysl.library.pojo.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * <b>角色功能数据持久层接口</b>
 */
public interface RoleDao {
	/**
	 * <b>根据查询对象查询列表</b>
	 * @param query
	 * @return
	 * @throws Exception
	 */
	List<Role> findByQuery(Role query) throws Exception;

	/**
	 * <b>根据角色删除角色菜单中间表</b>
	 * @param id
	 * @throws Exception
	 */
	void deleteRoleMenuByRoleId(Long id) throws Exception;

	/**
	 * <b>添加角色菜单中间表数据</b>
	 * @param paramMap
	 * @throws Exception
	 */
	void saveRoleMenu(Map<String, Long> paramMap) throws Exception;

	/**
	 * <b>保存角色信息</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	int saveRole(Role role) throws Exception;
}
