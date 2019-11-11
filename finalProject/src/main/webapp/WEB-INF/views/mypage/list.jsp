<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
      
      <li><a href="${pageContext.request.contextPath }/memberPage"><span>고객 페이지</span></a></li>
      <li><a href="${pageContext.request.contextPath }/partnerPage"><span>사업자 페이지</span></a></li>
      <li><a href="${pageContext.request.contextPath }/adminPage"><span>관리자 페이지</span></a></li>
      
        </div>
   </div>
</div>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>