<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/2.3.3/fabric.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/project/resources/js/main/blackboard.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jscolor/2.0.4/jscolor.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

.np {
	font-family: 'Nanum Pen Script', cursive;
}

.jg {
	font-family: 'Jeju Gothic', sans-serif;
}

.jm {
	font-family: 'Jeju Myeongjo', serif;
}

.kb {
	font-family: 'KoPub Batang', serif;
}

.nb {
	font-family: 'Nanum Brush Script', cursive;
}

.ns {
	font-family: 'Noto Sans KR', sans-serif;
}

.hn {
	font-family: 'Hanna', sans-serif;
}

.ng {
	font-family: 'Nanum Gothic', sans-serif;
}

.nm {
	font-family: 'Nanum Myeongjo', serif;
}

.jh {
	font-family: 'Jeju Hallasan', cursive;
}

.ngc {
	font-family: 'Nanum Gothic Coding', monospace;
}

.canvas-container {
	border: 1px dotted LightGrey;
}

.input {
	border: 0;
	outline: 0;
	background: transparent;
	border-bottom: 1px solid LightGrey;
}

#bgColor {
	border: 0;
	outline: 0;
	background: transparent;
	border-bottom: 1px solid LightGrey;
}

.a {
	display: inline-block
}

[draggable] {
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	/* Required to make elements draggable in old WebKit */
	-khtml-user-drag: element;
	-webkit-user-drag: element;
	cursor: move;
}
</style>
</head>
<body>
	<div id='abosulte' style="float: top; margin: 10px;">
		<input type="text" id="maintitle"
			style="font-size: 20px; margin: auto; text-align: center; width: 100%; border: 3px solid #fff; padding: 10px;"
			placeholder="이 페이지의 타이틀을 입력하세요" required />
		<hr />
	</div>

	<div id='float-left' style="float: left; margin-right: 15px;">

		<div class="panel panel-default"
			style="width: 220px; margin-left: 30px;">
			<div class="panel-heading clearfix">
				<b class="panel-title">텍스트 추가</b>
			</div>

			<div class="form-group" style="margin-left: 15px;">
				<br />
				<textarea rows="4" cols="12" class="input" id="atext"
					style="width: 160px; height: 110px;"></textarea>
				<button id="text" name="text">+</button>
				<br />
			</div>
		</div>

		<div class="panel panel-default"
			style="width: 220px; margin-left: 30px;">
			<div class="panel-heading clearfix">
				<b class="panel-title">기본이미지</b>
			</div>

			<div class="form-group">
				<div id="images"
					style="width: 218px; height: 100px; overflow-y: scroll;">
					<img draggable="true"
						src="/project/resources/img/basic_emoticon/1001.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1002.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1003.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1004.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1005.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1006.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1007.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1008.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1009.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1010.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1011.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1012.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1013.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1014.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1015.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1016.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1017.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1018.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1019.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1020.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1021.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1022.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1023.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1024.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1025.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1026.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1027.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1028.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1029.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1030.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1031.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1032.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1033.png" width="84"
						height="84"></img> <img draggable="true"
						src="/project/resources/img/basic_emoticon/1034.png" width="84"
						height="84"></img>
				</div>
			</div>

			<!-- Rinse and Repeat the above -->

		</div>

		<div class="panel panel-default"
			style="width: 220px; margin-left: 30px;">
			<div class="panel-heading clearfix">
				<b class="panel-title">이미지 업로드</b>
			</div>
			<div class="form-group">

				<form id="uploadImg">
					<input type="file" id="uploadedImg"
						style="width: 180px; font-size: 12px; margin: 10px" />
				</form>

			</div>

			<!-- Rinse and Repeat the above -->

		</div>

		<div class="panel panel-default"
			style="width: 220px; margin-left: 30px;">
			<div class="panel-heading clearfix">
				<b class="panel-title">도형 추가</b>
			</div>
			<div class="form-group">

				<div class="btn-group btn-group-vertical" role="group"
					aria-label="..." style="margin-left: 58px; margin-top: 20px">
					<button type="button" id="rectangle" class="btn btn-default">직사각형</button>
					<button type="button" id="square" class="btn btn-default">정사각형</button>
					<button type="button" id="triangle" class="btn btn-default">삼각형</button>
					<button type="button" id="circle" class="btn btn-default">원</button>
				</div>

			</div>

			<!-- Rinse and Repeat the above -->

		</div>


	</div>

	<div id='right' style="float: right"></div>

	<div id='center' style="float: left">
		<div id="canvas-container">
			<canvas id="canvas" width="1200px" height="625px"></canvas>
		</div>

	</div>

	<div id='center1' style="float: left">
		<div class="panel panel-default"
			style="width: 220px; margin-left: 30px;">
			<div class="panel-heading clearfix">
				<b class="panel-title">옵션</b>
			</div>
			<div class="form-group">
				<div class="btn-group" role="group" aria-label="..."
					style="margin: 10px 0 0 50px; height: 24px;">
					<button data-toggle="tooltip" data-placement="bottom" id="remove"
						title="해당요소 삭제" type="button" class="btn btn-outline-danger"
						style="background: url(/project/resources/img/options/trash.png) no-repeat; height: 24px;">
						<i class="fa fa-trash" aria-hidden="true"></i>
					</button>
					<button data-toggle="tooltip" data-placement="bottom" id="toback"
						title="뒤로 보내기" type="button" class="btn btn-outline-primary"
						style="background: url(/project/resources/img/options/toback.png) no-repeat; height: 24px;">
						<i class="fa fa-level-down" aria-hidden="true"></i>
					</button>
					<button data-toggle="tooltip" data-placement="bottom"
						title="앞으로 보내기" type="button" id="tofront"
						class="btn btn-outline-primary"
						style="background: url(/project/resources/img/options/tofront.png) no-repeat; height: 24px;">
						<i class="fa fa-level-up" aria-hidden="true"></i>
					</button>
					<button data-toggle="tooltip" data-placement="bottom" title="복사하기"
						id="copy" type="button" class="btn btn-outline-primary"
						style="background: url(/project/resources/img/options/copy.png) no-repeat; height: 24px;">
						<i class="fa fa-clone" aria-hidden="true"></i>
					</button>
					<button data-toggle="tooltip" data-placement="bottom" id="unselect"
						title="선택취소" type="button" class="btn btn-outline-primary"
						style="background: url(/project/resources/img/options/cancel.png) no-repeat; height: 24px;">
						<i class="fa fa-remove" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
		<div class='showD'>
			<div class="panel panel-default"
				style="width: 220px; margin-left: 30px;">
				<div class="panel-heading clearfix">
					<b class="panel-title">바탕화면 설정</b>
				</div>

				<div class="form-group" style="margin: 10px;">
					배경색 <br /> <input type="text" id='bgColor' class="jscolor"
						placeholder="#fff"><br /> 배경이미지(Url) <br /> <input
						type="text" id='bgUrl' class="input" placeholder="http://... .png"><br />
					패턴화된 배경이미지(Url) <br /> <input type="text" id='bgUrl2'
						class="input" placeholder="http://... .png"><br /> <br />
				</div>
			</div>
		</div>

		<%-- --%>
		<div class="showT">
			<div class="panel panel-default"
				style="width: 220px; margin-left: 30px;">
				<div class="panel-heading clearfix">
					<b class="panel-title">글 설정</b>
				</div>

				<div class="form-group" style="margin: 10px;">
					<div class="custom-item-title">투명도</div>
					<input type="range" id="textOpacity" step="0.1" min="0" max="1">



					<div class="custom-item-title">색상설정</div>
					<input type="text" id='textColor' class="jscolor"
						placeholder="#fff">



					<div class="custom-item-title">폰트 설정</div>

					<select id='textFontFamily'>
						<option class="np" value="Nanum Pen Script">나눔 팬</option>
						<option class="jg" value="Jeju Gothic">제주 고딕</option>
						<option class="jm" value="Jeju Myeongjo">제주 명조</option>
						<option class="kb" value="KoPub Batang">KoPub 바탕</option>
						<option class="nb" value="Nanum Brush Script">나눔 붓</option>
						<option class="ns" value="Noto Sans KR">노트산스</option>
						<option class="hn" value="Hanna">한나</option>
						<option class="ng" value="Nanum Gothic">나눔 고딕</option>
						<option class="nm" value="Nanum Myeongjo">나눔 명조</option>
						<option class="jh" value="Jeju Hallasan">제주 한라산</option>
						<option class="ngc" value="Nanum Gothic Coding">나눔고딕코딩</option>

					</select>


					<div class="custom-item">
						<div class="custom-item-title">정렬</div>
						<div class="custom-item-body text-center">
							<div class="btn-group" role="group" aria-label="..."
								style="margin: 10px">
								<button id="leftP" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/left.png) no-repeat">
									<i class="fa fa-align-left"
										style="background: url(/project/resources/img/options/toback.png) no-repeat;"></i>
								</button>
								<button id="centerP" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/center.png) no-repeat;">
									<i class="fa fa-align-center"></i>
								</button>
								<button id="rightP" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/right.png) no-repeat;">
									<i class="fa fa-align-right"></i>
								</button>
								<button id="justifyP" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/justify.png) no-repeat;">
									<i class="fa fa-align-justify"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="custom-item">
						<div class="custom-item-title">스타일</div>
						<div class="custom-item-body text-center">
							<div class="btn-group" role="group" aria-label="...">
								<button id="bold" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/bold.png) no-repeat;">
									<i class="fa fa-bold"></i>
								</button>
								<button id="italic" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/italic.png) no-repeat;">
									<i class="fa fa-italic"></i>
								</button>
								<button id="underline" type="button" class="btn btn"
									style="background: url(/project/resources/img/options/underline.png) no-repeat;">
									<i class="fa fa-underline"></i>
								</button>
							</div>
						</div>
					</div>

					<div class="custom-item-title">글씨 크기</div>
					<input id="fontSize" type="range" step="1" min="1" max="120">



					<div class="custom-item-title">줄 간격</div>
					<input id="fontHeight" type="range" step="0.1" min="0" max="10">



					<div class="custom-item-title">단어 간격</div>
					<input id="charSpacing" type="range" step="10" min="-200" max="800">

				</div>
			</div>



		</div>

		<div class="showF">
			<div class="panel panel-default"
				style="width: 220px; margin-left: 30px;">

				<div class="panel-heading clearfix">
					<b class="panel-title">모양 설정</b>
				</div>
				<div class="form-group" style="margin: 10px;">
					<div class="custom-item">
						<div class="custom-item-title">투명도</div>
						<div class="custom-item-body">
							<input type="range" id="fOpacity" min="0" max="1" step='0.01'>
						</div>
					</div>
					<div class="custom-item">
						<div class="custom-item-title">색상설정</div>
						<div class="custom-item-body">
							<input type="text" id='fColor' class="jscolor" placeholder="#fff">
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="showI">
			<div class="panel panel-default"
				style="width: 220px; margin-left: 30px;">
				<div class="panel-heading clearfix">
					<b class="panel-title">이미지 설정</b>
				</div>
				<div class="form-group" style="margin: 10px;">

					<div class="custom-item-title">투명도</div>
					<div class="custom-item-body">
						<input type="range" id="imageOpacity" min="0" max="1" step='0.01'>
					</div>

				</div>
			</div>
		</div>
		<div>
		<form id="saveJSON" method="POST" style = "margin-left:30px">
			<input type='hidden' id='hiddenField' name='title'/> <input
				type='hidden' id='hiddenField2' name='json'/>
			<button id="toJSONF" class="btn btn-outline-default btn-rounded waves-effect">저장하기</button>
		</form>
		</div>
		<form id="updateJSON" method="POST">
			<input type='hidden' id='hfTitle' name='titleU'/>
			<input type='hidden' id='hfJson' name='jsonU'/>
			<input type='hidden' id='hfUserid' name='useridU'/>
			<input type='hidden' id='hfBno' name='bnoU'/>
			<button id="updateJSONF">수정하기</button>
		</form>
		
	</div>
	<script>
		var bno = '${board.bno}';
		var title = '${board.title}';
		var userid = '${board.userid}';
		var json = '${board.json}';
		canvas = new fabric.Canvas('canvas', {
			hoverCursor : 'pointer',
			selection : true,
			selectionBorderColor : 'blue'
		});
		if(bno!=0 || title!=''){
			$('#maintitle').val(title);
			$('#hfTitle').val(title);
			$('#hfBno').val(bno);
			$('#hfUserid').val(userid);
			$('#hfJson').val(json);
			$('#saveJSON').hide();
			var jjson = JSON.parse(json);
			canvas.loadFromJSON(jjson,function(){
				canvas.renderAll.bind(canvas);
			});
		}else{
			$('#updateJSON').hide();
		}
		
	</script>

</body>
</html>