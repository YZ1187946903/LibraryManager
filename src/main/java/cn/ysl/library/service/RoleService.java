package cn.ysl.library.service;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Role;

import java.util.List;

/**
 * <b>角色功能业务层接口</b>
 */
public interface RoleService {
	/**
	 * <b>分页查询列表</b>
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	PageVO<Role> getByPage(PageVO<Role> pageVO, Integer status) throws Exception;

	/**
	 * <b>进行角色授权</b>
	 * @param id
	 * @param menuIdList
	 * @return
	 * @throws Exception
	 */
	boolean authRole(Long id, List<Long> menuIdList) throws Exception;

	/**
	 * <b>保存角色信息</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	boolean saveRole(Role role) throws Exception;
	/**
	 * <b>根据角色名称查询角色对象</b>
	 * @param name
	 * @return
	 * @throws Exception
	 */
	Role getRoleByName(String name) throws Exception;
}
