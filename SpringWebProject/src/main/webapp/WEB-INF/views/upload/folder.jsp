<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/folder.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/folder2.css" rel="stylesheet" />


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<style>
img{
height: 68%;
}

p.views.views-info{
position:relative;
left:100px;
bottom: 90px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid{
width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
padding: 0px;
margin-right: 20px;
margin-bottom: 20px;
}

.overlay {
  position: absolute; 
  bottom: 0; 
  margin:0px;
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1; 
  transition: .5s ease;
  opacity:0;
  width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
  color: white;
  font-size: 20px;
  padding: 90px;
  text-align: center;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay {
  opacity: 1;
}

div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info{
padding-top:10px;
padding:0px;
max-height: 86.5px;
}

.btndeup{
position: relative;
margin: 0px;
padding: 0px;
left: 170px;
bottom: 40px;
}

</style>


</head>
<body>

<br/>
<br/>


<div id = folder>
<c:forEach var="group" items="${groupList }">

<div class="col-md-3 resent-grid recommended-grid movie-video-grid">
<div class="resent-grid-img recommended-grid-img">
<a href="upload/folderDetail?bno=${group.bno }&lecCategory=${group.lecCategory}">
<c:if test="${not empty group.imagePath}">
<img src="${pageContext.request.contextPath}/resources/image/tmpFiles/${group.imagePath}" alt="">
</c:if>
<c:if test="${empty group.imagePath }">
<img src="${pageContext.request.contextPath}/resources/img/nullfolder.png" alt="">
</c:if>
</a>
<div class="time small-time show-time movie-time">
</div>
<div class="clck movie-clock">
</div>
</div>
<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info">
<h6 style="color: #04B486; font-size: 70%;font-weight: bold;">${group.lecCategory }.</h6>
<h5 style="font-size: 60%"><a href="single.html" class="title">${group.lecName }</a></h5>
<ul>
<li><p class="author author-info"><a href="#" class="author">${userName}</a></p></li>
<li class="right-list"><p class="views views-info">${group.lecLike} </p></li>
</ul>
<button class="btndeup" id="btnUpdate" style="background:${pageContext.request.contextPath}/resources/img/update.png;"></button>
<button class="btndeup" id="btnDelete" style="background:${pageContext.request.contextPath}/resources/img/update.png;"></button>
</div>
<a href="upload/folderDetail?bno=${group.bno }" class="detail">
<div class="overlay"></div>
</a>
</div>

</c:forEach>
</div>

<!-- 폴더 이름입력창 -->
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>강의 폴더 생성</h2>
      </header>
      <div class="w3-container">      
      	<div class="form-group">
      	<br/>
      <label>카테고리 선택:</label>
      	<form id="createFolder">
      	<select id = "category" class="form-control" name="category">
  		<option>IT</option>
  		<option>운동</option>
  		<option>요리</option>
  		<option>생활</option>
  		<option>예술</option>
  		<option>기타</option>
		</select>
      	<label>폴더 이름:</label>
        <input type="text" id ="folderName" name="folderName" class="form-control input-lg"/>
        <input type="hidden" name="userId" value=${userId }/>
        </form>
        <br/>
        <button id ="btnFolder" class="btn btn-default">생성</button>

        </div>
       </div>
    </div>
  </div>
<br/>
<br/>
<br/>

<script>

$(()=>{
	
	$("#btnFolder").click(function () {
			
		  var folderName = $('#folderName').val();
		  var category = $('#category option:selected').val();
		  var id = '${userId}';
		  var name = '${userName}';
		  
		  console.log(folderName);
		  console.log(category);
		  console.log(id)
		  
		  if($('#folderName').val() == ''){
			  alert('이름을 입력하세요!');
		  }else{
			  $.ajax({
					type:'post',
					url:'/project/upload/createonlec',
					headers:{
						'Content-Type' : 'application/json; charset=UTF-8',
						'X-HTTP-Method-Override' : 'post'
					},
					data: JSON.stringify({
						'userId' : id,
						'lecName' : folderName,
						'lecCategory' : category
					}),
					success:function(result){
						if(result != null){
							console.log(result);
							 $("#folder").append('<div class="col-md-3 resent-grid recommended-grid movie-video-grid"><div class="resent-grid-img recommended-grid-img"><a href="upload/folderDetail?bno=${'+id+' }&lecCategory=${'+folderName+'}" class="detail"><img src="${pageContext.request.contextPath}/resources/img/nullfolder.png" alt=""></a><div class="time small-time show-time movie-time"></div><div class="clck movie-clock"></div></div><div class="resent-grid-info recommended-grid-info recommended-grid-movie-info"><h6 style="color: #04B486; font-size: 70%;font-weight: bold;">' + category +'</h6><h5 style="font-size: 60%"><a href="single.html" class="title">' +folderName +'</a></h5><ul><li><p class="author author-info"><a href="#" class="author">'+ name +'</a></p></li><li class="right-list"><p class="views views-info">${'0'} </p></li></ul></div></div>');
							  $('#id01').css('display','none');
							  $('#folderName').val('');  
						}else{
							alert('등록 실패');
						}
					}
					
				});
			 
		  }
		  
		});

	
	$("#folder").on('click','.col-md-3.resent-grid.recommended-grid.movie-video-grid .detail', function(){
		event.preventDefault();
		var location = $(this).attr('href');
		 $("#onLec").load(location);
		console.log(location)
	})
	
});



</script>



</body>
</html>