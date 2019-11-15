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
  
  $(document).ready(function(){
	  $("#pbtnDelete").click(function(){
		  document.deletePartner.action="${path}/partner/deletePartner";
		  document.deletePartner.submit();
	  });
  });
  
  
</script>

 
<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
       <div class="col">
       
       <form name="updatePartner" method="post">
        <table class="table" id="tbl-dev">
        <div class="form-group">
					<label for="form-label">아이디</label>
			<input name="partner_Id" value="${partner.partner_Id}" readonly="readonly">
	    </div>
		<div class="form-group">
					<label for="form-label">비밀번호</label>
			<input type="password" name="partner_Password" value="${partner.partner_Password}">
		</div>
		<div class="form-group">
					<label for="form-label">업체 이름</label>
					<input name="partner_TruckName" value="${partner.partner_TruckName}">
		</div>
		<div class="form-group">
					<label for="form-label">주소</label>
					<input name="partner_Address" value="${partner.partner_Address}">
		</div>
		<div class="form-group">
					<label for="form-label">이메일</label>
					<input name="partner_Email" value="${partner.partner_Email}">
		</div>
		<div class="form-group">
					<label for="form-label">연락처</label>
					<input name="partner_Phone" value="${partner.partner_Phone}">
		</div>
		<div class="form-group">
					<label for="form-label">사업자 번호</label>
					<input name="partner_Permission_No" value="${partner.partner_Permission_No}">
		</div>
		<tr>
		  <td colspan="2" align="center">
		     <input type="button" class="btn btn-outline-success" value="수정" id="pbtnUpdate">
		     <input type="button" class="btn btn-outline-success" value="탈퇴" id="pbtnDelete">
		  </td>
		</tr>
	</table>
	</form>
	    <ul><li><a href="${pageContext.request.contextPath }/calendar"><span>캘린더</span></a></li></ul>
	     </div>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>