package cn.com.rich.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.rich.entity.Et_Admin;
import cn.com.rich.service.UserService;


@Controller  
@RequestMapping("/etAdminService")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/adminLogin")
	public String adminLogin(Et_Admin admin,Model model, HttpServletRequest request,
			HttpServletResponse response){
		Et_Admin user= userService.Login(admin);
		HttpSession session = request.getSession();
		session.removeAttribute("errormessage");
		session.removeAttribute("adminlogin");
		if(user!=null){
			session.setAttribute("adminlogin", user);
			return "Administrator";
		} else {
			System.out.print("error");
			session.setAttribute("errormessage", "ÄúµÄÕË»§»òÃÜÂë´íÎó");
			return "fail";
		}
	}

}
