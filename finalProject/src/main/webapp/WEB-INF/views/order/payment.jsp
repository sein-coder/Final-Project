<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="결제페이지"/>
</jsp:include>

<section id="content">
	<!-- 제품수령방법 -->
	<div class="site-section">
		<div class="row col-md-8 offset-md-2">
			<form action="" method="">
				<div class="col-md-8">
					<h4>수령방법</h4>
					<div class="form-check-inline justify-content-*-center">
						<input type="radio" class="form-check-input" name="delivery" id="delivery_1"/>
						<label for="delivery_1" class="form-check-label">배달로 받을래요</label>
						<input type="radio" class="form-check-input" name="delivery" id="delivery_2"/>
						<label for="delivery_2" class="form-check-label">직접 방문수령할래요</label>
					</div>
					<!-- 주문 요청사항 기재란 -->
					<div>
						<h4>주소지 설정</h4>
						<table class="table">
							<tr>
								<td><label for="address">도로명 주소</label></td>
								<td><input type="text" name="address" class="form-control" id="roadaddress"/></td>
								<td><button onClick="inputAddr();" class="btn btn-warning">주소검색</button></td>
							</tr>
							<tr>
								<td><label for="etc_address">상세주소</label></td>
								<td colspan="2"><input type="text" name="etc_address" class="form-control" id="etc_address"/></td>		
							</tr>
						</table>
					</div>
					<div>
						<h4>주문 요청사항</h4>
						<textarea rows="1" cols="30" placeholder="30자 이내로 기재"></textarea>	
					</div>
				</div>
				<div class="col-md-4">
					<div class="bg-light">
						<div class="text-center">
							<h4>주문내역</h4>
							<!-- 주문내역 리스트에 맞춰 반복 -->
							<input type="text" value="" name=""/>
							<input type="number" value="" name=""/>
							<button onClick="" class="form-control btn btn-info">장바구니에 담기</button>
							<input type="submit" class="form-control btn btn-primary" value="결제하기"/> 
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아임포트 cdn -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
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
		buyer_postcode: '',
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
				point = rsp.paid_amount;
			location.href="${path}/order/paymentEnd";
			return point;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		});
	};

	function inputAddr(){
		new daum.Postcode({
			oncomplete: function(data){
				document.getElementById('roadaddress').value=data.roadAddress;
			}
		}).open();
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>