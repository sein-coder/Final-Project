<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
      
       <li><a href="${pageContext.request.contextPath }/partnerlist"><span>사업자 회원 목록</span></a></li>
       <li><a href="${pageContext.request.contextPath }/memberlist"><span>고객 회원 목록</span></a></li>
      
        </div>

   </div>
</div>










<jsp:include page="/WEB-INF/views/common/footer.jsp"/>