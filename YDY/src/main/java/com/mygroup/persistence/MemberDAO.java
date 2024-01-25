package com.mygroup.persistence;

import java.util.List;

import com.mygroup.domain.*;
import com.mygroup.domain.MemberWorkTimeVO;

public interface MemberDAO {
	
	public MemberVO readEmail(String email) throws Exception;
	
	public void createMember(MemberVO vo) throws Exception; //사원 생성 
	
	public List<MemberWorkTimeVO> readWorkTime(Integer memberId,String today) throws Exception; //근태 리스트 
	
	public void createWorkStart(MemberWorkTimeVO vo) throws Exception; //출근등록 
	
	public void createWorkEnd(MemberWorkTimeVO vo) throws Exception; //출근등록 
	
	public List<MemberWorkTimeVO> readSumTime(Integer memberId,String isData) throws Exception; //근태 시간 합 
	
}


