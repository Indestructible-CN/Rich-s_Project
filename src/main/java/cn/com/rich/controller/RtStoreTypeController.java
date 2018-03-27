package cn.com.rich.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.rich.entity.Rt_Store_Type;
import cn.com.rich.service.RtStoreTypeService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/rtStoreTypeService")
public class RtStoreTypeController {
	@Autowired
	RtStoreTypeService rtStoreTypeService;
	
	//����Ҫ���� ���������̼����༯��
	// ajaxʹ���� ������HTML��ʽ ��Ҫ��
	@ResponseBody
	// url
	@RequestMapping("/doInsertInit")
	// ��ѯ������������������
	public String selectByExample(Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		//���ϳ�ʼ��
		List<Rt_Store_Type> rstLi = null;
		String rtCode = null;
		rstLi = rtStoreTypeService.selectByExample();
		if(rstLi == null){
			rtCode = "error";
		}else if(rstLi.size() == 0){
			rtCode = "error";
		}else{
			JSONArray json = JSONArray.fromObject(rstLi);
			rtCode = json.toString();
		}
		return rtCode;
	}
}
