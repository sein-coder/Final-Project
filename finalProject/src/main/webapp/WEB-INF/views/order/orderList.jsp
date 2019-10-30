<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="주문하기"/>
</jsp:include>
<section id="content">
	<div class="site-section">
			<div class="filter-container bg-light col-md-8 offset-md-2">
				<div class="row">
					<form action="" method="post">
						<div class="form-group">
							<div class="menusearch">
								<label for="foodSearch"><span class="icon icon-cutlery"></span> 메뉴검색</label>
								<input type="text" name="foodSearch" id="foodSearch"/>
							</div>
							<div class="">
								<label for="foodSearch"><span class="icon icon-room"></span> 지역검색</label>
								<input type="text" name="foodSearch" id="foodSearch"/>
							</div>
							<label for="easySearch">상세검색</label>
							<div class="" id="easySearch">
								<button class="btn btn-outline-primary">평점 높은 순</button>
								<button class="btn btn-outline-primary">최다 조회 순</button>
								<button class="btn btn-outline-primary">최다 주문 순</button>
							</div>	
						</div>
						<div class="">
							<input type="button" value="검색" class="btn btn-outline-warning">
						</div>
					</form>
				</div>
			</div>
			<!-- 검색결과가 노출되는 리스팅 -->
		  	<div class="row">
				<div class="col-md-8 offset-md-2">
					<!-- 여기서 부터 DIV가 업체 리스트에 맞춰 반복되야함, image변경 필! -->
					<div class="d-block d-md-flex listing-horizontal">
						<!-- 푸드트럭 별 대표이미지 -->
							<a href="${path }/order/orderListView" class="img d-block" style="background-image: url('images/img_2.jpg')">
								<span class="category">종류</span>
							</a>
							<div class="lh-content">
								<h3><a href="${path }/order/orderListView">Jones Grill &amp; Restaurants</a></h3>
								<p>대표메뉴가 올자리</p>
								<p>
								<!-- 별점 -->
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-secondary"></span>
								<span>(492 Reviews)</span>
								<!-- 총 주문수, 리뷰수, 별점수 추가, 조회 수 -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>