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

	// ajax使用中 除返回HTML格式 都要加
	@ResponseBody
	// url
	@RequestMapping("/doInsert")
	public String doSelect(Et_Store_InfoWithBLOBs esiw, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 返回值
		int rtcode = 0;
		// ID
		esiw.setId(MaxId());
		// 创建时间
		esiw.setGmtCreate(new Date());
		// 默认标记为不删除
		esiw.setIsDelete("n");
		// 数据插入并返回
		rtcode = etStoreInfoService.insertEtStoreInfo(esiw);
		// 返回值判断
		if (rtcode > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	public String MaxId() {
		// 返回值初始化
		String rtCode = "1";
		// 查询值初始化
		int i = 0;
		// 调用查询当前表中ID最大值
		try {
			i = etStoreInfoService.maxId();
		} catch (Exception e) {
			System.out.println("EtStoreInfoController类中MaxId()方法，查询不到ID最大值[已默认设置为1]");
			rtCode = "1";
		}
		if (i > 0) {
			rtCode = (i + 1) + "";
		}
		return rtCode;
	}

}
