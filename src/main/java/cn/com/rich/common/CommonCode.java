package cn.com.rich.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

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
	/**
	 * 
	 * 
	 * @param fromFile
	 * @param toFile
	 * @throws IOException
	 */
	public static void copyFile(File fromFile,File toFile) throws IOException{
        FileInputStream ins = new FileInputStream(fromFile);
        FileOutputStream out = new FileOutputStream(toFile);
        byte[] b = new byte[3072];
        int n=0;
        while((n=ins.read(b))!=-1){
            out.write(b, 0, n);
        }
        
        ins.close();
        out.close();
    }
}
