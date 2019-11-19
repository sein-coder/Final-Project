<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
.mb-4, .my-4 {
    margin-bottom: 1.5rem!important;
 
}
<!-- 우후 글씨 -->
html, body {
  width: 100%;  
  height: 100%;
  background: #FF7777;
  -webkit-font-smoothing: antialiased;
  display: flex;
  justify-content: center;
  align-items: center;
}

h1 {
  height: 50px;
  
}

h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
  font-family: 'Titan One', cursive;
  font-size: 80px;
  color: #FF7777;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }
h1 span:nth-child(7) { animation-delay: .6s; }
h1 span:nth-child(8) { animation-delay: .7s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
  }
}
</style>

<section>
	<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta name="description" content="">
	  <meta name="author" content="">
	</head>

<body>
<div class="site-section">
	<div class="container">
	<div class="row justify-content-center mb-0">
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block" style="width: 100%; height: 200px;" src="${pageContext.request.contextPath }/resources/images/festival/포스터1.png" alt="First slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block" style="width: 100%; height: 200px;" src="${pageContext.request.contextPath }/resources/images/festival/포스터2.png" alt="Second slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block" style="width: 100%; height: 200px;" src="${pageContext.request.contextPath }/resources/images/festival/포스터3.png" alt="Third slide">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	</div>
  <!-- Page Content -->
  <div class="container">

	 <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8 t-3">
		 
		<div class="row justify-content-end mb-5">
			
		</div>
        <!-- Blog Post -->
       <div class="carousel-inner col-md-13 " style="border-color:#ffc9c9; ">
        <c:if test="${not empty list }">
		<c:forEach items="${list}" var="v" varStatus="s">
	          		<div class="card mb-4 t-6" id="pic" style="background-color:#ffc9c9;">
	          			<img class="card-img-top" width="100px" height="500px" src="${pageContext.request.contextPath}/resources/images/festival/${v.festival_Thumbnail }" alt="Card image cap">
	          	<div class="card-body">
		            <h2 class="card-title"><p>${v.festival_Title }</p></h2>
		            <button class="proceeding" id="proceeding" style="color: #fff; text-align: center; border: none;">
						${v.festival_Proceeding }
					</button>
		            <p class="card-text"><p>${v.festival_StartDate } ~ ${v.festival_EndDate }</p></p>
		            <a href="#" class="btn btn-primary" onclick='location.href="${path}/festival/festivalView?festival_No=${v.festival_No }"' 
		            >Read More &rarr;</a>
        		 </div>
         		 </div>
         		  </c:forEach>
		</c:if>
        </div>

   
       <!--  Pagination -->
        <ul class="pagination justify-content-center mb-4" id="this">
          <li id="prePage" class="page-item">
	          	<c:if test="${not empty searchKeyword }">
	          		 <a class="page-link" href="${pageContext.request.contextPath }/festival/searchFestival.do?cPage=${cPage-1}&searchKeyword=${searchKeyword}">&larr; Older</a>
	          	</c:if>
	          	<c:if test="${empty searchKeyword }">
	          		  <a class="page-link" href="${pageContext.request.contextPath }/festival/searchFestival.do?cPage=${cPage-1}">&larr; Older</a>
	          	</c:if>
          </li>
          <li>
          	
          </li>
          <li id="nextPage" class="page-item">
	          <c:if test="${not empty searchKeyword }">
	         	<a class="page-link" href="${pageContext.request.contextPath }/festival/searchFestival.do?cPage=${cPage+1}&searchKeyword=${searchKeyword}">Newer &rarr;</a>
	          </c:if>
	          <c:if test="${empty searchKeyword }">
	            <a class="page-link" href="${pageContext.request.contextPath }/festival/searchFestival.do?cPage=${cPage+1}">Newer &rarr;</a>
	          </c:if>
          </li>
        </ul>

      </div> 

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
		<div class="row">
			<div class="col-6">
				<img src="https://item.kakaocdn.net/do/13223be410903921ff0f5725340e04aff43ad912ad8dd55b04db6a64cddaf76d" style="width:50px; height=50px;">
			</div>
			<div class="col">
				<div class="site-menu js-clone-nav d-none d-lg-block" style="color:#f38181;text-align: right;">
					<div class="dropdown mt-2">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black; background-color:#ffc9c9;border-color: white; ">
					   	<img src="https://svgsilh.com/svg_v2/1295308.svg" style="width:25px; height=25px;">
					   	설정
					  </button>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/festival/festivalForm">등록</a>
					  </div>
					</div>
				</div>
			</div>
		</div>
		
        <!-- Search Widget -->
        <div class="card my-4" style="margin-top: 0px !important;">
          <h5 class="card-header" style="background-color:#ffc9c9;">Search</h5>
          <div class="card-body">
            <div class="input-group">
            		<form action="${pageContext.request.contextPath }/festival/searchFestival.do" method="post" enctype="multipart/form-data">
						<div class="ml-2 row">
		            	<div id="search-Title" style="width: 250px;">
							<input type="hidden" name="searchType" value="festival_Title||fesitval_Content">
		                	<input type="text" name="searchKeyword" class="form-control" placeholder="Search for..." value="">
		            	</div>
	                	<button class="btn btn-secondary" type="submit">Go!</button>
						</div>
             		
             		</form>
            </div>
          </div>
        </div>

		<div class="card my-4">
	          <div class="col" style="text-align: center;"><b>asdasd</b>
	          	<button class="proceeding" id="proceeding" style="color: #fff; text-align: center; border: none;">
						asd</button>
	          </div>
	          &nbsp;
	          <div class="card-body" id="content">
	          </div>
          </div>


        <!-- Side Widget -->
        <c:if test="${not empty list2}">
        	<c:forEach items="${list2}" var="v" varStatus="s">
	        <div class="card my-4">
	          	<div>
		          	<a href="${pageContext.request.contextPath}/festival/festivalView?festival_No=${v.festival_No}">
		          		<h5 class="card-header" style="background-color:#ffc9c9;">${v.festival_Title}</h5>
		          	</a>
	          	</div>
	          <div class="col" style="text-align: center;"><b>[ ${v.festival_StartDate } ~ ${v.festival_EndDate } ]</b>
	          	<button class="proceeding" id="proceeding" style="color: #fff; text-align: center; border: none;">
						${v.festival_Proceeding }</button>
	          </div>
	          &nbsp;
	          <div class="card-body" id="content">
	        	<c:choose>
		           <c:when test="${fn:length(v.festival_Content) > 101}">
				        <c:out value="${fn:substring(v.festival_Content, 0, 100)}...">
				        </c:out>
			        </c:when>
			        <c:otherwise>
			        	<c:out value="${v.festival_Content }"/>
			        </c:otherwise>
			    </c:choose>
	          </div>
	          </div>
	        </c:forEach>
		</c:if>
      </div>
    
    </div>
    <!-- /.row -->

  </div>
  </div>
 </body>


	<script>
	/*  축제 진행여부 */
		$('.proceeding').each(function(){
			if($(this).text().includes('예정',0)){
				$(this).css("background-color",'blue');
			}else if($(this).text().includes('진행',0)){
				$(this).css("background-color",'green');
			}else if($(this).text().includes('종료',0)){
				$(this).css("background-color",'red');
		}
		});
	
	</script>
	<script>
	/* 썸네일 사진 */
	$('#upFile').on('change',function (e) {
	       var get_file = e.target.files;
	
	       var image = $("#pic").children();
	       var reader = new FileReader();
	       
	       reader.onload = (function (aImg) {
	           console.log(1);
	           return function (e) {
	               console.log(3);
	               aImg.attr("src",e.target.result);
	               aImg.attr({"width":"400px","height":"252px"});
	           }
	       })(image)
	
	       if(get_file){
	           reader.readAsDataURL(get_file[0]);
	           console.log(2);
	       }
	   });
	</script>
	
	<script>
	$(document).ready(function(){
		var lastP = Math.ceil("${totalCount}"/3); 
		
		console.log(lastP);
		
		var nowP = ${cPage};

		if("${totalCount}"==1 || "${totalCount}"==2 || "${totalCount}"==3){
			$("#nextPage").addClass("disabled");
			$("#prePage").addClass("disabled");
		}else{
			if(nowP >= lastP){
				$("#nextPage").addClass("disabled");
			}else if(nowP <= 1){
				$("#prePage").addClass("disabled");
			}
		}
	});
	</script>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
