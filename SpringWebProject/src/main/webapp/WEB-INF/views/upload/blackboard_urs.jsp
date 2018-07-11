<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.btnGG{

background: url(/project/resources/img/options/customUL.png) no-repeat;
border: none;
}
</style>

</head>
<body>


	<!-- 설정한 페이지가 없을때 보여주는 화면 -->
	<div style="display: none;" id="notactive">
		<br/>
		<h1>${uId}님이 설정한 페이지가 없습니다</h1>
		<br/>
	</div>
	<div>


	<!-- 설정한 페이지가 있을때 보여주는 화면 -->



	<canvas style="float: left" id="canvas" width="1200px"
		height="636px"></canvas>
	</div>
	<div style="float: left;">
	<div id="bt"
		style="display:inline-block;height: 636px; width: 290px; overflow-y: scroll; float: left;">
		<div class="btn-group-vertical" role="group"
			aria-label="Vertical button group"></div>

	</div>
	</div>

	<form action="editPage" id="editPage" method="POST">
		<input type="hidden" id="jsonH" name="json"> <input
			type="hidden" name="bno" id="bnoH"> <input type="hidden"
			id="titleH" name="title"> <input type="hidden" id="useidH"
			name="userid" value="${uId}">
	</form>





	<script>
		$(document).ready(function() {
			var ud = '${uId}';
			
			$("#onLec").css('width', '100%');
			$("#onLec").css('maxWidth', '100%');
			$("#onLec").css('marginRight', '200px');
			var canvas = new fabric.StaticCanvas('canvas');
	
	
			function getAllBoards() {
				//현재 로그인 유저가 설정한페이지 load
				$.getJSON('/project/loadBlackBoardurs', function(data) {
					list = data;
					
					//화면처리
					if (list == null || list == "" || list.length == 0) {
					
						$('#notactive').show();
						$('#active').hide();
						$('#bt').hide();
	
					} else {
						
						$('#notactive').hide();
						$('#active').show();
						$('#bt').show();
	
						//설정한 페이지가 있을때 title을 이용한 버튼 생성
						var buttontitle = "";
						$(data).each(function() {
							buttontitle += '<button type="button" style="height:40px;" class="btnGG" id =' + this.bno + '>'
								+ this.title + '</button> ';
	
						}); //end each()
						$('.btn-group-vertical').html(buttontitle);
	
						//버튼 onclick 처리
	
						$(data).each(function() {
							var self = this
							$("#" + this.bno).click(function() {
	
								$('#jsonH').val(self.json);
								$('#bnoH').val(self.bno);
								$('#titleH').val(self.title);
	
								var json = JSON.parse(self.json);
								canvas.loadFromJSON(json, function() {});
	
								console.log("json: " + $('#jsonH').val());
								console.log("bno: " + $('#bnoH').val());
								console.log("title: " + $('#titleH').val());
	
							});
						});
	
						//칠판을 처음 시작할떄 맨 마지막 설정한 페이지를 보여줌
						canvas.loadFromJSON(JSON.parse(list[list.length - 1].json), function() {
							$('#jsonH').val(list[list.length - 1].json);
							$('#bnoH').val(list[list.length - 1].bno);
							$('#titleH').val(list[list.length - 1].title);
							canvas.loadFromJSON(JSON.parse(list[list.length - 1].json), function() {});
	
						});
	
					}
	
				}); //end $.getJSON()
			} // end getAlReplies()
	
		
	
			getAllBoards();
	
		});
	</script>



</body>
</html>