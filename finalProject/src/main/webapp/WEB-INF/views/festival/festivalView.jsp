<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<<<<<<< HEAD
}
}
/* 	버튼 css */
.btn-sensitive:active, .btn-sensitive.active {
	top: 1px;
	margin-top: 4px;
=======
>>>>>>> refs/remotes/origin/jy
}
}

/* 	버튼 css */
.btn-sensitive:active, .btn-sensitive.active {
	top: 1px;
	margin-top: 4px;
}

/* 추천글 */
body
{
	background:#00bcd4;
}

h1
{
	color:#fff;
	margin:40px 0 60px 0;
	font-weight:300;
}

.our-team-main
{
	width:100%;
	height:auto;
	border-bottom:5px #323233 solid;
	background:#fff;
	text-align:center;
	border-radius:10px;
	overflow:hidden;
	position:relative;
	transition:0.5s;
	margin-bottom:28px;
}


.our-team-main img
{
	border-radius:50%;
	margin-bottom:20px;
	width: 90px;
}

.our-team-main h3
{
	font-size:20px;
	font-weight:700;
}

.our-team-main p
{
	margin-bottom:0;
}

.team-back
{
	width:100%;
	height:auto;
	position:absolute;
	top:0;
	left:0;
	padding:5px 15px 0 15px;
	text-align:left;
	background:#fff;
	
}

.team-front
{
	width:100%;
	height:auto;
	position:relative;
	z-index:10;
	background:#fff;
	padding:15px;
	bottom:0px;
	transition: all 0.5s ease;
}

.our-team-main:hover .team-front
{
	bottom:-200px;
	transition: all 0.5s ease;
}

.our-team-main:hover
{
	border-color:#777;
	transition:0.5s;
}

/*our-team-main*/
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<body>
	<section id="content">
		<div class="site-section pb-0">
			<div class="row">
