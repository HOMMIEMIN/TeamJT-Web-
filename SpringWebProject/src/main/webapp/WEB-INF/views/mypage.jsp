<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Team Job</title>
    
	
    <!-- Bootstrap core CSS -->
    
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

    
   

	
  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Team Job생각</a>
        <form>
  <div class="input-group" id ="searchBar">
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
	
	
	
    <div class="frame" id="profile"></div>
    <div id="name">이름</div>
    
    <hr id="profileHr"/>
    
    <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">나는 학생</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">나는 선생</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">칠판</button>
  <button id="createFolder" onclick="document.getElementById('id01').style.display='block'" style="display: none;">생성</button>
  <button type="button" id= "btnUpload">Upload</button>
</div>

<div id="London" class="tabcontent" style="border:none;">
  <h3>나는 학생</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent" style="border:none;">
 
  <div id="onLec"></div>
  <script>
			$(document).ready(function(){
			$('#createFolder').css('display','block');
   			 $("#onLec").load("/project/upload/folder");

			});
			</script>
</div>

<div id="Tokyo" class="tabcontent" style="border:none;">
  <h3>칠판</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
    if(cityName === 'Paris'){
    	$(document).ready(function(){
			$('#createFolder').css('display','block');
   			 $("#onLec").load("/project/upload/folder");

			});
    }
}
</script>
    
    
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Plugin JavaScript -->
    
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
	
	
	
  </body>

</html>
