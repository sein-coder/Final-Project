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
			<form action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
				<input type="text" class="form-control" placeholder="영문숫자조합" id="member_Id" name="member_Id" />
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="member_Password" name="member_Password"/>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="memberPw2"/>
				<input type="text" class="form-control" placeholder="이름" id="member_Name" name="member_Name"/>
				<input type="text" class="form-control" placeholder="나이" id="member_Age" name="member_Age"/>
				<input type="text" class="form-control" placeholder="주소" id="member_Address" name="member_Address"/> 
				<input type="email" class="form-control" placeholder="이메일" id="member_Email" name="member_Email"/>
				<input type="tel" class="form-control" placeholder="전화번호" id="member_Phone" name="member_Phone" />
			 	<div>
			      <label><input type="radio" name="member_Gender" value="M"> 남 </label>
			      <label><input type="radio" name="member_Gender" value="F"> 여 </label>
			    </div>	
			    <input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
				<input type="reset" class="btn btn-outline-success" value="취소">
			</form>
			</div>
		</div>
	</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>