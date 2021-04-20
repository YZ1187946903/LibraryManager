package cn.ysl.library.service.impl;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.dao.RoleDao;
import cn.ysl.library.pojo.entity.Role;
import cn.ysl.library.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <b>角色功能业务层接口实现类</b>
 */
@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;

	@Override
	public PageVO<Role> getByPage(PageVO<Role> pageVO, Integer status) throws Exception {
		// 1、创建查询对象
		Role query = new Role();
		// 将参数封装到query对象中去查询数据
		query.setStatus(status);
		query.setBegin((pageVO.getPageNo() - 1) * pageVO.getPageSize());
		query.setSize(pageVO.getPageSize());
		// 2、分页查询列表
		List<Role> roleList = roleDao.findByQuery(query);
		// 3、进行不分页查询，获得总的条数
		query.setBegin(null);
		query.setSize(null);
		Long totalCount = Long.valueOf(roleDao.findByQuery(query).size());
		Integer totalPage = (int) ((totalCount % pageVO.getPageSize() == 0) ? (totalCount / pageVO.getPageSize()) :
				(totalCount / pageVO.getPageSize()) + 1);
		// 4、封装参数
		pageVO.setList(roleList);
		pageVO.setTotalCount(totalCount);
		pageVO.setTotalPage(totalPage);
		// 将 pageVo对象返回
		return pageVO;
	}

	@Override
	public boolean authRole(Long id, List<Long> menuIdList) throws Exception {
		// 1、根据角色删除原有权限
		roleDao.deleteRoleMenuByRoleId(id);
		Map<String, Long> paramMap = new HashMap<String, Long>();
		// 2、循环添加新的权限
		paramMap.put("roleId", id);
		for (Long menuId : menuIdList) {
			paramMap.put("menuId", menuId);
			roleDao.saveRoleMenu(paramMap);
		}
		return true;
	}

	@Override
	public boolean saveRole(Role role) throws Exception {
		if (roleDao.saveRole(role) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * <b>根据角色名称查询角色对象</b>
	 */
	@Override
	public Role getRoleByName(String name) throws Exception {
		// 封装查询对象
		Role query = new Role();
		query.setName(name);
		List<Role> roleList = roleDao.findByQuery(query);
		if (roleList != null && !roleList.isEmpty()) {
			return roleList.get(0);
		}
		return null;
	}

	@Override
	public boolean updateRole(Role role) {
		if (roleDao.updateRole(role) > 0) {
			return true;
		}
		return false;
	}
}
