<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/mainview.css" type="text/css/" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>




<style>
#map {
	height: 400px;
	width: 100%;
}
</style>

<script>
	function imagepreview(input) {
		if (input.files && input.files[0]) {
			var filerd = new FileReader();
			filerd.onload = function(e) {
				$("#imgpreview").attr('src', e.target.result);
			};
			filerd.readAsDataURL(input.files[0]);
		}
	}
	// i mention $ symbol before function so its not identified by onchange;
	
	
	$(document).ready(function() {
	
		  $('#datepicker').datepicker({
			  
			  });
	
	
	});
	
</script>
</head>


<body>

	<div class="page-header"><jsp:include page="header.jsp"></jsp:include></div>


	<div class="container" style="padding-top: 30px; width: 1200px;">


		<!--  지도 , 폴더 목록  -->
		<div class="container-fluid" style="padding-top: 50px;">
			<div class="row" style="height: 420px; padding-top: 20px;">
				<div class="col-sm-6">


					<div class="row">
						<div class="col-sm-10">
							<!--  	<h5 class="text-warning" id="location">${bnoList.location }</h5> -->
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div id="map"></div>
				</div>

				<div class="col-sm-3" style="padding-top: 40px; padding-right: 10px;">
					<div id="datepicker"></div>
					<!-- 모임날짜  -->
					<div class="col-sm-12">
						<h5 id="dateandmeet"
							style="width: 100%; font-size: 17px; border-style: solid; border-color: gray; text-align: center;">${mday}<br />
							${mtime}
						</h5>
					</div>
				</div>

				<!--  폴더 목록 -->
				<div class="col-sm-3" style="padding-right: 20px;">
					<%
						int a = 1;
					%>
					<div
						style="display: inline-block; width: 400px; bottom: 340px; margin-bottom: 50px; bottom: 0px; position: relative; margin-left: 30px;">
						<div
							style="background-color: #424242; font-weight: bold; color: white; font-size: 135%; padding: 22px; position: relative;">${lecName }</div>
						<div style="width: 400px; height: 330px; overflow: scroll;">
							<c:if test="${not empty groupBnoList }">
								<c:forEach var="group" items="${groupBnoList }">
									<c:if test="${group.title != bnoList.title }">
										<a href="offDetail?groupBno=${groupBno}&bno=${group.bno}&lecName=${lecName}"
											style="color: black">
											<div class="item" style="padding: 10px; background-color: lightgrey">
												<%=a%>
												<img src="/project/resources/image/offline/${group.imgPath }" width="90px" height="50px">
												<div style="display: inline-block; margin-bottom: 10px">${group.title }</div>
											</div>
										</a>
									</c:if>
									<c:if test="${group.title == bnoList.title }">
										<div style="padding: 10px; background-color: #E6E6E6">
											<img src="/project/resources/img/this.png" width="" height=""> <img
												src="/project/resources/image/offline/${group.imgPath }" width="90px" height="50px">
											<div style="display: inline-block; margin-bottom: 10px; font-weight: bold;">${group.title }</div>
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
			</div>
		</div>

		<hr />

		<!--  카테고리 대제목,소제목 -->
		<div class="container-fluid" style="margin-top: 10px;">
			<div class="row" style="height: 100px;">
				<div class="col-sm-6">
					<div class="col-sm-10" style="height: 20px;">
						<div class="row">

							<label class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">${bnoList.category}</label>
						</div>
					</div>
					<div class="col-sm-10" style="height: 30px;">
						<div class="row" style="margin-top: 10px;">
							<h5 style="padding-left: 30px; color: gray;">${lecName}</h5>
						</div>
					</div>
					<div class="col-sm-10">
						<div class="row" style="margin-top: 10px;">
							<h4 id="title" style="padding-left: 100px; color: rgb(33, 33, 33);">${bnoList.title }</h4>
						</div>
					</div>
				</div>
				<div class="col-sm-6" style="padding-bottom: 100px;">
					<!-- 수강인원   -->
					<div class="row" style="padding-left: 60%;">
						<h5 id="maxmember" style="font-size: 13px; padding-top: 30px;">모집인원
							${bnoList.curmember}/${bnoList.maxmember}</h5>
					</div>
					<!-- 수강신청 로직  -->
					<div class="row" style="padding-left: 60%;">
						<div>
							<c:if test="${userId eq bnoList.userid}">
								<c:if test="${bnoList.curmember eq bnoList.maxmember}">
									<input type="button" id="applyManager" value="모집마감하기" class="form-control"
										name="applyManager" style="background-color: rgb(22, 160, 133); color: white;">
								</c:if>
								<form action="offLecDelete" method="post">
									<input type="submit" id="cancelManager" value="강의취소하기(해당글 삭제)" class="form-control"
										name="cancelManager" style="background-color: rgb(22, 160, 133); color: white;"> <input
										type="hidden" id="deletebno" name="deletebno" value="${bnoList.bno }">
								</form>
							</c:if>


							<c:if test="${userId ne bnoList.userid}">

								<c:choose>
									<c:when test="${waitOK == 2 and applyOK == 4}">
										<input type="button" id="apply" value="신청" class="form-control" name="apply"
											style="background-color: rgb(22, 160, 133); color: white;">
									</c:when>
									<c:when test="${waitOK == 1}">
										<input type="button" id="applywait" value="신청수락 대기중" class="form-control" name="applywait"
											style="background-color: rgb(22, 160, 133); color: white;">
									</c:when>
									<c:when test="${applyOK == 3}">
										<h5>${userId}님수강신청완료!</h5>
									</c:when>

								</c:choose>
							</c:if>
						</div>
					</div>


				</div>

			</div>
		</div>


		<hr />
		<!--  신청자  -->
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<div class="row">

							<label for="member" class="control-label"
								style="font-size: 20px; color: rgb(22, 160, 133); padding-left: 15px; padding-top: 5px;">신청자</label>
							<h5 style="padding-left: 10px; margin-bottom: 20px;">
								<c:choose>
									<c:when test="${waitListCount eq null}"> 0 명  </c:when>
									<c:when test="${waitListCount ne 0}"> ${waitListCount}명  </c:when>
								</c:choose>
							</h5>
						</div>
						<div class="col-sm-12" style="padding-top: 10px;">
							<div id="waitingMemberCount"></div>
							<div id="waitingMember">
								<c:forEach var="item" items="${waitList }">
									<div class="row" id="applyDiv">
										<div class="col-sm-10">
											<div data-text-content="true"
												style="background-color: rgb(250, 250, 250); border-width: 0px; border-style: none; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 1px 1px 4px 0px; width: 288px; height: 80px;">
												<div data-image-content="true"
													style="background-image: url(/static/imagefarm/100072178/rBl7h5c3wnlQg0PoMeCqnb8AOiDXQVOh);"></div>

												<div data-text-content="true"
													style="font-weight: bold; font-size: 16px; color: rgb(33, 33, 33); padding-left: 60px; padding-top: 13px;"
													class="">
													${item}
													<c:if test="${userId ne bnoList.userid}">
														<c:choose>
															<c:when test="${waitOK == 1}">
																<input type="button" value="대기"
																	style="background-color: rgb(22, 160, 133); color: white; margin-left: 120px;">
															</c:when>
															<c:when test="${applyOK == 3}">
																<input type="button" value="선택"
																	style="background-color: rgb(255, 255, 255); color: white; margin-left: 120px;">
															</c:when>
														</c:choose>
													</c:if>

												</div>
												<div style="padding-left: 60px; font-size: 12px;">
													<div class="row">
														wendy@redvelvet.com
														<c:if test="${userId eq bnoList.userid}">
															<button type="button" name="btnYes" id="btnYes"
																style="margin-left: 70px; margin-bottom: 20px;">수락</button>
														</c:if>
													</div>
												</div>

											</div>

										</div>
										<div class="col-sm-2">
											<input type="hidden" name="itemBno" id="itemBno" value="${bnoList.bno}"> <input
												type="hidden" name="itemId" id="itemId" value="${item }"> <input type="hidden"
												name="itemMax" id="itemMax" value="${bnoList.maxmember}"> <input type="hidden"
												name="itemCur" id="itemCur" value="${bnoList.curmember}">

										</div>
									</div>
								</c:forEach>


							</div>
							<input type="hidden" name="waitList" id="waitList" value="${bnoList.waitingId}">
						</div>
					</div>
				</div>

			</div>
		</div>


		<hr />
		<!--  강의내용 -->
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="content" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">강의내용</label>
						<div class="col-sm-12" style="padding-top: 10px;">

							<p style="height: 200px; border: 1px;">${bnoList.content}</p>
						</div>
					</div>
				</div>

			</div>
		</div>


		<hr />
		<!--  선생님 -->
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-6">
					<div class="form-group" style="padding-top: 5px;">
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">선생님</label>
						<div class="col-sm-12" style="padding-top: 10px;">
							<a href="yourpage?userId=${memberId}&userName=${memberName}">
								<div style="font-weight: bold; font-size: 120%">${memberName}</div>
								<div style="color: grey; font-size: 90%; padding-left: 20px;">${memberId}</div>

							</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div style="padding-top: 50px; padding-left: 320px;">

						<button type="button" class="btn btn-default btn-sm"
							onclick="location.href='yourpage?userId=${memberId}&userName=${memberName}' ">
							<span class="glyphicon glyphicon-edit"></span> 선생님의 칠판
						</button>

					</div>
				</div>

			</div>
		</div>


		<hr />
		<!--  댓글  -->
		   <div id="loader" style="display: none; z-index: 4;"></div>
   			<div id="notClick" style="display: none; z-index: 3;"></div>
   			<input type="hidden" id="start" value="1">
   			<input type="hidden" id="end" value="3">
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="comment" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">댓글</label>
						<div class="col-sm-12" style="padding-top: 10px;">

							<div class="container mt-3" style="border-bottom: 1px solid lightgrey; padding-top: 100px;">

								<form action="">
									<input type="text" id="userid" value="${userId}" readonly /> <input type="text"
										id="content" placeholder="내용을 입력" />
									<button type="button" id="btnCreate">댓글등록</button>
								</form>
								<hr />
								<!--    <div id="offReplies" style="overflow: scroll; border: 1px solid red; padding: 10px; width:1200px; height: 400px;">댓글 목록들</div> -->
								<div id="offReplies">댓글목록들</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--  끝!! 밑에는 Hidden 이다  -->
		<div class="col-sm-12" style="height: 100px;">
			<div class="form-group">
				<input type="hidden" name="lat" id="lat" value=""> <input type="hidden" name="long1"
					id="long" value=""> <input type="hidden" name="groupBno" id="groupBno" value="${bno}">

			</div>
		</div>



	</div>

	<!--  오프라인강의 스크립트      -->
	<script type="text/javascript">
	
		
		
		function initMap() {
			var latitude = Number(${lat});
			var longitude = Number(${long1});

			var seoul = {
					lat : latitude,
					lng : longitude	
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 17,
				center : seoul
			});
			// 마커설정
			var marker = new google.maps.Marker({
				position : seoul,
				title : "모임장소 입니다."
			});
			// 마커추가
			marker.setMap(map);
		}
		
		$('#apply').click(function(){
			var userId = '${userId}'; 
			var bno = '${bnoList.bno}';
			$.ajax({
				type : 'put',
				url : '/project/apply',
				headers: {'Content-Type' : 'application/json; charset=UTF-8', 
					'X-HTTP-Method-Override' : 'put'
					}, 
				data: JSON.stringify({
						'userid' : userId,
						'bno' : bno
						
					}),
				success: function(result){		
							console.log('신청자 결과 : ' + result);
														
							if(result){
								alert(userId+'님 수강 신청 완료');
								jQuery('#apply').hide();						
							}else{
								alert('수강 신청 실패');
							}
							
							
							var list='';
							var listCount='';
							$(result).each(function(index,item){
																		
								list += '<div class="row">'
											+'<div class="col-sm-8" style="padding-left:20px;">'
												+ '<h3>'+item+'</h3>' 
											+'</div>'
											+'<div class="col-sm-4">'
											+'<c:if test="${userId eq bnoList.userid}">'
												+'<button>수락</button>'
											+'</c:if>'
											+'</div>'
										+ '</div>'	
							});
							$(result).each(function(index,item){
								var count = index+1;
								listCount ='<h4> 현재 신청자수 '+count+'명</h4>'
							});
							$('#waitingMember').html(list);
							$('#waitingMemberCount').html(listCount);								
					}
			});	// end ajax	
			
		}); // end apply
		
		$('#waitingMember').on('click','.row .col-sm-4 #btnYes',function(){
			console.log('수락버튼클릭');		
			
			var bno = $(this).prevAll('#itemBno').val();
			var userid = $(this).prevAll('#itemId').val();	
			var maxmember = $(this).prevAll('#itemMax').val();
			var curmember = $(this).prevAll('#itemCur').val();
			
			console.log('신청한 강의'+bno+'번   신청자: '+userid+', 최대수강인원:'+maxmember+',현재 수강인원:'+curmember);
			
			
			$.ajax( {	// ajax ? 함수 호출 하겠다!!!!   그래서 오브젝트를 만들어야 하는데 그것들이 밑의 기능 
				// 오브젝트 하나에 매개변수를 준다. 
				type: 'post', // 요청방식
				url : '/project/confirm', // 요청주소 
				headers: { 'Content-Type':'application/json',
						   'X-HTTP-Method-Override':'post'  // PUT 이나 DELETE 는 꼭 post 방식을 줘야함 
						 } , // 요청 헤더 (request header)
				// 서버로 보낼 JSON 객체의 문자열   // 함수를 호출해서 데이터를 가져오겠다.
				data: JSON.stringify({'bno':bno,
								      'userid':userid ,
									  'maxmember':maxmember,
									  'curmember':curmember}) , // 오브젝트를 하나 만들어준것.
				success: function (result) {	// 결과가 왔을 때 실행해줄 콜백함수 
					console.log('선생님의 수락여부 결과 : ' + result );
					if( result === 1){
						alert(userid+'학생 수락 완료');
						jQuery('#applyDiv').hide();
					}else{
						alert(bno+'번 강의의 현재 신청인원이 꽉 찼습니다.');
					}
				}  // 서버에서 HttpStatus.OK 응답이 왔을 때 실행시킬 콜백 함수
			}); // end ajax
			
			
			
		});
		$('#cancelManager').click(function(){
			alert('강의가 취소되었습니다.');
		});
		

			jQuery.browser = {};
            (function() {
               jQuery.browser.msie = false;
               jQuery.browser.version = 0;
               if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                  jQuery.browser.msie = true;
                  jQuery.browser.version = RegExp.$1;
               }
            })();           
            
	</script>


	<!--  댓글 스크립트 -->
	<script type="text/javascript">
	  
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
    $.getJSON("offDetail2?bno=" +bno + "&start="+start +"&end="+end, function(para){            
       
        start += 3;
       end += 3;
       $('#start').val(start);
       $('#end').val(end);
       console.log('start : ' +start); 
       console.log('end : ' + end);
       
       if(para.length == 0){
       if(checkLength == true){
          list += '댓글이 없습니다 '
             $('#offReplies').html(list);   
          checkLength = false;
       }
             
       } else {
          checkLength = false;
          $(para).each(function(){  // 데이터가 0개 이면  for 구문을 실행시킬 수가 없어서 input, button 들이 전부 생성될 수가 없음
          console.log("rno ? " + this.rno);
          var date = new Date(this.regdate);  
          var dateString = date.toLocaleDateString() + ' ' +date.toLocaleTimeString();
          $('#offReplies').append('<div class ="media border p-3" style="width: 80%; border:none;">'
                   + '<p id="reply-rno" style="display:inline-block" >'
                 + this.rno 
                 + '</p>'                  
                 + '<img src="/project/resources/img/test1.png" class="align-self-start mr-3" style="border-radius: 50%; width: 60px;"  />'                   
                 + '<div class ="reply-one">'
                 
                 + '<div >'
                 + '<h3>'
                 + this.userid
//                 + '</h4>'
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
//    var userid = ${userid};
    var a = '${bnoList.bno}';
    console.log(' 오프라인 댓글 a : ' + a);
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
 $('#offReplies').on('click', '.reply-item .reply-one .btnUp', function(){
    $('#reply-content').focus();
    $('#btnUpdate').style.visibility="visible";
    
    
 })
  */
 $('#offReplies').on('click', '.media border p-3 .reply-one .btnUpdate', function(){
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
 
 
  $('#offReplies').on('click', '.media border p-3 .reply-one .btnDelete', function(){
//    var rno = $(this).prevAll('#rno').val();
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

	
	</script>


	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>
</body>


</html>















