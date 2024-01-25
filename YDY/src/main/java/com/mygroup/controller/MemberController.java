package com.mygroup.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mygroup.domain.*;
import com.mygroup.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 근태관리 페이지로 이동 
	 */
	@GetMapping(value = "/workTime")
	public void GETworkTime() {
		logger.info("/member/workTime");
	}
	

	
}
