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

	@GetMapping("/password")
	public String forwardPassword() throws Exception{
		return "user/user_password";
	}

	@GetMapping("/info")
	public String userInfo() throws Exception{
		return "user/user_info";
	}


	/**
	 * <b>当登录失败，那么会调用该方法</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginError() throws Exception {
		// 登录失败
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
		if (userService.updateUser(user)) {
			// 修改成功重新绑定 user 对象更新对象信息
			session.setAttribute("user",userService.getUserById(user.getId()));
			return true;
		}
		return false;
	}

	@PostMapping("/password")
	@ResponseBody
	public boolean updatePassword(String oldPassword,String password,Long id) throws Exception{
		User user = userService.getUserById(id);
		if (user.getPassword().equals(MD5Util.encrypt(oldPassword))) {
			// 将新密码加密然后赋值到user中
			user.setPassword(MD5Util.encrypt(password));
			if (userService.updateUser(user)) {
				request.getSession().removeAttribute("user");
				return true;
			}
		}
		return false;
	}

	@PostMapping("/confirmPassword")
	@ResponseBody
	public boolean checkConfirmPassword(String password,String confirmPassword) throws Exception {
		if (password != null && password.equals(confirmPassword)) {
			return true;
		}
		return false;
	}

	@PostMapping("/recharge")
	@ResponseBody
	public boolean recharge(User entity){
		User user = userService.getUserById(entity.getId());
		entity.setMoney(user.getMoney() + entity.getMoney());
		return userService.updateUser(entity);
	}
}
