package com.hong.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hong.image.service.ImageService;
import com.hong.image.vo.ImageVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/image")
@Log4j
public class ImageController {

	@Autowired
	@Setter(onMethod_ = {@Autowired})
	private ImageService imageServiceImpl;
	
	
	// list - g
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		log.info("이미지 게시판 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(8);
		
		model.addAttribute("list", imageServiceImpl.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "image/list";
	}
	
	// view - g
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("이미지 게시판 보기");
		
		model.addAttribute("vo", imageServiceImpl.view(no));
		return "image/view";
	}
	
	// write Form - g
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("이미지 게시판 등록 폼");
		return "/image/write";
	}
	
	// write - p
	@PostMapping("/write.do")
	public String write(ImageVO vo, HttpSession session, HttpServletRequest request, int perPageNum) throws Exception {
		log.info("이미지 게시판 등록 처리");
		
		// id session에서 받아서 쓴다. - member table에 있는 계정 사용.
		vo.setId("test");
		// 이미지 파일명을 찾아서 넣어주는것이 필요. - 중복이 되지 않는다. - 실제적으로 파일 올리기
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		
		imageServiceImpl.write(vo);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// update Form - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("이미지 게시판 수정 폼");
		
		model.addAttribute("vo", imageServiceImpl.view(no));
		return "image/update";
	}
	
	// update - p
	@PostMapping("/update.do")
	public String update(ImageVO vo) throws Exception {
		log.info("이미지 게시판 수정 처리");
		
		imageServiceImpl.update(vo);
		return "redirect:view.do?no=10";
	}
	
	// delete - g
	@GetMapping("/delete.do")
	public String delete(ImageVO vo) throws Exception {
		log.info("이미지 게시판 삭제");
		
		// DB에서 데이터에서 데이터 삭제
		imageServiceImpl.delete(vo.getNo());
		// 파일 삭제
		return "redirect:list.do";
	}
	
}
