package com.mygroup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mygroup")
public class RestTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestTestController.class);

	// 주소: /test(GET)
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public ResponseEntity<String> test() throws Exception{
		logger.info("test");
		
		return new ResponseEntity<String>("test",HttpStatus.OK);
	}
}
