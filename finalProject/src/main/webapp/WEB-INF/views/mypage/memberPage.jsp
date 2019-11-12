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
		  document.deleteMember.action="${path}/member/deleteMember";
		  document.deleteMember.submit();
	  });
  });
 

</script>

<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
        <div class="col">
      
      
      
      <form name="updateMember" method="post">
      <table class="table" id="tbl-dev">
        <tr>
			<th scope="col">아이디</th>
			<td><input name="member_Id" value="${member.member_Id}" readonly="readonly"></td>
		</tr>
		<tr>
			<th scope="col">비밀번호</th>
			<td><input name="member_Password" value="${member.member_Password}"></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><input name="member_Email" value="${member.member_Email}"></td>
		</tr>
		<tr>
			<th scope="col">연락처</th>
			<td><input name="member_Phone" value="${member.member_Phone}"></td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		     <input type="button" value="수정" id="btnUpdate">
		     <input type="button" value="탈퇴" id="btnDelete">
		  </td>
		</tr>
	 </table>
	    </form>
	    </div>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
