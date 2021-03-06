<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>오프라인 강의 업로드 페이지</title>

<style>
#map {
	height: 400px;
	width: 100%;
}
</style>

<script>
	$(function() {

		 $('#datepicker').datepicker({
	       		altField : '#datepicker1',			
				dateFormat : 'yy년 mm월 dd일 ',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',	'8월', '9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				minDate : 0,
				yearSuffix : '년' 
	    });
	});
	$(function() {
		$("#timepicker1").timepicker({
			timeFormat : 'hh시mm분',
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
	<h1>강의업로드</h1>

	<div class="container" style="padding-top: 30px;">

		<form method="post" action="offline/register1" enctype="multipart/form-data">
			<div class="container-fluid">
				<div class="row" style="height: 250px;">
					<div class="col-sm-4" >
						<div class="form-group">
						<img src="/project/resources/img/uploadimage.png" id="imgpreview" style=" width: 100%; height: 100%;" />
						<div class="form-group">
							<input type="file" name="imgPath" onchange="imagepreview(this);" id="hide" style="display:none;"/>
						</div>
						</div>
					</div>
					<div class="col-sm-8" >
						<div class="form-group" style="padding-top: 50px;">
							<label for="category" class="col-sm-2 control-label" style=" font-size: 30px; color:rgb(22, 160, 133); ">${lecCategory}.</label>
							<div class="col-sm-10">
							<label for="foldername" class="control-label" style="padding-top: 5px; font-size: 20px;">${lecName}</label>
							</div>
							<div class="form-group">
								
								<div class="col-sm-10"style="padding-top: 10px;">
									<input type="text" class="form-control" id="title" name="title" placeholder="소제목을 입력해주세요."
										value="" >
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<hr/>
			<div class="container-fluid">

				<div class="row" style="height: 550px; padding-top: 5px;">
					<div class="col-sm-8" >
						<div class="row" style="padding-bottom: 10px;">
							<div class="col-sm-10">
							<input type="text" class="form-control form-join" id="location" name="location" placeholder="모임장소를 입력해주세요.">
							</div>
							<div class="col-sm-2">
							<button type="button" name='subject' class="btn btn-default" id='btn-mapchange' value='trans' style="background-color:rgb(22, 160, 133); "><span class="glyphicon glyphicon-search"></span> 장소검색</button>    
							</div>
						</div>
						
							<div id="map"></div>
						


					</div>
					<div class="col-sm-4" >
						<div class="form-group" style="padding-top: 30px;">
							<label for="meetingday" class="control-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">모임 날짜</label>
							<div class="col-sm-10">
								<div id="datepicker"></div>
								<input type='text' class="form-control" id="datepicker1" name="meetingday" placeholder="${serverTime1}"/>
							</div>
						</div>
						<div class="form-group" style="padding-top: 30px;">
							<label for="meetingtime" class="conrol-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">모임 시간</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="timepicker1" name="meetingtime" placeholder="${serverTime2}" />
							</div>


						</div>						
						<div class="form-group" style="padding-top: 30px;">
							<label for="maxmember" class="control-label" style=" font-size: 20px; color:rgb(22, 160, 133); ">수강인원</label>
							<div class="row" style="padding-left: 60%;">
								<div>
									<input type="text" class="form-control" id="maxmember" name="maxmember" placeholder="0"
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
								<textarea class="form-control" id="content" rows="4" name="content" style="height: 300px; "></textarea>
							</div>
						</div>
					</div>

				</div>
			</div>
			
				<div class="col-sm-12" style=" height : 100px;" >
					<div class="form-group">
						
							<input type="submit" value="업로드" class="form-control" style="background-color:rgb(22, 160, 133); color: white; "> <input type="hidden"
								name="lat" id="lat"> <input type="hidden" name="long1" id="long" > <input type="hidden" name="groupBno" id="groupBno" value="${bno}">
								<input type="hidden" name="userId" id="userId" value="${userId}">
								<input type="hidden" name="lecCategory" id="lecCategory" value="${lecCategory}">
						
					</div>
				</div>
			
		</form>

	</div>


	<!--  지도     -->
	<script type="text/javascript">
		function initMap() {
			var latitude = 37.49953;
			var longitude = 127.03152;

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
				title : "Hello Marker"
			});

			// 마커추가
			marker.setMap(map);

		}

		function reloadMap(lat, lng) {
			var latitude = Number(lat);
			var longitude = lng;

			var mark = {
				lat : latitude,
				lng : longitude
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : mark
			});
			// 마커설정
			var marker = new google.maps.Marker({
				position : mark,
				title : "Hello Marker"
			});

			// 마커추가
			marker.setMap(map);
		}

		$('#btn-mapchange').click(
				function() {
					var adress_text = $('#location').val();

					var trans_objeect = {
						'location' : adress_text
					}
					var trans_json = JSON.stringify(trans_objeect); // json으로 변환

					$.ajax({
						url : "http://localhost:8181/project/offline/register",
						type : 'POST',
						dataType : 'json',
						data : trans_json,
						contentType : 'application/json',
						mimeType : 'application/json',
						success : function(retVal) {
							console.log(retVal);
							console.log("retVal lat : " + retVal.latitude
									+ "retVal long : " + retVal.longitude);
							reloadMap(retVal.latitude, retVal.longitude);
							$('#lat').val(retVal.latitude);
							$('#long').val(retVal.longitude);

						},
						error : function(retVal, status, er) {
							alert("장소를 잘못 입력하였습니다.");
						}

					});

				});
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>
	<script type="text/javascript">
		$('#maxmember').keyup(function() {
			this.value = this.value.replace(/[^0-9]/g, '');
		});
		$("#imgpreview").click(function(){
			$("#hide").click();
		});
	</script>




</body>
</html>