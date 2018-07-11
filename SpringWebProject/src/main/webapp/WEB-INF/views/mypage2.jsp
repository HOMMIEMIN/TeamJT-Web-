<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>You Can Be A Teacher</title>


<!-- Bootstrap core CSS -->

<link href="resources/css/mypage.css" rel="stylesheet">

<!-- 웹폰트 -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">

<!-- 모달에 필요 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/main/bootstrap.js"></script>


<style>
.mypage-container {
	
}

.top {
	margin-top: 60px;
	height: 150px;
	width: 100%;
	background-color: #f0f0f0;
}

.menu-container {
	max-width: 1040px;
	min-width: 670px;
	margin: auto;
}

.top-menu {
	padding-top: 45px;
	height: 155px;
	display: flex;
	
}

#profileimg {
	position: relative;
	display: inline-block;
	background: url(resources/img/test.png) center center no-repeat;
	border-radius: 50%;
	width: 140px;
	height: 140px;
	margin-right: 10px;
	padding-bottom: 15px;
}

.top-menu-center {
	padding-top: 40px;
	display: flex;
	flex-direction: column;
	width: 500px;
}

#username {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16pt;
	color: #404040;
}

#userid {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 9pt;	
	color: #7d7d7d;
}

.nav-taps {
	height: 45px;
	display: inline-block;	
}

/*
.tablinks {
	position: relative;
	left: 400px;
	background-color: white;
	font-size: 80%;
}*/

.tablinks {
	height: 45px;
	width: 120px;
}

.top-menu-right {
	margin-left: auto;
}

#editprofile {
	border: 1px solid black;
}





#createFolder1 {
	position: relative;
	left: 850px;
	background-image: url("resources/img/button.png");
	margin-top: 10px;
	background-size: cover;
	color:white;
}
#createFolder2 {
	position: relative;
	left: 850px;
	background-image: url("resources/img/button.png");
	margin-top: 10px;
	background-size: cover;
	color:white;
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





/*.tab {
	position: relative;
	bottom: 800px;
	top: 0px;
	background-color: white;
	border: 1px solid white;
	font-size: 80%;
}
*/
.name {
	position: relative;
	top: 70px;
	left: 360px;
	font-size: 80%;
}


/*
@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform


:

 

rotate


(360
deg
);

 

}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform


:

 

rotate


(360
deg
);

 

}
}
*/
/* Add animation to "page content" */
.animate-bottom {
	position: relative;
	-webkit-animation-name: animatebottom;
	-webkit-animation-duration: 1s;
	animation-name: animatebottom;
	animation-duration: 1s
}
/*

@
-webkit-keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0px;
	opacity: 1
}

}
@
keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0;
	opacity: 1
}

}
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

h4 {
	font-family: hanna;
}
}*/

.container {
	padding: 0px;
}
</style>


</head>

