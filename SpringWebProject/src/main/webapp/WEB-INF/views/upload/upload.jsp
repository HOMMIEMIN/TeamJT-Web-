<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <style>
    html{ 
    font-size: 14px; 
    font-family: Arial, Helvetica, sans-serif; 
    }
       #notClick {
	background-color: rgba(1, 1, 1, 0.7);
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
}

#loader {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 1;
	width: 150px;
	height: 150px;
	margin: -75px 0 0 -75px;
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid #3498db;
	width: 120px;
	height: 120px;
	top: 500px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}
 
     </style>
    <title></title>
    
	<link href="${pageContext.request.contextPath}/resources/css/upload.css" rel="stylesheet" />
   
    
    
    

</head>

<body id ="bodyup" style="display: inline-block;">
<div></div>
<br/>
<br/>
<br/>
<h4 style="margin-left: 400px">강의 업로드</h4>
<br/>
	<div style="margin-left: 400px">
	<div style="width: 854px; max-width: 854; border: 1px solid lightgrey">
	<img id="imageUp" style = "margin: 0px;padding:0px; border-right: 1px solid lightgrey;"src="${pageContext.request.contextPath}/resources/img/addImage.png">
	<div style ="display:inline-block;">
	<div>
	<div id="categoryName" style="color: #04B486; font-weight: bolder; font-size: 18px;margin-left: 10px">
	${lecCategory}.
	</div>
	<div id="title1" style="font-size: 18px;margin-top: 10px; margin-left: 10px">
	${lecName }
	</div>
	<input type="text" id="title" class="form-control" style="width: 360px; margin-top: 20px; margin-left: 8px;">
	</div>
	</div>
	</div>
	<br/>
	<div>
	<video id="video1"  width="854" height="480" style="background-color:#F2F2F2;border:1px solid lightgrey; border-radius: 16px; max-height: 480px; max-width: 854;" >
    <source type="video/mp4">
    <source id = "video2" type="video/ogg"></video>
 <img id="loading" src = "${pageContext.request.contextPath}/resources/img/movieImage.png" style="position: relative; right: 530px; bottom: 220px"></img>
 <div id= "percent" style="left: 1000px; top: 900px;position: absolute; display: none; font-weight: bold;">100%</div>		 
</div>
            <div>
   
                <div class="demo-section k-content" style="display: none;">
                    <input name="files" id="files" type="file" accept=".mp4"/>
                </div>
                
                <br/>
   

                <div class="demo-section k-content" style="display: none;">
                    <input name="files" id="files2" type="file" accept=".jpg,.jpeg.,.gif,.png"/>
                </div>
            </div>
	
 	<textarea class="form-control" style="width:854px; max-width: 854px;" placeholder="내용을 입력해주세요." rows="10" id="content"></textarea>

		
       <br/>
		<input type="button" style="width: 854px;height:50px ;hemax-width: 854px; background-color: 3ED0C8; border: 1px solid 3ED0C8" id="creatLec" value=""/>
</div>

<div id="loader" style="display: none; z-index: 4;"></div>
	<div id="notClick" style="display: none; z-index: 3;"></div>

            <script>
                $(document).ready(function() {
                	
                	
                	var fileName = '';
                	var imageName = '';
                	var id = '${userId}'
                	console.log('dd');
                    $("#files").kendoUpload({
                        async: {
                            chunkSize: 110000,// bytes
                            saveUrl: "chunkSave",
                            removeUrl: "remove",
                            autoUpload: true
                        },
                        success:onSuccess,
                        progress:onUpload,
                        select:onSelect
                    
                    });
                    
                    $("#files2").kendoUpload({
                        async: {

                            chunkSize: 300,// bytes

                            saveUrl: "chunkSaveImage",
                            removeUrl: "remove",
                            autoUpload: true
                        },
                        success:onSuccess2
                       
                    
                    });
                    
                    function onSelect(e){
                    	console.log('들어옴');
                    	$('#loading').css('display','none');
                    	$('#percent').css('display','block');
                    }
                    
                    function onSuccess(e){                 
                    	  var file0Uid = e.files[0].uid;
                    	  fileName = $(".k-file[data-uid='" + file0Uid + "']").find(".k-file-name").text();
                    	  $('#video1').attr('src','/project/resources/video/tmpFiles/'+ id + fileName);
                    	  $('#loading').css('display','none');
                    	  $('#percent').css('display','none');
                    	  console.log(id+fileName);
                      }
                    
                    function onSuccess2(e){   	
                  	  var file0Uid = e.files[0].uid;
                  	  imageName = $(".k-file[data-uid='" + file0Uid + "']").find(".k-file-name").text();             	
                  	$('#imageUp').attr('src','${pageContext.request.contextPath}/resources/image/tmpFiles/'+ id + imageName);
                  	  console.log(id+imageName);
                    }
                      function onUpload(e){
                    	  $('#percent').text(e.percentComplete+'%');
                      }
                    
                    $('#creatLec').click(()=>{
                  	  var id = '${userId}';
                  	  var title = $('#title').val();
                  	  var content= $('#content').val();
                  	  var groupBno = '${bno}';
                  	  var category = '${lecCategory}';
                  	  var userName = '${userName}';
                  	$("#loader").css('display','block');
        			$("#notClick").css('display','block');
                  	  
                  	  $.ajax({
        					type:'post',
        					url:'/project/upload/onLeccreate',
        					headers:{
        						'Content-Type' : 'application/json; charset=UTF-8',
        						'X-HTTP-Method-Override' : 'post'
        					},
        					data: JSON.stringify({
        						'userId' : id,
        						'title' : title,
        						'content' : content,
        						'videoPath' : id+fileName,
        						'groupBno' : groupBno,
        						'lecCategory' : category,
        						'imagePath' : id+imageName,
        						'userName' : userName
        					}),
        					success:function(result){
        						if(result === 'ok'){
        							$("#loader").css('display','none');
        							$("#notClick").css('display','none');
        							$("#onLec").load("/project/upload/folder");
        							
        						}else{
        							$("#loader").css('display','none');
        							$("#notClick").css('display','none');
        							alert('등록 실패');
        						}
        					},
        					error:function(result){
        						$("#loader").css('display','none');
    							$("#notClick").css('display','none');
        					}
        					
        				});
                    });
                    
                    $('#imageUp').click(()=>{
                    	$('#files2').click();
                    	
                    });
                    
                    $('#video1').click(()=>{
                    	$('#files').click();
                    });
                    
                    $('#loading').click(()=>{
                    	$('#files').click();
                    });
                    
                    
                });
                
                             
                
            </script>
        


</body>
</html>