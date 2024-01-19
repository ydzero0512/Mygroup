package com.mygroup.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.mygroup.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 디비연결정보, mapper접근 => SqlSession객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	private static final String NAMESPACE = "com.mygroup.persistence.MemberDAO";

	@Override
	public void createMember(MemberVO vo) throws Exception {
		logger.debug("sqlSession객체 - Mybatis-mapper 접근 ");
		 int result =  sqlSession.insert(NAMESPACE+ ".create",vo);
		 
		 if(result!=0) {
			 logger.debug("사원생성 완료!");
		 }
	}

}
