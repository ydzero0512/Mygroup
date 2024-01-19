package com.mygroup.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mygroup.domain.MemberVO;
import com.mygroup.persistence.MemberDAO;

@Service
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDAO mdao;
	
	private final PasswordEncoder bcryptPasswordEncoder;
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 비밀번호 암호화하여 등록해주는 매개체 
	 */
	public MemberServiceImpl(SqlSession sqlSession, PasswordEncoder bcryptPasswordEncoder) {
		this.mdao = sqlSession.getMapper(MemberDAO.class);
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// 사원 생성
		vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword()));
		mdao.createMember(vo);
	}

}
