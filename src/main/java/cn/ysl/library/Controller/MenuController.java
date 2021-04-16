package cn.ysl.library.Controller;

import cn.ysl.library.base.controller.BaseController;
import cn.ysl.library.pojo.Node;
import cn.ysl.library.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <b>菜单功能控制层类</b>
 */
@Controller("menuController")
@RequestMapping("/menu")
public class MenuController extends BaseController {
	@Autowired
	private MenuService menuService;
	/**
	 * <b>根据角色信息获得菜单 Node 集合</b>
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/nodelist", method = RequestMethod.POST)
	@ResponseBody
	public List<Node> queryNodeListByRole(Long roleId) throws Exception {
		return menuService.getNodeListByRole(roleId);
	}
}
