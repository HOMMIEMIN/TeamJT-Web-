<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>You Can Be A Teacher</title>


<!-- Bootstrap core CSS -->

<link href="resources/css/mypage.css" rel="stylesheet">

<!-- 웹폰트 -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css"
   rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
   rel="stylesheet" type="text/css">

<!-- 모달에 필요 -->
<link rel="stylesheet"
   href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/main/bootstrap.js"></script>


<style>

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

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
   display: flex;
   flex-direction: row;
   height: 45px;
   z-index: 1;
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
   color: white;
}

#createFolder2 {
   position: relative;
   left: 850px;
   background-image: url("resources/img/button.png");
   margin-top: 10px;
   background-size: cover;
   color: white;
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

/*
.tab {
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

.modal-content {
   position: relative;
   background-color: #ffffff;
   outline: none;
   border-radius: 0px;
   -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
   box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
   background-clip: padding-box;
}

.profile-close {
   width: 10px;
   height: 10px;
   float: right;
   font-size: 21px;
   font-weight: bold;
   line-height: 1;
   color: #000000;
   text-shadow: 0 1px 0 #ffffff;
   opacity: 0.2;
   filter: alpha(opacity = 20);
}

.profile-close:hover, .profile-close:focus {
   color: #000000;
   text-decoration: none;
   cursor: pointer;
   opacity: 0.5;
   filter: alpha(opacity = 50);
}

button.profile-close {
   padding: 0;
   cursor: pointer;
   background: transparent;
   border: 0;
   -webkit-appearance: none;
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
                  	<div class="row">
                     <div class="col-sm-4"><button class="tablinks" id="London" style="background-color:#ffffff; border-style: none;  " onclick="openCity(event, 'London')">나는 학생</button></div>
                     <div class="col-sm-4"><button class="tablinks" id="Paris"  style="background-color:#ffffff; border-style: none; " onclick="openCity(event, 'Paris')">나는 선생님</button></div>
                     <div class="col-sm-4"><button class="tablinks" id="Tokyo"  style="background-color:#ffffff; border-style: none; " onclick="openCity(event, 'Tokyo')">칠판</button></div>             
                    </div>
                  </div>
               </div>
               <div class="top-menu-right">
                  <div id="editprofile" data-toggle="modal"
                     href="javascript:void(0)" onclick="profileModal()">프로필</div>
                  <div class="makefolder">
                     <button id="createFolder1"
                        onclick="document.getElementById('id01').style.display='block'"
                        style="display: none">online</button>
                     <button id="createFolder2"
                        onclick="document.getElementById('id02').style.display='block'"
                        style="display: none">offline</button>
                  </div>
               </div>
            </div>

         </div>
      </div>

      <!-- 프로필 모달 -->
      <div class="modal fade profile" id="profileModal">
         <div class="modal-dialog profile animated">
            <div class="modal-content">

               <div class="modal-body">
                  <div class="box">
                     <div class="content">
                        <button type="button" class="profile-close" data-dismiss="modal"
                           aria-hidden="true">&times;</button>
                        <div class="set-profileimg">
                           <!-- div id="cur-profile"></div-->
                           <div id="profileimg"></div>
                           <a id="select-img" href="javascript:void(0)" onclick=><img
                              src="" alt="사진선택"></a>
                        </div>
                        <div class="set-username">
                           <input class="big-text" id="username1" type="text"
                              name="username1" value="${userName}" readonly="readonly" /> <img
                              id="edit-username" src="" alt="닉네임수정하기" style="display: block">
                           <img id="new-username" src="" alt="닉네임수정완료"
                              style="display: none">
                           <div id="checkNamefail" class="checkFail"
                              style="display: none; color: red;">닉네임이 존재합니다!</div>
                           <div class="checkNameSuccess" style="display: none; color: green;">사용 가능한 닉네임입니다</div>
                           <div class="checkNameNull" style="display: none; color: red;">
                              닉네임을 입력해주세요!</div>
                           <div>${userId}</div>

                        </div>
                        <div class="set-phone">
                           <div class="content-title">전화번호</div>
                           <input class="big-text" id="phone1" type="text" name="phone1"
                              value="${phone}" readonly="readonly" /> <img id="edit-phone"
                              src="" alt="번호수정하기" style="display: block"> <img
                              id="new-phone" src="" alt="번호수정완료" style="display: none">
                           <div class="checkPhoneNull" style="display: none; color: red;">
                              번호를 입력해주세요!</div>
                        </div>
                        <hr>
                        <div class="set-password">
                           <div class="content-title">비밀번호 변경</div>
                           <input id="curpassword" class="reset-password" type="password"
                              name="curpassword" placeholder="기존 비밀번호" /><br>
                           <div class="checkedfail"
                              style="display: none; color: red; font-size: 8pt;">비밀번호를
                              확인해주세요</div>
                           <div class="checkedsuccess"
                              style="display: none; color: green; font-size: 8pt;">비밀번호 확인됨</div>
                           <input id="newpassword" class="reset-password" type="password"
                              name="newpassword" placeholder="새 비밀번호" readonly="readonly"/> <br>
                           <input id="checkpassword" class="reset-password" type="password"
                              name="checkpassword" placeholder="새 비밀번호 확인" readonly="readonly"/><br>
                           <div class="checkednotsame"
                              style="display: none; color: red; font-size: 8pt;">새로
                              입력하신 비밀번호가 다릅니다</div>
                        </div>

                        <div class="change-pwd"
                              style="padding: 10px; background-color: gray; color: white; font-size: 14pt;">비밀번호 변경하기</div>
                        <!-- div class="change-pwd"
                              style="padding: 10px; background-color: #169e83; color: white; font-size: 14pt;">비밀번호 변경하기</div-->
                     </div>
                  </div>
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
         <div id="offLec"
            style="display: inline-block; margin-left: 200px; width: 1200px; max-width: 1200px"></div>

      </div>

      <div id="loader" style="display: none; z-index: 4;"></div>
      <div id="notClick" style="display: none; z-index: 3;"></div>




      <script>
      
      
      
         $('#btnSearchBar').click(() => {
            $('#searchForm').submit();
         });
      
         // 닉네임 수정 input editable
         $('#edit-username').click(function() {
            $('input[name="username1"]').prop('readonly', false);
            $('input[name="username1"]').prop('required', true);
            $('#edit-username').css('display', 'none');
            $('#new-username').css('display', 'block');
         });
      
         var nameCheck = false;
      
         // 닉네입 입력값 유무 즉각 확인         
         $("#username1").on("change keyup paste", function() {
            var name = $('#username1').val();
            if (name === null || name === '') {
               $('.checkNameNull').css('display', 'block');
               $('.checkNameSuccess').css('display', 'none');
            } else {
               $('.checkNameNull').css('display', 'none');
               if (name != null && name != '') {
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
                           $('.checkFail').css('display', 'block');
                           $('.checkNameSuccess').css('display', 'none');
                           nameCheck = false;
                        } else {
                           $('.checkFail').css('display', 'none');
                           $('.checkNameSuccess').css('display', 'block');
                           
                           nameCheck = true;
                        }
                     }
                  });
               }
               }
         });
      
         // 닉네임 중복체크
         /*$('#username1').change(function() {
            var name = $('#username1').val();
            if (name != null && name != '') {
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
                        $('.checkFail').css('display', 'block');
                        $('.checkNameSuccess').css('display', 'none');
                        nameCheck = false;
                     } else {
                        $('.checkFail').css('display', 'none');
                        $('.checkNameSuccess').css('display', 'block');
                        
                        nameCheck = true;
                     }
                  }
               });
            }
         });
      */
         // 새 닉네임 저장
         $('#new-username').click(function() {
            var name = $('#username1').val();
            console.log('nameCheck : ' + nameCheck);
            if (nameCheck == true) {
               if (name != null) {
                  var id = '${userId}';
                  console.log('ajax');
      
                  $.ajax({
                     type : 'post',
                     url : '/project/update-name',
                     async : false,
                     headers : {
                        'Content-Type' : 'application/json; charset=UTF-8',
                        'X-HTTP-Method-Override' : 'post'
                     },
                     data : JSON.stringify({
                        'userName' : name,
                        'userId' : id
                     }),
                     success : (result) => {
                        console.log("변경 : " + result);
                        if (result == 'ok') {
                           alert("닉네임이 변경되었습니다");
                           $('input[name="username1"]').prop('readonly', true);
                           $('input[name="username1"]').prop('required', false);
                           $('#edit-username').css('display', 'block');
                           $('#new-username').css('display', 'none');
                           $('.checkNameSuccess').css('display', 'none');
                        //document.location.reload();
                        }
                     }
                  });
               }
            }
         });
      
         // 전화번호 수정 input editable
         $('#edit-phone').click(function() {
            $('input[name="phone1"]').prop('readonly', false);
            $('input[name="phone1"]').prop('required', true);
            $('#edit-phone').css('display', 'none');
            $('#new-phone').css('display', 'block');
         });
      
         // 전화번호 입력값 유무 즉각 확인         
         $("#phone1").on("change keyup paste", function(){
            var phoneNo = $('#phone1').val();
            if (phoneNo === null || phoneNo === '') {
               $('.checkPhoneNull').css('display', 'block');
            } else {
               $('.checkPhoneNull').css('display', 'none');
            }
         });
         
         // 새 전화번호 저장
         $('#new-phone').click(function() {
            var phoneNo = $('#phone1').val();
            if (phoneNo != null && phoneNo != '') {
               var id = '${userId}';
               $.ajax({
                  type : 'post',
                  url : '/project/update-phone',
                  headers : {
                     'Content-Type' : 'application/json; charset=UTF-8',
                     'X-HTTP-Method-Override' : 'post'
                  },
                  data : JSON.stringify({
                     'phone' : phoneNo,
                     'userId' : id
                  }),
                  success : (result) => {
                     console.log("변경 : " + result);
                     if (result == 'ok') {
                        alert("전화번호가 변경되었습니다");
                        $('input[name="phone1"]').prop('readonly', true);
                        $('input[name="phone1"]').prop('required', false);
                        $('#edit-phone').css('display', 'block');
                        $('#new-phone').css('display', 'none');
                        $('.checkPoneNull').css('display', 'none');
                     //document.location.reload();
                     }
                  }
               });
            }
         });
      
         // 비밀번호 체크
         var pwdCheck = false;
         
         $('#curpassword').on("change keyup paste", function() {
            var password = $('#curpassword').val();
            var id = '${userId}';
            console.log('변경 : ' + id);
            
            if (password != null && password != '') {
               $.ajax({
                  type : 'post',
                  url : '/project/checkpwd',
                  headers : {
                     'Content-Type' : 'application/json; charset=UTF-8',
                     'X-HTTP-Method-Override' : 'post'
                  },
                  data : JSON.stringify({
                     'userId' : id,
                     'password' : password
                     
                  }),
                  success : (result) => {
                     if (result == 'same') {
                        $('.checkedfail').css('display', 'none');
                        $('.checkedsuccess').css('display', 'block');
                        $('input[name="newpassword"]').prop('readonly', false);
                        $('input[name="checkpassword"]').prop('readonly', false);
                        pwdCheck = true;
                     } else if (result == 'notSame') {
                        $('.checkedfail').css('display', 'block');
                        $('.checkedsuccess').css('display', 'none');
                        pwdCheck = false;
                     } else {
                        alert("비밀번호 비교 실패");
                     }
                  }
               });
            }
         });
         
         // 새 비밀번호 즉각 확인
         //var newPassword = $('#newpassword').val();
         $("#checkpassword").on("change keyup paste", function(){
            
            //var checkPassword = $('#checkpassword').val();
            if (pwdCheck === true && $('#newpassword').val() != null && $('#newpassword').val() != '' && $('#checkpassword').val() === $('#newpassword').val()) {
               $('.change-pwd').css('background-color', '#169e83');
               $('.checkednotsame').css('display', 'none');
            } else {
               $('.checkednotsame').css('display', 'block');
               $('.change-pwd').css('background-color', 'gray');
            }
         });
      
         // 새 비밀번호 저장
         $('.change-pwd').click(function() {
            var checkPassword = $('#checkpassword').val();
            if (pwdCheck === true && $('#newpassword').val() != null && $('#newpassword').val() != '' && $('#checkpassword').val() === $('#newpassword').val()) {
               var id = '${userId}';
               var checkPassword = $('#checkpassword').val();
               $.ajax({
                  type : 'post',
                  url : '/project/update-password',
                  headers : {
                     'Content-Type' : 'application/json; charset=UTF-8',
                     'X-HTTP-Method-Override' : 'post'
                  },
                  data : JSON.stringify({
                     'password' : checkPassword,
                     'userId' : id
                  }),
                  success : (result) => {
                     console.log("변경 : " + result);
                     if (result == 'ok') {
                        alert("비밀번호가 변경되었습니다");
                        $('input[name="curpassword"]').val('');
                        $('input[name="newPassword"]').val('');
                        $('input[name="checkpassword"]').val('');
                        $('.change-pwd').css('background-color', 'gray');
                        $('.checkedsuccess').css('display', 'none');
                     //document.location.reload();
                     }
                  }
               });
      
            } else {
               alert("변경할 내용을 제대로 입력해주세요");
            }
         });
      
         // 프로필 모달창이 닫히면 마이페이지 새로고침
         $('#profileModal').on('hidden.bs.modal', function(e) {
            var target = $(e.target);
            target.removeData('bs.modal').find(".modal-content").html('');
            document.location.reload();
            // 리로드 하면서 닉네임, 전화번호는 새로 저장된 값 다시 가져오기 비밀번호 input은 모두 지우기 
         })
      
         // 프로필 모달
         function profileModal() {
            showProfileForm();
            setTimeout(function() {
      
               $('#profileModal').modal('show');
            }, 230);
         }
      
         function showProfileForm() {
            $('#profileModal').fadeOut('fast', function() {
               $('.content').fadeIn('fast');
      
            });
            $('.error').removeClass('alert alert-danger').html('');
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
            $(document).ready(() => {
               evt.currentTarget.className += " active";
               console.log(cityName + '입장      [종류]paris:선생 london:학생 tokyo:칠판')
            });
      
      
            if (cityName === 'Paris') {
               console.log('나는 선생님 페이지 들어옴');
               $('#Paris').css('border-bottom', '5px solid black');
               $('#London').css('border-bottom', 'none');
               $('#Tokyo').css('border-bottom', 'none');
               
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
      
      
               $('#createFolder1').css('display', 'block');
               $('#createFolder2').css('display', 'block');
      
      
      
      
      
            } else if (cityName === 'London') {
               console.log('나는 학생 페이지 들어옴');
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
      
               $('#offLec').animate({
                  opacity : 0
               }, 1000);
               $('#offLec').load("/project/offline/myOffLec");
               $('#offLec').animate({
                  opacity : 1
               }, 1000);
      
               $('#loader').css('display', 'block');
               $('#notClick').css('display', 'block');
            } else if (cityName === 'Tokyo') {
      
                $('#Tokyo').css('border-bottom', '5px solid black');
                $('#onLec').load("/project/upload/blackboardall");
                $('#Paris').css('border-bottom', 'none');
                $('#London').css('border-bottom', 'none');
            	
            	
            	
            	
            	
            	
            } else {
               $('#createFolder1').css('display', 'none');
               $('#createFolder2').css('display', 'none');
            }
         }
      
         function myFunction() {
            console.log('myFunction() 들어옴')
            $('#loader').css('display', 'block');
            $('#notClick').css('display', 'block');
      
         }
      
         function showPage() {
            $('#notClick').css('display', 'none');
            $('#loader').css('display', 'none');
         }
      
         $(document).ready(function() {
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
      
            jQuery.browser = {};
            (function() {
               jQuery.browser.msie = false;
               jQuery.browser.version = 0;
               if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                  jQuery.browser.msie = true;
                  jQuery.browser.version = RegExp.$1;
               }
            })();
         });
      </script>


      <script
         src="https://kendo.cdn.telerik.com/2018.2.620/js/kendo.all.min.js"></script>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
      <link rel="stylesheet"
         href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.common-material.min.css" />
      <link rel="stylesheet"
         href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.min.css" />
      <link rel="stylesheet"
         href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.material.mobile.min.css" />
      <link rel="stylesheet"
         href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
         type="text/css" />
      <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
      <link rel="stylesheet"
         href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
      <script
         src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/2.3.3/fabric.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</body>

</html>