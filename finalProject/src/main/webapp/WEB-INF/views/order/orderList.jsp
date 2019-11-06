<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="주문하기"/>
</jsp:include>
<style>
.star-rating {
  line-height:32px;
  font-size:1.25em;
  
}

.star-rating .icon-star{
  color: yellow;
  transition : 0.5s;
}
</style>
<section id="content">
	<div class="site-section">
		<div class="filter-container bg-light col-md-8 offset-md-2">
			<div class="row">
				<form action="" method="post">
					<div class="form-group">
						<div id="menuSearch">
							<label for="foodSearch"><span class="icon icon-cutlery"></span> 메뉴검색</label>
							<input type="text" name="foodSearch" id="foodSearch"/>
						</div>
						<label for="menuFind">카테고리 검색</label>
						<div id="menuFind">
							<label for="korean_menu"></label>
							<button class="btn btn-primary" id="korean_menu" onClick="findMenu(한식)">한식</button>
							<label for="chinese_menu"></label>
							<button class="btn btn-primary" id="chinese_menu" onClick="findMenu(중식)">중식</button>
							<label for="japanese_menu"></label>
							<button class="btn btn-primary" id="japanese_menu" onClick="findMenu(일식)">일식</button>
							<label for="western_menu"></label>
							<button class="btn btn-primary" id="western_menu" onClick="findMenu(양식)">양식</button>
							<label for="dessert_menu"></label>
							<button class="btn btn-primary" id="dessert_menu" onClick="findMenu(디저트)">디저트</button>
							<label for="else_menu"></label>
							<button class="btn btn-primary" id="else_menu" onClick="findMenu(기타)">기타</button>
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
		<c:forEach var="pt" items="${list }">
	  	<div class="row">
			<div class="col-md-8 offset-md-2">
				<!-- 여기서 부터 DIV가 업체 리스트에 맞춰 반복되야함, image변경 필! -->
				<div class="d-block d-md-flex listing-horizontal">
					<!-- 푸드트럭 별 대표이미지 -->
					<a href="${path }/order/orderListView" class="img d-block" style="background-image: url('${path}/resources/images/person_2.jpg')">
						<span class="category"><c:out value="${pt.partner_Menu }"/></span>
					</a>
					<div class="lh-content">
							<h3><a href="${path }/order/orderListView"><c:out value="${pt.partner_TruckName }"/></a></h3>
							<p>대표메뉴가 올자리</p>
							<!-- 별점 -->
							<div class="row">
								<div class="star-rating">
									<span class="icon-star" data-rating="1"></span>
									<span class="icon-star" data-rating="2"></span>
									<span class="icon-star" data-rating="3"></span>
									<span class="icon-star" data-rating="4"></span>
									<span class="icon-star" data-rating="5"></span>
									<input type="hidden" name="whatever1" class="rating-value" value="3">
								</div>
							<span>(492 Reviews)</span>
							<!-- 총 주문수, 리뷰수, 별점수 추가, 조회 수 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- 페이징 처리 -->
		${pageBar }
	</div>
</section>
<script>
var star_rating = $('.star-rating .icon-star');

var SetRatingStar = function() {
  return star_rating.each(function() {
    if (parseInt(star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
      return $(this).removeClass('text-secondary').addClass('text-warning');
    } else {
      return $(this).removeClass('text-warning').addClass('text-secondary');
    }
  });
};

/* 별점 클릭 이벤트
	star_rating.on('click', function() {
  star_rating.siblings('input.rating-value').val($(this).data('rating'));
  return SetRatingStar();
}); 

*/

SetRatingStar();
$(document).ready(function() {

});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>