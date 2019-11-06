<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<section>
	<div class="site-section">
		<div class="col-md-8 offset-md-2">
		<div id="content">
			<form action="${pageContext.request.contextPath }/partner/partnerEnrollEnd.do" method="post" onsubmit="return validate();" >
				<input type="text" class="form-control" placeholder="영문숫자조합" id="partnerId" name="partner_Id" required/>
				
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partnerPw" name="partner_Password"/>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partnerPw2"/>
				<input type="text" class="form-control" placeholder="이름" id="partnerName" name="partner_Name"/>
				<input type="text" class="form-control" placeholder="나이" id="partnerAge" name="partner_Age"/>
				<input type="text" class="form-control" placeholder="주소" id="partnerAddress" name="partner_Address"/> 
				<input type="email" class="form-control" placeholder="이메일" id="partnerEmail" name="partner_Email"/>
				<input type="tel" class="form-control" placeholder="전화번호" id="partnerPhone" name="partner_Phone" required/>
			    <div> 
			      <label><input type="radio" name="partner_Menu" value="한식"> 한식 </label>
			      <label><input type="radio" name="partner_Menu" value="중식"> 중식 </label>
			      <label><input type="radio" name="partner_Menu" value="일식"> 일식 </label>
			      <label><input type="radio" name="partner_Menu" value="양식"> 양식 </label>
			    </div>
			    <input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
				<input type="reset" class="btn btn-outline-success" value="취소">
				
			</form>
			</div>
		</div>
	</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>