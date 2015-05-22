package com.company.gap.system.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.LocalContext;
import com.company.gap.system.model.User;


@Controller
@RequestMapping("admin")
public class TabController {
	
	@RequestMapping("/tab")
	public String homepage(HttpServletRequest request) {
		
		User user = LocalContext.getUser();
		
		request.setAttribute("user", user);
		
		return "admin/tab";
		
	}
	
}
