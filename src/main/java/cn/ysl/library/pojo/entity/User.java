package cn.ysl.library.pojo.entity;

import cn.ysl.library.base.pojo.entity.BaseEntity;

import java.util.List;

/**
 * 图书管理系统-用户实体类
 */
public class User extends BaseEntity {
	private static final long serialVersionUID = 1680885117392600373L;
	private Long id;                        // 主键
	private String name;                    // 姓名
	private String cellphone;               // 手机号码
	private String password;                // 登录密码
	private Role role;                      // 用户角色
	private String idCard;                  // 身份证号码
	private Integer number;                 // 借阅数量
	private Integer money;                  // 账户余额
	private List<Book> bookList;            // 借阅图书集合

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

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

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Integer getNumber() {
		if (bookList != null) {
			return bookList.size();
		}
		return number;
	}

	public void setNumber(Integer number) {
		if (bookList != null) {
			this.number = bookList.size();
		} else {
			this.number = number;
		}
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}
}
