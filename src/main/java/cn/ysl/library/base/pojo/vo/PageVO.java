package cn.ysl.library.base.pojo.vo;


import cn.ysl.library.util.ConstantUtil;

import java.io.Serializable;
import java.util.List;

/**
 * <b>分页视图信息</b>
 * @param <E>
 */
public class PageVO<E> implements Serializable {
	private static final long serialVersionUID = 7952991438675620050L;
	private Integer pageNo;                    // 当前页码
	private Integer pageSize;                   // 每页显示数量
	private Integer draw;                       // DataTables组件信息
	private List<E> list;                       // 分页列表
	private Long totalCount;                    // 总条数
	private Integer totalPage;                  // 总页数

	public PageVO() {}

	public PageVO(Integer pageNo, Integer pageSize) {
		if (pageNo != null && pageNo > 0) {
			this.pageNo = pageNo;
		} else {
			this.pageNo = ConstantUtil.PAGE_NO;
		}
		if (pageSize != null && pageSize > 0) {
			this.pageSize = pageSize;
		} else {
			this.pageSize = ConstantUtil.PAGE_SIZE;
		}
	}

	public PageVO(Integer pageNo, Integer pageSize,Integer draw) {
		if (pageNo != null && pageNo > 0) {
			this.pageNo = pageNo;
		} else {
			this.pageNo = ConstantUtil.PAGE_NO;
		}
		if (pageSize != null && pageSize > 0) {
			this.pageSize = pageSize;
		} else {
			this.pageSize = ConstantUtil.PAGE_SIZE;
		}
		this.draw = draw;
	}


	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
}
