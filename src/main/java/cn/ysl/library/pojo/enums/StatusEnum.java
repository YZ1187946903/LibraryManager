package cn.ysl.library.pojo.enums;

/**
 * <b>系统状态枚举信息</b>
 */
public enum StatusEnum {
	STATUS_DISABLE(0, "禁用"),
	STATUS_ENABLE(1, "启用"),
	STATUS_CHECKED(2, "未审核"),
	STATUS_CLOSED(3, "已注销");

	private Integer code;                       // 状态编码
	private String remark;                      // 状态说明

	private StatusEnum(Integer code, String remark) {
		this.code = code;
		this.remark = remark;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
