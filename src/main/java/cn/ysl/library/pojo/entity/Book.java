package cn.ysl.library.pojo.entity;

import cn.ysl.library.base.pojo.entity.BaseEntity;

/**
 * 图书管理系统-图书信息实体类
 */
public class Book extends BaseEntity {
	private static final long serialVersionUID = 5445294496153553226L;
	private Long id;                        // 主键
	private String name;                    // 图书名称
	private String no;                      // 图书编号
	private String author;                  // 作者
	private String publish;                 // 出版社
	private Integer price;                  // 图书价格
	private Integer number;                 // 库存数量
	private String bookshelf;               // 图书存放区域

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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getBookshelf() {
		return bookshelf;
	}

	public void setBookshelf(String bookshelf) {
		this.bookshelf = bookshelf;
	}
}
