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
opacity:1;
-webkit-transform:
scale
(1);
transform:
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
38181;100%
{
opacity:1;
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

/* 추천글 */
body {
	background: #00bcd4;
}

h1 {
	color: #fff;
	margin: 40px 0 60px 0;
	font-weight: 300;
}

.our-team-main {
	width: 100%;
	height: auto;
	border-bottom: 5px #323233 solid;
	background: #fff;
	text-align: center;
	border-radius: 10px;
	overflow: hidden;
	position: relative;
	transition: 0.5s;
	margin-bottom: 28px;
}

.our-team-main img {
	border-radius: 50%;
	margin-bottom: 20px;
	width: 90px;
}

.our-team-main h3 {
	font-size: 20px;
	font-weight: 700;
}

.our-team-main p {
	margin-bottom: 0;
}

.team-back {
	width: 100%;
	height: auto;
	position: absolute;
	top: 0;
	left: 0;
	padding: 5px 15px 0 15px;
	text-align: left;
	background: #fff;
}

.team-front {
	width: 100%;
	height: auto;
	position: relative;
	z-index: 10;
	background: #fff;
	padding: 15px;
	bottom: 0px;
	transition: all 0.5s ease;
}

.our-team-main:hover .team-front {
	bottom: -200px;
	transition: all 0.5s ease;
}

.our-team-main:hover {
	border-color: #777;
	transition: 0.5s;
}
/* 해시태그 */
    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }

    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }
    ul#tag-list {
        padding: 16px 0;
    }

    ul#tag-list li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
