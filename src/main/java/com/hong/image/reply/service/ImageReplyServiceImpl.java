package com.hong.image.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hong.image.reply.mapper.ImageReplyMapper;
import com.hong.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
@Qualifier("imageReplyServiceImpl")
public class ImageReplyServiceImpl implements ImageReplyService {

	private ImageReplyMapper mapper;
	
	@Override
	public List<ImageReplyVO> list(PageObject pageObject, Long no) {
		
		// 이미지 번호에 맞는 전체 데이터 갯수 처리 -> 안하면 데이터 안나옴.
		pageObject.setTotalRow(mapper.getTotalRow(no));
		
		return mapper.list(pageObject, no);
	}


}
