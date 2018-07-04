<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>You Can Be A Teacher</title>


<!-- Bootstrap core CSS -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/main/bootstrap.js"></script>



<!-- Custom fonts for this template -->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- Plugin CSS -->
<link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="resources/css/folder2.css" rel="stylesheet" />




<Style>

 a:link {
  text-decoration: none; 
  color: black;
  }

.category{
padding-left: 25px;
margin-bottom: 15px;
color:black;
}

.categoryType{
padding-left: 25px;
margin-bottom: 15px;
color:black;
}

.categoryMenu{
font-size: 180%;
color: grey;
margin-bottom: 15px;
}

.cate{
font-size:150%;
}
.cateType{
font-size:150%;
}

img{
height: 68%;
}



div .col-md-3.resent-grid.recommended-grid.movie-video-grid{
width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
padding: 0px;
margin-right: 60px;
margin-bottom: 20px;

}


.overlay {
  position: absolute; 
  bottom: 0; 
  margin:0px;
  background: none;
  border : 1px solid grey;
  color: #f1f1f1; 
  transition: .5s ease;
  opacity:0;
  width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
  color: white;
  font-size: 20px;
  padding: 90px;
  text-align: center;
}


div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info{
padding-top:15px;
padding-right:10px;
max-height: 86.5px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay {
  opacity: 1;
}

#addLec:hover #add{
  opacity: 0.8;
}

.author{
position:relative;
bottom: 8px;
}

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

</Style>

</head>

<body>

<!-- Navigation 
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/project">You Can Be A Teacher</a>
			<form>
				<div class="input-group" id="searchBar">
					<input type="text" id="searchText" class="form-control" placeholder="Search" style="width: 800px">
					<div class="input-group-btn">
						<button class="btn btn-default" id="btnSearchBar" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<div class="collapse navbar-collapse" id="navbarResponsive"></div>
		</div>
	</nav>
-->

<jsp:include page="header.jsp"></jsp:include>



<div style="width: 2000px; height: auto;">
<div id="filter" style="display: inline-block; margin: 40px;  width: 400px; height: 600px;">
<div style="margin-bottom: 30px; font-weight: bold; font-size: 190%; ">Search Filter</div>

<div class="categoryMenu">Category</div>
<div class="category"><a id="AllCategory" class ="cate" href="" style="color: black">All Category</a></div>
<div class="category"><a id="IT" class ="cate" href="" style="color: black">IT</a></div>
<div class="category"><a id="Language"  class ="cate" href="" style="color: black">Language</a></div>
<div class="category"><a id="Food" class ="cate" href="" style="color: black">Food</a></div>
<div class="category"><a id="Health" class ="cate" href="" style="color: black">Health</a></div>
<div class="category"><a id="Life" class ="cate" href="" style="color: black">Life</a></div>
<div class="category"><a id="Etc" class ="cate" href="" style="color: black">Etc.</a></div>
<br/>
<br/>

<div class="categoryMenu">Lecture Type</div>
<div class="categoryType"><a id="online" class="cateType" href="" style="color: black">Online</a></div>
<div class="categoryType"><a id="offline" class="cateType" href="" style="color: black">Offline</a></div>
</div>

<div style="display: inline-block;width: 1200px; height: auto;position: relative;bottom:450px;">
<div style="margin-bottom: 30px; font-size: 150%; color: grey">${category }   >   ${lecType }  </div>



<div id="" style="">


<c:forEach var="group" items="${list }">

<div class="col-md-3 resent-grid recommended-grid movie-video-grid">
<div class="resent-grid-img recommended-grid-img">
<a href="Video/videoview?videopath=${group.videoPath }&userId=${userId}&groupBno=${group.groupBno}&lecCategory=${group.lecCategory}&title=${group.title}&content=${group.content}&regDate=${group.regDate}" class="detail">
<c:if test="${not empty group.imagePath }">
<img alt="" src="${pageContext.request.contextPath}/resources/image/tmpFiles/${group.imagePath}">
</c:if>
</a>
<div class="time small-time show-time movie-time">
</div>
<div class="clck movie-clock">
</div>
</div>
<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info" style="padding: 5px">
<h6 style="color: #04B486; font-size: 70%;font-weight: bold;">${group.lecCategory }.</h6>
<h5 style="font-size: 60%"><a href="single.html" class="title">${group.title }</a></h5>
<ul>
<li><p class="author author-info"><a href="#" class="author">${group.userName }</a></p></li>
<li class="right-list"><p class="views views-info"></p></li>
</ul>
</div>
<a class="detail" href="videoview?groupBno=${group.groupBno}&bno=${group.bno}&lecName=${lecName}">
<div class="overlay"></div>
<div></div>
</a>
</div>

</c:forEach>

</div>
</div>

</div>

<div id="loader" style="display: none; z-index: 4;"></div>
<div id="notClick" style="display: none; z-index: 3;"></div>	
<script>
$(()=>{
	typeColor();
	menuColor();
	if('${category}' === "All Category"){
		$('#AllCategory').css('color','#00ffbb');
	}
	var category = '#'+'${category}';
	var type = '#'+'${lecType}'
	console.log(category);
	var clickCategory = '${category}';
	var clickType = 'online';
	
	console.log(category);
	$(category).css('color','#00ffbb');
	$(type).css('color','#00ffbb');
	$('.cate').click(function(){
		event.preventDefault();
		menuColor();
		$(this).css('color','#00ffbb');
		var a = $(this).css('color');
		clickCategory = $(this).text();
		console.log(clickCategory);
		if(clickCategory === 'Etc.'){
			clickCategory = 'Etc';
		}
		location = 'searchClick?category='+clickCategory +'&lecType=' + clickType;
		$("#loader").css('display','block');
		$("#notClick").css('display','block');
	});

	$('.cateType').click(function(){
		event.preventDefault();
		typeColor();
		clickType = $(this).text();
		console.log(clickType);
		$(this).css('color','#00ffbb');
	
	});

	function typeColor(){
		$('.cateType').css('color','black');
	}

	function menuColor(){
		$('.cate').css('color','black');
	}
	
	var search = '${searchText}';
	if(search != null){
		$('#searchText').val(search);
	}
});


</script>


	


</body>

</html>
