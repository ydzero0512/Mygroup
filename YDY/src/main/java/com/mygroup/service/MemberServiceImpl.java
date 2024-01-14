package com.mygroup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mygroup.domain.MemberVO;
import com.mygroup.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mdao;

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		//사원 생성 
		mdao.createMember(vo);
	}

}
