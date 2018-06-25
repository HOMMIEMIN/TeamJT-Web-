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
     </style>
    <title></title>
    
	<link href="${pageContext.request.contextPath}/resources/css/upload.css" rel="stylesheet" />
   
    
    
    

</head>
<body>
		<form id="upload" method="post">
		<div class="form-group">
  <label for="usr">제목:</label>
  <input type="text" class="form-control" id="title"> 
</div>
<br/>
	<img id="sample" ></img>
	<video id="video1" width="420" style="display: none;">
    <source src="" type="video/mp4">
    <source src="mov_bbb.ogg" type="video/ogg"></video>
 		 <br/>
 		 
 		  <div id="example">
            <div>
            <h3>동영상 업로드</h3>
                <div class="demo-section k-content">
                    <input name="files" id="files" type="file" accept=".mp4"/>
                </div>
                
                <br/>
                <img id = "image" alt="" src="">
                <h3>이미지 업로드</h3>
                <div class="demo-section k-content">
                    <input name="files" id="files2" type="file" accept=".jpg,.jpeg.,.gif,.png"/>
                </div>
            </div>
		</div>
	
		<br/>

<div class="form-group">
  <label for="comment">소개:</label>
  <textarea class="form-control" rows="5" id="content"></textarea>
</div>
		
       
		<input type="button" id="creatLec" value="등록"/>
		</form>


            <script>
                $(document).ready(function() {
                	
                	
                	var fileName = '';
                	var imageName = '';
                	
                	
                    $("#files").kendoUpload({
                        async: {
                            chunkSize: 11000,// bytes
                            saveUrl: "chunkSave",
                            removeUrl: "remove",
                            autoUpload: true
                        },
                        success:onSuccess,
                        upload:onUpload
                    
                    });
                    
                    $("#files2").kendoUpload({
                        async: {
                            chunkSize: 11000,// bytes
                            saveUrl: "chunkSaveImage",
                            removeUrl: "remove",
                            autoUpload: true
                        },
                        success:onSuccess2
                       
                    
                    });
                    
                    function onSuccess(e){
                    	  $('#sample').css('display','none');
                    	  $('#video1').css('display','block');
                    	  var file0Uid = e.files[0].uid;
                    	  fileName = $(".k-file[data-uid='" + file0Uid + "']").find(".k-file-name").text();
                    	  $('#video1').attr('src','resources/video/tmpFiles/'+ fileName);
                    	  console.log(name);
                      }
                    
                    function onSuccess2(e){   	
                  	  var file0Uid = e.files[0].uid;
                  	  imageName = $(".k-file[data-uid='" + file0Uid + "']").find(".k-file-name").text();
                  	  $('#video1').attr('src','resources/video/tmpFiles/'+ fileName);
                  	$('#image').attr('src','${pageContext.request.contextPath}/resources/image'+ id + imageName);
                  	  console.log(name);
                    }
                      function onUpload(e){
                    	  $('#sample').attr('src','${pageContext.request.contextPath}/resources/css/folder.css');
                      }
                    
                    $('#creatLec').click(()=>{
                  	  var id = '${userId}';
                  	  var title = $('#title').val();
                  	  var content= $('#content').val();
                  	  var groupBno = '${bno}';
                  	  var category = '${lecCategory}'
                  	  
                  	  
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
        						'imagePath' : id+imageName
        					}),
        					success:function(result){
        						if(result === 'ok'){
        							$("#onLec").load("/project/upload/folder");
        							
        						}else{
        							alert('등록 실패');
        						}
        					}
        					
        				});
                    });
                });
                
                             
                
            </script>
        


</body>
</html>