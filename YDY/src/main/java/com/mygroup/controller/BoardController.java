package com.mygroup.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@GetMapping(value = "/{category}/list")
	public String list(HttpSession session, Model model, @PathVariable(name = "category") String category) {
		model.addAttribute(category);
		session.setAttribute("checkViewCnt", true);
		return "/board/list";
	}
	
	@GetMapping(value = "/{category}/create")
	public String create(Model model, @PathVariable(name = "category") String category) {
		model.addAttribute(category);
		return "board/create";
	}
	@GetMapping(value = "{category}/read/{bno}")
	public String readPost(Model model, @PathVariable(name = "category") String category, @PathVariable(name = "bno") Integer bno) {
		logger.info("C : read " + bno + "번 글");
		model.addAttribute(bno);
		return "/board/read";
	}
	@GetMapping(value = "{category}/update/{bno}")
	public String updatePost(Model model, @PathVariable(name = "category") String category, @PathVariable(name = "bno") Integer bno) {
		logger.info("C : read " + bno + "번 글");
		model.addAttribute(bno);
		return "/board/update";
	}
	
	
	@GetMapping(value = "{category}/reply/{bno}")
	public String replyPost(Model model, @PathVariable(name = "category") String category, @PathVariable(name = "bno") Integer bno) {
		logger.info("C : reply " + bno + "번 글");
		model.addAttribute(bno);
		return "/board/reply";
	}
	
	@GetMapping(value = "/home")
	public String home() {
		return "/board/home";
	}
}
