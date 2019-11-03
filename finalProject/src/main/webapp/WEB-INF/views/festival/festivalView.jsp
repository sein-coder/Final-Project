<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-family: 'open sans';
	overflow-x: hidden;
}

img {
	max-width: 100%;
}

.preview {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

@media screen and (max-width: 996px) {
	.preview {
		margin-bottom: 20px;
	}
}

.preview-pic {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.preview-thumbnail.nav-tabs {
	border: none;
	margin-top: 15px;
}

.preview-thumbnail.nav-tabs li {
	width: 18%;
	margin-right: 2.5%;
}

.preview-thumbnail.nav-tabs li img {
	max-width: 100%;
	display: block;
}

.preview-thumbnail.nav-tabs li a {
	padding: 0;
	margin: 0;
}

.preview-thumbnail.nav-tabs li:last-of-type {
	margin-right: 0;
}

.tab-content {
	overflow: hidden;
}

.tab-content img {
	width: 100%;
	-webkit-animation-name: opacity;
	animation-name: opacity;
	-webkit-animation-duration: .3s;
	animation-duration: .3s;
}

.card {
	margin-top: 50px;
	background: #eee;
	padding: 3em;
	line-height: 1.5em;
}

@media screen and (min-width: 997px) {
	.wrapper {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		background-color: #ffc9c9;
	}
}

.details {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

.colors {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.product-title, .price, .sizes, .colors {
	text-transform: UPPERCASE;
	font-weight: bold;
}

.checked, .price span {
	color: #ff9f1a;
}

.product-title, .rating, .product-description, .price, .vote, .sizes {
	margin-bottom: 15px;
}

.product-title {
	margin-top: 0;
}

.size {
	margin-right: 10px;
}

.size:first-of-type {
	margin-left: 40px;
}

.color {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	height: 2em;
	width: 2em;
	border-radius: 2px;
}

.color:first-of-type {
	margin-left: 20px;
}

.add-to-cart, .like {
	background: #ff9f1a;
	padding: 1.2em 1.5em;
	border: none;
	text-transform: UPPERCASE;
	font-weight: bold;
	color: #fff;
	-webkit-transition: background .3s ease;
	transition: background .3s ease;
}

.add-to-cart:hover, .like:hover {
	background: #b36800;
	color: #fff;
}

.not-available {
	text-align: center;
	line-height: 2em;
}

.not-available:before {
	font-family: fontawesome;
	content: "\f00d";
	color: #fff;
}

.orange {
	background: #ff9f1a;
}

.green {
	background: #85ad00;
}

.blue {
	background: #0076ad;
}

.tooltip-inner {
	padding: 1.3em;
}

@
-webkit-keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}

100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}
@
keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}

100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}
/* 	버튼 css */
.btn-sensitive:active, .btn-sensitive.active {
	top: 1px;
	margin-top: 4px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<body>
	<section id="content">
		<div class="site-section">

			<div class="row">
				<div class="col-1"
					style="padding-left: 10px; padding-right: 0; margin-top: 50px;">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								style="background-color: #f38181">여기</button>
						</div>
 
						<!-- Collect the nav links, forms, and other content for toggling -->

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1"
							style="background-color: #ffc9c9l">
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false">
										<span class="glyphicon glyphicon-shopping-cart"></span>내가 본 축제<span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu dropdown-cart" role="menu">
										<li><span class="item"> <span class="item-left">
													<img src="http://lorempixel.com/50/50/" alt="" /> <span
													class="item-info"> <span>축제이름</span>
												</span>
											</span> <span class="item-right">
													<button class="btn btn-xs btn-danger pull-right">x</button>
											</span>
										</span></li>
										<li><span class="item"> <span class="item-left">
													<img src="http://lorempixel.com/50/50/" alt="" /> <span
													class="item-info"> <span>축제이름</span>
												</span>
											</span> <span class="item-right">
													<button class="btn btn-xs btn-danger pull-right">x</button>
											</span>
										</span></li>
										<li><span class="item"> <span class="item-left">
													<img src="http://lorempixel.com/50/50/" alt="" /> <span
													class="item-info"> <span>축제이름</span>
												</span>
											</span> <span class="item-right">
													<button class="btn btn-xs btn-danger pull-right">x</button>
											</span>
										</span></li>
										<li><span class="item"> <span class="item-left">
													<img src="http://lorempixel.com/50/50/" alt="" /> <span
													class="item-info"> <span>축제이름</span>
												</span>
											</span> <span class="item-right">
													<button class="btn btn-xs btn-danger pull-right">x</button>
											</span>
										</span></li>
									</ul></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</div>



				<!-- 새로운 뷰 -->

				<div class="container" style="background-color: white;">
					<div class="card col-md-11" style="border: 3px solid #ffc9c9;">

						<div class="wrapper row" style="background-color: white;">
							<div class="preview col-md-5">

								<div class="preview-pic tab-content">
									<div class="tab-pane active" id="pic-1">
										<img src="http://placekitten.com/400/252" />
									</div>
									<div class="tab-pane" id="pic-2">
										<img src="http://placekitten.com/400/252" />
									</div>
									<div class="tab-pane" id="pic-3">
										<img src="http://placekitten.com/400/252" />
									</div>
									<div class="tab-pane" id="pic-4">
										<img src="http://placekitten.com/400/252" />
									</div>

								</div>
								<ul class="preview-thumbnail nav nav-tabs">
									<li class="active"><a data-target="#pic-1"
										data-toggle="tab"><img
											src="http://placekitten.com/200/126" /></a></li>
									<li><a data-target="#pic-2" data-toggle="tab"><img
											src="http://placekitten.com/200/126" /></a></li>
									<li><a data-target="#pic-3" data-toggle="tab"><img
											src="http://placekitten.com/200/126" /></a></li>
									<li><a data-target="#pic-4" data-toggle="tab"><img
											src="http://placekitten.com/200/126" /></a></li>

								</ul>

							</div>
							<div class="details col-md-7">
								<h3 class="product-title">[11월]한강 고구마축제</h3>
								<div class="rating">
									<div class="stars">
										<span class="fa fa-star checked"></span> <span
											class="fa fa-star checked"></span> <span
											class="fa fa-star checked"></span> <span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>

								</div>
								<p class="product-description">
									축제내용축제내용축제내용축제내용<br>축제내용축제내용축제내용축제내용<br>축제내용축제내용축제내용축제내용
									<br>
								</p>
								<h4 class="price">
									참가 요금: <span>$180</span>
								</h4>
								<h4 class="price">
									시작일: <span>2019.11.01</span><br> 종료일: <span>2019.11.30</span><br>

								</h4>


								<p class="vote">
									<strong>91명</strong> 오늘 이 글에 좋아요를 누른 회원수 입니다. <strong>(87
										votes)</strong>
								</p>

								<div class="action">
									<button class="add-to-cart btn btn-default" type="button">좋아요</button>
								</div>

							</div>							
						</div>
						
						<div class="row">
							<div class="col-md-5"></div>
							<div class="col-md-7 justify-content-center">
							<!-- 더 보기 버튼 생성  -->
							<div class="btn btn-default btn-pressure btn-sensitive col-md pl-5 pr-5 mt-2"
								style="padding-left: 0;">
								<input value="더보기"
									onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"
									type="button" class="btn btn-danger btn-block" />
								<div style="display: none;">
										<!-- 내용 추가 부분  -->

										<div class="alert alert-danger1">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주관</a> <strong>Danger:</strong>
											you shouldn't do an action!
										</div>
										<div class="alert alert-danger2">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주최</a> <strong>Danger:</strong>
											you shouldn't do an action!
										</div>
										<div class="alert alert-danger3">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주소/신청서링크</a> <strong>Danger:</strong>
											you shouldn't do an action!
										</div>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">전화번호</a> <strong>Danger:</strong>
											you shouldn't do an action!
										</div>
								</div>
							</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />