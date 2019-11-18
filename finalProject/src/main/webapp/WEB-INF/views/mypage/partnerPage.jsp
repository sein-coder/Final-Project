<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
 .btn-outline-light{
 color:black;}
 
 

 
 .photo{width:300px;}

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
		  location.href="${path}/partner/deletePartner?Partner_Id="+'${loginMember.partner_Id}';
	  });
  }); 
  
  $(document).ready(function(){
	  $("#cbtnMove").click(function(){
		  location.href="${path}/calendar?partnerno="+${partner.partner_No};
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
			<img src="${path}/resources/images/foodtruck/${partner.profile_Re}" class="photo" />
	    </div>
        <div class="form-group">
					<label for="form-label">아이디</label>
			<input name="partner_Id" value="${partner.partner_Id}" readonly="readonly" class="form-control">
	    </div>
		<div class="form-group">
					<label for="form-label">비밀번호</label>
			<input type="password" name="partner_Password" value="${partner.partner_Password}" class="form-control">
		</div>
		<div class="form-group">
					<label for="form-label">업체 이름</label>
					<input name="partner_TruckName" value="${partner.partner_TruckName}" class="form-control">
		</div>
		<div class="form-group">
					<label for="form-label">주소</label>
					<input name="partner_Address" value="${partner.partner_Address}" class="form-control">
		</div>
		<div class="form-group">
					<label for="form-label">이메일</label>
					<input name="partner_Email" value="${partner.partner_Email}" class="form-control">
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
		     <input type="button" class="btn btn-outline-success" value="캘린더" id="cbtnMove">
		  </td>
		</tr>
	</table>
	</form>
	    
	     </div>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>