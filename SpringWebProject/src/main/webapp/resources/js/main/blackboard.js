$(document).ready(function() {
	$('.showF').hide();
	$('.showT').hide();
	$('.showI').hide();
	$('.showD').show();
	var canvas = new fabric.Canvas('canvas', {
		hoverCursor : 'pointer',
		selection : true,
		selectionBorderColor : 'blue'
	});
	var subcanvas = new fabric.Canvas('subcanvas');


	canvas.on({
		'object:moving' : (e) => {
		},
		'object:modified' : (e) => {
		},
		'mouse:down' : (e) => {
			if (e.target !== null) {
				let selectedObject = e.target;
				if (selectedObject.type !== 'group' && selectedObject) {
					console.log(selectedObject.type);

					switch (selectedObject.type) {
					case 'rect':
					case 'circle':
					case 'triangle':
						$('.showF').show();
						$('.showT').hide();
						$('.showI').hide();
						$('.showD').hide();
						break;
					case 'text':
						$('.showF').hide();
						$('.showT').show();
						$('.showI').hide();
						$('.showD').hide();
						break;
					case 'image':
						$('.showF').hide();
						$('.showT').hide();
						$('.showI').show();
						$('.showD').hide();
						break;
					}
				}
			}

		},
		'object:selected' : (e) => {

			let selectedObject = e.target;
			selectedObject.hasRotatingPoint = true;
			selectedObject.transparentCorners = false;



			if (selectedObject.type !== 'group' && selectedObject) {
				console.log(selectedObject.type);

				switch (selectedObject.type) {
				case 'rect':
				case 'circle':
				case 'triangle':
					$('.showF').show();
					$('.showT').hide();
					$('.showI').hide();
					$('.showD').hide();
					break;
				case 'text':
					$('.showF').hide();
					$('.showT').show();
					$('.showI').hide();
					$('.showD').hide();
					break;
				case 'image':
					$('.showF').hide();
					$('.showT').hide();
					$('.showI').show();
					$('.showD').hide();
					break;
				}
			}
		},

		'selection:cleared' : (e) => {
			console.log("hi?");
			$('.showF').hide();
			$('.showT').hide();
			$('.showI').hide();
			$('.showD').show();

		}
	});


	//배경화면 설정
	$('#bgColor').change(backgroundColor);
	function backgroundColor() {
		console.log($(this).val());
		canvas.backgroundColor = '#' + $(this).val();
		canvas.renderAll();
	}

	$('#bgUrl').click(bgUrl);
	function bgUrl() {
		var url = prompt("이미지 Url주소를 입력하세요")
		canvas.setBackgroundImage(url, canvas.renderAll.bind(canvas), {
			backgroundImageOpacity : 0.5,
			backgroundImageStretch : false
			//width:canvas.width,
			//height:canvas.height

		});
		canvas.renderAll();
	}

	$('#bgUrl2').click(bgUrl2);
	function bgUrl2() {
		var url = prompt("이미지 Url주소를 입력하세요")
		canvas.setBackgroundColor({
			source : url,
			repeat : 'repeat'
		}, function() {
			// self.props.canvasFill = '';
			canvas.renderAll();
		});
	}


	//addText
	function addText() {
		var textToAdd = $('#atext').val();
		console.log(textToAdd);
		canvas.add(new fabric.Text(textToAdd, {
			left : 0, //Take the block's position
			top : 0,
			fill : 'black'
		}));
	}

	$('#text').click(addText);

	//이미지 업로드 function
	document.getElementById('uploadedImg').addEventListener("change", function(e) {
		var file = e.target.files[0];
		var reader = new FileReader();
		reader.onload = function(f) {
			var data = f.target.result;
			fabric.Image.fromURL(data, function(img) {
				var oImg = img.set({
					left : 0,
					top : 0,
					angle : 0
				});
				canvas.add(oImg).renderAll();
				var a = canvas.setActiveObject(oImg);
				var dataURL = canvas.toDataURL({
					format : 'png',
					quality : 0.8
				});
			});
		};
		reader.readAsDataURL(file);
	});


	//sub canvas에 images 폴더 파일들을 올려놓는 function
	function handleDragStart(e) {
		[].forEach.call(images, function(img) {
			img.classList.remove('img_dragging');
		});
		this.classList.add('img_dragging');
	}

	function handleDragOver(e) {
		if (e.preventDefault) {
			e.preventDefault(); // Necessary. Allows us to drop.
		}

		e.dataTransfer.dropEffect = 'copy'; // See the section on the DataTransfer object.


		return false;
	}

	function handleDragEnter(e) {
		// this / e.target is the current hover target.
		this.classList.add('over');
	}

	function handleDragLeave(e) {
		this.classList.remove('over'); // this / e.target is previous target element.
	}

	function handleDrop(e) {
		// this / e.target is current target element.

		if (e.stopPropagation) {
			e.stopPropagation(); // stops the browser from redirecting.
		}

		var img = document.querySelector('#images img.img_dragging');

		console.log('event: ', e);

		var newImage = new fabric.Image(img, {
			width : 84,
			height : 84,
			left : e.layerX,
			top : e.layerY
		});

		canvas.add(newImage);
		canvas.setActiveObject(newImage);
		canvas.renderAll();
		return false;
	}

	function handleDragEnd(e) {
		// this/e.target is the source node.
		[].forEach.call(images, function(img) {
			img.classList.remove('img_dragging');
		});
	}


	// Browser supports HTML5 DnD.

	// Bind the event listeners for the image elements
	var images = document.querySelectorAll('#images img');
	[].forEach.call(images, function(img) {
		img.addEventListener('dragstart', handleDragStart, false);
		img.addEventListener('dragend', handleDragEnd, false);
	});
	// Bind the event listeners for the canvas
	var canvasContainer = document.getElementById('canvas-container');
	canvasContainer.addEventListener('dragenter', handleDragEnter, false);
	canvasContainer.addEventListener('dragover', handleDragOver, false);
	canvasContainer.addEventListener('dragleave', handleDragLeave, false);
	canvasContainer.addEventListener('drop', handleDrop, false);

	//도형추가
	$("#rectangle").click(addFigure);
	$("#triangle").click(addFigure);
	$("#circle").click(addFigure);
	$("#square").click(addFigure);
	function addFigure() {
		var figure = $(this).attr('id');
		console.log('figure: ' + figure);
		switch (figure) {
		//var any;
		case 'rectangle':
			add = new fabric.Rect({
				width : 200,
				height : 100,
				left : 10,
				top : 10,
				angle : 0,
				fill : '#3f51b5'
			});
			break;
		case 'square':
			add = new fabric.Rect({
				width : 100,
				height : 100,
				left : 10,
				top : 10,
				angle : 0,
				fill : '#4caf50'
			});
			break;
		case 'triangle':
			add = new fabric.Triangle({
				width : 100,
				height : 100,
				left : 10,
				top : 10,
				fill : '#2196f3'
			});
			break;
		case 'circle':
			add = new fabric.Circle({
				radius : 50,
				left : 10,
				top : 10,
				fill : '#ff5722'
			});
			break;
		}

		canvas.add(add);
		canvas.setActiveObject(add);
		canvas.renderAll();
	}


	//옵션 기능들
	$("#remove").click(removeSelected);
	function removeSelected() {
		activeGroup = canvas.getActiveObjects();

		if (activeGroup.length > 0) {
			canvas.discardActiveObject();
			activeGroup.forEach(function(object) {

				console.log(object);
				canvas.remove(object);
				canvas.renderAll();
			});
		}
	// this.textString = ''
	}
	$("#toback").click(putToBack);
	function putToBack() {
		activeGroup = canvas.getActiveObjects();

		if (activeGroup) {

			canvas.discardActiveObject();
			activeGroup.forEach((object) => {

				object.sendToBack();
				canvas.renderAll();
			});
		}
	}

	$("#tofront").click(putToFront);
	function putToFront() {
		activeGroup = canvas.getActiveObjects();

		if (activeGroup) {

			canvas.discardActiveObject();
			activeGroup.forEach((object) => {

				object.bringToFront();
				canvas.renderAll();
			});
		}
	}

	$('#copy').click(copy);
	function copy() {
		let activeObject = canvas.getActiveObject();


		if (activeObject) {
			let clone;
			switch (activeObject.type) {
			case 'rect':
				clone = new fabric.Rect(activeObject.toObject());
				break;
			case 'circle':
				clone = new fabric.Circle(activeObject.toObject());
				break;
			case 'triangle':
				clone = new fabric.Triangle(activeObject.toObject());
				break;
			case 'i-text':
				clone = new fabric.IText('', activeObject.toObject());
				break;
			case 'image':
				clone = fabric.util.object.clone(activeObject);
				break;
			}
			if (clone) {
				clone.set({
					left : 10,
					top : 10
				});
				canvas.add(clone);
				canvas.setActiveObject(clone);
				canvas.renderAll();
			}
		}

	}

	$('#unselect').click(unselect);
	function unselect() {
		canvas.discardActiveObject();
		canvas.renderAll();

	}

	//for the Image Panel

	$(document).on('input', "#imageOpacity", function() {

		console.log($('#imageOpacity').val());
		var text = canvas.getActiveObject();
		text.set({
			opacity : $('#imageOpacity').val()
		});
		canvas.renderAll();
	});

	//for the Figure Panel

	$(document).on('input', "#fOpacity", function() {


		var text = canvas.getActiveObject();
		text.set({
			opacity : $('#fOpacity').val()
		});
		canvas.renderAll();
	});

	$(document).on('change', "#fColor", function() {
		console.log('#' + $('#fColor').val());

		var text = canvas.getActiveObject();
		text.set({
			fill : '#' + $('#fColor').val()
		});
		canvas.renderAll();
	});

	//for the text panel 

	$(document).on('input', "#textOpacity", function() {


		var text = canvas.getActiveObject();
		text.set({
			opacity : $('#textOpacity').val()
		});
		canvas.renderAll();
	});

	$(document).on('change', "#textColor", function() {


		var text = canvas.getActiveObject();
		text.set({
			fill : '#' + $('#textColor').val()
		});
		canvas.renderAll();
	});

	$(document).on('change', "#textFontFamily", function() {
		canvas.getActiveObject().set("fontFamily", this.value);
		canvas.renderAll();
	});

	$(document).on('change', "#fontSize", function() {
		canvas.getActiveObject().set("fontSize", this.value);
		canvas.renderAll();
	});

	$(document).on('change', "#fontHeight", function() {
		canvas.getActiveObject().set("lineHeight", this.value);
		canvas.renderAll();
	});

	$(document).on('change', "#charSpacing", function() {
		canvas.getActiveObject().set("charSpacing", this.value);
		canvas.renderAll();
	});

	$(document).on('click', "#bold", function() {
		canvas.getActiveObject().set("fontWeight", 'bold');
		canvas.renderAll();
	});

	$(document).on('click', "#italic", function() {
		canvas.getActiveObject().set("fontStyle", 'italic');
		canvas.renderAll();
	});

	$(document).on('click', "#underline", function() {
		
		canvas.getActiveObject().set("underline", true);
		canvas.renderAll();
		

	});
	
	$(document).on('click', "#leftP", function() {
		
		canvas.getActiveObject().set("textAlign", "left");
		canvas.renderAll();
		

	});

	$(document).on('click', "#centerP", function() {
		
			canvas.getActiveObject().set("textAlign", "center");
		canvas.renderAll();
		

	});
	
	$(document).on('click', "#rightP", function() {
		
		canvas.getActiveObject().set("textAlign", "right");
		canvas.renderAll();
		

	});
	
	$(document).on('click', "#justifyP", function() {
		
		canvas.getActiveObject().set("textAlign", "justify");
		canvas.renderAll();
		

	});
	
	$(document).on('click', "#toJSONF", function() {
		
		 json = canvas.toJSON();
		console.log(json);
		canvas.clear();
		

	});
	
	$(document).on('click', "#fromJSONF", function() {
		
		canvas.loadFromJSON(json,function(){
			alert('확인됨');
		});
		console.log(json);
		canvas.clear();
		

	});
	

}); // end document.ready()