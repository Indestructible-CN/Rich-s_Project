package cn.com.rich.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.rich.entity.Et_Store_InfoWithBLOBs;
import cn.com.rich.service.EtStoreInfoService;

@Controller
@RequestMapping("/etStoreInfoService")
public class EtStoreInfoController {
	@Autowired
	EtStoreInfoService etStoreInfoService;

	// ajaxʹ���� ������HTML��ʽ ��Ҫ��
	@ResponseBody
	// url
	@RequestMapping("/doInsert")
	public String doSelect(Et_Store_InfoWithBLOBs esiw, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// ����ֵ
		int rtcode = 0;
		// ID
		esiw.setId(MaxId());
		// ����ʱ��
		esiw.setGmtCreate(new Date());
		// Ĭ�ϱ��Ϊ��ɾ��
		esiw.setIsDelete("n");
		// ���ݲ��벢����
		rtcode = etStoreInfoService.insertEtStoreInfo(esiw);
		// ����ֵ�ж�
		if (rtcode > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	public String MaxId() {
		// ����ֵ��ʼ��
		String rtCode = "1";
		// ��ѯֵ��ʼ��
		int i = 0;
		// ���ò�ѯ��ǰ����ID���ֵ
		try {
			i = etStoreInfoService.maxId();
		} catch (Exception e) {
			System.out.println("EtStoreInfoController����MaxId()��������ѯ����ID���ֵ[��Ĭ������Ϊ1]");
			rtCode = "1";
		}
		if (i > 0) {
			rtCode = (i + 1) + "";
		}
		return rtCode;
	}

}
