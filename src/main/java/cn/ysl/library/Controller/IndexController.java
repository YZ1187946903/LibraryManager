package cn.ysl.library.Controller;

import cn.ysl.library.base.controller.BaseController;
import cn.ysl.library.pojo.entity.Menu;
import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * <b>首页面控制层类</b>
 */
@Controller("IndexController")
public class IndexController extends BaseController {
	@Autowired
	private MenuService menuService;
	@GetMapping("/")
	public String index(ModelMap map) throws Exception{
		// 1、从Session上获得当前登录用户信息
		User user = (User) session.getAttribute("user");
		// 2、根据用户角色信息获取菜单集合
		List<Menu> menuList = menuService.getMenuListForIndex(user.getRole());
		// 3、将菜单信息集合添加到 ModelMap 中作为携带参数发送出去
		map.put("menuList",menuList);
		// 转发至首页面
		return "index";
	}
}
