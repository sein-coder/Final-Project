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
    			<table id="orderList" class="table-hover">
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
<!-- 모달창 -->
<div class="modal fade" id="payModal">
    <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	         	<h4 class="modal-title">결제하기</h4>
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
   				<div class="container">
   					<form action="${pageContext.request.contextPath}/payment" method="POST" onSubmit="payOrders();">
						<div class="text-center">
							<h4 class="bg-light">주문내역</h4>
							<!-- 주문내역 리스트에 맞춰 반복 -->
						</div>
						
						<div class="text-center">
							<h4 class="bg-light">주문요청사항</h4>
							<textarea rows="1" cols="30" placeholder="30자 이내로 기재" name="add_request"></textarea>	
						</div>
      					<div class="row">
        					<div class="col">
				                <input type="hidden" name="" value=""/>
				         		<input type="hidden" name="" value=""/>
				         		<button onClick="" class="form-control btn btn-info">장바구니에 담기</button>
				         		<input type="submit" class="form-control btn btn-primary" value="결제하기"/> 
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
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
				$('#orderList').append(tags);
			}
			else{
				var orderDataList=$("#orderList").find(".orderdata").children();
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
		var orderDataList=$("#orderList").find(".orderdata");
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
	$('#pay-total').html(payment).val();
}

function changeValue(elementInput){
	var value=$(elementInput).val();
}

SetRatingStar();

</script>
<!-- 아임포트 cdn -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var point = 0;

function payOrders(){

	var IMP = window.IMP; // 생략가능
	IMP.init('imp13577377');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'inicis', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	/*
	merchant_uid에 경우
	https://docs.iamport.kr/implementation/payment
	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	참고하세요.
	나중에 포스팅 해볼게요.
	*/
	name: '렛잇고 ',
	//결제창에서 보여질 이름
	amount: $("#updatePoint").val(),
	//가격
	buyer_email: '',
	buyer_name: '',
	buyer_tel: '',
	buyer_addr: '',
	//m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
	if (rsp.success) {
		var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		location.href="${path}/order/paymentEnd";
	} else {
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
		alert(msg);
	}
	});
};

/*  //결제완료 후 구현할 로직
	function orderTo(){
		
		var orderList = "";
		
		$("#orderList tr.orderdata").each(function(){
			orderList += $(this).children().eq(0).text()+":"+ $(this).children().eq(1).text()+"/";
		});
		 var result = JSON.stringify(orderList);
		console.log(result); 
		console.log(orderList);
		location.href="${path}/order/payment?partner_No="+${partner.partner_No}+"&orderList="+orderList;
	}
	
	*/
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>