/*our-team-main*/
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4524f2a578ce5b005f1a8157e72c3d3a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5360adbac3952b61ac35a4e1cc59e4c3&libraries=services"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<section id="content">
	<div class="site-section pb-0">

		<div class="row">
			<div class="container" style="background-color: white;">
				<div class="card col-md-12" style="border: 3px solid #ffc9c9;">

					<div class="wrapper row" style="background-color: white;">
						<div class="preview col-md-5">

							<div class="preview-pic tab-content">
								<div class="tab-pane active" id="pic-1">
									<img alt="없음" width="400px" height="252px"
									src="${pageContext.request.contextPath}/resources/images/festival/${festival.festival_Thumbnail }">
								</div>

							</div>
						</div>
						<div class="details col-md-7">
							<h3 class="product-title">${festival.festival_Title }</h3>
							<div class="rating">
								<div class="stars">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>

							</div>
							<div id="festival_No" style="disaplay:none;">
								${festival.festival_No}
							</div>
							<p class="product-description">
							<button id="proceeding" style="color: #fff; text-align: center; border: none;">
								${festival.festival_Proceeding }
							</button>
							<p class="text-break">
								${festival.festival_Content }
							</p>
							<div class="action" style="display: inline-block;">
										<button class="add-to-cart btn btn-default" type="button">
									 		<span class="icon-heart" id="heart"></span>
										</button>
							</div>
							<div style="display: inline-block;">
							<p class="vote">
								이 글에 좋아요를 누른 회원수 입니다. 
								<b id="count">(${festival.festival_Like} votes)</b>
							</p>
							</div>

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
					<input value="더보기" style="background-color: f38181;border: none;"
						onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}
												else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}"
						type="button" class="btn btn-danger btn-block" />
					<div style="display: none;">
						<!-- 내용 추가 부분  -->
						<table class="table" style="margin: auto; text-align: left">
							<tr>
								<td scope="row">
									<div class="alert alert-danger1">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">시 작 일</a> <strong>:</strong>
												${festival.festival_StartDate}
									</div>
								</td>
								<td>
									<div class="alert alert-danger2">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">종 료 일</a> <strong>:</strong>
										${festival.festival_EndDate }
									</div>
								</td>
							</tr>
							<tr>
								<td scope="row">
									<div class="alert alert-danger3">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">전화번호</a> <strong>:</strong>
										${festival.festival_Phone }
									</div>
								</td>
								<td>
									<div class="alert alert-danger4">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">홈페이지</a> <strong>:</strong>
										${festival.festival_Homepage }
									</div>
								</td>
							</tr>
							<tr>
								<td scope="row">
									<div class="alert alert-danger4">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">주 소</a> <strong>:</strong>
										${festival.festival_Address }
									</div>
									<div style="display: inline-block">

										<!-- <a href="#none" class="hashtag_copy" style="background-color: #f38181"
											data-clipboard-action="copy" data-clipboard-target="p.copy">
											<span>copy</span>
										</a> 

										<script
											src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
									</div>-->
								</td>
								<td>
									<div class="alert alert-danger4">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">주 최</a> <strong>:</strong>
										${festival.festival_Host}
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="alert alert-danger4">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">주 관</a> <strong>:</strong>
										${festival.festival_Sub }
									</div>
								</td>
								<td>
									<div class="alert alert-danger4">
										<a class="btn btn-xs btn-danger pull-right"
											style="background-color: #fff;">이용요금</a> <strong>:</strong>
										${festival.festival_Price }
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-center">
		<button type="button" class="col-md-2 ml mt-1 btn btn-danger btn-block" style="background-color: f38181;border: none;"
			onclick="location.href='${pageContext.request.contextPath}/festival/festivalList'">목록</button>
	</div>
	<div>
		<div>
			<button type="button" class="col-md-2 ml mt-1 btn btn-danger btn-block" style="background-color: f38181;border: none;"
				onclick="location.href='${pageContext.request.contextPath}/festival/deleteFestival?festival_No=${festival.festival_No }'">삭제</button>
		</div>
		<div>
			<button type="button" class="col-md-2 ml mt-1 btn btn-danger btn-block" style="background-color: f38181;border: none;"
				onclick="location.href='${pageContext.request.contextPath}/festival/updateFestival?festival_No=${festival.festival_No }'">수정</button>
		</div>
	</div>
	<!--추천글 -->

	<div class="container mt-5">
		<div class="col-md-12">
			<div class="row">

					<!--
				<div class="col-lg-4">
					<div class="our-team-main">

						<div class="team-front">
							<img src="http://placehold.it/110x110/4caf50/fff?text=ONE"
								class="img-fluid" />
							<h3>축제이름</h3>
							<p>축제날짜</p>
						</div>

						<div class="team-back">
							<span> Lorem ipsum dolor sit amet, consectetuer adipiscing
								elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, Lorem ipsum
								dolor sit amet, consectetuer adipiscing elit. Aenean commodo
								ligula eget dolor. Aenean massa. Cum sociis natoque. </span>
						</div>

					</div>
				</div>
				

			 <div class="col-lg-4">
					<div class="our-team-main">

						<div class="team-front">
							<img src="http://placehold.it/110x110/e91e63/fff?text=TWO"
								class="img-fluid" />
							<h3>축제이름</h3>
							<p>축제날짜</p>
						</div>

						<div class="team-back">
							<span> Lorem ipsum dolor sit amet, consectetuer adipiscing
								elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, Lorem ipsum
								dolor sit amet, consectetuer adipiscing elit. Aenean commodo
								ligula eget dolor. Aenean massa. Cum sociis natoque. </span>
						</div>

					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="our-team-main">

						<div class="team-front">
							<img src="http://placehold.it/110x110/2196f3/fff?text=THREE"
								class="img-fluid" />
							<h3>축제이름</h3>
							<p>축제기간</p>
						</div>

						<div class="team-back">
							<span> Lorem ipsum dolor sit amet, consectetuer adipiscing
								elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, Lorem ipsum
								dolor sit amet, consectetuer adipiscing elit. Aenean commodo
								ligula eget dolor. Aenean massa. Cum sociis natoque. </span>
						</div>

					</div>
				</div> -->
				


			</div>
		</div>
		<br>
		<h2>지도보기!</h2>
		
		<br>
		<div id="map" style="width:100%;height:350px;"></div>
		<br>
	</div>

	
	<script>
		$('#contentText').keyup(function(e) {
			var content = $(this).val();
			$('#counter').val(500 - content.length);

			if (content.length > 500) {
				$(this).val($(this).val().substring(0, 500));
			}
		});
		/* var clipboard = new ClipboardJS('.hashtag_copy');
		clipboard.on('success', function(e) {
			alert('복사되었습니다.');
		});
		 */

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch("${festival.festival_Address}", function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {

		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
		});    
	
	</script>
	<script>
	/* count */
	$("#heart").click(function() {
	    $('#count').html(function(count,val) {
	        $.ajax({
	            url: "${pageContext.request.contextPath}/festival/updateFestivalLike.do",
	            type: "POST",
	            data: {
	            	'festival_Like':${festival.festival_Like},
	            	'festival_No':${festival.festival_No}
	            },	
	            success: function(data) {
	            		location.reload();
	            }
	        });
    		
	    });	    
	});
	</script>
	<script>
	/*축제번호 숨기기 */
		$("#festival_No").hide();
	</script>

	<script>
		$(document).ready(function(){

			if($('#proceeding').text().includes('예정',0)){
				$('#proceeding').css("background-color",'blue');
			}else if($('#proceeding').text().includes('진행',0)){
				$('#proceeding').css("background-color",'green');
			}else if($('#proceeding').text().includes('종료',0)){
				$('#proceeding').css("background-color",'red');
			}
		});
	</script>
	
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />