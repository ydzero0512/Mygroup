package com.mygroup.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mygroup.domain.CustomMemberVO;
import com.mygroup.domain.MemberVO;
import com.mygroup.domain.MemberWorkTimeVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 디비연결정보, mapper접근 => SqlSession객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	private static final String NAMESPACE = "com.mygroup.persistence.MemberDAO";
	
	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 로그인시, 이메일 확인 
	 */
	@Override
	public MemberVO readEmail(String email) throws Exception {
		MemberVO vo = sqlSession.selectOne(NAMESPACE+ ".login",email);
		return vo;
	}

	/*
	 * 2024.01.19
	 * 작성자 : 양다영 
	 * 관리자 기능 - 사원등록
	 */
	@Override
	public void createMember(MemberVO vo) throws Exception {
		logger.debug("sqlSession객체 - Mybatis-mapper 접근 ");
		 int result =  sqlSession.insert(NAMESPACE+ ".createMember",vo);
		 
		 if(result!=0) {
			 logger.debug("사원생성 완료!");
		 }
	}

	/*
	 * 2024.01.21 
	 * 작성자 : 양다영 
	 * 근태관리 - 근태목록
	 */
	@Override
	public List<MemberWorkTimeVO> readWorkTime(Integer memberId) throws Exception {
		List<MemberWorkTimeVO> vo = sqlSession.selectList(NAMESPACE+ ".readWorkTime",memberId);
		return vo;
	}
	
	@Override
	public void createWorkStart(MemberWorkTimeVO vo) throws Exception {
		 int result =  sqlSession.insert(NAMESPACE+ ".createWorkTime",vo);
		 
		 if(result!=0) {
			 logger.debug("출근등록 완료!");
		 }
		
	}


	

}
