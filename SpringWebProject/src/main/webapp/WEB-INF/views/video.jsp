<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">

<title>You Can Be A Teacher</title>




<!-- Custom fonts for this template -->


<!-- Custom styles for this template -->
<link href="resources/css/mypage.css" rel="stylesheet">


<style type="text/css">
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

a:link {

   text-decoration: none;
   color: black;

}

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);





body {
   font-family: 'Nanum Gothic', serif;
}
</style>


</head>

<body id="page-top">

   <jsp:include page="header.jsp"></jsp:include>
   <div style="margin-left: 240px; margin-top: 100px; z-index: 1;">
      <div style="display: inline-block;">
         <video width="854" height="480" controls> <source
            src="/project/resources/video/tmpFiles/rlaghals999@naver.com123.mp4"
            type='video/mp4'> <source src="movie.ogg" type="video/ogg"></video>
      </div>
      <%
         int a = 1;
      %>
      <div
         style="display: inline-block; width: 400px; bottom: 380px; margin-bottom: 10px; bottom: 0px; position: relative;">
         <div
            style="background-color: #424242; font-weight: bold; color: white; font-size: 135%; padding: 22px; position: relative;">${lecName }</div>
         <div style="width: 400px; height: 410px; overflow: scroll;">
            <c:if test="${not empty GroupbnoList }">
               <c:forEach var="group" items="${GroupbnoList }">
                  <c:if test="${group.title != bnoList.title }">
                     <a
                        href="videoview?groupBno=${groupBno}&bno=${group.bno}&lecName=${lecName}"
                        style="color: black">
                        <div class="item" style="padding: 10px; background-color: lightgrey">
                           <%=a%>
                           <img
                              src="/project/resources/image/tmpFiles/${group.imagePath }"
                              width="90px" height="50px">
                           <div style="display: inline-block; margin-bottom: 10px">${group.title }</div>
                        </div>
                     </a>
                  </c:if>
                  <c:if test="${group.title == bnoList.title }">
                     <div style="padding: 10px; background-color: #E6E6E6">
                        <img src="/project/resources/img/this.png" width="" height="">
                        <img src="/project/resources/image/tmpFiles/${group.imagePath }"
                           width="90px" height="50px">
                        <div
                           style="display: inline-block; margin-bottom: 10px; font-weight: bold;">${group.title }</div>
                     </div>
                  </c:if>
                  <%
                     a++;
                  %>
               </c:forEach>
            </c:if>
         </div>
      </div>
   </div>

   <div
      style="margin-left: 240px; width: 1260px; height: 130px; border-bottom: 1px solid lightgrey">
      <div style="display: inline-block; margin-left: 10px">
         <h4 style="color: #04B486; display: inline-block;">${bnoList.lecCategory }.</h4>
         <div style="color: #424242; font-size: 130%;">${lecName }</div>
         <img style="display: inline-block;">
         <div
            style="display: inline-block; margin-left: 30px; font-size: 140%; margin-top: 10px; font-weight: bold;">${bnoList.title }</div>
      </div>
      <div
         style="display: inline-block; position: relative; margin-left: 1130px; bottom: 50px">
         <c:if test="${not empty userId }">
            <c:if test="${empty deleResult }">
               <div id="like"
                  style="border: 1px solid white; border-radius: 4px; width: 120px; color: white; font-weight: bolder; text-align: center; height: 40px; background-image: url('/project/resources/img/like.png'); background-size: cover;"></div>
            </c:if>
            <c:if test="${not empty deleResult }">
               <div id="likeDe"
                  style="border: 1px solid white; border-radius: 4px; width: 120px; color: white; font-weight: bolder; text-align: center; height: 40px; background-image: url('/project/resources/img/likeDe.png'); background-size: cover;"></div>
            </c:if>
         </c:if>
         <div style="color: grey; width: 300px; margin-top: 5px">
            게시일 :
            <fmt:formatDate value="${bnoList.regDate}" pattern="yyyy.MM.dd" />
         </div>
      </div>
   </div>

   <div
      style="margin-left: 240px; width: 1260px; height: 130px; border-bottom: 1px solid lightgrey">
      <div style="font-size: 130%; padding-top: 40px">
         ${bnoList.content }</div>
      <div
         style="margin-left: 240px; width: 1260px; height: 230px; border-bottom: 1px solid lightgrey">
         <div id="clickLike"
            style="background: url(resources/image/tmpFiles/${image}) center center no-repeat;border-radius: 50%; width: 60px; height: 60px; position: relative; right: 240px;top: 80px; display: inline-block;"></div>
         <div style="position: relative; top: 30px; right: 165px">
            <a
               href="yourpage?userId=${bnoList.userId }&userName=${bnoList.userName }&profile=${image}">
               <div style="font-weight: bold; font-size: 120%">${bnoList.userName }</div>
               <div style="color: grey; font-size: 90%">${bnoList.userId }</div>
            </a>
         </div>
      </div>
   </div>


   <div id="loader" style="display: none; z-index: 4;"></div>
   <div id="notClick" style="display: none; z-index: 3;"></div>
   <input type="hidden" id="start" value="1">
   <input type="hidden" id="end" value="3">


   <div class="container mt-3" style="border-bottom: 1px solid lightgrey; padding-top: 100px;">

      <form action="">
         <input type="text" id="userid" value="${userId}" readonly /> <input
            type="text" id="content" placeholder="내용을 입력" />
         <button type="button" id="btnCreate">댓글등록</button>
      </form>
      <hr />
      <!--    <div id="onReplies" style="overflow: scroll; border: 1px solid red; padding: 10px; width:1200px; height: 400px;">댓글 목록들</div> -->
      <div id="onReplies">댓글목록들</div>

   </div>



   <script>
   var checkLength = true;
   $(()=>{
      var deleResult = '${deleResult}'
      console.log(typeof deleResult);
      if(deleResult == ''){
      $("#like").click(()=>{
         $("#loader").css('display','block');
         $("#notClick").css('display','block');
         var userId = '${userId}';
         var groupBno = '${groupBno}';
         var bno = '${bno}';
         $.ajax({
            type: 'post', 
            url: '/project/like', 
            headers: {'Content-Type' : 'application/json; charset=UTF-8', 
                     'X-HTTP-Method-Override' : 'post'
                     }, 
            data: JSON.stringify({
               'groupBno' : groupBno,
               'userId' : userId,
               'bno' : bno
               
            }),
            success: function(result){
               $("#loader").css('display','none');
               $("#notClick").css('display','none');
                  if(result === 'ok'){
                     alert('수강 완료');
                     location = document.location;
                  }else{
                     alert('이미 수강 중입니다');
                  }
                  
            }
            }); // end ajacx
         
      });
      }else{
         $("#likeDe").click(()=>{
            $("#loader").css('display','block');
            $("#notClick").css('display','block');
            var userId = '${userId}';
            var groupBno = '${groupBno}';
            var bno = '${bno}';
            $.ajax({
               type: 'post', 
               url: '/project/likeDelete', 
               headers: {'Content-Type' : 'application/json; charset=UTF-8', 
                        'X-HTTP-Method-Override' : 'post'
                        }, 
               data: JSON.stringify({
                  'groupBno' : groupBno,
                  'userId' : userId,
                  'bno' : bno
                  
               }),
               success: function(result){
                  $("#loader").css('display','none');
                  $("#notClick").css('display','none');
                     if(result === 'ok'){
                        alert('수강 취소 완료');
                        location = document.location;
                     }else{
                        alert('수강 취소 실패');
                     }
                     
               }
               }); // end ajacx
            
         });
      }
      $('.item').hover(function(){
         $(this).css('background-color','#6E6E6E');
      }, function(){
         $(this).css('background-color','lightgrey');
      });
      
   });
   
    $('#like').hover(function(){
         $(this).css('border','2px solid green');
      },function(){
         $(this).css('border','none');
      });
      
      $('#likeDe').hover(function(){
         $(this).css('border','2px solid black');
         $(this).css('background-color','grey');
      },function(){
         $(this).css('border','none');
      });

