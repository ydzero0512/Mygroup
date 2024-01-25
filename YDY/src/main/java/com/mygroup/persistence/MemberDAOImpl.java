package com.mygroup.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 * 근태관리 - 출근등록 
	 */
	@Override
	public List<MemberWorkTimeVO> readWorkTime(Integer memberId,String today) throws Exception {
	    Map<String, Object> params = new HashMap<>();
	    params.put("memberId", memberId);
	    params.put("today", today);
		List<MemberWorkTimeVO> vo = sqlSession.selectList(NAMESPACE+ ".readWorkTime",params);
		return vo;
	}
	
	@Override
	public void createWorkStart(MemberWorkTimeVO vo) throws Exception {
		 int result =  sqlSession.insert(NAMESPACE+ ".createWorkStartTime",vo);
		 
		 if(result!=0) {
			 logger.debug("출근등록 완료!");
		 }
		
	}

	/*
	 * 2024.01.22  
	 * 작성자 : 양다영 
	 * 근태관리 - 퇴근등록 
	 */
	@Override
	public void createWorkEnd(MemberWorkTimeVO vo) throws Exception {
		 int result =  sqlSession.insert(NAMESPACE+ ".createWorkEndTime",vo);
		 
		 if(result!=0) {
			 logger.debug("퇴근등록 완료!");
		 }		
	}

	/*
	 * 2024.01.25
	 * 작성자 : 양다영 
	 * 근태관리 - 누적합 
	 */
	@Override
	public List<MemberWorkTimeVO> readSumTime(Integer memberId, String isData) throws Exception {
		 Map<String, Object> params = new HashMap<>();
		    params.put("memberId", memberId);
		    params.put("isData", isData);
			List<MemberWorkTimeVO> vo = sqlSession.selectList(NAMESPACE+ ".readTimeSum",params);
		return vo;
	}


	

}
