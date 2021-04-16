package cn.ysl.library.service.impl;

import cn.ysl.library.dao.MenuDao;
import cn.ysl.library.pojo.Node;
import cn.ysl.library.pojo.entity.Menu;
import cn.ysl.library.pojo.entity.Role;
import cn.ysl.library.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * <b>菜单功能业务层接口实现类</b>
 */
@Service("menuService")
@Transactional
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;
	/**
	 * <b>根据角色获得该角色所对应首页面菜单集合</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Menu> getMenuListForIndex(Role role) throws Exception {
		// 1、创建map集合，根据角色查询一级菜单
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("parent", null);
		queryMap.put("role", role.getId());
		List<Menu> menuList = menuDao.findMenuListByRoleAndParent(queryMap);
		// 2、循环一级菜单，查询二级菜单
		if (menuList != null && !menuList.isEmpty()) {
			for (Menu parent : menuList) {
				queryMap.put("parent", parent.getId());
				List<Menu> children = menuDao.findMenuListByRoleAndParent(queryMap);
				// 3、将查询获得的二级菜单添加到一级菜单中
				parent.setChildren(children);
			}
		}
		// 返回查询得到的菜单集合
		return menuList;
	}

	/**
	 * <b>根据角色id 获得菜单 Node 集合</b>
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Node> getNodeListByRole(Long roleId) throws Exception{
		// 查询所有的菜单集合
		List<Menu> menuList = menuDao.findMenuListByQuery(null);
		// 创建角色对象
		Role role = new Role();
		role.setId(roleId);
		// 根据角色查询该角色的所有菜单
		List<Menu> menuRoleList = menuDao.findMenuListByRole(role);
		// 获取 menuList 中的数据，切换为 nodeList
		List<Node> nodeList = new ArrayList<Node>();

		if (menuList != null && !menuList.isEmpty()) {
			for (Menu menu : menuList) {
				// 创建 Node 对象
				Node node = new Node();
				node.setId(menu.getId());
				node.setName(menu.getText());
				// 判断此时的 Menu 是否为一级菜单
				if (menu.getParent() == null) {
					// 此时的菜单为一级菜单
					node.setpId(0L);
					node.setOpen(true);
				} else {
					// 此时的菜单为二级菜单
					node.setpId(menu.getParent().getId());
				}

				// 检查该菜单是否是该角色已经授权的菜单
				if (menuRoleList != null && !menuRoleList.isEmpty()) {
					for (Menu menuRole : menuRoleList) {
						if (menuRole.getId().equals(menu.getId())) {
							// 此时该菜单已经赋予该角色，那么 node 的 checked 为 TRUE
							node.setChecked(true);
							break;
						}
					}
				}
				nodeList.add(node);
			}
		}
		return nodeList;
	}
}
