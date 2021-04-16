package cn.ysl.library.base.pojo.entity;

import java.io.Serializable;
import java.util.Date;

public class BaseEntity implements Serializable {
	private static final long serialVersionUID = -5926740424271095696L;
	private Integer status;                     // 0-禁用，1-启用，2-未审核，3-已注销
	private Date createTime;                    // 创建时间
	private Date updateTime;                    // 修改时间
	private Integer begin;                      // 开始下标
	private Integer size;                       // 连续查询数量

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getBegin() {
		return begin;
	}

	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}
}
