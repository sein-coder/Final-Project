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

//축제 등록
$(document).ready(function(){
	  $("#festivalAdd").click(function(){
		  location.href="${path}/festival/festivalForm";
	  });
}); 

//축제 수정

$(document).ready(function(){
	  $("#festivalUpdate").click(function(){
		  location.href="${path}/festival/updateFestival?festival_No="+'${festival_No}';
	  });
}); 

//축제 삭제


</script>

<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
       <div class="col">
      
        	<td>관리자 페이지</td>
        	
        	<form name="updateAdminPage" method="post">
             <table class="table" id="tbl-dev">
        <div class="form-group">
					<label for="form-label">아이디</label>
			<input name="member_Id" value="${member.member_Id}" readonly="readonly" class="form-control">
		</div>
		 <div class="form-group">
					<label for="form-label">비밀번호</label>
			<input type="password" name="member_Password" value="${member.member_Password}" class="form-control">
		</div>
		<div class="form-group">
					<label for="form-label">나이</label>
			<input name="member_Age" value="${member.member_Age}" readonly="readonly" class="form-control">
		</div>
		<div class="form-group">
					<label for="form-label">성별</label>
			<input name="member_Gender" value='${member.member_Gender eq "남" ? "남":"여" }' readonly="readonly" class="form-control">
		</div>
		 <div class="form-group">
					<label for="form-label">이메일</label>
			<input name="member_Email" value="${member.member_Email}" class="form-control">
		</div>
		 <div class="form-group">
					<label for="form-label">연락처</label>
			<input name="member_Phone" value="${member.member_Phone}" class="form-control">
		</div>
		<div class="form-group">
			<input type="button" class="btn btn-outline-success" value="관리자 정보 수정" id="btnUpdate">
			<input type="button" class="btn btn-outline-success" value="축제 등록" id="festivalAdd">
			<input type="button" class="btn btn-outline-success" value="축제 수정" id="festivalUpdate">
			<input type="button" class="btn btn-outline-success" value="축제 삭제" id="festivalDelete">
		</div>
      </table>
      </form>
      </div>
     </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
