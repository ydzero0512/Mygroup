package com.mygroup.persistence;

import java.util.List;
import java.util.Map;

import com.mygroup.domain.BoardVO;

public interface BoardDAO {

	public Integer create(BoardVO vo);

	public List<BoardVO> getList();

	public BoardVO read(Integer bno);

	public Integer update(BoardVO vo);

	public Integer delete(Integer bno);

	public Map<String, Object> getList(Map<String, Object> paramMap);

	public Integer replyCreate(BoardVO vo);

}
