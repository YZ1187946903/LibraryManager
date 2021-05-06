package cn.ysl.library.pojo.entity;

import cn.ysl.library.base.pojo.entity.BaseEntity;

/**
 * 图书馆管理系统-出入库记录表实体类
 * @author YSL
 * @date 2021/4/28
 */
public class BookLog extends BaseEntity {
	private static final long serialVersionUID = -1143684145404844526L;
	private Long id;                        // 主键
	private String type;                    // 出入库操作
	private String place;                   // 出入库地点
	private String operator;                // 操作员姓名
	private String name;                    // 出入库图书名称
	private Integer number;                 // 出入库数量


	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
}
