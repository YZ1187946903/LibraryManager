package cn.ysl.library.pojo.entity;


import cn.ysl.library.base.pojo.entity.BaseEntity;

import java.util.List;

/**
 * <b>图书管理系统-角色实体信息</b>
 */
public class Role extends BaseEntity {
	private static final long serialVersionUID = 7172015810576435749L;
	private Long id;                        // 主键
	private String name;                    // 角色名称
	private List<Menu> menuList;            // 角色对应的功能菜单集合

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
}
