package com.mygroup.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mygroup.domain.MemberWorkTimeVO;
import com.mygroup.service.MemberService;

@RestController
@RequestMapping(value = "/member")
public class MemberRestController {

	@Autowired
	private MemberService mservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
		
	
	/*
	 * 2024.01.21
	 * 작성자 : 양다영 
	 * 근태관리 - 사원의 근태 조회 
	 */
	@GetMapping(value = "/workTimeList")
	public ResponseEntity<List<MemberWorkTimeVO>> GETworkTimeList(@RequestParam Integer memberId,@RequestParam String today) throws Exception{
		List<MemberWorkTimeVO> result = mservice.selectWorkTime(memberId, today);
		return new ResponseEntity<List<MemberWorkTimeVO>>(result,HttpStatus.OK);
	}
	
	/*
	 * 2024.01.21
	 * 작성자 : 양다영 
	 * 근태관리 - 출근등록 
	 */
	@PostMapping(value = "/workStartTime")
	public ResponseEntity<String> PostworkStartTime(@RequestBody MemberWorkTimeVO vo) throws Exception{
		mservice.insertWorkStart(vo);
		return new ResponseEntity<String>("ok",HttpStatus.OK);
	}
	
	/*
	 * 2024.01.22 
	 * 작성자 : 양다영 
	 * 근태관리 - 퇴근등록 
	 */
	@PostMapping(value = "/workEndTime")
	public ResponseEntity<String> PostworkEndTime(@RequestBody MemberWorkTimeVO vo) throws Exception{
		mservice.insertWorkEnd(vo);
		return new ResponseEntity<String>("ok",HttpStatus.OK);
	}
	
	/*
	 * 2024.01.25 
	 * 작성자 : 양다영 
	 * 근태관리 - 사원의 근태 누적 시간 조회 
	 */
	@GetMapping(value = "/workTimeSum")
	public ResponseEntity<List<MemberWorkTimeVO>> GETworkTimeSum(@RequestParam Integer memberId,@RequestParam String isData) throws Exception{
		List<MemberWorkTimeVO> result = mservice.selectSumTime(memberId, isData);
		return new ResponseEntity<List<MemberWorkTimeVO>>(result,HttpStatus.OK);
	}
}
