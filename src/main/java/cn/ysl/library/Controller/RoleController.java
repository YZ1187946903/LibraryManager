package cn.ysl.library.Controller;

import cn.ysl.library.base.controller.BaseController;
import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Role;
import cn.ysl.library.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <b>角色功能控制层类</b>
 */
@Controller("roleController")
@RequestMapping("/role")
public class RoleController extends BaseController {
	@Autowired
	private RoleService roleService;
	/**
	 * <b>转发到角色首页面</b>
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/index")
	public String index() throws Exception {
		return "role/role_index";
	}

	/**
	 * <b>转发到授权页面</b>
	 * @param id
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/auth/{id}", method = RequestMethod.GET)
	public String forwardAuth(@PathVariable("id") Long id, ModelMap map) throws Exception {
		// 将该角色的 id 转发到授权页面
		map.put("id", id);
		return "role/role_auth";
	}

	/**
	 * <b>转发到保存页面</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String forwardRoleSave() throws Exception {
		return "role/role_save";
	}

	/**
	 * <b>转发到修改页面</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String forwardRoleUpdate(@PathVariable("id") Long id, ModelMap map) throws Exception {
		// 将该角色的 id 参数传给到修改页面
		map.put("id", id);
		return "role/role_update";
	}

	/**
	 * <b>分页查询角色信息</b>
	 * @param pageNo
	 * @param pageSize
	 * @param draw
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	@ResponseBody
	public PageVO<Role> queryByPage(Integer pageNo, Integer pageSize, Integer draw, Integer status)
			throws Exception {
		// 1、根据 pageNum、pageSize 和 draw 创建 PageVO 对象
		PageVO<Role> pageVO = new PageVO<Role>(pageNo, pageSize, draw);
		// 2、进行分页查询得到 pageVo对象
		pageVO = roleService.getByPage(pageVO,status);
		// 3、将 pageVO 对象异步返回给前端页面
		return pageVO;
	}

	/**
	 * <b>进行角色授权</b>
	 * @param id
	 * @param checkedIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/auth/{id}", method = RequestMethod.POST)
	@ResponseBody
	// @PathVariable("id") Long id：将路径后面的 {id}中的值传入到 Long id参数值中
	public boolean authRole(@PathVariable("id") Long id, String checkedIds) throws Exception {
		// 1、获得该用户的权限字符串，进行分解
		String[] checkIdAry = checkedIds.split("-");
		// 2、根据权限进行授权
		List<Long> menuIdList = new ArrayList<>();
		for (int i = 0; i < checkIdAry.length; i++) {
			menuIdList.add(Long.parseLong(checkIdAry[i]));
		}
		return roleService.authRole(id, menuIdList);
	}

	/**
	 * <b>保存角色信息</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveRole(Role role) throws Exception {
		return roleService.saveRole(role);
	}

	/**
	 * <b>修改角色信息</b>
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateRole(Role role) throws Exception {
		return roleService.updateRole(role);
	}

	/**
	 * <b>异步校验角色名称</b>
	 * @param name
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check/name", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkRoleName(String name) throws Exception {
		// 根据角色名称查询角色对象
		Role role = roleService.getRoleByName(name);
		if (role != null) {
			// 根据该角色名称查询获得角色对象
			return false;
		} else {
			return true;
		}
	}
}
