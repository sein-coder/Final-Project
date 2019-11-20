<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<<<<<<< HEAD
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="festivalList"/>
</jsp:include>
<style>
img { max-width:100%; }

a {
    -webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease; 
	}
    
a:hover {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; /* IE 8 */
    filter: alpha(opacity=50); /* IE7 */
    opacity: 0.6;
    text-decoration: none;
}



body{
    border-top:0;
    background:#c4e17f;
    background-image:-webkit-linear-gradient(left,#c4e17f,#c4e17f 12.5%,#f7fdca 12.5%,#f7fdca 25%,#fecf71 25%,#fecf71 37.5%,#f0776c 37.5%,#f0776c 50%,#db9dbe 50%,#db9dbe 62.5%,#c49cde 62.5%,#c49cde 75%,#669ae1 75%,#669ae1 87.5%,#62c2e4 87.5%,#62c2e4);background-image:-moz-linear-gradient(left,#c4e17f,#c4e17f 12.5%,#f7fdca 12.5%,#f7fdca 25%,#fecf71 25%,#fecf71 37.5%,#f0776c 37.5%,#f0776c 50%,#db9dbe 50%,#db9dbe 62.5%,#c49cde 62.5%,#c49cde 75%,#669ae1 75%,#669ae1 87.5%,#62c2e4 87.5%,#62c2e4);background-image:-o-linear-gradient(left,#c4e17f,#c4e17f 12.5%,#f7fdca 12.5%,#f7fdca 25%,#fecf71 25%,#fecf71 37.5%,#f0776c 37.5%,#f0776c 50%,#db9dbe 50%,#db9dbe 62.5%,#c49cde 62.5%,#c49cde 75%,#669ae1 75%,#669ae1 87.5%,#62c2e4 87.5%,#62c2e4);background-image:linear-gradient(to right,#c4e17f,#c4e17f 12.5%,#f7fdca 12.5%,#f7fdca 25%,#fecf71 25%,#fecf71 37.5%,#f0776c 37.5%,#f0776c 50%,#db9dbe 50%,#db9dbe 62.5%,#c49cde 62.5%,#c49cde 75%,#669ae1 75%,#669ae1 87.5%,#62c2e4 87.5%,#62c2e4)
}

.thumbnails li> .fff .caption { 
    background:#fff !important; 
    padding:10px
}

/* Page Header */
.page-header {
    background: #f9f9f9;
    margin: -30px -40px 40px;
    padding: 20px 40px;
    border-top: 4px solid #ccc;
    color: #999;
    text-transform: uppercase;
}
    
.page-header h3 {
    line-height: 0.88rem;
    color: #000;
}

ul.thumbnails { 
    margin-bottom: 0px;
}



/* Thumbnail Box */
.caption h4 {
    color: #444;
}

.caption p {  
    color: #999;
}



/* Carousel Control */
.control-box {
    text-align: right;
    width: 100%;
}
.carousel-control{
    background: #666;
    border: 0px;
    border-radius: 0px;
    display: inline-block;
    font-size: 34px;
    font-weight: 200;
    line-height: 18px;
    opacity: 0.5;
    padding: 4px 10px 0px;
    position: static;
    height: 30px;
    width: 15px;
}



/* Mobile Only */
@media (max-width: 767px) {
    .page-header, .control-box {
        text-align: center;
    } 
}
@media (max-width: 479px) {
    .caption {
        word-break: break-all;
    }
}


li { list-style-type:none;}

::selection { background: #ff5e99; color: #FFFFFF; text-shadow: 0; }
::-moz-selection { background: #ff5e99; color: #FFFFFF; }

</style>
<section>
<div class="container">
<div class="col-xs-12">

    <div class="page-header">
        <h3>Bootstrap 3.3.0</h3>
        <p>Responsive Moving Box Carousel Demo</p>
    </div>
        
    <div class="carousel slide" id="myCarousel">
        <div class="carousel-inner">
            <div class="item active">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
    						<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide1 --> 
            <div class="item">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide2 --> 
            <div class="item">
                    <ul class="thumbnails">
                        <li class="col-sm-3">	
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide3 --> 
        </div>
        
       
	   <nav>
			<ul class="control-box pager">
				<li><a data-slide="prev" href="#myCarousel" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
				<li><a data-slide="next" href="#myCarousel" class=""><i class="glyphicon glyphicon-chevron-right"></i></li>
			</ul>
		</nav>
	   <!-- /.control-box -->   
                              
    </div><!-- /#myCarousel -->
        
</div><!-- /.col-xs-12 -->          

</div><!-- /.container -->
<script>
$(document).ready(function() {
    $('.carousel').carousel({
      interval: 6000
    })
  });


</script>




</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
=======
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

<style>
/* Reset */
ul {
    list-style: none
}
.clearfix:before,
.clearfix:after {
    content: " ";
    display: table;
}
.clearfix:after {
    clear: both;
}
.clearfix {
    *zoom: 1;
}
/* Main */
#social {
    text-align: center;
    position: absolute;
    bottom: 14%;
    width: 100%;
}
#social p{
  margin-bottom: 10px;
}

#social ul,
#social li {
    display: inline-block;
}

