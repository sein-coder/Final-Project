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
<div class="site-blocks-padding mobile">
</div>
<section id="content">
	<div class="site-section">
		<div class="filter-container bg-light col-md-8 offset-md-2">
			<div class="row">
				<div class="form-group col-*-8">
					<div class="row" id="menuSearch">
						<label for="foodSearch"><span class="icon icon-cutlery"></span> 메뉴검색</label>
						<input type="text" name="menu_Name" id="menu_Name"/>
					</div>
					<div class="row">
						<div class="form-check">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="한식" style='left:-9999px'/>
								<button class="btn btn-outline-info" onClick="searchConsole(this);">한식</button>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="중식" style='left:-9999px'/>
								<button class="btn btn-outline-info" onClick="searchConsole(this);">중식</button>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="일식" style='left:-9999px'/>
								<button class="btn btn-outline-info" onClick="searchConsole(this);">일식</button>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="양식" style='left:-9999px'/>
								<button class="btn btn-outline-info" onClick="searchConsole(this);">양식</button>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" name="partner_Menu" class="form-check-input" value="디저트" style='left:-9999px'/>
							<button class="btn btn-outline-info" onClick="searchConsole(this);">디저트</button>
						</div>
						<div class="form-check">
							<input type="checkbox" name="partner_Menu" class="form-check-input" value="기타" style='left:-9999px'/>
							<button class="btn btn-outline-info" onClick="searchConsole(this);">기타</button>
						</div>
					</div> 
					<label for="easySearch">상세검색</label>
					<div id="easySearch">
						<button class="btn btn-outline-primary">평점 높은 순</button>
						<button class="btn btn-outline-primary">평점 낮은 순</button>
						<button class="btn btn-outline-primary">최다 주문 순</button>
						<button class="btn btn-outline-primary">최소 주문 순</button>
					</div>	
				</div>
				<div class="col-*-4 float-right">
					<input type="submit" value="검색" class="btn btn-outline-warning">
				</div>
				</div>
			</div>
		</div>
		<!-- 검색결과가 노출되는 리스팅 -->
	  	<div class="row">
			<div class="col-md-8 offset-md-2">
				<!-- 여기서 부터 DIV가 업체 리스트에 맞춰 반복되야함, image변경 필! -->
				<c:forEach var="p" items="${list }" varStatus="v">
				<div class="d-block d-md-flex listing-horizontal" id="truck-container" onClick="truckInfo();">
					<!-- 푸드트럭 별 대표이미지 -->
					<a href="${path }/order/orderListView?partner_No=${p.partner_No}" class="img d-block" style="background-image: url('${path}/resources/images/foodtruck/${p.profile_Re }')">
						<span class="category"><c:out value="${p.partner_Menu }"/></span>
					</a>
					<div class="lh-content">
							<h3><a href="${path }/order/orderListView?partner_No=${p.partner_No}"><c:out value="${p.partner_TruckName }"/></a></h3>
							<!-- 별점 -->
							<div class="row">
								<span>리뷰 별점</span>
									<div class="star-rating">
										<span class="icon-star" data-rating="1"></span>
										<span class="icon-star" data-rating="2"></span>
										<span class="icon-star" data-rating="3"></span>
										<span class="icon-star" data-rating="4"></span>
										<span class="icon-star" data-rating="5"></span>
										<input type="hidden" name="data_No" class="rating-value" value="${p.starCount}">
									</div>
									<div class="row">
									<c:forEach var="img" items="${menuList[v.count-1] }">
											<img class="img-fluid" src="${path }/resources/images/menu/${img.menu_Oriname_File }"/>
									</c:forEach>
									</div>
									<div class="row">
										<span><c:out value="총 주문 건 수  ${p.reviewCount }건"/></span>
									</div>
							<!-- 총 주문수, 리뷰수, 별점수 추가, 조회 수 -->
							</div>
					</div>
				</div>
				<script>
				function truckInfo(){
					location.href="${path }/order/orderListView?partner_No=${p.partner_No}";
				}
				</script>
				</c:forEach>
			</div>
		</div>
		<!-- 페이징 처리 -->
		${pageBar }
</section>

<script>
$(document).ready(function(){
	   $("input[name=data_No]").each(function(){
	      var starCount = $(this).val();
	      $($(this).siblings()).each(function(){
	         if(starCount >= $(this).data('rating')){
	            return $(this).removeClass('text-secondary').addClass('text-warning');
	         }else{
	            return $(this).removeClass('text-warning').addClass('text-secondary');
	         }
	      });
	   });

	});
	
function searchConsole(data){
	console.log($(data).before());
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>