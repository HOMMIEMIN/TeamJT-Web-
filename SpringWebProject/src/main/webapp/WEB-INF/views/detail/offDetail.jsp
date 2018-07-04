<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta  charset="UTF-8">
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

		$("#datepicker1").datepicker(
				{
					inline : true,
					sidebySide : true,
					dateFormat : 'yy년 mm월 dd일 ',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					yearSuffix : '년' 
					

				});

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
</script>



</head>
<body>

		<h1>강좌 제목 :  ${lecName}</h1>

	<div class="container" style="padding-top: 30px;">

		
			<div class="container-fluid">
				<div class="row" style="height: 250px;">
					<div class="col-sm-4" >
						<div class="form-group">
						<img src="${pageContext.request.contextPath}/resources/image/offline/${bnoList.imgPath }" id="imgpreview" style=" width: 100%; height: 100%;" />

						</div>
					</div>
					<div class="col-sm-8" >
						<div class="form-group" style="padding-top: 50px;">
							<label for="category" class="col-sm-2 control-label" style=" font-size: 30px; color:rgb(22, 160, 133); ">${bnoList.category}.</label>
							<div class="col-sm-10">
							<label for="foldername" class="control-label" style="padding-top: 5px; font-size: 20px;">${lecName}</label>
							</div>
							<div class="form-group">
								
								<div class="col-sm-10"style="padding-top: 10px;">
									<input type="text" class="form-control" id="title" name="title" placeholder="소제목을 입력해주세요."
										value="${bnoList.title }"  readonly="readonly">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<hr/>
			<div class="container-fluid">

				<div class="row" style="height: 450px; padding-top: 5px;">
					<div class="col-sm-8" >
						<div class="row" style="padding-bottom: 10px;">
							<div class="col-sm-10">
							<input type="text" class="form-control form-join" id="location" name="location" value="${bnoList.location }" readonly="readonly">
							</div>
							<div class="col-sm-2">
							    
							</div>
						</div>
						
							<div id="map"></div>
						


					</div>
					<div class="col-sm-4" >
						<div class="form-group" style="padding-top: 90px;">
							<label for="meetingday" class="control-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">모임 날짜</label>
							<div class="col-sm-10">
							
								<input type='text' class="form-control" id="datepicker1" name="meetingday" value="${bnoList.meetingday}" readonly="readonly"/>
							</div>
						</div>
						<div class="form-group" style="padding-top: 30px;">
							<label for="meetingtime" class="conrol-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">모임 시간</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="timepicker1" name="meetingtime" value="${bnoList.regdate}" readonly="readonly" />
							</div>


						</div>						
						<div class="form-group" style="padding-top: 30px;">
							<label for="maxmember" class="control-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">수강최대인원</label>
							<div class="row" style="padding-left: 60%;">
								<div>
									<input type="text" class="form-control" id="maxmember" name="maxmember" value="${bnoList.maxmember }" readonly="readonly"
										onkeydown="onlyNumber(this)" style="width:50px;">
								</div>
								<div style="padding-top: 8px;">명</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<hr/>
			<div class="container-fluid">

				<div class="row" style="padding-top: 5px;">
					<div class="col-sm-12" >
						<div class="form-group" style="padding-top: 5px; ">
							<label for="content" class="control-label"style=" font-size: 20px; color:rgb(22, 160, 133); ">강의내용 작성</label>
							<div class="col-sm-12" style="padding-top: 10px;">
								<textarea class="form-control" id="content" rows="4" name="content" style="height: 300px;" readonly="readonly">${bnoList.content}</textarea>
							</div>
						</div>
					</div>

				</div>
			</div>
			
				<div class="col-sm-12" style=" height : 100px;" >
					<div class="form-group">
						
							<input type="submit" value="수강신청" class="form-control" style="background-color:rgb(22, 160, 133); color: white; ">
							 <input type="hidden" name="lat" id="lat" value="">
							 <input type="hidden" name="long1" id="long" value="">
							 <input type="hidden" name="groupBno" id="groupBno" value="${bno}">
							 
						
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
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>
	<script type="text/javascript">
		$('#maxmember').keyup(function() {
			this.value = this.value.replace(/[^0-9]/g, '');
		});

	</script>

	


</body>
</html>