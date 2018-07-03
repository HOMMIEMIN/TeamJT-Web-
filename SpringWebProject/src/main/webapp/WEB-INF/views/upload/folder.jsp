<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/folder.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/folder2.css" rel="stylesheet" />


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<style>
img {
	height: 68%;
}

p.views.views-info {
	position: relative;
	left: 100px;
	bottom: 90px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid {
	width: 200px;
	height: 280px;
	max-width: 200px;
	max-height: 280px;
	padding: 0px;
	margin-right: 20px;
	margin-bottom: 20px;
}

.overlay {
	position: absolute;
	bottom: 0;
	margin: 0px;
	background: none;
	border: 1px solid grey;
	color: #f1f1f1;
	transition: .5s ease;
	opacity: 0;
	width: 200px;
	height: 280px;
	max-width: 200px;
	max-height: 280px;
	color: white;
	font-size: 20px;
	padding: 90px;
	text-align: center;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay
	{
	opacity: 1;
}

div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info
	{
	padding-top: 15px;
	padding-right: 10px;
	max-height: 86.5px;
}

.btndeup {
	position: relative;
	height: 20px;
	width: 20px;
	margin: 0px;
	padding: 0px;
	left: 150px;
	bottom: 25px;
	background-color: white;
	background-size: cover;
	border: 1px solid white;
}

.author {
	position: relative;
	bottom: 8px;
}

p.views.views-info {
	margin-right: 10px;
}
</style>


</head>
<body>
	<br />
	<br />
	<br />
	<h4 style="font-weight: bold;">온라인 강의 관리</h4>
	<br />

	<div>
		<div style="display: inline-block; width: 550px;"></div>
		<div id=folder style="display: inline-block;">
			<c:forEach var="group" items="${groupList }">

				<div class="col-md-3 resent-grid recommended-grid movie-video-grid">
					<div class="resent-grid-img recommended-grid-img">
						<a href="upload/folderDetail?bno=${group.bno }&lecCategory=${group.lecCategory}"> <c:if
								test="${not empty group.imagePath}">
								<img src="${pageContext.request.contextPath}/resources/image/tmpFiles/${group.imagePath}"
									alt="">
							</c:if> <c:if test="${empty group.imagePath }">
								<img src="${pageContext.request.contextPath}/resources/img/nullfolder.png" alt="">
							</c:if>
						</a>
						<div class="time small-time show-time movie-time"></div>
						<div class="clck movie-clock"></div>
					</div>
					<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info">
						<h6 style="color: #04B486; font-size: 70%; font-weight: bold;">${group.lecCategory }.</h6>
						<h5 style="font-size: 60%">
							<a href="single.html" class="title">${group.lecName }</a>
						</h5>
						<ul>
							<li><p class="author author-info">
									<a href="#" class="author">${userName}</a>
								</p></li>
							<li class="right-list"><p class="views views-info">${group.lecLike}</p></li>
						</ul>
					</div>
					<a
						href="upload/folderDetail?bno=${group.bno }&lecName=${group.lecName}&lecCategory=${group.lecCategory}"
						class="detail">
						<div class="overlay"></div>
					</a>
					<button class="btndeup" id="btnUpdate"
						style="background:url('${pageContext.request.contextPath}/resources/img/update.png');"></button>
					<a href="upload/folderDelete?bno=${group.bno }">
						<button class="btndeup" id="btnDelete"
							style="background:url('${pageContext.request.contextPath}/resources/img/delete.png');"></button>
					</a>
					<div style="display: inline-block; width: 550px;"></div>
				</div>

			</c:forEach>
		</div>
	</div>
	<!-- 폴더 이름입력창 -->
	<div id="id01" class="w3-modal" style="position: absolute; height: 200%;">
		<div class="w3-modal-content w3-animate-opacity w3-card-4"
			style="position: relative; left: 300px; top: 200px; width: 20%">
			<header class="w3-container w3-teal">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<h2>온라인 폴더 생성</h2>
			</header>
			<div class="w3-container" style="padding: 0px">
				<div class="form-group">
					<br />
					<div>
						<div style="display: inline-block; padding-left: 40px;">카테고리</div>
						<form id="createFolder" style="padding-left: 10px; display: inline-block;">
							<select id="category" class="form-control" name="category"
								style="width: 163%; margin-left: 30px">
								<option>IT</option>
								<option>Health</option>
								<option>Food</option>
								<option>Life</option>
								<option>Language</option>
								<option>Ect</option>
							</select>
					
					<div>
						<div style="display: inline-block; padding-left: 40px;">강의명</div>
						<input type="text" id="folderName" name="folderName" class="form-control input-lg"
							style="width: 50%; height: 35px; margin-left: 53px; display: inline-block;" /> <input
							type="hidden" name="userId" value=${userId } />
					</div>
					</form>
					<br />
					<button id="btnFolder1" class="btn btn-default"
						style="width: 100%; background-color: #04B486; color: white">v</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />

	<script>

$(function(){
	
	$("#btnFolder1").click(function () {
		
		  var folderName = $('#folderName').val();
		  var category = $('#category option:selected').val();
		  var id = '${userId}';
		  var name = '${userName}';
		  
		  console.log(folderName);
		  console.log(category);
		  console.log(id)
		  
		  if($('#folderName').val() == ''){
			  alert('폴더명을 입력하세요!');
		  }else{
			  $.ajax({
					type:'post',
					url:'/project/upload/createonlec',
					headers:{
						'Content-Type' : 'application/json; charset=UTF-8',
						'X-HTTP-Method-Override' : 'post'
					},
					data: JSON.stringify({
						'userId' : id,
						'lecName' : folderName,
						'lecCategory' : category
					}),
					success:function(result){
						if(result != null){
							console.log(result);
							 $("#folder").append('<div class="col-md-3 resent-grid recommended-grid movie-video-grid"><div class="resent-grid-img recommended-grid-img"><a href="upload/folderDetail?bno='+result +'&lecCategory='+category +'"><img src="/project/resources/img/nullfolder.png" alt=""></a><div class="time small-time show-time movie-time"></div><div class="clck movie-clock"></div></div><div class="resent-grid-info recommended-grid-info recommended-grid-movie-info"><h6 style="color: #04B486; font-size: 70%;font-weight: bold;">'+category+'.</h6><h5 style="font-size: 60%"><a href="single.html" class="title">'+folderName+'</a></h5><ul><li><p class="author author-info"><a href="#" class="author">'+ name +'</a></p></li><li class="right-list"><p class="views views-info">'+ "0" +' </p></li></ul></div><a href="upload/folderDetail?bno='+result+'" class="detail"><div class="overlay"></div></a><button class="btndeup" id="btnUpdate" style="background:url("project/resources/img/update.png");"></button><a href="upload/folderDelete?bno='+ result +'"><button class="btndeup" id="btnDelete" style="background:url("/project/resources/img/delete.png");"></button></a></div>');
							  $('#id01').css('display','none');
							  $('#folderName').val('');  
						}else{
							alert('등록 실패');
						}
					}
					
				});
			 
		  }
		  
		});

	
	$("#folder").on('click','.col-md-3.resent-grid.recommended-grid.movie-video-grid .detail', function(){
		event.preventDefault();
		console.log(' onLec folder 들어옴');
		myFunction();
		var location = $(this).attr('href');
		$('#onLec').animate({opacity: 0},1000);
		 $("#onLec").load(encodeURI(location));
		$('#onLec').animate({opacity: 1},1000);		
		console.log(location)
	});
	
});



</script>



</body>
</html>