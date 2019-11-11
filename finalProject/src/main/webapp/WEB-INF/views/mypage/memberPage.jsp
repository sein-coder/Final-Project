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

<script>
  $(document).ready(function(){
	  $("#btnUpdate").click(function(){
		  document.updateMember.action="${path}/member/updateMember";
		  document.updateMember.submit();
	  });
  });
 

</script>

<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
      <form name="updateMember" method="post">
      <table class="table" id="tbl-dev">
        <tr>
			<th scope="col">아이디</th>
			<td><input name="memberId" value="${member.member_Id}" readonly="readonly"></td>
		</tr>
		<tr>
			<th scope="col">이름</th>
			<td><input name="memberName" value="${member.member_Name}"></td>
		</tr>
		<tr>
			<th scope="col">나이</th>
			<td><input name="memberAge" value="${member.member_Age}"></td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td><input name="memberAddress" value="${member.member_Address}"></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><input name="memberEmail" value="${member.member_Email}"></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td><input name="memberPhone" value="${member.member_Phone}"></td>
		</tr>
		<tr>
			<th scope="col">성별</th>
			<td><input name="memberGender" value='${member.member_Gender eq "M"?"남":"여"}'></td>
		</tr>
	 </table>
	  <button type="submit" id="btnUpdate" class="updateMember">수정</button>
	 
	    </form>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
