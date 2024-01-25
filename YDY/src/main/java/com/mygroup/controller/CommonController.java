package com.mygroup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping(value = "/*")
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * user가 admin페이지로 접근하는 경우, 접근제한하는 페이지로 이동 
	 */
	@GetMapping(value = "/common/accessDenied")
	public void accessDenied(Authentication auth, Model model) {
		//Authentication타입의 파라미터를 받도록 설계해서 필요한 경우 사용자의 정보를 확인할 수 있도록 함
		logger.info("access Denied : "+auth);
		model.addAttribute("msg","Access Denied");
	}

	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 로그인 페이지로 이동 
	 */
	@GetMapping(value = "/common/customLogin")
	public void loginInput(String error, String logout, Model model) {
		logger.info("error"+error);
		logger.info("logout"+logout);
	    if(error!=null) {
	    	model.addAttribute("error","Login Error Check Your Account");
	    }
	    if(logout!=null) {
	    	model.addAttribute("logout","Logout!!");
	    }
	}
}
