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
	 * 查询公告
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
			e.printStackTrace(new PrintWriter("公告配置文件未找到！"));
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
	 * 修改公告
	 * @param notice1 固定公告
	 * @param notice2 滚动公告
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
			e.printStackTrace(new PrintWriter("公告配置文件未找到！"));
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
	 * 商家查询
	 * @param m 查询内容传输
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
		// 初始化返回值
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

		// 作为筛选条件
		if (m != null) {
			if (!"".equals(m.getKey())) {
				selectMap.put("key", m.getKey());
			} else {
				selectMap.put("key", null);
			}
		} else {
			selectMap.put("key", null);
		}

		// 查询符合条件的所有数据
		list = etStoreInfoService.selectByKey(selectMap);
		// 符合条件数据的总条数
		int selectCount = list.size();
		// 分多少页
		int pages = selectCount / Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) + 1;
		// 不足一页时显示总共一页
		if (selectCount == 0) {
			pages = 0;
		}
		// 整除的情况
		if (selectCount % Integer.parseInt(CommonCode.SelectLimitCode.ADMIN_SELECT_LIMIT_20) == 0) {
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
}
