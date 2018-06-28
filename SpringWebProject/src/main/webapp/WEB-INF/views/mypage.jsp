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

    
   <style>
   #createFolder1{
   position: relative;
   left: 850px;
   background-image:url("resources/img/button.png");
   margin-top:10px;
   background-size: cover;

   }
   
 #notClick {
    background-color: rgba(1, 1, 1, 0.7);
    bottom: 0;
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
}  

#profile {
    position: relative;
    display: inline-block;
    background: url(resources/img/test.png) center center no-repeat;
    border-radius: 50%;
    width: 120px;
    height: 120px;  
    top: 160px;
    left: 230px;
  
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
top:500px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

.tab{
position:relative;
bottom:800px;
top:0px;
background-color: white;
border: 1px solid white;
font-size: 80%;
}

.name{
position: relative;
top:70px;
left:360px;	
font-size: 80%;

}

.tablinks{
position:relative;
left: 400px;
background-color: white;
font-size: 80%;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
h4{
font-family: hanna;
}
}
   </style>

	
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
	
	
	<div style="background-color: dcdcdc; height: 250px; max-height: 250px;">
    <div class="frame" id="profile"></div>
    <div class="name" style="font-weight: bold; font-size: 130%">${userName }</div>
    <div class="name" style="color: grey">${userId }</div>
    </div>

    
   <div class="tab">
  <button class="tablinks" id="London" onclick="openCity(event, 'London')">나는 학생</button>
  <button class="tablinks" id="Paris" onclick="openCity(event, 'Paris')">나는 선생님</button>
  <button class="tablinks" id="Tokyo" onclick="openCity(event, 'Tokyo')">칠판</button>
  <button id="createFolder1" onclick="document.getElementById('id01').style.display='block'" style="display: none"></button>

</div>

<div id="London" class="tabcontent" style="border:none;">
  <h3>나는 학생</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent" style="border:none;">

</div>

<div id="Tokyo" class="tabcontent" style="border:none;">
  <h3>칠판</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

 <div>

  <div id="onLec" style="display: inline-block; margin-left: 200px">

  </div>
  </div>

<div id="loader" style="display: none;">

</div>
<div id ="notClick" style="display: none"></div>
<div></div>
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
    console.log(cityName)
   
    if(cityName === 'Paris'){
    	console.log('들어옴');
    
    		myFunction();
    		$('#onLec').animate({opacity: 0},1000);
			$('#onLec').load("/project/upload/folder");
			$('#onLec').animate({opacity: 1},1000);
    		$('#Paris').css('border-bottom','5px solid black');
    		$('#Tokyo').css('border-bottom','none');
    		$('#London').css('border-bottom','none'); 		
   			$('#createFolder1').css('display','block');	

    				
    }else if(cityName === 'London'){  	
    	$('#London').css('border-bottom','5px solid black');
    	$('#Paris').css('border-bottom','none');
		$('#Tokyo').css('border-bottom','none');
    }else if(cityName === 'Tokyo'){  	
    	$('#Tokyo').css('border-bottom','5px solid black');
    	$('#Paris').css('border-bottom','none');
		$('#London').css('border-bottom','none');
    }else{
    	$('#createFolder1').css('display','none');
    }
}

function myFunction() {
	console.log('들어옴')
	$('#loader').css('display','block');
	$('#notClick').css('display','block');
    var a = setTimeout(showPage, 1000);
}

function showPage() {
	$('#notClick').css('display','none');
  $('#loader').css('display','none');
}
</script>
    
    
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Plugin JavaScript -->
    
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
	
	<script src="https://kendo.cdn.telerik.com/2018.2.620/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2018.2.620/js/kendo.all.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.mobile.min.css" />
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
  </body>

</html>