// 댓글    
   $(document).ready(function(){
      
      console.log('window innerWidth: ' + window.innerWith + ', innerHeight: ' + window.innerHeight);
      console.log('window outerWidth: ' + window.outerWith + ', outerHeight: ' + window.outerHeight);
      console.log('screen width: ' + screen.width + ', height: ' + screen.height);
      console.log('jquery window height(): ' + $(window).height);
      console.log('jquery document height(): ' + $(document).height());
      
   
      $(window).scroll(function(){
         console.log(" 스크롤이 작동은 됨?!");
         if($(window).scrollTop() == $(document).height() - $(window).height()) {
            console.log("스크롤이 바닥에 닿음");   
         //   if(checkEnd == true){
            getAllReplies();
         //   checkEnd == false;
         //   }
            
            
         }            
         
      }); // window.scroll ()      
      
      
      var bno = '${bnoList.bno}';
         
      function getAllReplies(){
         
         console.log("bno = " + bno);
         var list ='';   
         var start = parseInt($('#start').val());
         var end = parseInt($('#end').val());
         $.getJSON("video?bno=" +bno + "&start="+start +"&end="+end, function(para){            
            
             start += 3;
            end += 3;
            $('#start').val(start);
            $('#end').val(end);
            console.log('start : ' +start); 
            console.log('end : ' + end);
            
            if(para.length == 0){
            if(checkLength == true){
               list += '댓글이 없습니다 '
                  $('#onReplies').html(list);   
               checkLength = false;
            }
                  
            } else {
               checkLength = false;
               $(para).each(function(){  // 데이터가 0개 이면  for 구문을 실행시킬 수가 없어서 input, button 들이 전부 생성될 수가 없음
               console.log("rno ? " + this.rno);
               var date = new Date(this.regdate);  
               var dateString = date.toLocaleDateString() + ' ' +date.toLocaleTimeString();
               $('#onReplies').append('<div id="reply-item" class="media border p-3" style="width: 80%; border:none;">'
                        + '<p id="reply-rno" style="display:inline-block" >'
                      + this.rno 
                      + '</p>'                  
                      + '<img src="/project/resources/img/test1.png" class="align-self-start mr-3" style="border-radius: 50%; width: 60px;"  />'                   
                      + '<div class ="reply-one">'
                      
                      + '<div >'
                      + '<h3>'
                      + this.userid
//                      + '</h4>'
                      + ' <small><i>'
                      + dateString 
                      + '</i></small></h3>'
                      + '</div>'              
                      + '<input id="reply-content" style="display:inline-block; border: none; width:400px; height: 100px; font-size: 120%;" value="'   
                      + this.content
                      + '"/>'
                       +'<button class ="btnUpdate" data-rno="' + this.rno + '" > 댓글 수정 </button>'
                      +'<button class ="btnDelete" data-rno="' + this.rno + '" > 댓글 삭제 </button>'                   
                      + '</div>');               
                     
                                                
        
            }) // .each
                      
            } // if-else{}
            
         }) // .getJSON
         
         

         
      } // getAllReplis()
   
      
   getAllReplies(); // 함수 호출 


      $('#btnCreate').click(function(){
         var content = $('#content').val();
         var userid = $('#userid').val();
//         var userid = ${userid};
         var a = '${bnoList.bno}';
         console.log('온라인 댓글 a : ' + a);
         $.ajax({
            type: 'post',
            url:'create',
            headers:{'Content-Type' : 'application/json', 'X-HTTP-Method-Override' : 'post'},
            data : JSON.stringify({'bno':'${bnoList.bno}', 'content':content, 'userid':userid }),
            success: function(result){
               console.log('댓글등록 성공! result = ' +result);
               
               if(result === 1) {
                  $('#content').val('');
                  console.log("btnCreate() 는 됐는데,, 대체 왜??")
                  getAllReplies();
               }
            }
         }) // .ajax
         
      }) // ('#btnCreate').click
      
   
      
/*       
      $('#onReplies').on('click', '.reply-item .reply-one .btnUp', function(){
         $('#reply-content').focus();
         $('#btnUpdate').style.visibility="visible";
         
         
      })
       */
      $('#onReplies').on('click', '#reply-item .reply-one .btnUpdate', function(){
         $('#reply-content').focus();
         var rno = $(this).attr('data-rno');
         var content = $(this).prevAll('#reply-content').val();
         
         console.log('rno = ' + rno);
         console.log('content = ' + content);
         $.ajax({
            type:'put',
            url:"update",
            headers:{'Content-Type' : 'application/json', 'X-HTTP-Method-Override': 'put'},
            data: JSON.stringify({'rno':rno, 'content':content}),
            success: function(result){
               alert(rno+'번 내용이 수정되었습니다 ')
               getAllReplies();
            }
         })
         
      }) // btnUpdate
      
      
       $('#onReplies').on('click', '#reply-item .reply-one .btnDelete', function(){
//         var rno = $(this).prevAll('#rno').val();
         var rno = $(this).attr('data-rno');
         console.log("rno j= " + rno);
         console.log("type of rno= "+ typeof rno);
         $.ajax({
            type:'delete' ,
            url: "delete",
            headers:{'Content-Type' : 'application/json', 'X-HTTP-Method-Override': 'delete'},
            data:JSON.stringify({'rno':rno, 'content' : 'dd'}),
            success: function(){
               confirm(rno+' 번을 삭제하시겠습니까?')
               getAllReplies();
            }
         })
         
         
      }) // btnDelete
          
         
         

   })   


   $('#like').hover(function(){
      $(this).css('border','2px solid green');
   },function(){
      $(this).css('border','none');
   });
   
   $('#likeDe').hover(function(){
      $(this).css('border','2px solid black');
      $(this).css('background-color','grey');
   },function(){
      $(this).css('border','none');
   });

   
   </script>




   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Plugin JavaScript -->

   <script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
   <script
      src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

   <!-- Custom scripts for this template -->
   <script src="resources/js/main/creative.js"></script>

</body>




</html>