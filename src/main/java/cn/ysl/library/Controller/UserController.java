package cn.ysl.library.Controller;

import cn.ysl.library.base.controller.BaseController;
import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.service.UserService;
import cn.ysl.library.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller("UserController")
@RequestMapping("/user")
public class UserController extends BaseController {
	@Autowired
	private UserService userService;
	/**
	 * <b>转发到登录界面</b>
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/login")
	// 将异常抛出，spring-mvc会自动将异常捕获进行处理
	public String forwardLogin() throws Exception{
		return "user/user_login";
	}

	/**
	 * <b>转发到登录界面</b>
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/list")
	public String forwardList() throws Exception{
		return "user/user_list";
	}

	@GetMapping("/blacklist")
	public String forwardBlacklist() throws Exception{
		return "user/user_blacklist";
	}

	@GetMapping("/register")
	public String forwardRegister() throws Exception{
		return "user/user_register";
	}

	@GetMapping("/update/{id}")
	public String forwardUpdate(@PathVariable("id") Long id) throws Exception{
		request.setAttribute("user",userService.getUserById(id));
		return "user/user_update";
	}

	@GetMapping("/recharge")
	public String forwardRecharge() throws Exception{
		return "user/user_recharge";
	}


	/**
	 * <b>当登录失败，那么会调用该方法</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginError() throws Exception {
		// 执行退出操作
		return "redirect:logout";
	}

	/**
	 * <b>分页查询用户信息</b>
	 * @param pageNo
	 * @param pageSize
	 * @param draw
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	@ResponseBody
	public PageVO<User> page(Integer pageNo, Integer pageSize, Integer draw, Integer status) throws Exception {
		// 根据ajax前端页面传过来的参数，创建PageVO对象
		PageVO<User> pageVO = new PageVO<>(pageNo,pageSize,draw);
		pageVO = userService.getByPage(pageVO, status);
		return pageVO;
	}

	@PostMapping("/register")
	public String register(User user) throws Exception{
		if (userService.getUserByCellphone(user.getCellphone()) == null) {
			user.setPassword(MD5Util.encrypt(user.getPassword()));
			if (userService.saveUser(user)) {
				return "redirect:login";
			}
		}
		return "redirect:register";
	}

	@RequestMapping(value = "/check/cellphone", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkCellphone(String cellphone,Long id) throws Exception {
		User user = userService.getUserByCellphone(cellphone);
		if (user != null && !user.getId().equals(id)) {
			return false;
		}
		return true;
	}

	@PostMapping("/update")
	@ResponseBody
	public boolean update(User user) throws Exception{
		return userService.updateUser(user);
	}

}
