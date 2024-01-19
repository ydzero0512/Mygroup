package com.mygroup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mygroup.domain.MemberVO;
import com.mygroup.service.MemberService;

@RestController
@RequestMapping("/mygroup")
public class RestTestController {
	
	@Autowired
	private MemberService mservice;
	
	private static final Logger logger = LoggerFactory.getLogger(RestTestController.class);

	
	// 사원을 등록하기 위한 기능 
	@RequestMapping(value = "/member/memberInsert",method = RequestMethod.POST)
	public ResponseEntity<String> memberInsertPost(@RequestBody MemberVO vo) throws Exception{
		logger.info("사원등록 시작~ ");
		mservice.insertMember(vo);
		
		return new ResponseEntity<String>("ok",HttpStatus.OK);
	}
}
