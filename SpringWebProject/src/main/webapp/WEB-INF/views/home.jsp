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

    <title>Team Job</title>
    
	
    <!-- Bootstrap core CSS -->
    
    <!-- 로그인창 -->
	<link href="resources/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  	<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/js/main/bootstrap.js"></script>
     <script src="resources/js/main/login-register.js" type="text/javascript"></script>
     
	
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
    width: 70px;
    height: 70px;
    left:108%;
    
}
    </style>
	
  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Team Job생각</a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        <c:if test="${not empty userId }">      
             <div class="frame1" id="profile"></div>       
        </c:if>
        <c:if test="${empty userId }">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">로그인</a>
            </li>
          </ul>
        </c:if>          
        </div>
      </div>
    </nav>

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

    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">미정</h2>
           
            <hr class="light my-4">
            <p class="text-faded mb-4">하고싶은말...</p>
          </div>
        </div>
      </div>
    </section>

   

    <section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/1.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/1.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    운동
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/2.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/2.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    요리
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/3.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/3.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    생활
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/4.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/4.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    미정
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/5.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/5.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    미정
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="resources/img/portfolio/fullsize/6.jpg">
              <img class="img-fluid" src="resources/img/portfolio/thumbnails/6.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    미정
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
            <h2 class="section-heading">하고싶은말....</h2>
            <hr class="my-4">
            <p class="mb-5">하고싶은말 쓰세요!!!!</p>
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
	
	<!--  로그인 창-->
	<div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
    		         <h4 class="modal-title"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                <div class="social">
                                    <a class="circle github" href="/auth/github">
                                        <i class="fa fa-github fa-fw"></i>
                                    </a>
                                    <a id="google_login" class="circle google" href="/auth/google_oauth2">
                                        <i class="fa fa-google-plus fa-fw"></i>
                                    </a>
                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
                                        <i class="fa fa-facebook fa-fw"></i>
                                    </a>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>or</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" action="/login">
                                    <input id="userId" class="form-control" type="text" placeholder="Email" name="userId">
                                    <input id="password" class="form-control" type="password" placeholder="Password" name="password">
                                    <input id="btnLogin" class="btn btn-default btn-login" type="submit" value="로그인">
                                    </form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                             <div class="form">
                                <form id="register" method="post" action="register"  method="post">
                                <input id="email1" class="form-control" type="text" placeholder="Email" name="userId" require>
                                <div id="checkSuccess" style="display: none; color: green;">사용 가능한 아이디 입니다!</div>
                                <div id="checkfail" style="display: none;color: red;">아이디가 존재 합니다!</div>
                                <input id="password1" class="form-control" type="password" placeholder="비밀번호" name="password" require>
                                <input id="password_confirmation" class="form-control" type="password" placeholder="비밀번호 확인" name="password_confirmation" require>
                                <div id="checkPwdfail" style="display: none; color: red;">비밀번호를 확인해주세요!</div>
                                <div id="checkPwdSuccess" style="display: none;color: green;">비밀번호가 동일합니다!</div>
                                <input id="userName" class="form-control" type="text" placeholder="닉네임" name="userName" require>
                                <div id="checkNamefail" style="display: none; color: red;">닉네임이 존재합니다!</div>
                                <div id="checkNameSuccess" style="display: none;color: green;">사용 가능한 닉네임 입니다!</div>
                                 <input id="phone" class="form-control" type="text" placeholder="휴대폰번호" name="phone" require>                            
                                <input id="createUser" class="btn btn-default btn-register" type="submit" value="회원가입" name="commit">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>아이디가 없으신가요?
                                 <a href="javascript: showRegisterForm();">여기를 눌러주세요</a>
                            </span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>아이디가 있으신가요?</span>
                             <a href="javascript: showLoginForm();">여기를 눌러주세요</a>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
	
    <!-- Bootstrap core JavaScript 
    <script src="vendor/jquery/jquery.min.js"></script>
    
    -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
	
	
	<script>
	$(()=>{
		
		var register = '${registerResult}';
		console.log(register);
		if(register != null && register == 'OK'){
			alert('회원가입 성공!');
		}else if(register != null && register == 'fail'){
			alert('회원가입 실패');
		}
		
		$('#password1').change(()=>{
		
			var pwd1 = $('#password1').val();
			var pwd2 = $('#password_confirmation').val();
			console.log(pwd1);
			console.log(pwd2);
			if(pwd1 === pwd2){
				$('#checkPwdfail').css('display','none');
				$('#checkPwdSuccess').css('display','block');
				
			}else{
	
				$('#checkPwdfail').css('display','block');
				$('#checkPwdSuccess').css('display','none');
			}
			
		});
		$('#password_confirmation').change(()=>{

			var pwd1 = $('#password1').val();
			var pwd2 = $('#password_confirmation').val();
			console.log(pwd1);
			console.log(pwd2);
			if(pwd1 === pwd2){
				$('#checkPwdfail').css('display','none');
				$('#checkPwdSuccess').css('display','block');
				
			}else{
				checkPwdfail
				$('#checkPwdfail').css('display','block');
				$('#checkPwdSuccess').css('display','none');
			}
			
		});
		
		$('#createUser').click(()=>{
			event.preventDefault();
			var pwd1 = $('#password1').val();
			var pwd2 = $('#password_confirmation').val();
			var checkId = $('#checkPwdSuccess').css('display');
			var checkName = $('#checkNameSuccess').css('display')
			if(pwd1 === pwd2 && checkId === 'block' && checkName === 'block'){
				
				$('#register').submit();
			}else{
				alert('아이디와 비밀번호를 확인해 주세요!');
			}
			
		
		});
		
		$('#email1').change(()=>{
			var id = $('#email1').val();
			$.ajax({
				type:'post',
				url:'/project/checkid',
				headers:{
					'Content-Type' : 'application/json; charset=UTF-8',
					'X-HTTP-Method-Override' : 'post'
				},
				data: JSON.stringify({
					'userId' : id
				}),
				success:(result)=>{
					if(result == 'ok'){
						$('#checkfail').css('display','block');
						$('#checkSuccess').css('display','none');
					}else{
						$('#checkfail').css('display','none');
						$('#checkSuccess').css('display','block');
					}
				}
				
			});
		});
		
		$('#userName').change(()=>{
			var name = $('#userName').val();
			$.ajax({
				type:'post',
				url:'/project/check',
				headers:{
					'Content-Type' : 'application/json; charset=UTF-8',
					'X-HTTP-Method-Override' : 'post'
				},
				data: JSON.stringify({
					'userName' : name
				}),
				success:(result)=>{
					if(result == 'ok'){
						$('#checkNamefail').css('display','block');
						$('#checkNameSuccess').css('display','none');
					}else{
						$('#checkNamefail').css('display','none');
						$('#checkNameSuccess').css('display','block');
					}
				}
				
			});
		});
		
		$('#btnLogin').click(()=>{
			event.preventDefault();
			var id = $('#userId').val();
			var pwd = $('#password').val();
			console.log(id);
			console.log(pwd);
			$.ajax({
				type: 'post', 
				url: '/project/login', 
				headers: {'Content-Type' : 'application/json; charset=UTF-8', 
							'X-HTTP-Method-Override' : 'post'
							}, 
				data: JSON.stringify({
					'userId' : id,
					'password' : pwd
					
				}),
				success: function(result){
						if(result==='ok'){
							console.log(result);
							location = '/project';
						}else{
							alert('아이디와 비밀번호를 확인해주세요!');
							$('#password').val('');
						}	
				}
				});
		});
		
	});
	
	</script>
	
	
  </body>

</html>
