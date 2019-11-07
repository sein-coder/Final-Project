<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<section>
<div class="site-section">
   <div class="container">
      <div class="row">
        <div class="col">
          <p>로그인</p>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#login_partner">사업자</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#login_member">사용자</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="login_partner">
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
              <div class="tab-pane fade" id="login_member">
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
      </div>
    </div>
  </div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>