<!-- 				<div class="col-1"
					style="padding-left: 10px; padding-right: 0; margin-top: 50px;">
					<div class="container-fluid">
						Brand and toggle get grouped for better mobile display
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								style="background-color: #f38181">여기</button>
						</div>

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
						/.navbar-collapse
					</div>
					/.container-fluid
				</div> -->
				
				<!-- 새로운 뷰 -->

				<div class="container" style="background-color: white;">
					<div class="card col-md-12" style="border: 3px solid #ffc9c9;">

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
								<h3 class="product-title">[11월] 한강 고구마축제</h3>
								<div class="rating">
									<div class="stars">
										<span class="fa fa-star checked"></span> <span
											class="fa fa-star checked"></span> <span
											class="fa fa-star checked"></span> <span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>

								</div>
								<p class="product-description">
								<p class="text-break">
									매년 11월, 매해 다른 콘셉트로 청계천 일대에 오색찬란한 등(燈)을 밝히는 서울의 겨울 대표 빛축제 <br>
									<br> * 행사사진은 2018년도 축제 <br> [행사내용] 1구간 : 당신의 동화, 서울
									2구간 : 서울, 동화를 만나다<br> 3구간 : 서울, 옛시간을 이야기하다 4구간 : 함께 꿈꾸는
									동화, 서울 <br>
									<br> [부대행사] 소망등 띄우기, 종이동화등 만들기, 복초롱등 만들기 체험 프로그램 <br>
								</p>
								<h4 class="price">
									참가 요금: <span></span>
								</h4>
								<h4 class="price">
									시작일: <span>2019.11.01</span><br> 종료일: <span>2019.11.30</span><br>

								</h4>

								<div class="action">
									<button class="add-to-cart btn btn-default" type="button">좋아요</button>
								</div>

								<p class="vote">
									<strong>91명</strong> 오늘 이 글에 좋아요를 누른 회원수 입니다. <strong>(87
										votes)</strong>
								</p>



							</div>							
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="container">
				<div class="col-md-12 mt-0 pt-0"
					style="border: 3px solid #ffc9c9; border-top: 0px solid white;">

					<!-- 더 보기 버튼 생성  -->
					<div
						class="btn btn-default btn-pressure btn-sensitive col-md pl-10 pr-8 mt-6"
						style="padding-left: 0; padding-right: 0;">
						<input value="더보기"
							onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}
												else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"
							type="button" class="btn btn-danger btn-block" />
						<div style="display: none;">
							<!-- 내용 추가 부분  -->
							<table class="table" style="margin:auto;text-align: left;">
								<tr>
									<td scope="row">
										<div class="alert alert-danger1">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">시 작 일</a> <strong>시작일:</strong>
											2019.11.05
										</div>
									</td>
									<td>
										<div class="alert alert-danger2">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">종 료 일</a> <strong>종료일:</strong>
											2019.11.30
										</div>
									</td>
								</tr>
								<tr>
									<td scope="row">
										<div class="alert alert-danger3">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">전화번호</a> <strong>전화번호:</strong>
											02-384-7319
										</div>
									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">홈페이지</a> <strong>홈페이지:</strong>
											www.naver.com
										</div>
									</td>
								</tr>
								<tr>
									<td scope="row">
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 소</a> <strong>주소:</strong>
											서울시 관악구 봉천동
										</div>
									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 최</a> <strong>주최:</strong>
											서울시청
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 관</a> <strong>주관:</strong>
											서울시 관악구
										</div>
									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">이용요금</a> <strong>이용요금:</strong>
											무료
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--추천글 -->
		   
	<div class="container mt-5">
	<div class="col-md-12">
	<div class="row">
	
	<!--team-4-->
	<div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front">
	<img src="http://placehold.it/110x110/4caf50/fff?text=ONE" class="img-fluid" />
	<h3>태안 팜파스 축제</h3>
	<p>2019.08.15~2019.11.25</p>
	</div>
	
	<div class="team-back">
	<span>
	11월 25일까지 충청남도 태안 청산수목원에서 진행되는 팜파스 축제. 
	늦가을 낭만을 즐길 수 있는 팜파스 축제에는 키를 훌쩍 넘기는 큰 서양 억새들과 핑크뮬리 밭이 3군데나 펼쳐져 있습니다.
	 이미 인생샷 명소로도 유명한 태안 팜파스 축제. 사진 뿐만 아니라 수생 정원과 나무 정원, 미로공원 등 다양한 볼거리와 휴식공간도 다양하니 남녀노소 방문하기 좋습니다. 

	</span>
	</div>
	
	</div>
	</div>
	<!--team-4-->
	
	<!--team-5-->
	<div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front">
	<img src="http://placehold.it/110x110/e91e63/fff?text=TWO" class="img-fluid" />
	<h3>순천만갈대축제</h3>
	<p>2019.11.02~2019.11.04</p>
	</div>
	
	<div class="team-back">
	<span>
	160만 평의 황금빛 갈대밭과 690만 평의 드넓은 갯벌로 이루어진 순천만습지는 국내를 대표하는 연안습지입니다. 
	계절마다 철새들이 찾아오는 천예의 자연 경관을 자랑하는 곳이기도 합니다. 이곳 순천만습지에서는 가을이면 매년 순천만갈대축제가 열립니다. 
	올해로 20회를 맞이한 11월 축제 순천만갈대축제는 아침 선상투어, 가을음악회, 플리마켓 등 다채로운 볼거리 등을 경험할 수 있습니다. 
	</span>
	</div>
	
	</div>
	</div>
	<!--team-5-->
	
	<!--team-6-->
	<div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front">
	<img src="http://placehold.it/110x110/2196f3/fff?text=THREE" class="img-fluid" />
	<h3>포항구룡포과메기축제</h3>
	<p>2019.11.10~2019.11.11</p>
	</div>
	
	<div class="team-back">
	<span>
	과메기 특산지로 알려진 구룡포. 이맘때쯤이면 구룡포에서는 큰 축제가 열립니다. 
	바로 올해 21회를 맞이하는 포항구룡포과메기축제. 지역문화와 먹거리를 축제에 녹여 하나의 문화행사로 자리매김하고 있습니다.
	11월 11일부터 12일까지의 기간 동안 민속놀이와 국악공연, 무료 시식회 등을 즐길 수 있습니다.

	</span>
	</div>
	
	</div>
	</div>
	<!--team-6-->
	
	
	</div>
	<button type="button" class="btn btn-outline-danger" style="text-align: center; margin: 0 auto;">목록</button>
	</div>
	</div>
	</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />