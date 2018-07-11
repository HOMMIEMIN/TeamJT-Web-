<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>You Can Be A Teacher</title>


<!-- Bootstrap core CSS -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/main/bootstrap.js"></script>



<!-- Custom fonts for this template
<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
   rel='stylesheet' type='text/css'>
<link
   href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
   rel='stylesheet' type='text/css'> -->

<!-- link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet" type="text/css" -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">
<!-- 
font-family: 'Jeju Gothic', serif;
font-family: 'Noto Sans KR', sans-serif; 
font-family: 'Nanum Gothic', serif;
-->

<!-- Plugin CSS
<link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">-->

<!-- Custom styles for this template -->
<link href="resources/css/mypage.css" rel="stylesheet">

<link href="resources/css/folder2.css" rel="stylesheet" />





<Style>
.search-container {
   display: flex;
   max-width: 1200px;
   min-width: 670px;
   margin: auto;
   margin-top: 60px;
   padding-top: 40px;
   font-family: 'Noto Sans KR', sans-serif;
   z-index: 1;
}

.search-filters {
   /*display: flex;
   justify-content: flex-start;*/
   float: left;
   width: 300px;
   height: 100%;
}

.filter-title {
   padding-bottom: 12px;
   color: #9c9c9c;
   font-size: 12pt;
}

.filter {
   padding-bottom: 14px;
   padding-left: 20px;
   margin-bottom: 10px;
   color: #9c9c9c;
   font-size: 11pt;
}

.nav-category, .nav-lectype {
   margin-bottom: 30px;
}

.filter-title {
   color: grey;
   margin-bottom: 15px;
}

.category, .lectype {
   
}

.result-box {
   display: flex;
   flex-direction: column;
   float: right;
   max-width: 900px;
   min-width: 370px;
   height: 34px;
}

.searchpath {
   float: left;
   display: flex;
   align-items: flex-end;
   width: 400px;
   height: 30px;
   color: grey;
   font-family: 'Nanum Gothic', serif;
   font-size: 10pt;
   padding-bottom: 4px;
}

.result-align {
   float: right;
   width: 126px;
   height: 34px;
}

.orderby {
   width: 60px;
   height: 34px;
   font-size: 11pt;
   font-family: 'Nanum Gothic', serif;
   border: 1px solid;
}

a:link {
   text-decoration: none;
   color: #333333;
}

a:hover {
   text-decoration: none !important;
}

/* 아래 css는 검색 결과  반복문에 적용 수정x */
img {
   height: 68%;
}

.searchresult {
   width: 1100px;
   height : auto;
   display: flex;  
   flex-wrap: wrap;
   padding-top: 100px;
}

.searchresult {
   max-width: 1100px;
   min-width: 370px;
   height:500px;
   display: flex; 
   padding-top: 100px;
}
/*
.searchresult:after {
   content: "";
   flex: auto;
}
*/
div .col-md-3.resent-grid.recommended-grid.movie-video-grid {
   width: 200px;
   height: 280px;
   max-width: 200px;
   max-height: 280px;
   padding: 0px;
   margin-right: 30px;
   margin-bottom: 20px;
}

.overlay {
   position: absolute;
   bottom: 0;
   margin: 0px;
   background: none;
   border: 1px solid grey;
   color: #f1f1f1;
   transition: .5s ease;
   opacity: 0;
   width: 200px;
   height: 280px;
   max-width: 200px;
   max-height: 280px;
   color: white;
   font-size: 20px;
   padding: 90px;
   text-align: center;
}

div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info
   {
   padding-top: 15px;
   padding-right: 10px;
   max-height: 86.5px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay
   {
   opacity: 1;
}

#addLec:hover #add {
   opacity: 0.8;
}

