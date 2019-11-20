<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
   <div class="site-section">
   <div class="container">
  <div>
            <ul class="nav nav-tabs">
            
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#find_Member">사용자</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#find_Partner">사업자</a>
              </li>
            </ul>    
             <!--Member  -->   
            <div class="tab-content" id="find_member">
              <div class="tab-pane fade show active" id="find_Member">
              
            <form action="${pageContext.request.contextPath}/member/find_id.do" method="post"  onsubmit="return memberfindid();">            
					<div class="form-group">
						<label for="form-label">계정 찾기</label>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="member_Email" name="member_Email" required/></label>
						<span id="email_check" class="w3-text-red"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-success" id="find_id_member">아이디찾기</button>
				</form>
				
            <form action="${pageContext.request.contextPath}/member/find_pw.do" method="post" onsubmit="return validate();">
					<div class="form-group">
						<label for="form-label">비밀번호 찾기</label>
						<div>	
						<label>아이디<input type="text" class="form-control" id="memberId" name="member_Id" required/></label>
							<span id="id_check1" class="btn-outline-primary"></span>
						</div>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="memberEmail" name="member_Email" required/></label>
						<span id="email_check1" class="w3-text-red"></span>
						</div>
					<button type="submit" class="btn btn-outline-success" id="find_Id_partner">비밀번호찾기</button>
					</div>
				</form>
				</div>
				<!-- Partner -->
			 	<div class="tab-pane fade" id="find_Partner">
			 		<form action="${pageContext.request.contextPath}/partner/find_id.do" method="post"  onsubmit="return validate();">            
					<div class="form-group">
						<label for="form-label">계정 찾기</label>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="partner_Email" name="partner_Email" required/></label>
						<span id="email_check2" class="w3-text-red"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-success" id="find_Id_partner">아이디찾기</button>
				</form>
				
            <form action="${pageContext.request.contextPath}/partner/find_pw.do" method="post" onsubmit="return validate();">
					<div class="form-group">
						<label for="form-label">비밀번호 찾기</label>
						<div>	
						<label>아이디<input type="text" class="form-control" id="partner_Id" name="partner_Id" required/></label>
							<span id="id_check" class="btn-outline-primary"></span>
						</div>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="partnerEmail" name="partner_Email" required/></label>
						<span id="email_check3" class="w3-text-red"></span>
						</div>
					<button type="submit" class="btn btn-outline-success" id="find_Id_partner">비밀번호찾기</button>
					</div>
				</form>
				</div>
				</div>	
			</div>
			
		</div>
	</div>	
	
<script>
$("#member_Email").keyup(function(){
	var member_Email = $('#member_Email').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/memberEmail.do',
		type : "get",
		data : {"member_Email":member_Email},
		success : function(data) {
				if (data == false) {
					$("#email_check").text("확인");
					$("#email_check").css("color", "green");
					$("#member_Email").css("border-color", "green");
				} else{
					$("#email_check").text("잘못된이메일입니다.");
					$("#email_check").css("color", "red");
					$("#member_Email").css("border-color", "red");	
					} 
				}
			});
		});
 $("#memberEmail").keyup(function(){
	var member_Email = $('#memberEmail').val();
	var memberId = $('#memberId').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/checkIdAndEmail.do',
		type : "get",
		data : {"member_Email":member_Email,"member_Id":memberId},
		success : function(data) {
				if (data == false) {
					$("#email_check1").text("확인");
					$("#email_check1").css("color", "green");
					$("#memberEmail").css("border-color", "green");
				} else{
					$("#email_check1").text("잘못된이메일입니다.");
					$("#email_check1").css("color", "red");
					$("#memberEmail").css("border-color", "red");	
				
					} 
				}
			});
		}); 
$("#memberId").keyup(function(){
	var memberId = $('#memberId').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/checkId.do',
		type : "get",
		data : {"member_Id":memberId},
		success : function(data) {
				if (data == false) {
					$("#id_check1").text("아이디 일치합니다.");
					$("#id_check1").css("color", "green");
					$("#memberId").css("border-color", "green");
				} else{
					$("#id_check1").text("일치하는 아이디가 없습니다.");
					$("#id_check1").css("color", "red");
					$("#memberId").css("border-color", "red");
					} 
				}
			});
		});
		



 $("#partner_Email").keyup(function(){
		var partner_Email = $('#partner_Email').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/partner_Email.do',
			type : "get",
			data : {"partner_Email":partner_Email},
			success : function(data) {
				console.log(data);
					 if (data == false) {
						$("#email_check2").text("확인");
						$("#email_check2").css("color", "green");
						$("#partner_Email").css("border-color", "green");
					} else{
						$("#email_check2").text("잘못된이메일입니다.");
						$("#email_check2").css("color", "red");
						$("#partner_Email").css("border-color", "red");			
						}  
					} 
				});
			});
$("#partner_Id").keyup(function(){
	var partner_Id = $('#partner_Id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/partner/checkId.do',
		type : "get",
		data : {"partner_Id":partner_Id},
		success : function(data) {
				if (data == false) {
					$("#id_check").text("아이디 일치합니다.");
					$("#id_check").css("color", "green");
					$("#partner_Id").css("border-color", "green");
				} else{
							$("#id_check").text("일치하는 아이디가 없습니다.");
							$("#id_check").css("color", "red");
							$("#partner_Id").css("border-color", "red");
					} 
				}
			});
		});
 $("#partnerEmail").keyup(function(){
		var partnerEmail = $('#partnerEmail').val();
		var partner_Id = $('#partner_Id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/partner/checkIdAndEmail.do',
			type : "get",
			data : {"partner_Email":partnerEmail,"partner_Id":partner_Id},
			success : function(data) { 	
				console.log(data);
					 if (data == false) {
						$("#email_check3").text("확인");
						$("#email_check3").css("color", "green");
						$("#partnerEmail").css("border-color", "green");
					} else{
						$("#email_check3").text("잘못된이메일입니다.");
						$("#email_check3").css("color", "red");
						$("#partnerEmail").css("border-color", "red");			
						}  
					} 
				});
			});
</script>

	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>