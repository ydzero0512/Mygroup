package com.mygroup.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mygroup.domain.BoardVO;
import com.mygroup.domain.PageMaker;
import com.mygroup.domain.PageVO;
import com.mygroup.service.BoardService;

@RestController
@RequestMapping(value = "/board/*")
public class BoardRestController {
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Inject
	private BoardService bService;
	
	@GetMapping(value = "/list/{category}")
	public ResponseEntity<Map<String, Object>> selectedList(@PathVariable(name = "category") String category, 
			PageVO pvo, String filter, String search) {
		logger.info("RC : list");
		
		pvo.setPageSize(10);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("category", category);
		paramMap.put("pvo", pvo);
		paramMap.put("filter", filter);
		paramMap.put("search", search);
		logger.info("filter : " + filter + " / search : " + search);
		
		Map<String, Object> resultMap = bService.getList(paramMap);
		List<BoardVO> list = (List<BoardVO>)resultMap.get("list");
		
		logger.info("RC : listSize = " + list.size());
		
		PageMaker pm = new PageMaker();
		pm.setPageVO(pvo);
		pm.setTotalCount((int)resultMap.get("count"));
		logger.info("RC : count : " + pm.getTotalCount());
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pm", pm);
		result.put("list", list);		
		
		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	}
	
	@PostMapping(value = "/posts")
	public ResponseEntity<String> create(@RequestBody BoardVO vo) {
		logger.info("RC : create " + vo.toString());
		Integer result = bService.create(vo);
		
		return result > 0 ? new ResponseEntity<String>(HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
	@GetMapping(value = "/posts/{bno}")
	public ResponseEntity<BoardVO> read(@PathVariable (name = "bno") Integer bno) {
		logger.info("RC : read" + bno);
		BoardVO vo = bService.read(bno);
		logger.info("RC : read" + vo.toString());
		
		return vo != null ? new ResponseEntity<BoardVO>(vo, HttpStatus.OK) : new ResponseEntity<BoardVO>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/posts")
	public ResponseEntity<String> update(@RequestBody BoardVO vo) {
		logger.info("RC : update" + vo.toString());
		Integer result = bService.update(vo);
		logger.info("RC : update result" + result);
		
		return result > 0 ? new ResponseEntity<String>(HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/posts/{bno}")
	public ResponseEntity<String> delete(@PathVariable (name = "bno") Integer bno) {
		logger.info("RC : delete");
		Integer result = bService.delete(bno);
		logger.info("RC : delete result" + result);
		
		return result > 0 ? new ResponseEntity<String>(HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/readcount/{bno}")
	public ResponseEntity<String> readCount(@PathVariable(name = "bno") Integer bno) {
		logger.info("RC : updateReadCount");
		Integer result = bService.updateReadCount(bno);
		logger.info("RC : updateReadCount result" + result);
		return result > 0 ? new ResponseEntity<String>(HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/reply")
	public ResponseEntity<String> reply(@RequestBody BoardVO vo) {
		logger.info("RC : reply" + vo.toString());
		Integer result = bService.replyCreate(vo);
		logger.info("RC : reply result : " + result);
		
		return result > 0 ? new ResponseEntity<String>(HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
