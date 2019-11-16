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
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8 t-3">

        <h1 class="my-4" style="text-align: center;">Enjoy the festival with
          <small>'let Eat Go'</small>
        </h1>
		
		<div style="pull-right; color:#f38181;">
			
				<ul class="site-menu js-clone-nav m-auto d-none d-lg-block">
					<li class="active col-md-3" ><a
						href="${pageContext.request.contextPath}/festival/festivalForm"><span>축제등록</span></a></li>
				</ul>
			
		</div>
        <!-- Blog Post -->
       <div class="carousel-inner col-md-11 " style="border-color:#ffc9c9; ">
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
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
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
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header" style="background-color:#ffc9c9;">해시태그</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
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
	







</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
