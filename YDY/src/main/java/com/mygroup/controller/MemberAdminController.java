package com.mygroup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mygroup.domain.MemberVO;
import com.mygroup.service.MemberService;

@Controller
@RequestMapping(value = "/admin/member")
public class MemberAdminController {
	
	@Autowired
	private MemberService mservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 관리자 기능 - 사원등록 페이지로 이동 
	 */
	@GetMapping(value = "/memberInsert")
	public void GETmemberInsert() {
		logger.info("/member/admin/memberInsert");
	}
	

}
