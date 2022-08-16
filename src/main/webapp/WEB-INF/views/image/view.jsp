<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 보기</title>
<style type="text/css">
#imageChangeDiv{
	display: none;
}

li > label{
	width: 150px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#imageChangeDivShowBtn").click(function() {
		$("#imageChangeDiv").show();
	});
	$("#cancelBtn").click(function() {
		$("#imageChangeDiv").hide();
	});
	
	$("#deleteBtn").click(function() {
		return confirm("정말 삭제하시겠습니까?");
	});
	
});
</script>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 보기</h2>
	<ul class="list-group">
		<li class="list-group-item"><label>번호</label>${vo.no}</li>
		<li class="list-group-item"><label>제목</label>${vo.title}</li>
		<li class="list-group-item"><label>첨부이미지</label>
			<img src="${vo.fileName}"/>
			<div>
				<button id="imageChangeDivShowBtn">이미지 바꾸기</button>
				<div id="imageChangeDiv">
					<form action="imageChange.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="no" value="${vo.no}">
						<input type="hidden" name="page" value="${param.page}">
						<input type="hidden" name="perPageNum" value="${param.perPageNum}">
						<input type="hidden" name="key" value="${param.key}">
						<input type="hidden" name="word" value="${param.word}">
						<input type="hidden" name="deleteName" value="${vo.fileName}">
						<div class="form-group">
							<label for="imageFile">바꿀 파일</label>
							<input type="file" name="imageFile" id="imageFile" required="required" class="form-control">
						</div>
						<button class="btn btn-default">바꾸기</button>
						<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
					</form>
				</div>
			</div>
		</li>
		<li class="list-group-item"><label>내용</label>${vo.content}</li>
		<li class="list-group-item"><label>아이디</label>${vo.id}</li>
		<li class="list-group-item"><label>작성일</label><fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></li>
	</ul>
	<div>
		<div class="alert alert-warning"><strong>수정 유의 사항</strong>정보만 수정할 수 있습니다. 이미지 파일은 이미지 아래 바꾸기 버튼을 사용하세요.</div>
		<a href="update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
		class="btn btn-default">수정</a>
		<a href="delete.do?no=${vo.no}&deleteName=${vo.fileName}&perPageNum=${param.perPageNum}" 
		class="btn btn-default" id="deleteBtn">삭제</a>
		<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
		class="btn btn-default">리스트</a>
	</div>
</div>
</body>
</html>