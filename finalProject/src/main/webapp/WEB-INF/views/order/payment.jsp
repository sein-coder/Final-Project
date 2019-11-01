<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<section id="content">
	<!-- 제품수령방법 -->
	<div class="row">
		<input type="radio" name="delivery" id="delivery_1"/>
		<label for="delivery_1">배달로 받을래요</label>
		<input type="radio" name="delivery" id="delivery_2"/>
		<label for="delivery_2">직접 방문수령할래요</label>
	</div>
	<!-- 주문 요청사항 기재란 -->
	<div>
		<textarea rows="1" cols="30" placeholder="30자 이내로 기재"></textarea>	
	</div>
	<!-- 결제 수단 선택란 -->
	<div>
		<!-- 신용카드 -->
		<div>
		</div>
		<!-- 카카오페이 -->
		<div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>