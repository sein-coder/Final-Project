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
		  document.updateMember.action="${path}/member/updateMember"; //쿼리스트링으로 아이디를 넘겨버리면 DB에 아이디가 2개가 저장되어버렸음
		  document.updateMember.submit();
	  });
  });
  
   $(document).ready(function(){
	  $("#btnDelete").click(function(){
		  location.href="${path}/member/deleteMember?Member_Id="+'${loginMember.member_Id}';
	  });
  }); 
</script>

<section>
<div class="site-section">
   <div class="container">
      <div class="row">
        <div class="col">
      
       <form name="updateMember" method="post">
       <table class="table" id="tbl-dev">
        <div class="form-group">
					<label for="form-label">아이디</label>
			<input name="member_Id" value="${member.member_Id}" readonly="readonly">
		</div>
		 <div class="form-group">
					<label for="form-label">비밀번호</label>
			<input type="password" name="member_Password" value="${member.member_Password}" >
		</div>
		<div class="form-group">
					<label for="form-label">나이</label>
			<input name="member_Age" value="${member.member_Age}">
		</div>
		<div class="form-group">
					<label for="form-label">성별</label>
			<input name="member_Gender" value='${member.member_Gender eq "남" ? "남":"여" }'>
		</div>
		 <div class="form-group">
					<label for="form-label">이메일</label>
			<input name="member_Email" value="${member.member_Email}">
		</div>
		 <div class="form-group">
					<label for="form-label">연락처</label>
			<input name="member_Phone" value="${member.member_Phone}">
		</div>
		<tr>
		  <td colspan="2" align="center">
		     <input type="button" class="btn btn-outline-success" value="수정" id="btnUpdate">
		     <input type="button" class="btn btn-outline-success" value="탈퇴" id="btnDelete" onclick="/member/deleteMember">
		  </td>
		</tr>
	 </table>
	    </form>
	    
	   </div>
      </div>
    </div>
  </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
