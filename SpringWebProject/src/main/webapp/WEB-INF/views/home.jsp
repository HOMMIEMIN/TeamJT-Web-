<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Team Job</title>
   
    <!-- 웹소켓 -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <!-- 로그인창 -->
   <link href="resources/css/login-register.css" rel="stylesheet" />
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
     <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/js/main/bootstrap.js"></script>
     <script src="resources/js/main/login-register.js" type="text/javascript"></script>
     
    <!-- 쪽지함 모달 -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
   
    <!-- Custom fonts for this template -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
   
    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/creative.min.css" rel="stylesheet">
    
    <style>
    .frame1 {
    position: relative;
    display: inline-block;
    background: url(resources/img/test.png) center center no-repeat;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    left:108%;
   }
   
   .dropdown-content { 
   bottom: -270%; 
   left: -100%;
   display: none;
   position: absolute;
   background-color: #f9f9f9;
   min-width: 90px;
   box-shadow: 0px 7px 16px 10px rgba(0,0,0,0.2);
   }
   
   .dropdown-content a {
   padding-top: 5px;
   padding-bottom: 5px;
    color: black;
    text-decoration: none;
    display: block;
   }
   
   .dropdown-content a:hover {background-color: lightgrey;}
   
   .frame1:hover .dropdown-content {
    display: block;
   }
   

   .city {display:none}
   
   tr{
      border-bottom: 2px solid lightpink;
      
   }
   
   th, td {
      border-right: 2px solid lightpink;
   }
   
   tr:hover {
    background-color: lavender;
}



    </style>
   
  </head>

  <body id="page-top">

    <jsp:include page="header.jsp"></jsp:include>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>You Can Be a Teacher</strong>
              
            </h1>
             
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5">여러분의 재능을 기부하고, 다른 사람의 재능을 찾아서 배워보세요!!</p>
            <br/><br/><br/><br/><br/><br/>
            <div id = "serchBar">
           <!-- 검색창 -->
         <script>
         $(document).ready(function(){

             $("#serchBar").load("resources/main/searchBar.html");

         });
         </script>
         

            </div>
          </div>
        </div>
      </div>
    </header>


   

    <section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=IT&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/1.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                     IT
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=Language&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/2.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Language
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=Food&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/3.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Food
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=Health&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/4.png" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Health
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=Life&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/5.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Life
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="searchClick?category=Etc&lecType=Online">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/6.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Etc.
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>

   

    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">Team Job</h2>
            <hr class="my-4">
            <p class="mb-5"></p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
            <p>123-456-6789</p>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">TeamJob@itwill.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>
   
  
   
    <!-- Bootstrap core JavaScript <script src="vendor/jquery/jquery.min.js"> </script>  -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    
   
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
   
   
   <script>
   
   $(document).ready(function(){
	   $('.navigation').css('background-color', 'rgba( 255, 255, 255, 0 )');
   	   $('.navcenter').css('display', 'none');
	   $(window).scroll(function() {
		   var aa = $(this).scrollTop();
		   console.log('스크롤 : ' + aa);
			  if($(this).scrollTop() <= 400) {
				  $('.navigation').css('background-color', 'rgba( 255, 255, 255, 0 )');
				  $('.navcenter').css('display', 'none');
			  }
			  else if($(this).scrollTop() >= 400) {
				  $('.navigation').css('background-color', '#404040');
				  $('.navcenter').css('display', 'block');
				  
			  }
			});
	   
   });
        
         
   </script>
   
   
  </body>

</html>