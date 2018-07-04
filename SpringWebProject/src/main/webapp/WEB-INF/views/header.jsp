<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 로그인에 필요 -->
<link href="resources/css/login-register.css" rel="stylesheet" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<script src="resources/js/main/login-register.js" type="text/javascript"></script>

<!-- Plugin CSS -->
<link href="resources/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/creative.min.css" rel="stylesheet">

<style type="text/css">
.navigation {
	height: 60px;
	background-color: #404040;
}

.container {
	display: flex;
	justify-content: space-between;
	max-width: 1200px;
	min-width: 670px;
	margin: auto;
	height: 60px;
}

.navleft {
	display: flex;
	justify-content: flex-start;
	width: 300px;
	height: 60px;
	margin-top: 15px;
}

.navright {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 300px;
	height: 60px;
}

.navcenter {
	display: inline-block;
	width: 300px;
	height: 60px;
}

.navcenter img {
	position: absolute;
	margin-top: 10px;
}

.navcenter .inputsearch {
	position: absolute;
	margin-top: 16px;
	margin-left: 5px;
	background-color: #404040;
	outline: none;
	height: 24px;
	width: 250px;
	padding-left: 8px;
	padding-right: 5px;
	text-align: left;
	border: 0px;
	color: #ffffff;
	font-size: 14pt;
	font-family: 돋움, dotum, sans-serif;
	font-weight: bold;
}

.navcenter #searchicon {
	position: absolute;
	margin-top: 18px;
	margin-left: 270px;
}

.btnlogin, 
.btnregister {
	width: 100%;
	height: 60px;
	border: none;
	background-color: #169e83;
	color: #ffffff;
	font-weight: bold;
	outline: none;
	
}

.btnlogin:focus, 
.btnregister:focus {
	outline: 0;
	
}

.btnlogin:active,
.btnregister:active {
	background-color: #44c7aa;
	
}


