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
 */
}

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
@media ( max-width : 768px;) {
	.page-header, .control-box {
		text-align: center;
	}
}
@media ( max-height : 800px;) {
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

button#btn-write {
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
					
					<p>렛.잇.고와 함께 하세요</p>
				</div>
				<div style="pull-right; color:#f38181;">
					<nav class="site-navigation position-relative text-right" role="navigation" style="background-color: #fff; color:#f38181;" >
						<ul class="site-menu js-clone-nav m-auto d-none d-lg-block" >
							<li class="active" ><a
								href="${pageContext.request.contextPath}/festival/festivalForm"><span>축제
										등록</span></a></li>
						</ul>
					</nav>
				</div>



				<div class="carousel slide" id="myCarousel">
					<div class="carousel-inner">
						<c:if test="${not empty list }">
							<c:forEach items="${list}" var="v" varStatus="s">
								<c:if test="${s.first }">
									<div class="item active">
										<ul class="thumbnails">
								</c:if>

								<c:if test="${!s.first&&s.count%4==1 }">
									<div class="item">
										<ul class="thumbnails">
								</c:if>

								<li class="col-sm-3" style="border: 5px solid #ffc9c9">
									<div class="fff">
										<div class="thumbnail">
									<img alt="없음" style="max-width: 220px; max-height: 200px" src="${pageContext.request.contextPath}/resources/images/festival/${v.festival_Thumbnail }">
										</div>
										<div class="caption">
											<p>${v.festival_Title }</p>
											<button class="proceeding" id="proceeding" style="color: #fff; text-align: center;">
												${v.festival_Proceeding }
											</button>
											<p>${v.festival_StartDate }~${v.festival_EndDate }</p>
											<p>${s.count}</p>
											<Input type="hidden" name="festival_No"> <a
												class="btn btn-mini"
												onclick='location.href="${path}/festival/festivalView?festival_No=${v.festival_No }"'>»
												Read More</a>
										</div>
									</div>
								</li>

								<c:if test="${s.count%4==0||s.last}">
				</ul>
			</div>
			</c:if>


			</c:forEach>
			</c:if>
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
				interval : 6000
			})
		});
		
		/* 썸네일 사진 */
		 $('#upFile').on('change',function (e) {
		        var get_file = e.target.files;
		 
		        var image = $("#pic-1").children();
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
	

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />