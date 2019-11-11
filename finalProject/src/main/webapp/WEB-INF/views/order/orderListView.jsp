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
            <img src="images/img_1.jpg" alt="업체사진" class="img-fluid rounded">
          </div>
          <div class="col-md-5 ml-auto">
            <h2 class="text-primary mb-3">${partner.partner_TruckName }</h2>
			<p>
				<label for="truck-star">평균 별점</label>
				<div class="star-rating" id="truck-star">
					<span class="icon-star" data-rating="1"></span>
					<span class="icon-star" data-rating="2"></span>
					<span class="icon-star" data-rating="3"></span>
					<span class="icon-star" data-rating="4"></span>
					<span class="icon-star" data-rating="5"></span>
					<input type="hidden" name="star-score" class="rating-value" value="${p.starCount }">
				</div>
				<span>${p.reviewCount }</span>
				<!-- 총 주문수, 리뷰수, 별점수 추가, 조회 수 -->
			</p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 ml-auto">
    	<div class="bg-light">
    		<form action="${path }/order/payment" method="POST">
    			<table class="table-hover">
    				<tr>
    					<td><h3>주문리스트</h3></td>
    				</tr>
    				<tr>
    					<td>주문목록 1</td>
    				</tr>
    				<tr>
    					<td>주문목록 2</td>
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
					<div class="col-md-4">
						<!-- 메뉴 이미지 -->
						<img src="${path }/resources/images/person_1.jpg"/>
						<!-- 메뉴설명  -->
						<p>메뉴설명</p>
						<div class="row">
							<div class="qty mt-5">
								<button><span class="icon icon-plus-circle"></span></button>
								<input type="number" class="count" name="qty" value="0" readonly/>
								<button><span class="icon icon-minus-circle"></span></button>
							</div>
						</div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- Review영역 -->
		<div class="pt-5">
			<h3 class="mb-5">6 Comments</h3>
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
	$(document).ready(function(){
		$('.count').prop('disabled', true);
		$(document).on('click', '.icon-plus-circle', function(){
			$('.count').val(parseInt($('.count').val()) + 1);
			if($('.count').val() > 20) {
				alert('최대 주문량은 20개를 초과할 수 없습니다.');
				$('.count').val(20);
			}
		});
		$(document).on('click', '.icon-minus-circle', function(){
			$('.count').val(parseInt($('.count').val()) - 1);
			if($('.count').val() == 0){
				$('.count').val(0);
			}
		});
	})

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

SetRatingStar();
$(document).ready(function() {

});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>