<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>오프라인 강의 업로드 페이지</title>
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
					yearSuffix : '년',
					defaultTime : '2018년 1월 1일'

				});

	});
	$(function() {
		$("#timepicker1").timepicker({
			timeFormat : 'h:mm p',
			interval : 30,
			minTime : '30',
			maxTime : '11:59pm',
			defaultTime : '08',
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

	<div class="container">

		<form method="post" action="register1" enctype="multipart/form-data">
			<div class="container-fluid">
				<div class="row" style="height: 250px;">
					<div class="col-sm-4" style="background-color: lavender;">
						<img src="/project/resources/img/uploadimage.png" id="imgpreview" style="width: 100%; height: 100%;" />
						<div class="form-group">
							<input type="file" name="imgPath" onchange="imagepreview(this);" id="hide" style="display:none;"/>
						</div>
						<div class="form-group"></div>
					</div>
					<div class="col-sm-8" style="background-color: lavenderblush;">
						<div class="form-group" style="padding-top: 20px;">
							<label for="category" class="col-sm-2 control-label">카테고리</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="category" name="category" placeholder="카테고리"
									value="">
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">소제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title" name="title" placeholder="소제목을 입력해주세요."
										value="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">

				<div class="row" style="height: 500px; padding-top: 5px;">
					<div class="col-sm-8" style="background-color: lavender;">

						<button type="button" name='subject' class='btn btn-success' id='btn-mapchange' value='trans'>장소검색</button>
						<input type="text" class="form-control form-join" id="location" name="location"
							placeholder="모임장소를 입력해주세요.">
						<div id="mapdiv">
							<div id="map"></div>
						</div>


					</div>
					<div class="col-sm-4" style="background-color: lavenderblush;">
						<div class="form-group" style="padding-top: 50px;">
							<label for="meetingday" class="control-label">모임 날짜</label>
							<div class="col-sm-10">
								<input type='text' class="form-control" id="datepicker1" name="meetingday" />

							</div>
						</div>
						<div class="form-group">
							<label for="meetingtime" class="conrol-label">모임 시간</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="timepicker1" name="meetingtime" />
							</div>


						</div>

						<div class="form-group">
							<label for="maxmember" class="control-label">수강인원</label>
							<div class="row">
								<div class="col-sm-10">
									<input type="text" class="form-control" id="maxmember" name="maxmember" placeholder="수강인원"
										onkeydown="onlyNumber(this)">
								</div>
								<div class="col-sm-2">명</div>
							</div>

						</div>
					</div>
				</div>
			</div>


			<div class="container-fluid">

				<div class="row">
					<div class="col-sm-12" style="background-color: lavender;">
						<div class="form-group" style="padding-top: 5px;">
							<label for="content" class="col-sm-2 control-label">강의내용 작성</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="content" rows="4" name="content" style="height: 300px;"></textarea>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" style="background-color: lavender;">
					<div class="form-group">
						<div class="col-sm-8">
							<input type="submit" value="register" class="form-control"> <input type="hidden"
								name="lat" id="lat"> <input type="hidden" name="long1" id="long">
						</div>
					</div>
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