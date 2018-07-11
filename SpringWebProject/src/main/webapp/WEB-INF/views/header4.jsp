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
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="resources/js/main/login-register.js" type="text/javascript"></script>

<!-- Plugin CSS -->


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
<body>
	<nav class="navigation"  style="margin: 0px; border: 1px solid black">
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
// 웹소켓
var url = 'ws://localhost:8181/project/echo';
var ws = new WebSocket(url);

ws.onmessage = function(event){
   console.log(event.data);
	}


	$(() => {

		var state1 = '${userId}';
		console.log('아이디 : ' + state1);

		if (state1 != '') {
			ws.send('login,' + state1);

		}
		window.onbeforeunload = function() {
			websocket.onclose = function() {
				var userId = '${userId}'
				alert('dd');
				ws.send('pageOut,' + userId);

			};
			ws.close();
		};




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
      var re = '${userId}'
      ws.send('pageOut,'+ re);
      
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
   
   
   // 쪽지함 모달에서 쪽지 작성중 (보내기)버튼  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
            if(result === 1){
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
      
   
   // 받은쪽지함에서 리스트로 보이게 하기 위한 코드  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   function getAllMessege() {
     console.log('===== userId: ' + userId);
     $.ajax({
        type: 'get',
        url: 'message/getmessege',
        headers: {
           'Content-Type': 'application/json',
           'X-HTTP-Method-Override': 'get'
        },
        data: encodeURI('userId='+userId),
        success: function(result) {
     	  $('#page-ul').css('visibility','visible');
           var list1 = '';
           var list2 = '';
           var list3 = '';
           list1 +='<tr>'
              +'<th>쪽지번호</th>'
              +'<th>보낸 사람</th>'
              +'<th>내용</th>'
              +'<th>보낸 시간</th>'
              +'<th>수신 여부</th>'
              +'</tr>';
           $(result.list).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
         	 console.log('11111');
              console.log('list[0] : '+this.mno);
         	 console.log('222222');
              var date = new Date(this.regdate);
         	 console.log('var date = ' + date);
         	 var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
         	 var subStringMcontent = this.mcontent;
         	 console.log('var dateString = ' + dateString);
              list2 += '<tr>'
              + '<td id="getMno">'
              + this.mno
              + '</td>'
              + '<td>'
              + this.yourId
              + '</td>'
              + '<td><a class="Message-content-link1" href="" data-mno1="' + this.mno + '">'
              + subStringMcontent.substring(0, 9)
              + '...</a></td>'
              + '<td>'
              + dateString
              + '</td>'
              + '<td>'
              + this.readOr
              + '</td>'
              + '</tr>'
           }); // end each()
           console.log(result.list[0].mcontent);
           console.log('Star페이지= '+result.maker.linkStartPageNo);
           console.log('End페이지= '+result.maker.linkEndPageNo);
           console.log('prev: ' + result.maker.hasPrev);
           console.log('next: ' + result.maker.hasNext);
           
     	  if(result.maker.hasPrev == true) {
     		  list3 +='<li><a class="page-link" href ="'+(result.maker.linkStartPageNo - 1)+'" > 이전 </a></li>';
     	  } // end if
     	  
	          for(var a = result.maker.linkStartPageNo ; a <= result.maker.linkEndPageNo ; a++){
	              list3 += '<li><a class="page-link" href="'+ a +'"> '+ a +' </a></li>';
	          }// end for
	          
     	  if(result.maker.hasNext == true) {
     		  list3 +='<li><a class="page-link" href ="'+(result.maker.linkEndPageNo + 1)+'" > 다음 </a></li>';
     	  } // end if
	          console.log(list3);
           $('#messageGetList').html(list1+list2);
           $('#page-ul').html(list3);
          
        }
     });      
  }// end getAllMessege()
  
  
   
  // 보낸쪽지함에서 보낸쪽지를 리스트로 보이게 하기 위한 코드  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
     	   $('#page-ul2').css('visibility','visible');
           var list1 = '';
           var list2 = '';
           var list3 = '';
           list1 +='<tr>'
              +'<th>쪽지번호</th>'
              +'<th>받은 사람</th>'
              +'<th>내용</th>'
              +'<th>보낸 시간</th>'
              +'<th>수신 여부</th>'
              +'</tr>';
           $(result.list).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
              console.log(this)
              var date = new Date(this.regdate);
              var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
              var subStringMcontent = this.mcontent;
              list2 += '<tr>'
              + '<td>'
              + this.mno
              + '</td>'
              + '<td>'
              + this.yourId
              + '</td>'
              + '<td><a class="Message-content-link2" href="" data-mno2="' + this.mno + '">'
              + subStringMcontent.substring(0, 9)
              + '...</a></td>'
              + '<td>'
              + dateString
              + '</td>'
              + '<td>'
              + this.readOr
              + '</td>'
              + '</tr>';
           }); // end each()
           
     	  if(result.maker.hasPrev == true) {
     		  list3 +='<li><a id="page-link2" class="page-link" href ="'+(result.maker.linkStartPageNo - 1)+'" > 이전 </a></li>';
     	  } // end if
     	  
	          for(var a = result.maker.linkStartPageNo ; a <= result.maker.linkEndPageNo ; a++){
	              list3 += '<li><a id="page-link2" class="page-link" href="'+ a +'"> '+ a +' </a></li>';
	          }// end for
	          
     	  if(result.maker.hasNext == true) {
     		  list3 +='<li><a id="page-link2" class="page-link" href ="'+(result.maker.linkEndPageNo + 1)+'" > 다음 </a></li>';
     	  } // end if
	          console.log(list3);
           $('#messageSendList').html(list1+list2);
           $('#page-ul2').html(list3);
            
        }
     });
  }// end sendAllMessege()
   
   $('.col-lg-4 col-sm-6').click(function(){
      console.log('gfgg');
      
   });  

   // 쪽지 페이징 처리중 하나.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   $('#mGet').on('click','#page-ul .page-link', function(event){
	//$('.page-link').click(function (event) {
		// <a> 태그의 기본 이벤트 동작(클릭하면 페이지 이동)을 금지
		event.preventDefault();
		
		var targetPage = $(this).attr('href'); 
		$('#nowShowPage').val(targetPage);
		var userId2 = encodeURI('userId='+userId);
		var target = $('#nowShowPage').val();
		var onepage =$('#onePageMessageNo').val();
		console.log('userId2 ='+userId2);
		console.log('target ='+target);
		console.log('onePageMessageNo ='+onepage);
     $.ajax({
         type: 'get',
         url: 'message/getmessege',
         data: {
         			'userId' : encodeURI(userId),
		            	'nowShowPage': target,
		            	'onePageMessageNo': onepage
		          },
		    
         success: function(result) {
      	   
      	  $('#page-ul').css('visibility','visible');
            var list1 = '';
            var list2 = '';
            var list3 = '';
            list1 +='<tr>'
               +'<th>쪽지번호</th>'
               +'<th>보낸 사람</th>'
               +'<th>내용</th>'
               +'<th>보낸 시간</th>'
               +'<th>수신 여부</th>'
               +'</tr>';
            $(result.list).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
          	 console.log('페이징링크 클릭시 ');
               console.log('list[0] : '+this.mno);
          	 console.log('페이징링크 클릭시2');
               var date = new Date(this.regdate);
          	 console.log('var date = ' + date);
          	 var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
          	 var subStringMcontent = this.mcontent;
          	 console.log('var dateString = ' + dateString);
               list2 += '<tr>'
               + '<td id="getMno">'
               + this.mno
               + '</td>'
               + '<td>'
               + this.yourId
               + '</td>'
               + '<td><a class="Message-content-link1" href="" data-mno1="' + this.mno + '">'
               + subStringMcontent.substring(0, 9)
               + '...</a></td>'
               + '<td>'
               + dateString
               + '</td>'
               + '<td>'
               + this.readOr
               + '</td>'
               + '</tr>'
            }); // end each()
            console.log(result.list[0].mcontent);
            console.log('바뀐 Star페이지= '+result.maker.linkStartPageNo);
            console.log('바뀐 End페이지= '+result.maker.linkEndPageNo);
            console.log('바뀐 prev: ' + result.maker.hasPrev);
            console.log('바뀐 next: ' + result.maker.hasNext);
            
      	  if(result.maker.hasPrev == true) {
      		  list3 +='<li><a class="page-link" href ="'+(result.maker.linkStartPageNo - 1)+'" > 이전 </a></li>';
      	  } // end if
      	  
	          for(var a = result.maker.linkStartPageNo ; a <= result.maker.linkEndPageNo ; a++){
	              list3 += '<li><a class="page-link" href="'+ a +'"> '+ a +' </a></li>';
	          }// end for
	          
      	  if(result.maker.hasNext == true) {
      		  list3 +='<li><a class="page-link" href ="'+(result.maker.linkEndPageNo + 1)+'" > 다음 </a></li>';
      	  } // end if
	          console.log(list3);
            $('#messageGetList').html(list1+list2);
            $('#page-ul').html(list3);
           
         } //end success
      });  //end ajax
	});  // 받은 쪽지함의 페이징링크 처리(click) 끝
  
	
	
 // 쪽지 페이징 처리중 둘.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 $('#mSend').on('click','#page-ul2 #page-link2', function(event){
	//$('.page-link2').click(function () {
		// <a> 태그의 기본 이벤트 동작(클릭하면 페이지 이동)을 금지
		event.preventDefault();
		var targetPage = $(this).attr('href'); 
		$('#nowShowPage2').val(targetPage);
		var userId2 = encodeURI('userId='+userId);
		var target = $('#nowShowPage2').val();
		var onepage =$('#onePageMessageNo2').val();
		console.log('userId2 ='+userId2);
		console.log('target ='+target);
		console.log('onePageMessageNo ='+onepage);
     $.ajax({
         type: 'get',
         url: 'message/sendmessage',
         data: {
         			'userId' : encodeURI(userId),
		            	'nowShowPage': target,
		            	'onePageMessageNo': onepage
		          },
		    
         success: function(result) {
      	   
      	  $('#page-ul2').css('visibility','visible');
            var list1 = '';
            var list2 = '';
            var list3 = '';
            list1 +='<tr>'
               +'<th>쪽지번호</th>'
               +'<th>보낸 사람</th>'
               +'<th>내용</th>'
               +'<th>보낸 시간</th>'
               +'<th>수신 여부</th>'
               +'</tr>';
            $(result.list).each(function() { //each는 각이리고 for이라 생각 하면 된다 .
          	 console.log('페이징링크 클릭시 ');
               console.log('list[0] : '+this.mno);
          	 console.log('페이징링크 클릭시2');
               var date = new Date(this.regdate);
          	 console.log('var date = ' + date);
          	 var dateString = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
          	 var subStringMcontent = this.mcontent;
          	 console.log('var dateString = ' + dateString);
               list2 += '<tr>'
               + '<td id="getMno">'
               + this.mno
               + '</td>'
               + '<td>'
               + this.yourId
               + '</td>'
               + '<td><a class="Message-content-link2" href="" data-mno1="' + this.mno + '">'
               + subStringMcontent.substring(0, 9)
               + '...</a></td>'
               + '<td>'
               + dateString
               + '</td>'
               + '<td>'
               + this.readOr
               + '</td>'
               + '</tr>'
            }); // end each()
            console.log(result.list[0].mcontent);
            console.log('바뀐 Star페이지= '+result.maker.linkStartPageNo);
            console.log('바뀐 End페이지= '+result.maker.linkEndPageNo);
            console.log('바뀐 prev: ' + result.maker.hasPrev);
            console.log('바뀐 next: ' + result.maker.hasNext);
            
      	  if(result.maker.hasPrev == true) {
      		  list3 +='<li><a id="page-link2" class="page-link" href ="'+(result.maker.linkStartPageNo - 1)+'" > 이전 </a></li>';
      	  } // end if
      	  
	          for(var a = result.maker.linkStartPageNo ; a <= result.maker.linkEndPageNo ; a++){
	              list3 += '<li><a id="page-link2" class="page-link"  href="'+ a +'"> '+ a +' </a></li>';
	          }// end for
	          
      	  if(result.maker.hasNext == true) {
      		  list3 +='<li><a id="page-link2" class="page-link" href ="'+(result.maker.linkEndPageNo + 1)+'" > 다음 </a></li>';
      	  } // end if
	          console.log(list3);
            $('#messageSendList').html(list1+list2);
            $('#page-ul2').html(list3);
           
         }// end success
      }); //end ajax
	}); // 보낸 쪽지함의 페이징링크 처리(click) 끝
  
  
});// end document.reay()   



