<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>




<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
       <div class="col">
<form method="post">
    <input type="text" name="member_Id" value="${loginMember.member_Id}">
    <input type="text" name="member_Password" value="${loginMember.member_Password}">
    <button type="submit">탈퇴</button>
</form> 
      </div>
    </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>