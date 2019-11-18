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

        <h1 class="my-4" style="text-align: center;text-shadow: 0px 5px 0px #fff; font-weight: bold; color:#f38181">Enjoy the festival with
          <small>'let Eat Go'</small>
        </h1>
		 
		<div row>
			<div class="site-menu js-clone-nav m-auto d-none d-lg-block" style="color:#f38181;text-align: right;">
				
					<ul class="">
						<li class="pull-right active" style="list-style-type: none;" ><a
							href="${pageContext.request.contextPath}/festival/festivalForm"><span>축제등록</span></a></li>
					</ul>
				
			</div>
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

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header" style="background-color:#ffc9c9;">Search</h5>
          <div class="card-body">
            <div class="input-group">
            	
            	<div id="search-Title">
            		<form action="${pageContext.request.contextPath }/festival/searchFestival.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="searchType" value="festival_Title||fesitval_Content">
		                <input type="text" name="searchKeyword" class="form-control" placeholder="Search for..."
		              	value="" style="width:300px;">
		              <span class="input-group-btn">
		                <button class="btn btn-secondary" type="submit">Go!</button>
		              </span>
             		</form>
            	</div>	
            </div>
          </div>
        </div>


        <!-- Side Widget -->
        <c:if test="${not empty list2}">
        	<c:forEach items="${list2}" var="v" varStatus="s">
	        <div class="card my-4">
	          	<div style>
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
