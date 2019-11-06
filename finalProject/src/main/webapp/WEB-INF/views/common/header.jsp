<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>LetEatGo●푸드트럭의 모든 것</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon-32x32.png">

<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/rangeslider.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">

</head>
<body>

	<div class="site-wrap">
		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		
		<header class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">

					<div class="col-11 col-xl-3">
						<a href="${pageContext.request.contextPath }"> <img
							src="${pageContext.request.contextPath }/resources/images/logo.png"
							class="img-fluid" />
						</a>
					</div>
					<div class="col-12 col-md-9 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right"
							role="navigation">
							<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
								<li class="active"><a
									href="${pageContext.request.contextPath }"><span>Home</span></a></li>
								<!-- nav-bar 메뉴부분 -->
								<li><a
									href="${pageContext.request.contextPath }/accountBook/accountBookView?partner_No=1234"><span>장부관리</span></a></li>
								<li><a href="${pageContext.request.contextPath }/order"><span>주문하기</span></a></li>
								<li><a href="${pageContext.request.contextPath }/map"><span>푸드트럭존 찾기</span></a></li>
								<li><a href="${pageContext.request.contextPath }/festival/festivaList"><span>축제알리미</span></a></li>
								<li>
									<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal">로그인</button>
								</li>
								<li><button class="btn btn-outline-primary" type="button"
										onclick="location.href='${pageContext.request.contextPath}/member/Enroll.do'">회원가입</button></li>
							</ul>
						</nav>
					</div>

					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
						style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-white">
							<span class="icon-menu h3"></span>
						</a>
					</div>
				</div>

			</div>
		</header>


		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">로그인</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="col">
									<p>로그인</p>
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#member_log">사업자</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#partner_log">사용자</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="member_log">
											<input type="text" placeholder="아이디" /> <input
												type="password" placeholder="비밀번호" />
											<button type="button" class="btn btn-primary"
												onclick="location.href='${pageContext.request.contextPath}'">로그인</button>
										</div>
										<div class="tab-pane fade" id="partner_log">
											<input type="text" placeholder="아이디" /> <input
												type="password" placeholder="비밀번호" />
											<button type="button" class="btn btn-primary"
												onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do'">로그인</button>
											<div></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer"></div>
					<button type="button">페이스북</button>
					<button type="button">네이버</button>
					<button type="button">구글</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>