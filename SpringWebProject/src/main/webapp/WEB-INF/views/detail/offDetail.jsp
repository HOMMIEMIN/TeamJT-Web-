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

	<h1>강좌 제목 : ${lecName}</h1>

	<div class="container" style="padding-top: 30px;">


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
							<h5 class="text-warning" id="location">${bnoList.location }</h5>
						</div>
						<div class="col-sm-2"></div>
					</div>

					<div id="map"></div>



				</div>
				<div class="col-sm-4">
					<div class="form-group" style="padding-top: 80px;">
						<label for="meetingday" class="control-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">모임 날짜</label>
						<div class="col-sm-10">
							<div style="padding-left: 22%;">
								<h5 id="datepicker1" class="text-warning">${mday}</h5>
							</div>
						</div>
					</div>
					<div class="form-group" style="padding-top: 30px;">
						<label for="meetingtime" class="conrol-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">모임 시간</label>
						<div class="col-sm-10">
							<div style="padding-left: 55%;">
								<h5 id="meetingtime" class="text-warning">${mtime}</h5>
							</div>
						</div>


					</div>
					<div class="form-group" style="padding-top: 30px;">
						<label for="maxmember" class="control-label"
							style="font-size: 20px; color: rgb(22, 160, 133);">수강가능인원</label>
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
						<input type="button" id="applyManager" value="신청관리페이지로 이동" class="form-control" name="applyManager"
									style="background-color: rgb(22, 160, 133); color: white;">
							 </c:if>
							 
								<input type="button" id="apply" value="신청" class="form-control" name="apply"
									style="background-color: rgb(22, 160, 133); color: white;">
								<input type="button" id="applywait" value="신청수락 대기중" class="form-control" name="applywait"
									style="background-color: rgb(22, 160, 133); color: white;">
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
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">선생님</label>
						<div class="col-sm-12" style="padding-top: 10px;">
							<p style="height: 50px; border: 1px;" id="member">선생님 정보 & 칠판</p>
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
				<input type="hidden" name="waitList" id="waitList" value="${bnoList.waitingId}">
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
				url : '/project/detail/apply',
				headers: {'Content-Type' : 'application/json; charset=UTF-8', 
					'X-HTTP-Method-Override' : 'put'
					}, 
				data: JSON.stringify({
						'userid' : userId,
						'bno' : bno
						
					}),
				success: function(result){		
							console.log('신청자 결과 : ' + result);
							if(result === 1){
								alert('수강 신청 완료');
								jQuery('#apply').hide();
								
							}else{
								alert('수강 신청 실패');
							}	
					}
			});	// end ajax
			
			



			
		}); // end apply
	</script>
	
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>









</body>
</html>















