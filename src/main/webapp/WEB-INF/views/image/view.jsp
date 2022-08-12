<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 보기</title>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 보기</h2>
	<ul class="list-group">
		<li class="list-group-item"><label>번호</label>${vo.no}</li>
		<li class="list-group-item"><label>제목</label>${vo.title}</li>
		<li class="list-group-item"><label>첨부이미지</label><img src="${vo.fileName}"/></li>
		<li class="list-group-item"><label>내용</label>${vo.content}</li>
		<li class="list-group-item"><label>아이디</label>${vo.id}</li>
		<li class="list-group-item"><label>작성일</label><fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></li>
	</ul>
	<div>
		<a href="update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
		class="btn btn-default">수정</a>
		<a href="delete.do?no=${vo.no}&deleteName=${vo.fileName}&perPageNum=${param.perPageNum}" 
		class="btn btn-default">삭제</a>
		<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
		class="btn btn-default">리스트</a>
	</div>
</div>
</body>
</html>