.author {
   position: relative;
   bottom: 8px;
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

.category{
color : black;
}

.lecType{
color : black;
}

.category {
   color: black;
}

.lecType {
   color: black;
}
</Style>

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>


   <div class="search-container">
      <div class="search-filters">

         <div style="margin-bottom: 30px; font-size: 15pt; font-weight: bold; color: #333333">
            Search Filter</div>

         <div class="nav-category">
            <div class="filter-title">Category</div>

            <div class="filter">
               <a id="AllCategory" class="category" href="">All Category</a>
            </div>
            <div class="filter">
               <a id="IT" class="category" href="">IT</a>
            </div>
            <div class="filter">
               <a id="Language" class="category" href="">Language</a>
            </div>
            <div class="filter">
               <a id="Food" class="category" href="">Food</a>
            </div>
            <div class="filter">
               <a id="Health" class="category" href="">Health</a>
            </div>
            <div class="filter">
               <a id="Life" class="category" href="">Life</a>
            </div>
            <div class="filter">
               <a id="Etc" class="category" href="">Etc.</a>
            </div>
         </div>
         

         <div class="nav-lectype">
            <div class="filter-title">Lecture Type</div>

            <div class="filter">
               <a id="Online" class="lectype" href="">Online</a>
            </div>

            <div class="filter">
               <a id="Offline" class="lectype" href="">Offline</a>
            </div>
         </div>
      </div>

      <div class="result-box">
      
         <div class="searchpath">${category } > ${lecType }<c:if test="${not empty keyword }"> > ${keyword }</c:if> </div>
         
         <div class="result-align">
            <div class="orderby">
               <a id="recent" href="javascript:void(0)" class = "repo">최신순↓</a>
            </div>
            <div class="orderby">
               <a id="popular" href="javascript:void(0)" class = "repo">인기순↓</a>
            </div>
         
         </div>

         <div class="searchresult">
         <!-- div style="padding-top: 100px;"-->
         <c:if test="${not empty online }">
            <c:forEach var="online" items="${online }">
      
               <div class="col-md-3 resent-grid recommended-grid movie-video-grid" style="display: inline-block;">
                  <div class="resent-grid-img recommended-grid-img">
                     <a
                        href=""
                        class="detail"> <c:if test="${not empty online.imagePath }">
                           <img alt=""
                              src="${pageContext.request.contextPath}/resources/image/tmpFiles/${online.imagePath}">
                        </c:if>
                     </a>
                     <div class="time small-time show-time movie-time"></div>
                     <div class="clck movie-clock"></div>
                  </div>
                  <div
                     class="resent-grid-info recommended-grid-info recommended-grid-movie-info"
                     style="padding: 5px">
                     <h6 style="color: #04B486; font-size: 70%; font-weight: bold;">${online.lecCategory }.</h6>
                     <h5 style="font-size: 60%">
                        <a href="single.html" class="title">${online.title }</a>
                     </h5>
                     <ul>
                        <li><p class="author author-info">
                              <a href="#" class="author">${online.userName }</a>
                           </p></li>
                        <li class="right-list"><p class="views views-info"></p></li>
                     </ul>
                  </div>
                  <a class="detail"
                     href="videoview?groupBno=${online.groupBno}&bno=${online.bno}&lecName=${lecName}">
                     <div class="overlay"></div>
                      <div style="width: 60px; height: 25px;background-color:#169e83; color:white; text-align: center; position: relative; bottom: 285px; ">온라인</div>
                     <div></div>
                  </a>
               </div>

            </c:forEach>
            </c:if>
            
             <c:if test="${not empty offline }">
            <c:forEach var="offline" items="${offline }">
      
               <div class="col-md-3 resent-grid recommended-grid movie-video-grid" style="display: inline-block;">
                  <div class="resent-grid-img recommended-grid-img">
                     <a
                        href=""
                        class="detail"> <c:if test="${not empty offline.imgPath }">
                           <img alt=""
                              src="${pageContext.request.contextPath}/resources/image/offline/${offline.imgPath}">
                        </c:if>
                     </a>
                     <div class="time small-time show-time movie-time"></div>
                     <div class="clck movie-clock"></div>
                  </div>
                  <div
                     class="resent-grid-info recommended-grid-info recommended-grid-movie-info"
                     style="padding: 5px">
                     <h6 style="color: #04B486; font-size: 70%; font-weight: bold;">${offline.category }.</h6>
                     <h5 style="font-size: 60%">
                        <a href="single.html" class="title">${offline.title }</a>
                     </h5>
                     <ul>
                        <li><p class="author author-info">
                              <a href="#" class="author">${offline.userid }</a>
                           </p></li>
                        <li class="right-list"><p class="views views-info"></p></li>
                     </ul>
                  </div>
                  <a class="detail"
                     href="offDetail?groupBno=${offline.groupBno}&bno=${offline.bno}&lecName=${lecName}">
                     <div class="overlay"></div>
                     <c:set var="now" value="<%=new java.util.Date()%>" />
                <c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set> 
                <c:set var="date" value="${offline.regdate }" />
                <c:set var="regDate"><fmt:formatDate value="${date}" pattern="yyyyMMddhhmmss" /></c:set>                
                     <c:if test="${offline.maxmember > offline.curmember }">
                     <div style="width: 60px; height: 25px;background-color:#169e83; color:white; text-align: center; position: relative; bottom: 285px; ">모집중</div>
                     </c:if>
                     <c:if test="${offline.maxmember == offline.curmember }">
                     <div style="width: 60px; height: 25px;background-color:orange; color:white; text-align: center; position: relative; bottom: 285px; ">모집마감</div>
                     </c:if>
                  </a>
               </div>

            </c:forEach>
            </c:if>
            <!-- /div-->
         </div>
      </div>
   </div>




<div id="loader" style="display: none; z-index: 4;"></div>
<div id="notClick" style="display: none; z-index: 3;"></div>   
<script>
var isEnd = false;
var checkScroll = true;

$(()=>{
	var start = 1;
	var end = 12;
   typeColor();
   menuColor();
   if('${category}' === "All Category"){
      $('#AllCategory').css('color','#169e83');
   }
   var category = '#'+'${category}';
   var type = '#'+'${lecType}'
   
   console.log('카테고리 : '+category);
   var clickCategory = '${category}';
   var clickType = '${lecType}';
   if(category ==='#Etc.'){
	   category = '#Etc';
	   clickCategory = 'Etc';
   }
   console.log(category);
   $(category).css('color','#169e83');
   $(type).css('color','#169e83');
   
   
   $('.category').click(function(){
      event.preventDefault();
      menuColor();
      $(this).css('color','#169e83');
      var a = $(this).css('color');
      clickCategory = $(this).text();
      if(clickCategory === 'Etc.'){
    	  clickCategory = 'Etc';
      }
      console.log(clickCategory);
      location = 'searchClick?category='+clickCategory +'&lecType=' + clickType+"&start=1&end=12";
      $("#loader").css('display','block');
      $("#notClick").css('display','block');
   });

   $('.lectype').click(function(){
      event.preventDefault();
      typeColor();
      clickType = $(this).text();
      
      console.log(clickType);
      $(this).css('color','#169e83');
      location = 'searchClick?category='+clickCategory +'&lecType=' + clickType+"&start=1&end=12";
      
   
   });
   
   $('.orderby').click(function(){
	   repoColor();
	   $(this).css('border','1px solid #169e83');
	   $(this).css('color','#169e83');
   });

   function typeColor(){
      $('.lectype').css('color','#333333');
   }

   function menuColor(){
      $('.category').css('color','#333333');
   }
   
   var search = '${searchText}';
   if(search != null){
      $('#searchText').val(search);
   }
   
   function repoColor(){
	   $('.orderby').css('color','black');
	   $('.orderby').css('border','1px solid black');
   }
   
   
   $(window).scroll(function(){
	  	 var $window = $(this);
	      var scrollTop = $window.scrollTop();
	      var windowHeight = $window.height();
	      var documentHeight = $(document).height();

	  	if(scrollTop + windowHeight + 10 > documentHeight){
	  		if(checkScroll == true){
	  			checkScroll = false;
	  		searchScroll();
	  		}
	  	}
	  
	  		 
	  });
 
   function searchScroll(){
 		 if(isEnd == true){
 			 return;
 		 }
 		 start += 12;
 		 end += 12;
 		if(clickType === 'Online'){ 
 		$.ajax({
	         type: 'get',
	         url: 'searchScroll?start='+start+'&end='+end+"&category="+clickCategory+"&lecType="+clickType,
	         headers: {
	            'Content-Type': 'application/json',
	            'X-HTTP-Method-Override': 'get'
	         },
	         success: function(result) {
	        	 if(result.length < 16){
	        		 isEnd = true;
	        	 }
	        	 console.log(result);
	        	 $.each(result, function(){
	        		 console.log('반복문 들어옴');
	        		 $('.searchresult').append('<div class="col-md-3 resent-grid recommended-grid movie-video-grid" style="display: inline-block;"><div class="resent-grid-img recommended-grid-img"><a href="" class="detail"><img alt="" src="/project/resources/image/tmpFiles/'+ this.imagePath + '"></a><div class="time small-time show-time movie-time"></div><div class="clck movie-clock"></div></div><div class="resent-grid-info recommended-grid-info recommended-grid-movie-info" style="padding: 5px"><h6 style="color: #04B486; font-size: 70%; font-weight: bold;">'+this.lecCategory+'.</h6><h5 style="font-size: 60%"><a href="single.html" class="title">'+this.title+'</a></h5><ul><li><p class="author author-info"><a href="#" class="author">'+this.userName+'</a></p></li><li class="right-list"><p class="views views-info"></p></li></ul></div><a class="detail"href="videoview?groupBno='+this.groupBno+'&bno='+ this.bno +'&lecName="${lecName}""><div class="overlay"></div><div style="width: 60px; height: 25px;background-color:#169e83; color:white; text-align: center; position: relative; bottom: 285px; ">온라인</div><div></div></a></div>');
	        		 checkScroll = true;
	        	 });
	         }
		 });
 		}
 	 }
 
});


</script>


   


</body>

</html>