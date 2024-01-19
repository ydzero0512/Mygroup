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

import com.mygroup.domain.MemberVO;
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
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 관리자 기능 - 사원등록 페이지로 이동 
	 */
	@GetMapping(value = "/admin/memberInsert")
	public void GETmemberInsert() {
		logger.info("/member/admin/memberInsert");
	}
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 관리자 기능 - 사원 등록
	 */
	@PostMapping("/admin/memberInsert")
	public ResponseEntity<String> memberInsertPost(@RequestBody MemberVO vo) throws Exception{
		System.out.print(vo);
		logger.info("사원등록 시작~ ");
		mservice.insertMember(vo);
		
		return new ResponseEntity<String>("등록되었습니다.",HttpStatus.OK);
	}
}
