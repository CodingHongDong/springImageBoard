package com.hong.image.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hong.image.reply.service.ImageReplyService;
import com.hong.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // method의 리턴이 데이터 그대로 사용자에게 전달된다.
@RequestMapping("/imagereply")
@Log4j
public class ImageReplyController {

	@Autowired
	@Qualifier("imageReplyServiceImpl")
	private ImageReplyService service;
	
	// list
	@GetMapping(value = "/list.do", 
				produces = {
							MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE}
	)
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long no) {
		// 페이지에 맞는 list 데이터 가져오기
		List<ImageReplyVO> list = service.list(pageObject, no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("list", list);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	// write
	
	// update
	
	// delete
	
}
