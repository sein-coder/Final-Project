<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="파트너리스트"/>
</jsp:include>
<style>
 .btn-outline-light{
 color:black;}

</style>

<section id="content">  
<table class="table">
		<tr>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">나이</th>
			<th scope="col">주소</th>
			<th scope="col">이메일</th>
			<th scope="col">연락처</th>
			<th scope="col">성별</th>
			<th scope="col">사업자 번호</th>
			<th colspan="2"></th>
		</tr>
		<!--내용출력결과내용  -->
		<c:forEach items="${list }" var="l" varStatus="s">
		  <tr>
		    <td>${s.count }</td>
		    <td>${l.devName }</td>
		    <td>${l.devAge} </td>
		    <td>${l.devEmail }</td>
		    <td>${l.devGender }</td>
		    <td>
		      <c:forEach items="${l.devLang}" var="lang" varStatus="v">
		       ${v.index!=null?",":"" }${lang }
		      </c:forEach>
		    </td>
		  </tr>
		</c:forEach>
		        <td>
					<button type="button" class="btn btn-outline-light"
					onclick="">수정</button>
				</td>
				<td>
					<button type="button" class="btn btn-outline-light"
					onclick="">삭제</button>
				</td>
	</table>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>