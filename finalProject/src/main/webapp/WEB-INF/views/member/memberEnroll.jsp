<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<section>
	<div id="content">
		<form action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
			<input type="text" class="form-control" placeholder="영문숫자조합" id="memberId" name="memberId" required/>
			<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="memberPw" name="memberPw2"/>
			<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="memberPw2"/>
			<input type="text" class="form-control" placeholder="이름" id="memberName" name="memberName"/>
			<input type="text" class="form-control" placeholder="나이" id="memberAge" name="memberAge"/>
			<input type="text" class="form-control" placeholder="주소" id="memberAddress" name="memberAddress"/> 
			<input type="email" class="form-control" placeholder="이메일" id="memberEmail" name="memberEmail"/>
			<input type="tel" class="form-control" placeholder="전화번호" id="memberPhone" name="memberPhone2" required/>
			<select class="form-control" name="memberGender" required>
				<option value="" disabled selected>성별</option>
				<option value="M">남</option>
				<option value="F">여</option>
			</select>
		</form>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>