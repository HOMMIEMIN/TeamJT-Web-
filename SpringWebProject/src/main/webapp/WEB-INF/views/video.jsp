<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta charset="UTF-8">
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>You Can Be A Teacher</title>
    
	<!-- 비디오 -->
	<link href="http://vjs.zencdn.net/4.12/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/4.12/video.js"></script>


    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 로그인창 -->
	<link href="resources/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  	<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <script src="resources/js/main/bootstrap.js"></script>
     <script src="resources/js/main/login-register.js" type="text/javascript"></script>
     

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<script src="https://kendo.cdn.telerik.com/2018.2.620/js/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/mypage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

   <style type="text/css">
   
   #notClick {
	background-color: rgba(1, 1, 1, 0.7);
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
}

#loader {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 1;
	width: 150px;
	height: 150px;
	margin: -75px 0 0 -75px;
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid #3498db;
	width: 120px;
	height: 120px;
	top: 500px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}
   
  a:link {
  text-decoration: none; 
  color: black;
  }

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
   body{
   font-family: 'Nanum Gothic', serif;
   }
  
</style> 
  
	
  </head>

  <body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">You Can Be A Teacher</a>
        <form>
  <div class="input-group" id ="searchBar" style="width: 77%">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" id="btnSearchBar" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
	</form>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        
        </div>
      </div>
    </nav>
    <br/>
	<div style="margin-left:240px ">
	<div style="display: inline-block;">
	<video width="854" height="480" controls>
 	<source src="/project/resources/video/tmpFiles/rlaghals999@naver.com123.mp4" type='video/mp4'>
 	<source src="movie.ogg" type="video/ogg">
	</video>
	</div>
	<%int a= 1; %>
	<div style="display: inline-block;width: 400px;bottom: 380px; margin-bottom: 10px; bottom: 0px;position: relative;">
	<div style="background-color: #424242; font-weight: bold; color: white; font-size: 135%; padding: 22px; position: relative;">${lecName }</div>
	<div style="width:400px; height:410px;overflow:scroll;">
	<c:if test="${not empty GroupbnoList }">
	<c:forEach var="group" items="${GroupbnoList }">
	<c:if test="${group.title != bnoList.title }">
	<a href="videoview?groupBno=${groupBno}&bno=${group.bno}&lecName=${lecName}" style="color: black">
	<div class="item" style="padding: 10px; background-color: lightgrey">
	<%=a %>      <img src="/project/resources/image/tmpFiles/${group.imagePath }" width="90px" height="50px">
	<div style="display: inline-block; margin-bottom: 10px">${group.title }</div>
	</div>
	</a>		
	</c:if>
	<c:if test="${group.title == bnoList.title }">	
	<div  style="padding: 10px; background-color: #E6E6E6">
	<img src="/project/resources/img/this.png" width="" height="">      <img src="/project/resources/image/tmpFiles/${group.imagePath }" width="90px" height="50px">
	<div style="display: inline-block; margin-bottom: 10px; font-weight: bold;">${group.title }</div>
	</div>
	</c:if>
	<%a++; %>
	</c:forEach>
	</c:if>
	</div>
	</div>
	</div>
	
	<div style="margin-left: 240px; width: 1260px; height: 130px; border-bottom: 1px solid lightgrey">
	<div style="display: inline-block; margin-left: 10px">
	<h4 style="color:#04B486;display: inline-block;">${bnoList.lecCategory }.</h4>
	<div style="color: #424242; font-size: 130%;">${lecName }     </div> 
	<img style="display: inline-block;"><div style="display: inline-block; margin-left: 30px; font-size: 140%;margin-top: 10px; font-weight: bold;">${bnoList.title }</div>
	</div>
	<div style="display: inline-block; position: relative; margin-left: 1130px; bottom: 50px">
	<div id="like" style="border: 1px solid white; background-color: #04B486; border-radius: 4px; width: 120px; color: white;font-weight: bolder;text-align: center; height: 40px; background-image: url('/project/resources/img/like.png'); background-size: cover;"></div>

	<div style="color: grey;width: 300px; margin-top: 5px">게시일 : <fmt:formatDate value="${bnoList.regDate}" pattern="yyyy.MM.dd" /></div>
	</div>
	</div>
	
	<div style="margin-left: 240px; width: 1260px; height: 130px; border-bottom: 1px solid lightgrey">
	<div style="font-size: 130%;padding-top: 40px">
	${bnoList.content }
	</div>
	<div style="margin-left: 240px; width: 1260px; height: 230px; border-bottom: 1px solid lightgrey">
	 <div id="clickLike" style="background: url(resources/img/test1.png) center center no-repeat;border-radius: 50%; width: 60px; height: 60px; position: relative; right: 240px;top: 80px; display: inline-block;"></div>
	 <div style="position: relative; top: 30px; right: 165px">
	 <div style="font-weight: bold; font-size: 120%">${userName }</div>
	 <div style="color: grey; font-size: 90%">${bnoList.userId }</div>
	 </div>
	</div>
	</div>
	
	<div id="loader" style="display: none; z-index: 4;"></div>
	<div id="notClick" style="display: none; z-index: 3;"></div>	
	
	<script>
	$(()=>{
		$("#like").click(()=>{
			$("#loader").css('display','block');
			$("#notClick").css('display','block');
			var userId = '${userId}';
			var groupBno = '${groupBno}';
			var bno = '${bno}';
			$.ajax({
				type: 'post', 
				url: '/project/like', 
				headers: {'Content-Type' : 'application/json; charset=UTF-8', 
							'X-HTTP-Method-Override' : 'post'
							}, 
				data: JSON.stringify({
					'groupBno' : groupBno,
					'userId' : userId,
					'bno' : bno
					
				}),
				success: function(result){
					$("#loader").css('display','none');
					$("#notClick").css('display','none');
						if(result === 'ok'){
							alert('구독 완료');
						}else{
							alert('이미 구독 중입니다');
						}
						
				}
				}); // end ajacx
			
		});
		
		$('.item').hover(function(){
			$(this).css('background-color','#6E6E6E');
		}, function(){
			$(this).css('background-color','lightgrey');
		});
		
	});
	
	</script>
	
	
    
    
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Plugin JavaScript -->
    
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
	
  </body>

</html>
