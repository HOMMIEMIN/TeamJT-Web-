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
    
	
    <!-- Bootstrap core CSS -->
    
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

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
       <div class="collapse navbar-collapse" id="navbarResponsive">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Team Job생각</a>
        	<c:if test="${not empty userId }">      
             	<div class="frame1" id="profile">
             		<div class="dropdown-content">
<<<<<<< HEAD
   						<a href="/project/mypage" style="border-bottom: 1px solid lightgrey;">나는 학생</a>
    					<a href="/project/mypage" style="border-bottom: 1px solid lightgrey;">나는 선생님</a>
    					<a href="/project/mypage" style="border-bottom: 1px solid lightgrey;">칠판</a>
=======
   						<a href="mypage" style="border-bottom: 1px solid lightgrey;">나는 학생</a>
    					<a href="mypage" style="border-bottom: 1px solid lightgrey;">나는 선생님</a>
    					<a href="mypage" style="border-bottom: 1px solid lightgrey;">칠판</a>
>>>>>>> branch 'master' of https://github.com/HOMMIEMIN/TeamJT-Web-.git
    					<a href="" id="btnlogout">하교</a>
  					</div>
            	 </div>
            	 <input type="text" id="messageUserId" value="${userId}" style="display: none;"   />
            	
            	
 <!-- 로그인시 쪽지함 모달!! -->
	<div class="w3-container">

			<button id="btnmessege" onclick="document.getElementById('id01').style.display='block'" 
					class="w3-button w3-black" style="position: relative; right:-100vh" >쪽지함.</button>
					
		<div id="id01" class="w3-modal">
			<div id="id02" class="w3-modal-content w3-card-4 w3-animate-zoom">
				  			<header class="w3-container w3-blue"> 
							   <span onclick="document.getElementById('id01').style.display='none'" 
							   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
							   <h2>${userName }님의 쪽지함</h2>
							</header>

				  	<div id="message" class="w3-bar w3-border-bottom">
				   		<button id="resetMget" class="tablink w3-bar-item w3-button" 
				   		onclick="messageBtn(event, 'mGet')">받은 쪽지</button>
				   		<button id="resetMsend" class="tablink w3-bar-item w3-button" 
				   		onclick="messageBtn(event, 'mSend')">보낸 쪽지</button>
				   		<button id="resetMwrite" class="tablink w3-bar-item w3-button" 
				   		onclick="messageBtn(event, 'mWrite')">쪽지 작성</button>
				  	</div>
				
				  	<div id="mGet" class="w3-container city">
				  		받은 쪽지함 0/7 <button style="left: -50%;" id="resetbtn1">새로고침</button>
				  		<table id="messageGetList">
						</table>
				  	</div>
				  	
				
				  	<div id="mSend" class="w3-container city">
				  		보낸 쪽지함 0/7 <button style="left: -50%;" id="resetbtn2">새로고침</button>
				  		<table id="messageSendList">
						</table>
				  	</div>
				
				    <div id="mWrite" class="w3-container city">
					   <h5>쪽지 작성</h5>
					   <label>받는 사람</label>
					   
					   <div id="resetwriteMessage">
						   <input id="toId" class="w3-input w3-border w3-margin-bottom" type="text" 
						   		  placeholder="ex) 아무게@itwill.com" name="yourId" required >
						   <textarea id="writeContent" style="margin-bottom: 20px;" class="w3-input w3-border w3-margin-bottom"
						   			 rows="7" cols="106" name="mcontent"placeholder="내용 작성" required></textarea>
						   <label>보내는 사람</label>
						   <input id="fromId" class="w3-input w3-border w3-margin-bottom" type="text" 
						          value="${userId}" name="userId" readonly >
						   <button id="writeSendBtn" class="w3-button w3-green w3-large" > 보내기 </button>
					   </div>
				  	</div>
				
				  	<div class="w3-container w3-light-grey w3-padding">
				   		<button class="w3-button w3-right w3-white w3-border" 
				   				onclick="document.getElementById('id01').style.display='none'">Close</button>
				  	</div>
			</div>
		</div>
				
	</div>
