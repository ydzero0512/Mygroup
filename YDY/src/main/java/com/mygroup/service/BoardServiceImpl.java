package com.mygroup.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mygroup.domain.BoardVO;
import com.mygroup.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO bdao;
	
	@Override
	public Integer create(BoardVO vo) {
		return bdao.create(vo);
	}
	@Override
	public List<BoardVO> getList() {
		return bdao.getList();
	}
	@Override
	public BoardVO read(Integer bno) {
		return bdao.read(bno);
	}
	@Override
	public Integer update(BoardVO vo) {
		return bdao.update(vo);
	}
	@Override
	public Integer delete(Integer bno) {
		return bdao.delete(bno);
	}
	@Override
	public Map<String, Object> getList(Map<String, Object> paramMap) {
		return bdao.getList(paramMap);
	}
	@Override
	public Integer replyCreate(BoardVO vo) {
		return bdao.replyCreate(vo);
	}

}
