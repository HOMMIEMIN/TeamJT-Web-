<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/folder.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/folder2.css" rel="stylesheet" />
<style>
a{
height: 280px;
}

video,source{
height : 420px;
max-width: 100%;

}

</style>
</head>
<body>

<div id = folder>
<c:forEach var="group" items="${onLecList }">

<div class="col-md-3 resent-grid recommended-grid movie-video-grid">
<div class="resent-grid-img recommended-grid-img">
<a href="upload/folderDetail?bno=${group.bno }" class="detail"><video id="video1">
    <source src="${pageContext.request.contextPath}/resources/video/tmpFiles/tmpFiles/${group.videoPath }" type="video/mp4">
    <source src="mov_bbb.ogg" type="video/ogg"></video></a>
<div class="time small-time show-time movie-time">
</div>
<div class="clck movie-clock">
</div>
</div>
<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info">
<h5><a href="single.html" class="title">${group.title }</a></h5>
<ul>
<li><p class="author author-info"><a href="#" class="author">${group.userId }</a></p></li>
<li class="right-list"><p class="views views-info">${group.regDate} </p></li>
</ul>
</div>

</div>

</c:forEach>
</div>



<script>
$(()=>{
	$('#btnUpload').click(()=>{
		var bno = '${bno}';
		var category = '${lecCategory}'
		 $("#onLec").load("/project/upload/addonlec?bno=" + bno + "&lecCategory=" + category);
		
	});
});

	

</script>

</body>
</html>