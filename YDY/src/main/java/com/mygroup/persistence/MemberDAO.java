package com.mygroup.persistence;

import com.mygroup.domain.MemberVO;

public interface MemberDAO {
	
	public void createMember(MemberVO vo) throws Exception; //사원 생성 

}
