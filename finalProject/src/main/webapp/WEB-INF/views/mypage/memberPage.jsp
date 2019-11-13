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
			<td><c:out value="${member.member_Id}"/></td>
		</tr>
		<tr>
			<th scope="col">이름</th>
			<td><c:out value="${member.member_Name }"/></td>
		</tr>
		<tr>
			<th scope="col">나이</th>
			<td><c:out value="${member.member_Age }"/></td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td><c:out value="${member.member_Address }"/></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><c:out value="${member.member_Email }"/></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td><c:out value="${member.member_Phone }"/></td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		     <input type="button" value="수정" id="btnUpdate">
		     <li><a href="${pageContext.request.contextPath }/deleteMember"><span>회원 탈퇴</span></a></li>
		  </td>
		</tr>
	</table>
	    <li><a href="${pageContext.request.contextPath }/member/updateMember"><span>수정</span></a></li>
		<li><a href="${pageContext.request.contextPath }/member/deleteMember"><span>삭제</span></a></li>
		
        	
      
      </div>

   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
