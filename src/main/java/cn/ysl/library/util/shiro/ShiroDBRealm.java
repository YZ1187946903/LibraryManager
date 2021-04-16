package cn.ysl.library.util.shiro;

import cn.ysl.library.pojo.entity.User;
import cn.ysl.library.pojo.enums.StatusEnum;
import cn.ysl.library.service.UserService;
import cn.ysl.library.util.MD5Util;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Component("shiroDBRealm")
public class ShiroDBRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	/**
	 * <b>当用户完成认证后，需要进行授权时，所调用的方法</b>
	 * @param principalCollection
	 * @return
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		// 1、获取账号密码信息
		String cellphone = token.getUsername();
		char[] passwords = token.getPassword();
		// 验证信息是否有效
		if (cellphone != null && !cellphone.isEmpty() && passwords != null && passwords.length > 0) {
			// 2、加密密码
			token.setPassword(MD5Util.encrypt(new String(passwords)).toCharArray());
			try {
				// 3、查询 user 对象是否存在
				User user = userService.getUserByCellphone(cellphone);
				if (user != null) {
					// 4、验证状态
					if (user.getStatus().equals(StatusEnum.STATUS_ENABLE.getCode())) {
						// （1）默认用户登录成功，绑定 HttpSession 信息
						session.setAttribute("user", user);
						// （2）对于判断密码是否相同，则交给 Shiro 进行判断
						SimpleAuthenticationInfo info =
								new SimpleAuthenticationInfo(user.getCellphone(), user.getPassword(), getName());
						return info;
					} else {
						throw new AuthenticationException("该用户禁止登录");
					}
				} else {
					throw new AuthenticationException("该用户尚未注册");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			throw new AuthenticationException("请填写有效的登录信息");
		}
		return null;
	}
}
