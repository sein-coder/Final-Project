<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
   <section id="content">
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-8">	
			푸드트럭소개
        </div>

    </div>
    </div>        
            
</section>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
