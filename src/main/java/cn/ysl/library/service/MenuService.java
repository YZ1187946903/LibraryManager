package cn.ysl.library.service;

import cn.ysl.library.pojo.Node;
import cn.ysl.library.pojo.entity.Menu;
import cn.ysl.library.pojo.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * 菜单功能数据持久层接口
 */
public interface MenuService {
	/**
	 * <b>根据角色获得该角色所对应首页面菜单集合</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	List<Menu> getMenuListForIndex(Role role) throws Exception;

	/**
	 * <b>根据角色id 获得菜单 Node 集合</b>
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	List<Node> getNodeListByRole(Long roleId) throws Exception;
}
