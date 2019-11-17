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
    <div class="site-section">
    <div class="row">
	<div class="col-md-8">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6">
            <img src="${path }/resources/images/foodtruck/${partner.profile_Re}" alt="${partner.partner_TruckName }" class="img-fluid rounded">
          </div>
          <div class="col-md-5 ml-auto">
            <h2 class="text-primary mb-3">${partner.partner_TruckName }</h2>
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
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 ml-auto">
    	<div class="bg-light">
    			<table class="table-hover orderList">
    				<tr>
    					<td colspan="2"><h3>주문리스트</h3></td>
    				</tr>
    			</table>
    		<div class="order-footer text-right">
    			<label for="pay-total">총 금액</label>
    			<h4 class="pay-total" id="pay-total">0</h4>
    		</div>
    			<button class="btn btn-danger btn-lg" data-toggle="modal" data-target="#payModal">주문완료</button>
    	</div>
    </div>
    </div>
    
    
    
    
    <div class="row">
    	<div class="col-md-8">
			<div class="container">
				<div class="row align-items-center bg-light">
				<!-- 메뉴 반복 위치-->
					<div class="row mb-3 align-items-stretch">
					<c:forEach var="menu" items="${menu }" >
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
										<input class="form-control col-md-4 count menucount" name="${menu.menu_No }" type="number" value="0" step="1" readonly/>
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
				<c:forEach var="rv" items="${reviewList}">
					<ul class="comment-list">
						<li class="comment">
						<div class="vcard bio">
							<img src="${path }/resources/images/${rv.oriname_File}" alt="리뷰작성자 이미지">
						</div>
						<div class="comment-body">
							<h3>${rv.member_Id}</h3>
							<div class="meta">
								<fmt:formatDate value="${rv.review_Time}" pattern="yyyy년  MM월 dd일  HH시 주문"/>
								<span>리뷰 별점</span>
									<div class="star-rating">
										<span class="icon-star" data-rating="1"></span>
										<span class="icon-star" data-rating="2"></span>
										<span class="icon-star" data-rating="3"></span>
										<span class="icon-star" data-rating="4"></span>
										<span class="icon-star" data-rating="5"></span>
										<input type="hidden" name="data_No" class="rating-value" value="${rv.review_Star}">
									</div>
							</div>
							<p>${rv.review_Content}</p>
							<c:forEach var="cmt" items="${comment }">
							<!-- session에서 partner가 확인되고, 번호가 같으면 답글 버튼 출력! -->
							<%-- <c:if test="${rv.order_No eq cmt.order_No && (loginMember.partner_No eq null? 0 : loginMember.partner_No )eq cmt.comment_From }">
								<button class="btn btn-primary" onClick="reply(${cmt.order_No});">답글달기</button> <!-- reply()매개변수로 댓글번호 전달 -->
							</c:if> --%>
							<input type="hidden" class="order_No" value="${rv.order_No}"/>
							</c:forEach>
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
				</c:forEach>
		</div>
              <!-- END comment-list -->
	</div>
<!-- 모달창 -->
<div class="modal fade" id="payModal">
    <div class="modal-dialog modal-dialog-centered" >
		<div class="modal-content" >
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	         	<h4 class="modal-title">결제하기</h4>
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
   				<div class="container">
					<div class="text-center">
						<h4 class="bg-light">주문내역</h4>
						<!-- 주문내역 리스트에 맞춰 반복 -->
						<table class="table-hover orderList" id="list">
						</table>
					</div>
					
					<div class="text-center">
						<h4 class="bg-light">총 결제 금액</h4>
						<span class="text-center pay-total">원</span>
					</div>
					
					<div class="text-center">
						<h4 class="bg-light">주문요청사항</h4>
						<textarea rows="1" cols="30" placeholder="30자 이내로 기재" name="add_request" id="add_request"></textarea>	
					</div>
     					<div class="row">
       					<div class="col">
			         		<button class="form-control btn btn-info" onClick="">주문예약하기</button>
			         		<button type="button" class="form-control btn btn-primary" onClick="fadeModal();">결제하기</button>
							<!-- onClick="payOrders();" -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</section>
<script>
$(function(){
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
})
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
var payment = 0;
function orderPlusMinus(data){
	
	var countInput;
	var el;
	
	var menuPrice;
	
	if($(data).children().attr('class').search("plus") != -1)
	{
		el=$(data).parent().nextAll(".menucount");
		countInput = $(data).parent().siblings().eq(2);
		countInput.val(parseInt(countInput.val())+1);
		
		// 메뉴 가격 찾기
		menuPrice = $(data).parent().siblings().eq(1).val();
		
		if(countInput.val() >= 1){
			if(countInput.val() == 1){
				var tagName = $(data).parent().siblings().eq(0).val();
				var tags = "<tr class='orderdata'>";
				tags += "<td>"+tagName+"</td>";
				tags += "<td class='"+$(el).attr("name")+"'>"+$(el).val()+"</td>";
				tags += "</tr>"; 
				$('.orderList').append(tags);
			}
			else{
				var orderDataList=$(".orderList").find(".orderdata").children();
				$.each(orderDataList,function(i,item){
					if($(el).attr('name')==$(item).attr("class")){
						$(item).html($(el).val());
					}
				});
			}
			payment += menuPrice*1;
		} 
	}
	else{
		el=$(data).parent().prevAll(".menucount");
		var orderDataList=$(".orderList").find(".orderdata");
		countInput = $(data).parent().siblings().eq(3);
		
		// 메뉴 가격 찾기
		menuPrice = $(data).parent().siblings().eq(2).val();
		
		if(countInput.val() > 0){
			countInput.val(parseInt(countInput.val())-1);
			//
			$.each(orderDataList, function(i, item){
				if($(el).attr('name') == $(item).children()[1].className){
					$(item).children()[1].innerText = $(el).val();
				}
			})
			
			if(countInput.val() == 0){
				$.each(orderDataList, function(i, item){
					if($(el).attr('name') == $(item).children()[1].className){
						$(item).remove();
					}
				})
			}
		payment -= menuPrice*1;
		}
	}
	$('.pay-total').html(payment).val();
}
function changeValue(elementInput){
	var value=$(elementInput).val();
}
SetRatingStar();
// 결제포트 실행전 첫 번째 모달 숨기기
function fadeModal(){
	$('#payModal').modal('hide');
	var windowWidth = 650;
	var windowHeight = 650;
	var windowLeft = parseInt((screen.availWidth/2) - (windowWidth/2));
	var windowTop = parseInt((screen.availHeight/2) - (windowHeight/2));
	var windowSize = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop + ",screenX=" + windowLeft + ",screenY=" + windowTop;
	var open = window.open('${path}/order/payment.do?order_Price='+payment, "_target ", windowSize);
	
}
function toOrderHistory(){
	var orderlists = "";
	
	$("#list tr.orderdata").each(function(){
		orderlists += $(this).children().eq(0).text() + "-" + $(this).children().eq(1).text() + "/";
	})
	$.ajax({
		url : "${path}/order/orderEnd",
		type: "POST",
		data: {
			"order_List" : orderlists,
			"add_Request" : $("#add_request").val(),
			"order_Price" : payment,
			"reservation_YN" : "N",
			"partner_No" : ${partner.partner_No},
			"member_No" : ${loginMember.member_No}
		},
		success : function(data){
			alert("결제 정보가 전송 중 입니다.");
			location.href="${path}/order/complete";
		},
		fail : function(data){
			alert("결제 처리에 실패하였습니다. 관리자에게 문의하세요.");
		}
	})

}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>