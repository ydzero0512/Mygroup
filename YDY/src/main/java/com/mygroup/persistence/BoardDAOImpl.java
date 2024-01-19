package com.mygroup.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mygroup.controller.BoardRestController;
import com.mygroup.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.mygroup.mapper.BoardMapper";
	
	@Override
	public Integer create(BoardVO vo) {
		Integer maxBno= sqlSession.selectOne(NAMESPACE + ".getMaxBno");
		vo.setBno(maxBno+1);
		vo.setRe_ref(maxBno+1);
		vo.setRe_lev(0);
		vo.setRe_seq(0);
		return sqlSession.insert(NAMESPACE + ".createPost", vo);
	}

	@Override
	public List<BoardVO> getList() {
		return sqlSession.selectList(NAMESPACE + ".getPostList");
	}

	@Override
	public BoardVO read(Integer bno) {
		return sqlSession.selectOne(NAMESPACE + ".readPost", bno);
	}

	@Override
	public Integer update(BoardVO vo) {
		return sqlSession.update(NAMESPACE + ".updatePost", vo);
	}

	@Override
	public Integer delete(Integer bno) {
		return sqlSession.delete(NAMESPACE + ".deletePost", bno);
	}

	@Override
	public Map<String, Object> getList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", sqlSession.selectOne(NAMESPACE + ".getPostCount", paramMap));
		resultMap.put("list", sqlSession.selectList(NAMESPACE + ".getSelectedPostList", paramMap));
		
		return resultMap;
	}

	@Override
	public Integer replyCreate(BoardVO vo) {
		sqlSession.update(NAMESPACE + ".updateReply", vo);
		Integer maxBno= sqlSession.selectOne(NAMESPACE + ".getMaxBno");
		vo.setBno(maxBno+1);
		vo.setRe_lev(vo.getRe_lev()+1);
		vo.setRe_seq(vo.getRe_seq()+1);
		
		return sqlSession.insert(NAMESPACE + ".createPost", vo);
	}

	@Override
	public Integer updateReadCount(Integer bno) {
		return sqlSession.update(NAMESPACE + ".updateReadcount", bno);
	}

}
