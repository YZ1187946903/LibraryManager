package cn.ysl.library.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * 系统常量类
 */
public class ConstantUtil {
	private static Properties props = new Properties();
	static {
		try {
			InputStream in = ConstantUtil.class.getClassLoader().getResourceAsStream("library.properties");
			props.load(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 分页信息：默认当前页码
	 */
	public static final Integer PAGE_NO = Integer.parseInt(props.getProperty("page.no"));

	/**
	 * 分页信息：默认每页显示数量
	 */
	public static final Integer PAGE_SIZE = Integer.parseInt(props.getProperty("page.size"));

}
