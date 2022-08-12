<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>
<script type="text/javascript">
$(function() {
	$(".dataRow").click(function() {
		var no = $(this).find(".no").text();
		location = "view.do?no=" + no 
					+ "&page=${pageObject.page}"
					+ "&perPageNum=${pageObject.perPageNum}"
					+ "&key=${pageObject.key}"
					+ "&word=${pageObject.word}"
	});
})
</script>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 리스트</h2>
	
	<!-- 한줄 시작 -->
	 <div class="row">
	 <c:forEach items="${list}" var="vo" varStatus="vs">
	 	<!-- 이미지 데이터 한개 표시 시작 -->
		<div class="col-md-3 dataRow">
		   <div class="thumbnail">	     
		      <img src="${vo.fileName}" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><span class="no">${vo.no}</span>. ${vo.title}</p>
		          <div>${vo.id} (<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/>)</div>
		        </div>		     
		    </div>
		  </div>
		  <!-- 이미지 데이터 한개 표시 끝 -->
		  <c:if test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum}">
		  	${"</div>" }
		  	${"<div class='row'>" }
		  </c:if>
	  </c:forEach>
	  </div>  
	  	<!-- 이미지 한줄 끝 -->
	  	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject}" /></div>
	  	<div><a href="write.do?perPageNum=${pageObject.perPageNum}" class="btn btn-default">등록</a></div>
</div>
</body>
</html>