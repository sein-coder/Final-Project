<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 
<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
<table class="table" id="tbl-dev">
        <tr>
			<th scope="col">아이디</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">이름</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">나이</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">성별</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">사업자 번호</th>
			<td></td>
		</tr>
		<tr>
			<th scope="col">메뉴</th>
			<td></td>
		</tr>
	</table>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>