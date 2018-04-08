package cn.com.rich.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.rich.common.CommonCode;
import cn.com.rich.common.CommonSeachKeyEsi;
import cn.com.rich.common.CommonSelectByKey;
import cn.com.rich.entity.Et_Store_InfoWithBLOBs;
import cn.com.rich.service.EtStoreInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/commonController")
public class CommonController {
	@Autowired
	EtStoreInfoService etStoreInfoService;
	
	/**
	 * ��ѯ����
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/selectNotice")
	public String selectNotice(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rtCode = "error";
		String  notice1 = "";
		String  notice2 = "";
		Properties prop = new Properties();
		List<String> li = new ArrayList<String>();
		InputStream file = new BufferedInputStream(new FileInputStream(request.getSession().getServletContext().getRealPath("/")+"WEB-INF/classes/Notice.properties"));
		try {
			prop.load(new InputStreamReader(file, "utf-8"));
		} catch (IOException e) {
			e.printStackTrace();
			e.printStackTrace(new PrintWriter("���������ļ�δ�ҵ���"));
			return rtCode;
		}finally { 
            if (file != null) {  
                try {  
                	file.close();  
                } catch (IOException e) {  
                    System.out.println(e.getMessage());  
                }  
            }  
        }
		notice1 = prop.getProperty("notice.one");
		notice2 = prop.getProperty("notice.two");
		li.add(notice1);
		li.add(notice2);
		JSONArray json = JSONArray.fromObject(li);
		rtCode = json.toString();
		return rtCode;
	}
	/**
	 * �޸Ĺ���
	 * @param notice1 �̶�����
	 * @param notice2 ��������
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/updateNotice")
	public String updateNotice(String notice1, String notice2, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rtCode = "error";
		Properties prop = new Properties();
		FileOutputStream  file = null;
		try {
			file = new FileOutputStream(request.getSession().getServletContext().getRealPath("/")+"WEB-INF/classes/Notice.properties" , false);
			prop.store(file, " / Please don't move");
			prop.setProperty("notice.one", notice1); 
			prop.setProperty("notice.two", notice2);
			prop.store(new OutputStreamWriter(file, "utf-8"), "encode");
			rtCode = "success";
		} catch (IOException e) {
			e.printStackTrace();
			e.printStackTrace(new PrintWriter("���������ļ�δ�ҵ���"));
			return rtCode;
		}finally { 
            if (file != null) {  
                try {  
                	file.close();  
                } catch (IOException e) {  
                    System.out.println(e.getMessage());  
                }  
            }  
        } 
		return rtCode;
	}

	/**
	 * �̼Ҳ�ѯ
	 * @param m ��ѯ���ݴ���
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/selectStore")
	public String updateNotice(CommonSelectByKey m, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// ��ʼ������ֵ
		String rtCode = "error";
		// ��ҳ��ʼ����
		int start = 0;
		// ��ҳ��������
		int end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// ��ǰҳ��-��ʱ ǰ̨ҳ�洫��
		String nowPageTMP = null;
		if (m != null) {
			nowPageTMP = m.getNowPageTMP();
		}
		// ��ǰҳ��
		int nowPage = 1;
		// ����Map
		Map<String, Object> selectMap = new HashMap<String, Object>();
		// �ж��Ƿ�Ϊ��
		if (nowPageTMP == null || nowPageTMP == "") {
			nowPageTMP = "1";
		}
		try {
			// ת��
			nowPage = Integer.parseInt(nowPageTMP);
		} catch (Exception e) {
			System.out.println("ҳ���ϵĵ�ǰҳ������Ϊ���ģ�ת�ʹ���");
		}
		// ��ʼ������
		List<Et_Store_InfoWithBLOBs> list = null;
		// ���㿪ʼ����
		start = (nowPage - 1) * (Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20));
		// �����������
		end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// ��ҳ��ʼ����
		selectMap.put("start", start);
		// ��ҳ��������
		selectMap.put("end", end);

		// ��Ϊɸѡ����
		if (m != null) {
			if (!"".equals(m.getKey())) {
				selectMap.put("key", m.getKey());
			} else {
				selectMap.put("key", null);
			}
		} else {
			selectMap.put("key", null);
		}

		// ��ѯ������������������
		list = etStoreInfoService.selectByKey(selectMap);
		// �����������ݵ�������
		int selectCount = list.size();
		// �ֶ���ҳ
		int pages = selectCount / Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) + 1;
		// ����һҳʱ��ʾ�ܹ�һҳ
		if (selectCount == 0) {
			pages = 0;
		}
		// ���������
		if (selectCount % Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) == 0) {
			pages = selectCount / Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		}
		// �������Map���Ϳ�ʼ
		selectMap.clear();
		m = null;
		selectMap = null;
		// �������Map���ͽ���
		Map<String, Object> rtMap = new HashMap<String, Object>();
		// ���طֶ���ҳ
		rtMap.put("pages", pages);
		// ���ز�ѯ��������
		rtMap.put("selectCount", selectCount);
		// ���ص�ǰ����ҳ
		rtMap.put("nowPage", nowPage);
		// ���ز�ѯ���ݽ��
		rtMap.put("list", list);
		JSONArray json = JSONArray.fromObject(rtMap);
		rtCode = json.toString();
		System.out.println(selectCount + "count->size" + list.size());
		return rtCode;
	}
}
