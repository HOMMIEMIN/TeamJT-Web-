<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/css/mainview.css" type="text/css/" />
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>
#map {
	height: 400px;
	width: 100%;
}
</style>

<script>
	$(function() {


	});
	$(function() {
		$("#timepicker1").timepicker({
			timeFormat : 'h:mm p',
			interval : 30,
			minTime : '30',
			maxTime : '11:59pm',
			
			startTime : '10:00',
			dynamic : true,
			dropdown : true,
			scrollbar : true
		});
	});
	
	
	
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
	
	$(function(){
		
		
		
	});
</script>



</head>
<body>
	
	

	<div class="container" style="padding-top: 30px;">
<jsp:include page="header.jsp"></jsp:include>
<h1>강좌 제목 : ${lecName}</h1>
		<div class="container-fluid">
			<div class="row" style="height: 350px;">
				<div class="col-sm-4">
					<div class="form-group">
						<img src="${pageContext.request.contextPath}/resources/image/offline/${bnoList.imgPath }"
							id="imgpreview" style="width: 100%; height: 100%;" />

					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group" style="padding-top: 50px;">

						<div class="col-sm-10">
							<label for="category" class="col-sm-4 control-label"
								style="font-size: 20px; color: rgb(22, 160, 133);">카테고리</label>
							<h4>${bnoList.category}</h4>
						</div>
						<div class="col-sm-10">
							<label for="foldername" class="col-sm-4 control-label"
								style="padding-top: 5px; font-size: 20px; color: rgb(22, 160, 133);">강좌</label>
							<h4>${lecName}</h4>
						</div>
						<div class="form-group">
							<div class="col-sm-10" style="padding-top: 10px;">
								<label for="title" class="col-sm-4 control-label"
									style="padding-top: 5px; font-size: 20px; color: rgb(22, 160, 133);">강의제목</label>
								<h4 class="text-warning" id="title">${bnoList.title }</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="container-fluid">

			<div class="row" style="height: 550px; padding-top: 5px;">
				<div class="col-sm-8">
					<label for="location" style="font-size: 20px; color: rgb(22, 160, 133);">모임 장소</label>
					<div class="row" style="padding-bottom: 10px;">
						<div class="col-sm-10">							
						<!--  	<h5 class="text-warning" id="location">${bnoList.location }</h5> -->
						</div>
						<div class="col-sm-2"></div>
					</div>

					<div id="map"></div>



				</div>
				<div class="col-sm-4">
					<div class="form-group" style="padding-top: 50px;">
						<label for="meetingday" class="control-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">모임 날짜</label>
						<div class="col-sm-10">
							<div style="padding-left: 22%;">
								<h5 id="datepicker1" class="text-warning">${mday}</h5>
							</div>
						</div>
					</div>
					<div class="form-group" style="padding-top: 15px;">
						<label for="meetingtime" class="conrol-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">모임 시간</label>
						<div class="col-sm-10">
							<div style="padding-left: 55%;">
								<h5 id="meetingtime" class="text-warning">${mtime}</h5>
							</div>
						</div>


					</div>
					<div class="form-group" style="padding-top: 15px;">
						<label for="maxmember" class="control-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">수강인원</label>
						<div class="row" style="padding-left: 60%;">
							<div>
								<h5 id="maxmember" class="text-warning"> ${bnoList.curmember} / ${bnoList.maxmember} 명</h5>
							</div>
						</div>
					</div>
										
					<div class="form-group" style="padding-top: 30px;">
						<label for="apply" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">수강신청</label>
						<div class="row" style="padding-left: 60%;">
							<div>
							<c:if test="${userId eq bnoList.userid}">
								<c:if test="${bnoList.curmember eq bnoList.maxmember}">
							<input type="button" id="applyManager" value="모집마감하기" class="form-control" name="applyManager" style="background-color: rgb(22, 160, 133); color: white;">
							</c:if>
						<form action="offLecDelete" method="post">
						<input type="submit" id="cancelManager" value="강의취소하기(해당글 삭제)" class="form-control" name="cancelManager" style="background-color: rgb(22, 160, 133); color: white;">
						<input type="hidden" id="deletebno" name="deletebno" value="${bnoList.bno }" >
						</form>
							 </c:if>
							 
							 
							 <c:if test="${userId ne bnoList.userid}">
							 
								 <c:choose>
		    						<c:when test="${waitOK == 2 and applyOK == 4}">
		        							<input type="button" id="apply" value="신청" class="form-control" name="apply" style="background-color: rgb(22, 160, 133); color: white;">
		    						</c:when>
		    						<c:when test="${waitOK == 1}">
											<input type="button" id="applywait" value="신청수락 대기중" class="form-control" name="applywait" style="background-color: rgb(22, 160, 133); color: white;">					         
								    </c:when>
								    <c:when test="${applyOK == 3}">
											<h4>${userId}님 수강신청 완료되었습니다!</h4>					         
								    </c:when>
								    
								</c:choose>				
							</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">신청자</label>
						<div class="col-sm-12" style="padding-top: 10px;">
							<div id="waitingMemberCount"> </div>
							<div id="waitingMember">	
							 	<h4>현재 신청자수 ${waitListCount}명 </h4>
							<c:forEach var="item" items="${waitList }">
							 	<div class="row" id="applyDiv">
							 		<div class="col-sm-3">${item }</div>
							 		<div class="col-sm-4" >
							 			<input type="hidden" name="itemBno" id="itemBno" value="${bnoList.bno}">
							 			<input type="hidden" name="itemId" id="itemId" value="${item }">
							 			<input type="hidden" name="itemMax" id="itemMax" value="${bnoList.maxmember}">
							 			<input type="hidden" name="itemCur" id="itemCur" value="${bnoList.curmember}">
							 			<c:if test="${userId eq bnoList.userid}">
							 			<button type="button" name="btnYes" id="btnYes">수락</button>		
							 			</c:if>					 			
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
		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">선생님</label>
						<div class="col-sm-12" style="padding-top: 10px;">
							<a href="yourpage?userId=${memberId}&userName=${memberName}">
							 <div style="font-weight: bold; font-size: 120%">${memberName}</div>
							 <div style="color: grey; font-size: 90%">${memberId}</div>
							 </a>
						</div>
					</div>
				</div>

			</div>
		</div>
		<hr />
		<div class="container-fluid">

			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="content" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">강의내용</label>
						<div class="col-sm-12" style="padding-top: 10px;">

							<p style="height: 300px; border: 1px;" id="content">${bnoList.content}</p>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-sm-12" style="height: 100px;">
			<div class="form-group">
				<input type="hidden" name="lat" id="lat" value=""> 
				<input type="hidden" name="long1" id="long" value=""> 
				<input type="hidden" name="groupBno" id="groupBno" value="${bno}">
				
			</div>
		</div>

	<hr/>
		<div class="container-fluid">

			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-12">
					<div class="form-group" style="padding-top: 5px;">
						<label for="comment" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">댓글</label>
						<div class="col-sm-12" style="padding-top: 10px;">

							<p style="height: 300px; border: 1px;" id="comment">댓글 창</p>
						</div>
					</div>
				</div>
			</div>
		</div>



	<%int a= 1; %>
	<div style="display: inline-block;width: 400px;bottom: 380px; margin-bottom: 10px; bottom: 0px;position: relative;">
	<div style="background-color: #424242; font-weight: bold; color: white; font-size: 135%; padding: 22px; position: relative;">${lecName }</div>
	<div style="width:400px; height:410px;overflow:scroll;">
	<c:if test="${not empty groupBnoList }">
	<c:forEach var="group" items="${groupBnoList }">
	<c:if test="${group.title != bnoList.title }">
	<a href="offDetail?groupBno=${groupBno}&bno=${group.bno}&lecName=${lecName}" style="color: black">
	<div class="item" style="padding: 10px; background-color: lightgrey">
	<%=a %>      <img src="/project/resources/image/tmpFiles/${group.imgPath }" width="90px" height="50px">
	<div style="display: inline-block; margin-bottom: 10px">${group.title }</div>
	</div>
	</a>		
	</c:if>
	<c:if test="${group.title == bnoList.title }">	
	<div  style="padding: 10px; background-color: #E6E6E6">
	<img src="/project/resources/img/this.png" width="" height="">      <img src="/project/resources/image/tmpFiles/${group.imgPath }" width="90px" height="50px">
	<div style="display: inline-block; margin-bottom: 10px; font-weight: bold;">${group.title }</div>
	</div>
	</c:if>
	<%a++; %>
	</c:forEach>
	</c:if>
	</div>
	</div>
	
	
	


	</div>

	<!--  지도     -->
	<script type="text/javascript">
		function initMap() {

			var latitude = Number(${lat});
			var longitude = Number(${long1});

			var seoul = {
					lat : latitude,
					lng : longitude
					
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
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
				
				// 다른 처리를 하다가 요청이 왔을 떄 처리해줄 CallBack 함수 OK 가 왔을때만 요청을 처리함. success 외에 error 등 다른것들 많음
																				// 우리는 다 OK 를 보냈기 떄문에 success사용
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
		

		
	</script>
	
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>









</body>
</html>















