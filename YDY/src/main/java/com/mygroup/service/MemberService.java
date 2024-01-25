package com.mygroup.service;


import java.util.List;

import com.mygroup.domain.MemberVO;
import com.mygroup.domain.MemberWorkTimeVO;

public interface MemberService {
	
	
	public void insertMember(MemberVO vo) throws Exception; //사원 생성 
	
	public List<MemberWorkTimeVO> selectWorkTime(Integer memberId,String today) throws Exception; //근태 리스트 
	
	public void insertWorkStart(MemberWorkTimeVO vo) throws Exception; //출근 등록 
	
	public void insertWorkEnd(MemberWorkTimeVO vo) throws Exception; //퇴근 등록 

	public List<MemberWorkTimeVO> selectSumTime(Integer memberId,String isData) throws Exception; //근태 시간 합 
}
