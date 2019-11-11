<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="주문페이지"/>
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
<section id="content" class="col-md-8 offset-md-2">
	<!-- 업체 소개 영역 -->
    <div class="site-section ">
    <div class="row">
	<div class="col-md-8">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6">
            <img src="${path }/resources/images/foodtruck/${partner.profile_Re}" alt="${partner.partner_TruckName }" class="img-fluid rounded">
          </div>
          <div class="col-md-5 ml-auto">
            <h2 class="text-primary mb-3">${partner.partner_TruckName }</h2>
			<p>
				<div class="star-rating" id="truck-star">
					<h4 class="font-size-regular">평균별점</h2>
					<span class="icon-star" data-rating="1"></span>
					<span class="icon-star" data-rating="2"></span>
					<span class="icon-star" data-rating="3"></span>
					<span class="icon-star" data-rating="4"></span>
					<span class="icon-star" data-rating="5"></span>
					<input type="hidden" name="star-score" class="rating-value" value="${partner.starCount }">
				</div>
				<label>총 리뷰 수
				<span>${partner.reviewCount }</span>
				<!-- 총 주문수, 리뷰수, 별점수 추가, 조회 수 -->
				</label>
			</p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 ml-auto">
    	<div class="bg-light">
    		<form action="${path }/order/payment" method="POST">
    			<table id="orderList" class="table-hover">
    				<tr>
    					<td colspan="2"><h3>주문리스트</h3></td>
    				</tr>
    			</table>
    		<div class="order-footer text-right">
    			<h4>총 금액 : 100,000</h4>
    			<input class="btn btn-primary" type="reset" value="주문초기화">
    			<input class="btn btn-danger" type="submit" value="주문완료">
    		</div>
    		</form>
    	</div>
    </div>
    </div>
    <div class="row">
    	<div class="col-md-8">
			<div class="container">
				<div class="row align-items-center bg-light">
				<!-- 메뉴 반복 위치-->
					<div class="row mb-3 align-items-stretch">
					<c:forEach var="menu" items="${menu }">
						<div class="col-md-4 col-lg-4 mb-4 mb-lg-4">
							<div class="h-entry">
								<img src="${path }/resources/images/menu/${menu.menu_Oriname_File}" alt="${menu.menu_Name }" class="img-fluid">
								<div class="h-entry-inner">
								<h2 class="font-size-regular">${menu.menu_Name }</h2>
									<div class="meta mb-4 text-center">${menu.menu_Price }</div>
									<div class="qty text-center input-group mb-4 row">
										<div class="input-group-pretend col-md-4">
											<button class="btn btn-outline-primary " onclick="orderPlusMinus(this);">
												<span class="icon icon-plus-circle"></span>
											</button>
										</div>
										<input type="hidden" name="menu_Name" value="${menu.menu_Name }" />
										<input type="hidden" name="menu_Price" value="${menu.menu_Price }"/>
										<input class="form-control col-md-4 count" name="menu_count" type="number" value="0" step="1" readonly/>
										<div class="input-group-append col-md-4">
											<button class="btn btn-outline-primary " onclick="orderPlusMinus(this);">
												<span class="icon icon-minus-circle"></span>
											</button>
										</div>
									</div>
								</div>
							</div> 
						</div>
					</c:forEach>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- Review영역 -->
		<div class="pt-5">
			<h3 class="mb-5">${partner.reviewCount}개의 리뷰가 있습니다.</h3>
			<ul class="comment-list">
				<li class="comment">
				<div class="vcard bio">
					<img src="${path }/resources/images/person_3.jpg" alt="리뷰작성자 이미지">
				</div>
				<div class="comment-body">
					<h3>Jean Doe</h3>
					<div class="meta">January 9, 2018 at 2:21pm</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
					<button class="btn btn-primary" onClick="reply()">Reply</button> <!-- reply()매개변수로 댓글번호 전달 -->
				</div>
				</li>
			<!-- 사장님 댓글영역 -->
				<ul class="children">
					<li class="comment">
						<div class="vcard bio">
						<img src="${path }/resources/images/person_4.jpg" alt="사장님 이미지">
						</div>
					<div class="comment-body">
						<h3>Jean Doe</h3>
						<div class="meta">January 9, 2018 at 2:21pm</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
					</div>
					</li>
				</ul>
			</ul>
		</div>
              <!-- END comment-list -->
	</div>
</section>
<script>
	// 평점 별 출력 부분
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

function orderPlusMinus(data){
	
	var countInput;
	
	if($(data).children().attr('class').search("plus") != -1)
	{
		countInput = $(data).parent().siblings().eq(2);
		countInput.val(parseInt(countInput.val())+1);
		
		if(countInput.val() >= 1){
			
			if(countInput.val() == 1){
				var tagName = $(data).parent().siblings().eq(0).val();
					
				var tags = "<tr>";
				tags += "<td>"+tagName+"</td>";
				tags += "</tr>";
				$('#orderList').append(tags);
			}
			
			console.log($('#orderList').children().children().children().siblings().eq(0).val()); //<tr>
		} 
	}
	else{
		countInput = $(data).parent().siblings().eq(3);
		if(countInput.val() > 0){
			countInput.val(parseInt(countInput.val())-1);			
		}
	}
}



SetRatingStar();

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>