package cn.com.rich.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.rich.common.CommonCode;
import cn.com.rich.common.CommonSeachKeyEsi;
import cn.com.rich.entity.Et_Store_InfoWithBLOBs;
import cn.com.rich.service.EtStoreInfoService;
import net.sf.json.JSONArray;

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

	@ResponseBody
	@RequestMapping("/selectByLimit")
	public String selectByLimit(CommonSeachKeyEsi m, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String rtCode = "error";
		// ��ҳ��ʼ����
		int start = 0;
		// ��ҳ��������
		int end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// ��ǰҳ��-��ʱ ǰ̨ҳ�洫��
		String nowPageTMP = null;
		if(m != null){
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
		start =  (nowPage-1)*(Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20));
		// �����������
		end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// ��ҳ��ʼ����
		selectMap.put("start", start);
		// ��ҳ��������
		selectMap.put("end", end);
		//
		//List 0	storePhone
		//List 1	id
		//List 2	storeTypeId
		//List 3	storeName
		//List 4	gmtCreate
		//List 5	��ǰҳ��-��ʱ ǰ̨ҳ�洫��  nowPageTMP
		//
		// ��Ϊɸѡ����
		if(m != null){
			selectMap.put("storePhone", m.getStorePhone());
			if(!"".equals(m.getIdItem())){
				selectMap.put("id", m.getIdItem());
			}else{
				selectMap.put("id", null);
			}
			if(!"".equals(m.getStoreTypeId())){
				selectMap.put("storeTypeId", m.getStoreTypeId());
			}else{
				selectMap.put("storeTypeId", null);
			}
			// ģ����ѯ
			if(!"".equals(m.getStoreName()) && m.getStoreName() != null){
				selectMap.put("storeName", m.getStoreName().replaceAll("", "%"));
			}else{
				selectMap.put("storeName", null);
			}
			if(!"".equals(m.getGmtCreate())){
				selectMap.put("gmtCreate", m.getGmtCreate());
			}else{
				selectMap.put("gmtCreate", null);
			}
		}else{
			selectMap.put("storePhone", null);
			selectMap.put("id", null);
			selectMap.put("storeTypeId", null);
			selectMap.put("gmtCreate", null);
		}
		
		
		// ��ѯ������������������
		list = etStoreInfoService.selectByLmit(selectMap);
		// �����������ݵ�������
		int selectCount = etStoreInfoService.selectByLmitCount(selectMap);
		// �ֶ���ҳ
		int pages = selectCount/Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20)+1;
		// ����һҳʱ��ʾ�ܹ�һҳ
		if(selectCount == 0){
			pages = 0;
		}
		// �������Map���Ϳ�ʼ
		selectMap.clear();
		m = null;
		selectMap = null;
		// �������Map���ͽ���
		Map<String,Object> rtMap = new HashMap<String, Object>();
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
		System.out.println(selectCount+"count->size"+list.size());
		return rtCode;
	}

}