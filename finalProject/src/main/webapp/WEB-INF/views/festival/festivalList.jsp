<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>

<style>
/* Global */
img {
	max-width: 100%;
}

a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease;
}

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

body {
	border-top: 0;
	background: #c4e17f;
	/* background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%,
		#f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%,
		#db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%,
		#669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%,
		#f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%,
		#db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%,
		#669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca
		25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe
		50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1
		87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca
		25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe
		50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1
		87.5%, #62c2e4 87.5%, #62c2e4)
 */}

.thumbnails li>.fff .caption {
	background: #fff !important;
	padding: 10px
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

.carousel-control {
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
@media ( max-width : 767px) {
	.page-header, .control-box {
		text-align: center;
	}
}

@media ( max-width : 479px) {
	.caption {
		word-break: break-all;
	}
}

li {
	list-style-type: none;
}

::selection {
	background: #ff5e99;
	color: #FFFFFF;
	text-shadow: 0;
}

::-moz-selection {
	background: #ff5e99;
	color: #FFFFFF;
}
button#btn-write{
	background: #f38181;
	color: #FFF;
	margin-bottom: 10px;
	margin-left: 0px;
	float: right;
}

</style>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<section>
	<div class="site-section">
	<!------ Include the above in your HEAD tag ---------->
	<div class="container">
		<div class="col-xs-12">

			<div class="page-header">
				<h3>Bootstrap 3.3.0</h3>
				<p>렛.잇.고와 함께 하세요</p>
			</div>
			<div>
			<input type="button" value="축제등록" id='btn-add' class='btn btn-outline-success' onclick='location.href="${path}/festival/festivalForm"'/>
			</div>

			<div class="carousel slide" id="myCarousel" >
				<div class="carousel-inner">
					<div class="item active">
						<ul class="thumbnails">
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- /Slide1 -->
					<div class="item">
						<ul class="thumbnails">
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- /Slide2 -->
					<div class="item">
						<ul class="thumbnails">
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
									<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-3" style="border:5px solid #ffc9c9">
								<div class="fff">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>축제 제목</h4>
										<p>축제 기간</p>
										<p>#해시태그</p>
										<a class="btn btn-mini" href="#">» Read More</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- /Slide3 -->
				</div>


				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></a></li>
					</ul>
				</nav>
				<!-- /.control-box -->

			</div>
			<!-- /#myCarousel -->

		</div>
		<!-- /.col-xs-12 -->

	</div>
	<!-- /.container -->
	</div>
<script>
//Carousel Auto-Cycle
$(document).ready(function() {
  $('.carousel').carousel({
    interval: 6000
  })
});

</script>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />