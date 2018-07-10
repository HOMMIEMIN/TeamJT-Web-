<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--  time picker -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!--  부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	
	
		$(function() {

		 $('#datepickerdiv').datepicker({	
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
	
	
</script>
</head>


<body>

	<div class="page-header"><jsp:include page="header.jsp"></jsp:include></div>


	<div class="container" style="padding-top: 30px; width: 1200px;">


		<!--  지도 , 폴더 목록  -->
		<div class="container-fluid">
			<div class="row" style="height: 450px; padding-top: 5px;">
				<div class="col-sm-6">
					<!-- 모임장소  -->
					<label for="location" style="font-size: 20px; color: rgb(22, 160, 133);">모임 장소</label>
					<div class="row" style="padding-bottom: 10px;">
						<div class="col-sm-10">
							<!--  	<h5 class="text-warning" id="location">${bnoList.location }</h5> -->
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div id="map"></div>
				</div>

				<div class="col-sm-3">
					<div id="datepickerdiv"></div>
					<!-- 모임날짜  -->
					<div class="form-group" style="padding-top: 50px;">

						
				
						<div class="col-sm-10">
							<div style="padding-left: 22%;">
								<h5 id="dateandmeet" class="text-warning" style="border-radius: 1px;">${mday} , ${mtime}</h5>
							</div>
						</div>					
						
					</div>
					
					

					

				</div>

				<!--  폴더 목록 -->
				<div class="col-sm-3">
					<%
						int a = 1;
					%>
					<div
						style="display: inline-block; width: 400px; bottom: 340px; margin-bottom: 10px; bottom: 0px; position: relative; padding-top: 45px;">
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


		<div class="container-fluid">
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
				<div class="col-sm-6">

					<!-- 수강인원   -->
					<div class="form-group" style="padding-top: 15px;">
						<div class="row" style="padding-left: 60%;">
							<div>
								<h5 id="maxmember" class="text-warning">모집인원  ${bnoList.curmember}/${bnoList.maxmember}</h5>
							</div>
						</div>
					</div>
					<!-- 수강신청 로직  -->
					<div class="form-group" style="padding-top: 30px;">

						<div class="row" style="padding-left: 60%;">
							<div>
								<c:if test="${userId eq bnoList.userid}">
									<c:if test="${bnoList.curmember eq bnoList.maxmember}">
										<input type="button" id="applyManager" value="모집마감하기" class="form-control"
											name="applyManager" style="background-color: rgb(22, 160, 133); color: white;">
									</c:if>
									<form action="offLecDelete" method="post">
										<input type="submit" id="cancelManager" value="강의취소하기(해당글 삭제)" class="form-control"
											name="cancelManager" style="background-color: rgb(22, 160, 133); color: white;">
										<input type="hidden" id="deletebno" name="deletebno" value="${bnoList.bno }">
									</form>
								</c:if>


								<c:if test="${userId ne bnoList.userid}">

									<c:choose>
										<c:when test="${waitOK == 2 and applyOK == 4}">
											<input type="button" id="apply" value="신청" class="form-control" name="apply"
												style="background-color: rgb(22, 160, 133); color: white;">
										</c:when>
										<c:when test="${waitOK == 1}">
											<input type="button" id="applywait" value="신청수락 대기중" class="form-control"
												name="applywait" style="background-color: rgb(22, 160, 133); color: white;">
										</c:when>
										<c:when test="${applyOK == 3}">
											<h4>${userId}님수강신청완료되었습니다!</h4>
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
						<div class="row">
							
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">신청자</label>
						<h5> ${waitListCount}명</h5>
						</div>
						<div class="col-sm-12" style="padding-top: 10px;">
							<div id="waitingMemberCount"></div>
							<div id="waitingMember">
								<c:forEach var="item" items="${waitList }">
									<div class="row" id="applyDiv">
										<div class="col-sm-10">
											<div data-text-content="true" style="background-color: rgb(250, 250, 250); border-width: 0px; border-style: none; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 1px 1px 4px 0px; width: 288px; height: 80px;">
												<div data-image-content="true" style="background-image:url(/static/imagefarm/100072178/rBl7h5c3wnlQg0PoMeCqnb8AOiDXQVOh);"></div>
												<div data-text-content="true" style="font-weight: bold; font-size: 16px; color: rgb(33, 33, 33);" class="">${item}</div>
												<div data-text-content="true" style="font-size: 11px; color: rgb(127, 127, 127);" class="">wendy@redvelvet.com<br></div>
												<c:if test="${userId eq bnoList.userid}">
												<button type="button" name="btnYes" id="btnYes">수락</button>
												</c:if>
											</div>
										
										</div>
										<div class="col-sm-2">
											<input type="hidden" name="itemBno" id="itemBno" value="${bnoList.bno}"> 
											<input type="hidden" name="itemId" id="itemId" value="${item }"> 
											<input type="hidden" name="itemMax" id="itemMax" value="${bnoList.maxmember}">
											<input type="hidden" name="itemCur" id="itemCur" value="${bnoList.curmember}">
											
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
						<label for="content" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">강의내용</label>
						<div class="col-sm-12" style="padding-top: 10px;">

							<p style="height: 200px; border: 1px;" id="content">${bnoList.content}</p>
						</div>
					</div>
				</div>

			</div>
		</div>



		<hr />



		<div class="container-fluid">
			<div class="row" style="padding-top: 5px;">
				<div class="col-sm-6">
					<div class="form-group" style="padding-top: 5px;">
						<label for="member" class="control-label" style="font-size: 20px; color: rgb(22, 160, 133);">선생님</label>
						<div class="col-sm-12" style="padding-top: 10px;">
							<a href="yourpage?userId=${memberId}&userName=${memberName}">
								<div style="font-weight: bold; font-size: 120%">선생님 이름: ${memberName}</div>
								<div style="color: grey; font-size: 90%">선생님 아이디 : ${memberId}</div>

							</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div>
						<h5 style="padding-top: 50px; padding-left: 200px;">선생님 칠판 아이콘</h5>
					</div>
				</div>

			</div>
		</div>


		<hr />

		<!--  댓글  -->
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

		<!--  끝!! 밑에는 Hidden 이다  -->

		<div class="col-sm-12" style="height: 100px;">
			<div class="form-group">
				<input type="hidden" name="lat" id="lat" value=""> <input type="hidden" name="long1"
					id="long" value=""> <input type="hidden" name="groupBno" id="groupBno" value="${bno}">

			</div>
		</div>



	</div>

	<!--  스크립트      -->
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
		
		
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZERHrUzBgHvXAa2TJ843Ca6Ng5nTq-ts&callback=initMap"></script>

</body>


</html>















