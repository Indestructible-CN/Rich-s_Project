package cn.com.rich.common;

import java.io.File;

public final class CommonCode {

	public class SelectLimitCode {
		/**
		 * ÿҳ�ֶ����� ��ǰ20
		 */
		public static final String ADMIN_SELECT_LIMIT_20 = "2";
	}

	public static final String DELETE_FLAG_Y = "y";

	/**
	 * ��ͼƬ�ڹ���������ɾ��
	 * 
	 * @param str
	 * @return ɾ�����
	 * 
	 */
	public boolean deleteImg(String str) {
		//
		boolean rtCode = false;
		//
		if (str != null & !"".equals(str)) {
			File file = new File(str);
			if (!file.exists()) {
	            System.out.println("ɾ���ļ�ʧ��:" + str + "�����ڣ�");
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
