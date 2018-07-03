<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta  charset="UTF-8">
<title> 오프라인 강의 목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>  
  <style>
  .border {
    display: inline-block;
    width: 250px;
    height: 450px;
    margin: 6px;
  }
  </style>
</head>
<body>
	<div class="container" >
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<!-- Brand -->
			<a class="navbar-brand" href="#">오프라인 강의 목록</a>

			<!-- Links -->
			<ul class="navbar-nav">
				
				<li class="nav-item"><a class="nav-link" href="register">강의 업로드 </a></li>

			</ul>
		</nav>  
  <c:forEach var="offlec" items="${offlecList}">
  	<span class="border">
  		<img alt="" src="${pageContext.request.contextPath}/resources/image/offline/${offlec.imgPath }" style="width:250px;height:200px;">
  		<script>
  		var path1 = '${pageContext.request.contextPath}';
  		var path2 = '${offlec.imgPath }';
  		console.log(path1+"/resources/image/offline/"+path2);
  		</script>
	  	글번호:	${offlec.bno } 	<br/>
	  	강의자: 	${offlec.userid } <br/>
	  	카테고리: ${offlec.category } <br/>
	  	강의제목: ${offlec.title } <br/>
	  	모임날짜: ${offlec.meetingday } <br/>
	  	 <fmt:formatDate value="${offlec.regdate }" pattern="yyyy/MM/dd HH:mm:ss" var="regdate" />
	       신청대기자:	<br/>[${offlec.waitingId }] <br/>
	  	작성시간" ${regdate }	  	
  	</span>
  </c:forEach>

	
	
	</div>
	
	
	
	
	
	
	
	
	
	
</body>
</html>