<!-- body id="page-top"-->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="mypage-container">
		<div class="top">
			<div class="menu-container">
				<div class="top-menu">
					<div id="profileimg"></div>
					<div class="top-menu-center">
						<div id="username">${userName}</div>
						<div id="userid">${userId}</div>
						<div class="nav-taps">
							<button class="tablinks" id="London"
								onclick="openCity(event, 'London')">나는 학생</button>
							<button class="tablinks" id="Paris"
								onclick="openCity(event, 'Paris')">나는 선생님</button>
							<button class="tablinks" id="Tokyo"
								onclick="openCity(event, 'Tokyo')">칠판</button>
						</div>
					</div>
					<div class="top-menu-right">
						<div id="editprofile" data-toggle="modal" href="javascript:void(0)" onclick="profileModal()">프로필</div>
						<div class="makefolder">
							<button id="createFolder1"
								onclick="document.getElementById('id01').style.display='block'"
								style="display: none">online</button>
							<button id="createFolder2"
								onclick="document.getElementById('id02').style.display='block'"
								style="display: none">offline</button>
						</div>
					</div>
					<!-- 
				<div class="frame" id="file" style="z-index: 1;"></div>
				<div class="name" style="font-weight: bold; font-size: 130%">${userName }</div>
				<div class="name" style="color: grey">${userId }</div>
				-->
				</div>


				<!-- div class="tab">
					<button class="tablinks" id="London"
						onclick="openCity(event, 'London')">나는 학생</button>
					<button class="tablinks" id="Paris"
						onclick="openCity(event, 'Paris')">나는 선생님</button>
					<button class="tablinks" id="Tokyo"
						onclick="openCity(event, 'Tokyo')">칠판</button>
					<button id="createFolder1"
						onclick="document.getElementById('id01').style.display='block'"
						style="display: none">online</button>
					<button id="createFolder2"
						onclick="document.getElementById('id02').style.display='block'"
						style="display: none">offline</button>

				</div-->

			</div>
		</div>
		
		<!-- 프로필 모달 -->
		<div class="modal fade profile" id="profileModal">
			<div class="modal-dialog profile animated">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="box">
							<div class="content">
								<div class="set-profileimg">
									<div id="cur-profile"></div>
									<a id="select-img" href="javascript:void(0)" onclick=><img
										src="" alt="사진선택"></a>
								</div>
								<div class="set-username">
									<input class="big-text" id="username" type="text" name="username"
										value="${userName}" /> 
									<a id="edit-username"
										href="javascript:void(0)" onclick=><img src="" alt="닉네임수정"></a>
									<div>${userId}</div>
								</div>
								<div class="set-phone">
									<div class="content-title">전화번호</div>
									<input class="big-text" id="phone" type="number" name="phone" value="${phone}"/>
									<a id="edit-phone"
										href="javascript:void(0)" onclick=><img src="" alt="번호수정"></a>
								</div>
								<hr>
								<div class="set-password">
									<div class="content-title">비밀번호 변경</div>
									<input id="curpassword" class="reset-password" type="password" name="curpassword" placeholder="기존 비밀번호"/>
									<div id="checkedfail" style="display: none; color: red; font-size: 8pt;">비밀번호를 확인해주세요</div>
									<input id="newpassword" class="reset-password" type="password" name="newpassword" placeholder="새 비밀번호"/>
									<input id="checkpassword" class="reset-password" type="password" name="checkpassword" placeholder="기존 비밀번호"/>
									<div id="checkednotsame" style="display: none; color: red; font-size: 8pt;">새로 입력하신 비밀번호가 다릅니다</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal-footer">
						<input id="save-password" class="savebtn" type="submit" value="비밀번호 변경"/>
					</div>
				</div>
			</div>
		</div>

		<div id="London" class="tabcontent" style="border: none;">
			<h3>나는 학생</h3>
			<p>London is the capital city of England.</p>
		</div>

		<div id="Paris" class="tabcontent" style="border: none;">
			<!--  나는 선생님 강의 관리  -->
		</div>

		<div id="Tokyo" class="tabcontent" style="border: none;">
			<h3>칠판</h3>
			<p>Tokyo is the capital of Japan.</p>
		</div>

		<div>

			<div id="onLec"
				style="display: inline-block; margin-left: 200px; width: 1200px; max-width: 1200px"></div>
		</div>

		<div>
			<div id="offLec" style="display: inline-block; margin-left: 200px"></div>

		</div>

		<div id="loader" style="display: none; z-index: 4;"></div>
		<div id="notClick" style="display: none; z-index: 3;"></div>


	</div>


	<script>
	
	
	
		$('#btnSearchBar').click(() => {
			$('#searchForm').submit();
		});
		
		
		// 비밀번호 변경완료
		var savepassword = '${savePaswordResult}';
		if (savepassword != null && savepassword == 'OK') {
			alert('비밀번호 변경 완료!');
		}
		
		// 비밀번호 체크
		$('#curpassowrd').change(function () {
			
		});
		
		// 새 비밀번호 체크
		$('#newpassword').change(function () {
			
		});
		
		// 닉네임 체크
		$('#username').click(function () {
			var name = $('#username').val();
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
		
		// 프로필 사진
		
		// 전화번호
		
		// 프로필 모달
		function profileModal(){
			showProfileForm();
			setTimeout(function(){
		        $('#profileModal').modal('show');    
		    }, 230);
		}
		
		function showProfileForm() {
		    $('#profileModal').fadeOut('fast',function(){
		        $('.content').fadeIn('fast');
		        $('.modal-footer').fadeOut('fast',function(){
		            $('.login-footer').fadeIn('fast');    
		        });
		        
		    });       
		     $('.error').removeClass('alert alert-danger').html(''); 
		}
		}
		
		
	
		function openCity(evt, cityName) {
			var i,
				tabcontent,
				tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
					" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
			console.log(cityName)
	
			if (cityName === 'Paris') {
				console.log('들어옴');
	
				myFunction();
				$('#onLec').animate({
					opacity : 0
				}, 1000);
				$('#onLec').load("/project/upload/folder");
				$('#onLec').animate({
					opacity : 1
				}, 1000);
	
				$('#offLec').animate({
					opacity : 0
				}, 1000);
				$('#offLec').load("/project/offline/offFolder");
				$('#offLec').animate({
					opacity : 1
				}, 1000);
	
				$('#Paris').css('border-bottom', '5px solid black');
				$('#Tokyo').css('border-bottom', 'none');
				$('#London').css('border-bottom', 'none');
				$('#createFolder1').css('display', 'block');
				$('#createFolder2').css('display', 'block');
	
	
	
	
	
			} else if (cityName === 'London') {
				$('#London').css('border-bottom', '5px solid black');
				$('#Paris').css('border-bottom', 'none');
				$('#Tokyo').css('border-bottom', 'none');
				$('#onLec').animate({
					opacity : 0
				}, 1000);
				$('#onLec').load("/project/upload/myLec");
				$('#onLec').animate({
					opacity : 1
				}, 1000);
	
				$('#loader').css('display', 'block');
				$('#notClick').css('display', 'block');
			} else if (cityName === 'Tokyo') {
				$('#Tokyo').css('border-bottom', '5px solid black');
				$('#Paris').css('border-bottom', 'none');
				$('#London').css('border-bottom', 'none');
			} else {
				$('#createFolder1').css('display', 'none');
				$('#createFolder2').css('display', 'none');
			}
		}
	
		function myFunction() {
			console.log('들어옴')
			$('#loader').css('display', 'block');
			$('#notClick').css('display', 'block');
	
		}
	
		function showPage() {
			$('#notClick').css('display', 'none');
			$('#loader').css('display', 'none');
		}
		$(() => {
			var type = '${type}';
			console.log('타입 : ' + type);
			if (type != null) {
				switch (type) {
				case 'a':
					openCity(event, 'London');
					break;
				case 'b':
					openCity(event, 'Paris');
					break;
				case 'c':
					openCity(event, 'Tokyo');
					break;
				}
			}
	
		});
	</script>



	<script	src="https://kendo.cdn.telerik.com/2018.2.620/js/kendo.all.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.common-material.min.css" />
	<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.min.css" />
	<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.mobile.min.css" />

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>

</html>