<!-- end 로그인시 쪽지함 모달 !-->
            	 
        	</c:if>
        	<c:if test="${empty userId }">
        		<ul class="navbar-nav ml-auto">
           			 <li class="nav-item">
              			<a class="nav-link js-scroll-trigger" data-toggle="modal" 
               				href="javascript:void(0)" onclick= openLoginModal() >로그인</a>
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
                                <!-- 로그인 모달 -->
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" action="/login">
                                    <input id="userId" class="form-control" type="text" placeholder="Email" name="userId" required />
                                    <input id="password" class="form-control" type="password" placeholder="Password" name="password" required />
                                    <input id="btnLogin" class="btn btn-default btn-login" type="submit" value="로그인">
                                    </form>
                                </div>
                             </div>
                        </div>
                        
                        <!-- 회원가입 모달 -->
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
	
    <!-- Bootstrap core JavaScript <script src="vendor/jquery/jquery.min.js"> </script>  -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="resources/js/main/creative.js"></script>
	
	
	<script>
	$(()=>{
		
		$('#getM').click(()=>{
			
			console.log('aaa');
		
			
			});
		
		var register = '${registerResult}';
		console.log(register);
		if(register != null && register == 'OK'){
			alert('회원가입 성공!');
			openLoginModal();
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
		
		$('#createUser').click((event)=>{
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
		
		$('#btnLogin').click((event)=>{
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
							//location = document.location;
							location.reload();
							
							var target = document.location;
				
							if(target === 'http://localhost:8181/project/'){
								location = '/project/#portfolio';								
							} else {
								location = target;
							}

						}else{
							alert('아이디와 비밀번호를 확인해주세요!');
							$('#password').val('');
						}	
				}
				}); // end ajacx
				
		}); //end btnLogin.click()
		
	
		// 로그아웃버튼 클릭시
		$('#btnlogout').click(function(event){
			event.preventDefault();
			location = '/project/logout'; //<<--controller로 간다 .
		}); //end #btnlogout()

		
		
		var userId = $('#messageUserId').val();
		console.log('messageUserId = ' + userId);
		
		
		//모달에서 받은쪽지함
		$('#getM').click(function(){
			console.log('getM클릭 메소드 실행전 '+userId);
			getAllMessege();
			console.log('getM클릭 메소드 실행후후'+userId);
			
		}); // end getM
		
		//모달에서 보낸쪽지함
		$('#sendM').click(function(){
			sendAllMessege();
		}); // end sendM

	
		 
		
		//쪽지함 모달에서 받은쪽지 새로고침버튼 
		$('#resetbtn1').click(function(){
			console.log("resetbtn111111111");
			getAllMessege();
		}); // end resetbtn
		
		//쪽지함 모달에서 보낸쪽지 새로고침버튼 
		$('#resetbtn2').click(function(){
			console.log("resetbtn22222222222");
			sendAllMessege();
		}); // end resetbtn
		
		
		// 메인화면에서 쪽지함 클릭시
		$('#btnmessege').click(function(){
			getAllMessege();
			sendAllMessege();
		}); // end btnmessege
		
		
		// 쪽지함 모달에서 쪽지 작성중 (보내기)버튼 
		$('#writeSendBtn').click(function(event){
			event.preventDefault();
			console.log("들어옴");
			var myid = $('#fromId').val();
			var youid = $('#toId').val();
			myid = encodeURI(myid);
			youid = encodeURI(youid);
			var writeContent = $('#writeContent').val();
			console.log(myid);
			console.log(youid);
			console.log(writeContent);

			$.ajax({
				type: 'post',
				url: 'message/sendMassage',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'post'
				},
				data: JSON.stringify({
					'userId': myid,
					'yourId': youid,
					'mcontent': writeContent
				}),
				success: function (result) { 
					if(result ===1){
						resetWriteMessage();
						console.log("1111111111");
						alert('성공적으로 보냈습니다.');
						console.log("22222222222");
						sendAllMessege();
						console.log("33333333333");
						setTimeout(function() {
						console.log("4444444444");
						messageBtn(event, 'mSend');
						getAllMessege();
						console.log("5555555555");
						}, 1000);
											
						
					} 
				}
			}); // end ajax()
		});// end #writeSendBtn()
		   
		
	 	// 받은쪽지함에서 리스트로 보이게 하기 위한 코드
 		function getAllMessege() {
			console.log('===== userId: ' + userId);
			$.ajax({
				type: 'get',
				url: 'message/all',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'get'
				},
				data: encodeURI('userId='+userId),
				success: function(result) {
					var list1 = '';
					var list2 = '';
					list1 +='<tr>'
						+'<th>쪽지번호</th>'
						+'<th>보낸 사람</th>'
						+'<th>내용</th>'
						+'<th>보낸 시간</th>'
						+'</tr>';
					$(result).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
						console.log(this)
						var date = new Date(this.regdate);
						var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
						list2 += '<tr>'
						+ '<td>'
						+ this.mno
						+ '</td>'
						+ '<td>'
						+ this.yourId
						+ '</td>'
						+ '<td>'
						+ this.mcontent
						+ '</td>'
						+ '<td>'
						+ dateString
						+ '</td>'
						+ '</tr>';
					}); // end each()
					$('#messageGetList').html(list1+list2);
					//$('#messageList').html(list2);	
				}
			});		
		}// end getAllMessege()
		
		// 보낸쪽지함에서 보낸쪽지를 리스트로 보이게 하기 위한 코드
		function sendAllMessege() {
			console.log('===== userId: ' + userId);
			$.ajax({
				type: 'get',
				url: 'message/sendmessage',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'get'
				}, 
				data: encodeURI('userId='+userId),
				success: function(result) {
					var list1 = '';
					var list2 = '';
					list1 +='<tr>'
						+'<th>쪽지번호</th>'
						+'<th>받은 사람</th>'
						+'<th>내용</th>'
						+'<th>보낸 시간</th>'
						+'</tr>';
					$(result).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
						console.log(this)
						var date = new Date(this.regdate);
						var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
						list2 += '<tr>'
						+ '<td>'
						+ this.mno
						+ '</td>'
						+ '<td>'
						+ this.yourId
						+ '</td>'
						+ '<td>'
						+ this.mcontent
						+ '</td>'
						+ '<td>'
						+ dateString
						+ '</td>'
						+ '</tr>';
					}); // end each()
					$('#messageSendList').html(list1+list2);
					//$('#messageList').html(list2);	
				}
			});
		}// end sendAllMessege()
		
		

});// end document.reay()	

	//쪽지작성 후 보내기 하면 그칸이 다시 리셋되게 하기 위한 함수
	function resetWriteMessage(){
		$('#toId').val('');
		$('#writeContent').val('');
	}// end resetWriteMessage()
	

//쪽지함 모달에서 클릭되있는 버튼만 보이게 하는 코드
		document.getElementsByClassName("tablink")[0].click();
		function messageBtn(event, btnName) {
			  var i, x, tablinks;
			  x = document.getElementsByClassName("city");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablink");
			  for (i = 0; i < x.length; i++) {
			    tablinks[i].classList.remove("w3-light-grey");
			  }
			  document.getElementById(btnName).style.display = "block";
			  event.currentTarget.classList.add("w3-light-grey");
			}// end messageBtn()  
			
			
	</script>
	
	
  </body>

</html>
