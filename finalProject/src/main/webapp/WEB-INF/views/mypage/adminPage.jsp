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
      
        	<td>관리자 페이지</td>
      
      </div>

   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
