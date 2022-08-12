package com.hong.image.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {
	
	private long no;
	private String title;
	private String content;
	private String id;
	// 첨부되어서 올라오는 파일
	private MultipartFile imageFile;
	// DB에 저장된 첨부파일명
	private String fileName;
	private Date writeDate;
	// 삭제할 이미지 파일명 전달 받아서
	private String deleteName;
	
	
}