//쪽지작성 후 보내기 하면 그칸이 다시 리셋되게 하기 위한 함수  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function resetWriteMessage(){
   $('#toId').val('');
   $('#writeContent').val('');
}// end resetWriteMessage()

	function btnlogout(event){
	   event.preventDefault();
	   location.reload();
	    location = '/project/logout';
	 }// end btnlogout()


	//쪽지함 모달에서 클릭되있는 버튼만 보이게 하는 코드  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
     
     
     // (받은) 쪽지함에서 내용 클릭시 자세히 보기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
     $('#mGet').on('click','#messageGetList .Message-content-link1', function(event){
        event.preventDefault();
        var Mno =$(this).attr('data-mno1');
        console.log('받은쪽지함detail : ' + Mno);
        $.ajax({
           type: 'post',
           url: 'message/getDetail',
           headers: {
              'Content-Type': 'application/json',
              'X-HTTP-Method-Override': 'post'
           },
           data: JSON.stringify({
              'mno': Mno
           }),
           success: function (result) { 
              if(result != null){
             	$('#page-ul').css('visibility','hidden');
                 var yourId = result['yourId'];
                 var userId = result['userId'];
                 var mcontent = result['mcontent'];
                 var mno = result['mno'];
                 console.log(JSON.stringify(result));
                 var list = '';
                 list+='<label>보낸 사람</label>'
                 +'<input class="w3-input w3-border w3-margin-bottom" type="text" value="'+ userId +'" name="yourId" readonly >'
                 +'<textarea id="writeContent" style="margin-bottom: 20px;" class="w3-input w3-border w3-margin-bottom" rows="7" cols="106" name="mcontent" readonly >'+ mcontent +'</textarea>'
                  +'<label>받은 사람</label>'
                  +'<input  class="w3-input w3-border w3-margin-bottom" type="text" value="'+ yourId +'" name="yourId" readonly >'
                  +'<button class="w3-button w3-green w3-large" id="Deletebtn" type="button" >뒤로가기 </button>'
                  +'<input type="hidden" value="'+ mno +'" id="deletemno" name="mno" >'
              } // if
              $('#messageGetList').html(list);
           } // seuccess
        }); // end ajax()
        
     });// end $('#mGet').on(funcion())
     
     
     // (보낸) 쪽지함에서 내용 클릭시 자세히 보기   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
     $('#mSend').on('click','#messageSendList .Message-content-link2', function(event){
        event.preventDefault();
        var Mno =$(this).attr('data-mno2');
        console.log('보낸쪽지함detail mno: ' + Mno);
        $.ajax({
           type: 'post',
           url: 'message/sendDetail',
           headers: {
              'Content-Type': 'application/json',
              'X-HTTP-Method-Override': 'post'
           },
           data: JSON.stringify({
              'mno': Mno
           }),
           success: function (result) { 
              if(result != null){            
             	$('#page-ul2').css('visibility','hidden');
                 var yourId = result['yourId'];
                 var userId = result['userId'];
                 var mcontent = result['mcontent'];
                 var mno = result['mno'];
                 console.log(JSON.stringify(result));
                 var list = '';
                 list+='<label>받은 사람</label>'
                 +'<input class="w3-input w3-border w3-margin-bottom" type="text" value="'+ yourId +'" name="yourId" readonly >'
                 +'<textarea id="writeContent" style="margin-bottom: 20px;" class="w3-input w3-border w3-margin-bottom" rows="7" cols="106" name="mcontent" readonly >'+ mcontent +'</textarea>'
                  +'<label>보낸 사람</label>'
                  +'<input  class="w3-input w3-border w3-margin-bottom" type="text" value="'+ userId +'" name="yourId" readonly >'
                  +'<button class="w3-button w3-green w3-large" id="Deletebtn" type="button" >뒤로가기 </button>'
                  +'<input type="hidden" value="'+ mno +'" id="deletemno" name="mno" >'
              } // if
              $('#messageSendList').html(list);
           } // seuccess
        }); // end ajax()
        
     });// end $('#mSend').on('click'.function(event))
</script>
</body>
</html>