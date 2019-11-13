<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>LetEatGO결제창</title>
</head>
<body>

</body>
<!-- 아임포트 cdn -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp13577377');
		IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '렛잇고',
		//결제창에서 보여질 이름
		amount: ${order_Price},
		//가격
		buyer_email: 'das@naver.com',
		buyer_name: '유연성',
		buyer_tel: '010-1234-1234',
		buyer_addr: '서울시 강남구',
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
				
				opener.toOrderHistory();
				window.close();
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		});
	})
</script>
</html>