/* Skeleton */

ul.flip {
    position: relative;
    float: left;
    margin: 5px;
    width: 30px;
    height: 45px;
    font-size: 40px;
    font-weight: bold;
    line-height: 43.5px;
    border-radius: 6px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, .7);
}

ul.flip li {
    z-index: 1;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;

}

ul.flip li:first-child {
    z-index: 2;
}

ul.flip li a {
    display: block;
    height: 100%;
    perspective: 200px;
}

ul.flip li a div {
    z-index: 1;
    position: absolute;
    left: 0;
    width: 100%;
    height: 50%;
    overflow: hidden;
}

ul.flip li a div .shadow {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 2;
}

ul.flip li a div.up {
    transform-origin: 50% 100%;
    top: 0;
}

ul.flip li a div.up:after {
  content: "";
  position:absolute;
  top:44px;
  left:0;
  z-index: 5;
    width: 100%;
  height: 3px;
  background-color: rgba(0,0,0,.4);
}

ul.flip li a div.down {
    transform-origin: 50% 0%;
    bottom: 0;
}

ul.flip li a div div.inn {
    position: absolute;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 200%;
    color: #ccc;
    text-shadow: 0 1px 2px #000;
    text-align: center;
    background-color: #333;
    border-radius: 6px;
}

ul.flip li a div.up div.inn {
    top: 0;

}

ul.flip li a div.down div.inn {
    bottom: 0;
}

/* PLAY */

body.play ul li.before {
    z-index: 3;
}

body.play ul li.active {
    animation: asd .5s .5s linear both;
    z-index: 2;
}

@keyframes asd {
    0% {
        z-index: 2;
    }
    5% {
        z-index: 4;
    }
    100% {
        z-index: 4;
    }
}

body.play ul li.active .down {
    z-index: 2;
    animation: turn .5s .5s linear both;
}

@keyframes turn {
    0% {
        transform: rotateX(90deg);
    }
    100% {
        transform: rotateX(0deg);
    }
}

body.play ul li.before .up {
    z-index: 2;
    animation: turn2 .5s linear both;
}

@keyframes turn2 {
    0% {
        transform: rotateX(0deg);
    }
    100% {
        transform: rotateX(-90deg);
    }
}
/* SHADOW */
body.play ul li.before .up .shadow {
    background: -moz-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0, 0, .1)), color-stop(100%, rgba(0, 0, 0, 1)));
    background: linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -o-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -ms-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: linear-gradient(to bottom, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    animation: show .5s linear both;
}

