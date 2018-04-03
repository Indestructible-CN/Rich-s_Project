package cn.com.rich.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/commonController")
public class CommonController {
	
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
}
