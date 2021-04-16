package cn.ysl.library.pojo;

import java.io.Serializable;

/**
 * <b>ztree 节点视图信息</b>
 */
public class Node implements Serializable {
	private static final long serialVersionUID = 6028282598076175451L;
	private Long id;
	private Long pId;                           // 用于分级0-一级节点，1-二级节点
	private String name;
	private boolean open;
	private boolean checked;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean getOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean getChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
