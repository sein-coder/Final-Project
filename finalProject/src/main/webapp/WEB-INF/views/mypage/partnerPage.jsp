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
	  $("#pbtnUpdate").click(function(){
		  document.updatePartner.action="${path}/partner/updatePartner"; //쿼리스트링으로 아이디를 넘겨버리면 DB에 아이디가 2개가 저장되어버렸음
		  document.updatePartner.submit();
	  });
  });
</script>

 
<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
       <div class="col">
       
       <form id="updatePartner" method="post">
        <table class="table" id="tbl-dev">
        <tr>
			<th scope="col">아이디</th>
			<td><input name="partner_Id" value="${partner.partner_Id}" readonly="readonly"></td>
		</tr>
		<tr>
			<th scope="col">업체명</th>
			<td><input name="partner_TruckName" value="${partner.partner_TruckName}"></td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td><input name="partner_Address" value="${partner.partner_Address}"></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><input name="partner_Email" value="${partner.partner_Email}"></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td><input name="partner_Phone" value="${partner.partner_Phone}"></td>
		</tr>
		<tr>
			<th scope="col">사업자 번호</th>
			<td><input name="partner_Permission_No" value="${partner.partner_Permission_No}"></td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		     <input type="button" value="수정" id="pbtnUpdate">
		     <li><a href="deletePartner">회원 탈퇴</a></li>
		  </td>
		</tr>
	</table>
	</form>
	    <li><a href="${pageContext.request.contextPath }/calendar"><span>캘린더</span></a></li>
	     </div>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>