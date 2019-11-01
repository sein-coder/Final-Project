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
					<button onClick="" class="form-control btn btn-info">장바구니에 담기</button>
					<input type="submit" class="form-control btn btn-primary" value="결제하기"/> 
				</div>
			</div>
		</div>
	</div>
</section>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function inputAddr(){
		new daum.Postcode({
			oncomplete: function(data){
				document.getElementById('roadaddress').value=data.roadAddress;
			}
		}).open();
	}
	
	function 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>