package cn.com.rich.common;

import java.io.File;

public final class CommonCode {

	public class SelectLimitCode {
		/**
		 * 每页分多少条 当前20
		 */
		public static final String ADMIN_SELECT_LIMIT_20 = "2";
	}

	public static final String DELETE_FLAG_Y = "y";

	/**
	 * 把图片在工程中物理删除
	 * 
	 * @param str
	 * @return 删除结果
	 * 
	 */
	public boolean deleteImg(String str) {
		//
		boolean rtCode = false;
		//
		if (str != null & !"".equals(str)) {
			File file = new File(str);
			if (!file.exists()) {
	            System.out.println("删除文件失败:" + str + "不存在！");
	        } else {
	        	rtCode = file.delete();
	        }
		}

		return rtCode;
	}
	public static void main(String[] args) {
		CommonCode c = new CommonCode();

		System.out.println(c.deleteImg("/Picture/1234.png"));
	}
}
