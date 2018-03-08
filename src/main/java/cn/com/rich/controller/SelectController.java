package cn.com.rich.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.rich.entity.Test;
import cn.com.rich.service.TestService;  

@Controller  
@RequestMapping("/select") 
public class SelectController {
	@Autowired
	private TestService testService;
	
	@RequestMapping("/doSelect") //url
	public String doSelect(Test t, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println(t.getId());
		try {
			Test u = testService.selectByPrimaryKey(t.getId());
			System.out.println("µÇÂ¼Ãû£º"+u.getId()+"		ÃÜ  Âë"+u.getName());
			request.setAttribute("id", u.getId());
			request.setAttribute("name", u.getName());
		} catch (Exception e) {
			model.addAttribute("failMsg", "Erro!!!");
			System.out.println(e);
			
			return "/fail"; 
		}
		model.addAttribute("successMsg", "Success!!!");
		
		return "/success";
	}
}
