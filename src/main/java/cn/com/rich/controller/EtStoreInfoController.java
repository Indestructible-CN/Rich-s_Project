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

	@ResponseBody
	@RequestMapping("/selectByLimit")
	public String selectByLimit(CommonSeachKeyEsi m, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String rtCode = "error";
		// 分页开始条数
		int start = 0;
		// 分页结束条数
		int end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// 当前页数-临时 前台页面传入
		String nowPageTMP = null;
		if (m != null) {
			nowPageTMP = m.getNowPageTMP();
		}
		// 当前页数
		int nowPage = 1;
		// 参数Map
		Map<String, Object> selectMap = new HashMap<String, Object>();
		// 判断是否为空
		if (nowPageTMP == null || nowPageTMP == "") {
			nowPageTMP = "1";
		}
		try {
			// 转型
			nowPage = Integer.parseInt(nowPageTMP);
		} catch (Exception e) {
			System.out.println("页面上的当前页数被人为更改，转型错误！");
		}
		// 初始化集合
		List<Et_Store_InfoWithBLOBs> list = null;
		// 计算开始条数
		start = (nowPage - 1) * (Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20));
		// 计算结束条数
		end = Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		// 分页开始参数
		selectMap.put("start", start);
		// 分页结束参数
		selectMap.put("end", end);
		//
		// List 0 storePhone
		// List 1 id
		// List 2 storeTypeId
		// List 3 storeName
		// List 4 gmtCreate
		// List 5 当前页数-临时 前台页面传入 nowPageTMP
		//
		// 作为筛选条件
		if (m != null) {
			if (!"".equals(m.getStorePhone())) {
				selectMap.put("storePhone", m.getStorePhone());
			} else {
				selectMap.put("storePhone", null);
			}
			if (!"".equals(m.getIdItem())) {
				selectMap.put("id", m.getIdItem());
			} else {
				selectMap.put("id", null);
			}
			if (!"".equals(m.getStoreTypeId())) {
				selectMap.put("storeTypeId", m.getStoreTypeId());
			} else {
				selectMap.put("storeTypeId", null);
			}
			// 模糊查询
			if (!"".equals(m.getStoreName()) && m.getStoreName() != null) {
				selectMap.put("storeName", m.getStoreName().replaceAll("", "%"));
			} else {
				selectMap.put("storeName", null);
			}
			if (!"".equals(m.getGmtCreate())) {
				selectMap.put("gmtCreate", m.getGmtCreate());
			} else {
				selectMap.put("gmtCreate", null);
			}
		} else {
			selectMap.put("storePhone", null);
			selectMap.put("id", null);
			selectMap.put("storeName", null);
			selectMap.put("storeTypeId", null);
			selectMap.put("gmtCreate", null);
		}

		// 查询符合条件的所有数据
		list = etStoreInfoService.selectByLmit(selectMap);
		// 符合条件数据的总条数
		int selectCount = etStoreInfoService.selectByLmitCount(selectMap);
		// 分多少页
		int pages = selectCount / Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) + 1;
		// 不足一页时显示总共一页
		if (selectCount == 0) {
			pages = 0;
		}
		// 整除的情况
		if(selectCount % Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) == 0){
			pages = selectCount / Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20);
		}
		// 清空无用Map类型开始
		selectMap.clear();
		m = null;
		selectMap = null;
		// 清空无用Map类型结束
		Map<String, Object> rtMap = new HashMap<String, Object>();
		// 返回分多少页
		rtMap.put("pages", pages);
		// 返回查询到多少条
		rtMap.put("selectCount", selectCount);
		// 返回当前多少页
		rtMap.put("nowPage", nowPage);
		// 返回查询数据结果
		rtMap.put("list", list);
		JSONArray json = JSONArray.fromObject(rtMap);
		rtCode = json.toString();
		System.out.println(selectCount + "count->size" + list.size());
		return rtCode;
	}

	@ResponseBody
	@RequestMapping("/deleteById")
	public String deleteById(Et_Store_InfoWithBLOBs esiw, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 赋值删除标记
		esiw.setIsDelete(CommonCode.DELETE_FLAG_Y);
		// 赋值更改时间
		esiw.setGmtModify(new Date());
		if(etStoreInfoService.updateByPrimaryKeySelective(esiw) == 1){
			return "success";
		}else{
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/selectByPrimaryKey")
	public String selectByPrimaryKey(Et_Store_InfoWithBLOBs esiw, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 初始化返回值
		String rtCode = "error";
		// 初始化返回对象
		Et_Store_InfoWithBLOBs es = null;
		// 调用查询
		es = etStoreInfoService.selectByPrimaryKey(esiw.getId());
		// 转json用Map
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Object", es);
		
		if(es != null){
			map.put("Msg", "查找成功");
		}else{
			map.put("Msg", "查无此人");
		}
		JSONArray json = JSONArray.fromObject(map);
		rtCode = json.toString();
		return rtCode;
	}
	
	@ResponseBody
	@RequestMapping("/updateByPrimaryKeySelective")
	public String updateByPrimaryKeySelective(Et_Store_InfoWithBLOBs esiw, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 初始化返回值
		String rtCode = "error";
		// 更新时间设置为现在
		esiw.setGmtModify(new Date());
		int i = etStoreInfoService.updateByPrimaryKeySelective(esiw);
		if(i == 1){
			rtCode = "success";
		}
		return rtCode;
	}
	
	@ResponseBody
	@RequestMapping("/deleteByImgSelective")
	public String deleteByImgSelective(String img,String index, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("img:"+img+"/index:"+index);
		// 初始化返回值
		String rtCode = "error";
		Et_Store_InfoWithBLOBs esiw = new Et_Store_InfoWithBLOBs();
		String[] tmp = null;
		StringBuffer newImg = new StringBuffer();
		newImg.append("");
		if(img != null){
			tmp = img.split(",");
			if(tmp != null){
				for(int i = 0;i<tmp.length;i++){
					if(i == 0 && "0".equals(index)){
						newImg.append(",");
					}else if(!(i+"").equals(index)){
						newImg.append(","+tmp[i]);
						
					}
				}
			}
		}
		
		esiw.setStoreImg(newImg.toString());
		int i = etStoreInfoService.updateByPrimaryKeySelective(esiw);
		if(i == 1){
			rtCode = "success";
		}
		return rtCode;
	}
	
}