</style>
</head>
<body style="margin: 0px">
	<nav class="navigation">
		<div class="container">
			<!-- 로고(메인페이지 링크) -->
			<div class="navleft">
				<a href="#"><img style="height: 30px; width: 260px" src="/project/resources/img/logo_white.png" alt="YOU CAN BE A TEACHER"></a>
			</div>
			<!-- 검색창 -->
			<div class="navcenter">
				<img style="height: 38px; width: 301px" src="/project/resources/img/search_bg.png">
				<input class="inputsearch" type="text" name="search">
				<img style="height: 20px; width: 20px" id="searchicon" src="/project/resources/img/search_icon.png">
			</div>
			<div class="navright">
			<!-- 로그인 (등교하기) 버튼 -->
				<c:if test="${empty userId}">
					<a style="outline: none" class="nav-link js-scroll-trigger" data-toggle="modal"
						href="javascript:void(0)" onclick=openLoginModal()>
						<img style="height: 40px; width: 100px" src="/project/resources/img/login_bg.png" alt="로그인"></a>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- 로그인  -->
	<div class="modal fade login" id="loginModal">
		<div class="modal-dialog login animated">
			<div class="modal-content">
			
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body">
					<div class="box">
						<div class="content">
							
							<!-- 로그인 모달 -->
							<div class="error"></div>
							<div class="form loginBox">
								<input id="userId" class="form-control" type="text"
									placeholder="Email" name="userId" required /> 
								<input id="password" class="form-control" type="password"
									placeholder="Password" name="password" required />
								<!-- <button type="button" id="btnLogin"
									class="btn btn-default btn-login">로그인</button>-->
								<button type="button" id="btnLogin"
									class="btnlogin">로그인</button>
							</div>
						</div>
					</div>

					<!-- 회원가입 모달 -->
					<div class="box">
						<div class="content registerBox" style="display: none;">
							<div class="form">
								<form id="register" method="post" action="register"
									method="post">
									
									<input id="email1" class="form-control" type="text"
										placeholder="Email" name="userId" require>
									
									<div id="checkSuccess" style="display: none; color: green;">
									사용	가능한 아이디 입니다!</div>
									<div id="checkfail" style="display: none; color: red;">
									아이디가 존재 합니다!</div>
									
									<input id="password1" class="form-control" type="password"
										placeholder="비밀번호" name="password" require>
									<input id="password_confirmation" class="form-control"
										type="password" placeholder="비밀번호 확인"
										name="password_confirmation" require>
									<div id="checkPwdfail" style="display: none; color: red;">
									비밀번호를	확인해주세요!</div>
									<div id="checkPwdSuccess" style="display: none; color: green;">
									비밀번호가	동일합니다!</div>
									
									<input id="userName" class="form-control" type="text"
										placeholder="닉네임" name="userName" require>
									<div id="checkNamefail" style="display: none; color: red;">
									닉네임이 존재합니다!</div>
									<div id="checkNameSuccess" style="display: none; color: green;">
									사용 가능한 닉네임 입니다!</div>
									
									<input id="phone" class="form-control" type="text"
										placeholder="휴대폰번호" name="phone" require> 
									<input id="createUser" class="btnregister"
										type="submit" value="회원가입" name="commit">
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<div class="forgot login-footer">
						<span>아이디가 없으신가요? 
						<a style="color: #2e9982; font-weight: bold" href="javascript: showRegisterForm();">
						여기를 눌러주세요</a>
						</span>
					</div>
					
					<div class="forgot register-footer" style="display: none">
						<span>아이디가 있으신가요?</span> 
						<a style="color: #2e9982; font-weight: bold" href="javascript: showLoginForm();">
						여기를 눌러주세요</a>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- Bootstrap core JavaScript <script src="vendor/jquery/jquery.min.js"> </script>  -->
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script>
$('document').ready(function(){
	
	// 회원 가입
	var register = '${registerResult}';
	if (register != null && register == 'OK') {
		alert('회원가입 성공!');
		openLoginModal();
	} else if (register != null && register == 'fail') {
		alert('회원가입 실패');
	}
	
	// 비밀번호
	$('#password1').change(() => {
		
		var pwd1 = $('#password1').val();
		var pwd2 = $('#password_confirmation').val();
		console.log(pwd1);
		console.log(pwd2);
		if (pwd1 === pwd2) {
			$('#checkPwdfail').css('display', 'none');
			$('#checkPwdSuccess').css('display', 'block');

		} else {

			$('#checkPwdfail').css('display', 'block');
			$('#checkPwdSuccess').css('display', 'none');
		}

	});
	$('#password_confirmation').change(() => {

		var pwd1 = $('#password1').val();
		var pwd2 = $('#password_confirmation').val();
		console.log(pwd1);
		console.log(pwd2);
		if (pwd1 === pwd2) {
			$('#checkPwdfail').css('display', 'none');
			$('#checkPwdSuccess').css('display', 'block');

		} else {
			checkPwdfail
			$('#checkPwdfail').css('display', 'block');
			$('#checkPwdSuccess').css('display', 'none');
		}

	});

	// 회원가입
	$('#createUser').click((event) => {
		event.preventDefault();
		var pwd1 = $('#password1').val();
		var pwd2 = $('#password_confirmation').val();
		var checkId = $('#checkPwdSuccess').css('display');
		var checkName = $('#checkNameSuccess').css('display')
		if (pwd1 === pwd2 && checkId === 'block' && checkName === 'block') {

			$('#register').submit();
		} else {
			alert('아이디와 비밀번호를 확인해 주세요!');
		}


	});

	// 이메일
	$('#email1').change(() => {
		var id = $('#email1').val();
		$.ajax({
			type : 'post',
			url : '/project/checkid',
			headers : {
				'Content-Type' : 'application/json; charset=UTF-8',
				'X-HTTP-Method-Override' : 'post'
			},
			data : JSON.stringify({
				'userId' : id
			}),
			success : (result) => {
				if (result == 'ok') {
					$('#checkfail').css('display', 'block');
					$('#checkSuccess').css('display', 'none');
				} else {
					$('#checkfail').css('display', 'none');
					$('#checkSuccess').css('display', 'block');
				}
			}
		});
	});

	// 가입자 이름
	$('#userName').change(() => {
		var name = $('#userName').val();
		$.ajax({
			type : 'post',
			url : '/project/check',
			headers : {
				'Content-Type' : 'application/json; charset=UTF-8',
				'X-HTTP-Method-Override' : 'post'
			},
			data : JSON.stringify({
				'userName' : name
			}),
			success : (result) => {
				if (result == 'ok') {
					$('#checkNamefail').css('display', 'block');
					$('#checkNameSuccess').css('display', 'none');
				} else {
					$('#checkNamefail').css('display', 'none');
					$('#checkNameSuccess').css('display', 'block');
				}
			}
		});
	});

	// 모달 내부 로그인 버튼
	$('#btnLogin').click((event) => {
		event.preventDefault();
		var id = $('#userId').val();
		var pwd = $('#password').val();
		console.log(id);
		console.log(pwd);
		$.ajax({
			type : 'post',
			url : '/project/login',
			headers : {
				'Content-Type' : 'application/json; charset=UTF-8',
				'X-HTTP-Method-Override' : 'post'
			},
			data : JSON.stringify({
				'userId' : id,
				'password' : pwd
			}),
			success : function(result) {
				if (result === 'ok') {

					console.log(result);
					//location = document.location;
					location.reload();

					var target = document.location;

					if (target === 'http://localhost:8181/project/') {
						location = '/project/#portfolio';
					} else {
						location = target;
					}

				} else {
					alert('아이디와 비밀번호를 확인해주세요!');
					$('#password').val('');
				}
			}
		}); // end ajacx

	}); //end btnLogin.click()


	// 로그아웃버튼 클릭시
	$('#btnlogout').click(function(event) {
		event.preventDefault();
		location = '/project/logout'; //<<--controller로 간다 .
	}); //end #btnlogout()
	
}); // end document.ready()

	// 로그아웃 처리
	function btnlogout(event) {
		event.preventDefault();
		location = '/project/logout';
	}
</script>
</body>
</html>