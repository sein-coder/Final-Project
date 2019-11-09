<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
 .btn-outline-light{
 color:black;}

</style>

 
<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
<table class="table" id="tbl-dev">
        <tr>
			<th scope="col">아이디</th>
			<td><c:out value="${partner.partner_Id }"/></td>
		</tr>
		<tr>
			<th scope="col">업체명</th>
			<td><c:out value="${partner.partner_TruckName }"/></td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td><c:out value="${partner.partner_Address }"/></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><c:out value="${partner.partner_Email }"/></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td><c:out value="${partner.partner_Phone }"/></td>
		</tr>
		<tr>
			<th scope="col">사업자 번호</th>
			<td><c:out value="${partner.partner_Permission_No }"/></td>
		</tr>
	</table>
	    <li><a href="${pageContext.request.contextPath }/partner/updatePartner"><span>수정</span></a></li>
		<li><a href="${pageContext.request.contextPath }/partner/deletePartner"><span>삭제</span></a></li>
	    <li><a href="${pageContext.request.contextPath }/calendar"><span>캘린더</span></a></li>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>