body.play ul li.active .up .shadow {
    background: -moz-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0, 0, .1)), color-stop(100%, rgba(0, 0, 0, 1)));
    background: linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -o-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: -ms-linear-gradient(top, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    background: linear-gradient(to bottom, rgba(0, 0, 0, .1) 0%, rgba(0, 0, 0, 1) 100%);
    animation: hide .5s .3s linear both;
}
/*DOWN*/
body.play ul li.before .down .shadow {
    background: -moz-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0, 0, 1)), color-stop(100%, rgba(0, 0, 0, .1)));
    background: linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -o-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -ms-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: linear-gradient(to bottom, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    animation: show .5s linear both;
}
body.play ul li.active .down .shadow {
    background: -moz-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0, 0, 1)), color-stop(100%, rgba(0, 0, 0, .1)));
    background: linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -o-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: -ms-linear-gradient(top, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    background: linear-gradient(to bottom, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, .1) 100%);
    animation: hide .5s .3s linear both;
}
@keyframes show {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
@keyframes hide {
    0% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}

span.show{
	display: inline-block;
}

span.hide {
	display: none;
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
				<div class="col">
				<c:if test="${ !(type == 'member' && loginMember.member_Id == 'jy9503') }">
					<div class="site-menu js-clone-nav d-none d-lg-block mt-5" style="color:#f38181;text-align: right;">
					</div>
				</c:if>
				<c:if test="${ type == 'member' && loginMember.member_Id == 'jy9503' }">
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
				</c:if>
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
        
        
        <!-- 우측 예정된 축제 이름 및 날짜 -->
       	<div class="card my-4" style="margin-top: 0px !important;">
          <h5 class="card-header" style="background-color:#ffc9c9;">현재 예정중인 축제</h5>
          <div class="card-body">
            <div class="input-group justify-content-center">
	            	<div class="row justify-content-center">
						<div class="col-pl-0">
						    <ul class="flip minutePlay" style="list-style-type: none;">
						        <li>
						            <a>
						                <div class="up">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						                <div class="down">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						            </a>
						        </li>
						    </ul>
						    <ul class="flip secondPlay">
						        <li>
						            <a>
						                <div class="up">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						                <div class="down">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						            </a>
						        </li>
						    </ul>
					    </div>		    
						<div class="col-pl-pr-0" style="font-size: 40px; line-height: 43.5px; margin-top: 5px;" >월</div>
						
						<div class="col-pl-0">
						    <ul class="flip thirdPlay" style="list-style-type: none;">
						        <li>
						            <a>
						                <div class="up">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						                <div class="down">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						            </a>
						        </li>
						    </ul>
						    <ul class="flip fourthPlay">
						        <li>
						            <a>
						                <div class="up">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						                <div class="down">
						                    <div class="shadow"></div>
						                    <div class="inn">0</div>
						                </div>
						            </a>
						        </li>
						    </ul>
					    </div>
						<div class="col-pl-pr-0" style="font-size: 40px; line-height: 43.5px; margin-top: 5px;" >일</div>
					</div>
            </div>
            <div id="scheduledFestival" class="row justify-content-center">
            	<span class="show">-</span>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
      	<div class="row">	
      		<div class="ml-3" style="display: inline-block">
			<img src="https://item.kakaocdn.net/do/13223be410903921ff0f5725340e04aff43ad912ad8dd55b04db6a64cddaf76d" style="width:50px; height=50px;">
		</div>
       	<div class="col"style="display: inline-block">
       		<a href="#"><b>가장 많이 본 축제</b></a>
   			</div>
   		</div>
   		
        <c:if test="${not empty list2}">
        	<c:forEach items="${list2}" var="v" varStatus="s">
	        <div class="card my-4" style="margin-top: 0px !important;">
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
		
		/* 페이징 처리 파트 */
		var lastP = Math.ceil("${totalCount}"/3); 
		
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
		
		/* 예정축제값 가져오기 */
		$.ajax({
			url : "${pageContext.request.contextPath}/festival/selectNowProceeding",
			success : function(data){
				if(data.nplist.length!=0){

					for(var i=0; i<data.nplist.length; i++){
						var name = data.nplist[i].festival_Title;
						
						var date = new Date(data.nplist[i].festival_StartDate);
						
						var dates = new Array();
						
						dates.push((""+(date.getMonth()+1)).substring(0,1));
						dates.push((""+(date.getMonth()+1)).substring(1,2));
						dates.push((""+date.getDate()).substring(0,1));
						dates.push((""+date.getDate()).substring(1,2));
						
						var plays = ["minutePlay","secondPlay","thirdPlay","fourthPlay"];
						
						for(var j = 0; j<dates.length; j++){
							var tags  = '<li><a><div class="up"><div class="shadow"></div>';
			                tags += '<div class="inn">'+dates[j]+'</div></div><div class="down">';
			                tags += '<div class="shadow"></div>';
			                tags += '<div class="inn">'+dates[j]+'</div></div></a></li>';
			                $("ul."+plays[j]).append(tags);
						}
						
		                $("#scheduledFestival").append("<span class='hide'>"+name+"</span>");
						
		                
					}
					
				    setInterval(function () {
				        minutePlay()
				    }, 5000);
				}
			}
		});
		
		
	});
	</script>
	<script>
	/* 이번달 축제  */		
	function minutePlay() {
		
		$("body").removeClass("play");
	    var aa = $("ul.secondPlay li.active");
	
	    if (aa.html() == undefined) {
	        aa = $("ul.secondPlay li").eq(0);
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	
	    }
	    else if (aa.is(":last-child")) {
	        $("ul.secondPlay li").removeClass("before");
	        aa.addClass("before").removeClass("active");
	        aa = $("ul.secondPlay li").eq(0);
	        aa.addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    else {
	        $("ul.secondPlay li").removeClass("before");
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
		
	    $("body").removeClass("play");
	    var aa = $("ul.minutePlay li.active");
	
	    if (aa.html() == undefined) {
	        aa = $("ul.minutePlay li").eq(0);
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	
	    }
	    else if (aa.is(":last-child")) {
	        $("ul.minutePlay li").removeClass("before");
	        aa.addClass("before").removeClass("active");
	        aa = $("ul.minutePlay li").eq(0);
	        aa.addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    else {
	        $("ul.minutePlay li").removeClass("before");
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    
		$("body").removeClass("play");
	    var aa = $("ul.thirdPlay li.active");
	
	    if (aa.html() == undefined) {
	        aa = $("ul.thirdPlay li").eq(0);
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	
	    }
	    else if (aa.is(":last-child")) {
	        $("ul.thirdPlay li").removeClass("before");
	        aa.addClass("before").removeClass("active");
	        aa = $("ul.thirdPlay li").eq(0);
	        aa.addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    else {
	        $("ul.thirdPlay li").removeClass("before");
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	    }

	    $("body").removeClass("play");
	    var aa = $("ul.fourthPlay li.active");
	
	    if (aa.html() == undefined) {
	        aa = $("ul.fourthPlay li").eq(0);
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	
	    }
	    else if (aa.is(":last-child")) {
	        $("ul.fourthPlay li").removeClass("before");
	        aa.addClass("before").removeClass("active");
	        aa = $("ul.fourthPlay li").eq(0);
	        aa.addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    else {
	        $("ul.fourthPlay li").removeClass("before");
	        aa.addClass("before")
	            .removeClass("active")
	            .next("li")
	            .addClass("active")
	            .closest("body")
	            .addClass("play");
	    }
	    
	    var bb = $("#scheduledFestival").children(".show");

	    if(!(bb.is($("#scheduledFestival").children("span").last())) ){
	    	bb.removeClass("show");
	    	bb.addClass("hide");
	    	bb.next("span").addClass("show");
	    	bb.next("span").removeClass("hide");
	    }
	    else if(bb.is($("#scheduledFestival").children("span").last())){
	    	bb.removeClass("show");
	    	bb.addClass("hide");
	    	$("#scheduledFestival").children("span").first().addClass("show");
	    	$("#scheduledFestival").children("span").first().removeClass("hide");
	    }
	}
	</script>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
>>>>>>> refs/remotes/origin/sein
