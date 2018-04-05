package cn.com.rich.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.rich.common.CommonCode;
import cn.com.rich.entity.Rt_Top_Store;
import cn.com.rich.service.RtTopStoreService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/rtTopStoreService")
public class RtTopStoreController {
	@Autowired
	RtTopStoreService rtTopStoreService;

	@ResponseBody
	@RequestMapping("/selectByExample")
	// 查询优质商户表中所有数据
	public String selectByExample(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 集合初始化
		List<Rt_Top_Store> rstLi = null;
		String rtCode = null;
		rstLi = rtTopStoreService.selectByExample(null);
		if (rstLi == null) {
			rtCode = "error";
		} else if (rstLi.size() == 0) {
			rtCode = "error";
		} else {
			JSONArray json = JSONArray.fromObject(rstLi);
			rtCode = json.toString();
		}
		System.out.println(rstLi);
		return rtCode;
	}
	/**
	 * 更改操作 
	 * @param rts [id , top_tag 置顶标记 , top_weight 置顶权重]
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/updateByPrimaryKeySelective")
	// 查询优质商户表中所有数据
	public String updateByPrimaryKeySelective(Rt_Top_Store rts, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rtCode = "error";
		rts.setGmtModify(new Date());
		int i = rtTopStoreService.updateByPrimaryKeySelective(rts);
		if(i == 1){
			rtCode = "success";
		}
		return rtCode;
	}
	/**
	 *  删除操作
	 * @param rts [id]
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/deleteByPrimaryKeySelective")
	// 查询优质商户表中所有数据
	public String deleteByPrimaryKeySelective(Rt_Top_Store rts, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rtCode = "error";
		rts.setGmtModify(new Date());
		rts.setIsDelete(CommonCode.DELETE_FLAG_Y);
		int i = rtTopStoreService.updateByPrimaryKeySelective(rts);
		if(i == 1){
			rtCode = "success";
		}
		return rtCode;
	}

	@ResponseBody
	@RequestMapping("/insertSelectiveSub")
	// 查询优质商户表中所有数据
	public String insertSelectiveSub(Rt_Top_Store rts, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rtCode = "error";
		rts.setGmtCreate(new Date());
		rts.setId(null);
		int i = rtTopStoreService.insertSelectiveSub(rts);
		if(i == 1){
			rtCode = "success";
		}
		return rtCode;
	}
}
