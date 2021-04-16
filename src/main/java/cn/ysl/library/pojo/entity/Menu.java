package cn.ysl.library.pojo.entity;

import cn.ysl.library.base.pojo.entity.BaseEntity;

import java.util.List;

/**
 * <b>图书管理系统-菜单实体信息</b>
 */
public class Menu extends BaseEntity {
	private static final long serialVersionUID = -7483315884099712229L;
	private Long id;                        // 主键
	private Menu parent;                    // 上级菜单
	private String text;                    // 菜单文本
	private String url;                     // 菜单链接地址
	private String icon;                    // 菜单图标
	private List<Role> roleList;            // 该菜单所分配的角色集合
	private List<Menu> children;            // 该菜单的下级菜单集合

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}
}
