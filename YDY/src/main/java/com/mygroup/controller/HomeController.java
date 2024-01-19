package com.mygroup.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//http://localhost:8088/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	
	@RequestMapping(value = "/admin/memberInsert", method = RequestMethod.GET)
	public void GETmemberInsert() {
		logger.info("/admin/memberInsert");
	}
	
	
	@RequestMapping(value = "/member/workTime", method = RequestMethod.GET)
	public void GETworkTime() {
		logger.info("/member/workTime");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET )
	public void accessDenied(Authentication auth, Model model) {
		//Authentication타입의 파라미터를 받도록 설계해서 필요한 경우 사용자의 정보를 확인할 수 있도록 함
		logger.info("access Denied : "+auth);
		model.addAttribute("msg","Access Denied");
	}
	
	@RequestMapping(value = "/customLogin", method = RequestMethod.GET )
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
