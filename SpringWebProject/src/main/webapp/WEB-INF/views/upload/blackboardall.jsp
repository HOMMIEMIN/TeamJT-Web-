<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<!-- 설정한 페이지가 없을때 보여주는 화면 -->
	<div style="display: none;" id="notactive">
		<h1>설정하신 페이지가 없습니다</h1>
	</div>

	<div id="ifowner">
		<button id="cpsetting">현재 페이지 설정</button>
		<button id="cpdelete">현재 페이지 삭제</button>
	</div>

	<!-- 설정한 페이지가 있을때 보여주는 화면 -->
	<div id="active" style="float: left">
		<img id="imgD">
		<canvas id="canvas" width="800" height="600"></canvas>

		<form action="editPage" id="editPage" method="POST">
			<input type="hidden" id="jsonH" name="json"> <input
				type="hidden" name="bno" id="bnoH"> <input type="hidden"
				id="titleH" name="title"> <input type="hidden" id="useidH"
				name="userid" value="${userId}">
		</form>
	</div>
	<div style="float: left">
		<div class="btn-group-vertical" role="group"
			aria-label="Vertical button group" style="width: 200px;"></div>
		<div id="ifowner">
			<a id="pageadd" href="/project/blackboard">페이지 추가 (+)</a>
		</div>
		
	</div>


	<script>
		$(document).ready(function() {
			var canvas = new fabric.Canvas('canvas');
			$('canvas').hide();
			
	
			function getAllBoards() {
				//현재 로그인 유저가 설정한페이지 load
				$.getJSON('/project/loadBlackBoard', function(data) {
					list = data;
					//화면처리
					if (list == null || list == "" || list.length == 0) {
						$('#notactive').show();
						$('#active').hide();
					} else {
						$('#notactive').hide();
						$('#active').show();
	
	
						//설정한 페이지가 있을때 title을 이용한 버튼 생성
						var buttontitle = "";
						$(data).each(function() {
							buttontitle += '<button type="button" class="btn btn-amber" style="width:200px;"  id =' + this.bno + '>'
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
								canvas.loadFromJSON(json, function() {
	
									$('canvas').get(0).toBlob(function(blob) {
										var url = URL.createObjectURL(blob)
										var image = $('#imgD').attr('src', url);
	
									});
								});
	
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
							$('canvas').get(0).toBlob(function(blob) {
								var url = URL.createObjectURL(blob)
								var image = $('#imgD').attr('src', url);
	
							});
						});
	
					}
	
				}); //end $.getJSON()
			} // end getAlReplies()
	
			//현재 페이지 삭제
			$('#cpdelete').click(function() {
				var userid = '${userId}';
				var bno = $('#bnoH').val();
				var json = $('#jsonH').val();
				var title = $('#titleH').val();
				$.ajax({
					type : 'delete',
					url : '/project/deleteBlackBoard',
					headers : {
						'Content-Type' : 'application/json; charset=UTF-8',
						'X-HTTP-Method-Override' : 'delete'
					},
					data : JSON.stringify({
						'userid' : userid,
						'title' : title,
						'json' : json,
						'bno' : bno
					}),
					success : function(result) {
						console.log('삭제 결과 : ' + result);
	
						if (result) {
							alert(userid + '님 페이지 삭제 완료');
							getAllBoards();
	
						} else {
							alert('삭제 실패');
						}
					}
				});
			});
			//현재 페이지 수정
			$('#cpsetting').click(function() {
				$('#editPage').submit();
			});
	
			getAllBoards();
	
		});
	</script>



</body>
</html>