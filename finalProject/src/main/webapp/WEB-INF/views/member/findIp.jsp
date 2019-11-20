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
              
            <form action="${pageContext.request.contextPath}/member/find_id.do" method="post"  onsubmit="return validate();">            
					<div class="form-group">
						<label for="form-label">사용자 계정 찾기</label>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="member_idEmail" name="member_Email" required/></label>
						<span id="email_check" class="w3-text-red"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-success" id="find_id_member" disabled="disabled">아이디찾기</button>
				</form>
				
            <form action="${pageContext.request.contextPath}/member/find_pw.do" method="post" onsubmit="return validate();">
					<div class="form-group">
						<label for="form-label">사용자 비밀번호 찾기</label>
						<div>	
						<label>아이디<input type="text" class="form-control" id="member_Id" name="member_Id" required/></label>
							<span id="id_check1" class="btn-outline-primary"></span>
						</div>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="member_PwEmail" name="member_Email" required/></label>
						<span id="email_check1" class="w3-text-red"></span>
						</div>
					<button type="submit" class="btn btn-outline-success" id="find_pw_member" disabled="disabled">비밀번호찾기</button>
					</div>
				</form>
				</div>
				<!-- Partner -->
			 	<div class="tab-pane fade" id="find_Partner">
			 		<form action="${pageContext.request.contextPath}/partner/find_id.do" method="post"  onsubmit="return validate();">            
					<div class="form-group">
						<label for="form-label">사업자 계정 찾기</label>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="partner_idEmail" name="partner_Email" required/></label>
						<span id="email_check2" class="w3-text-red"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-success" id="find_Id_partner" disabled="disabled">아이디찾기</button>
				</form>
				
            <form action="${pageContext.request.contextPath}/partner/find_pw.do" method="post" onsubmit="return validate();">
					<div class="form-group">
						<label for="form-label">사업자 비밀번호 찾기</label>
						<div>	
						<label>아이디<input type="text" class="form-control" id="partner_Id" name="partner_Id" required/></label>
							<span id="id_check" class="btn-outline-primary"></span>
						</div>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="partner_PwEmail" name="partner_Email" required/></label>
						<span id="email_check3" class="w3-text-red"></span>
						</div>
					<button type="submit" class="btn btn-outline-success" id="find_Pw_partner" disabled="disabled">비밀번호찾기</button>
					</div>
				</form>
				</div>
				</div>	
			</div>
			
		</div>
	</div>	
	
<script>
$("#member_idEmail").keyup(function(){
	var member_Email = $('#member_idEmail').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/memberEmail.do',
		type : "get",
		data : {"member_Email":member_Email},
		success : function(data) {
				if (data == false) {
					$("#email_check").text("확인");
					$("#email_check").css("color", "green");
					$("#member_idEmail").css("border-color", "green");
					$("#find_id_member").removeAttr("disabled");
				} else{
					$("#email_check").text("잘못된이메일입니다.");
					$("#email_check").css("color", "red");
					$("#member_idEmail").css("border-color", "red");
					/* $("find_id_member").attr("disabled","disabled"); */
					} 
				}
			});
		});
$("#member_PwEmail").keyup(function(){
	var member_PwEmail = $('#member_PwEmail').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/memberEmail.do',
		type : "get",
		data : {"member_Email":member_PwEmail},
		success : function(data) {
				if (data == false) {
					$("#email_check1").text("확인");
					$("#email_check1").css("color", "green");
					$("#member_PwEmail").css("border-color", "green");
					$("#find_pw_member").removeAttr("disabled");
				} else{
					$("#email_check1").text("잘못된이메일입니다.");
					$("#email_check1").css("color", "red");
					$("#member_PwEmail").css("border-color", "red");
				/* 	$("find_pw_member").attr("disabled","disabled"); */
					} 
				}
			});
		});
$("#member_Id").keyup(function(){
	var member_Id = $('#member_Id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/checkId.do',
		type : "get",
		data : {"member_Id":member_Id},
		success : function(data) {
				if (data == false) {
					$("#id_check1").text("아이디 일치합니다.");
					$("#id_check1").css("color", "green");
					$("#member_Id").css("border-color", "green");
				} else{
							$("#id_check1").text("일치하는 아이디가 없습니다.");
							$("#id_check1").css("color", "red");
							$("#member_Id").css("border-color", "red");
					} 
				}
			});
		});
		
		
/* $("#find_Id_partner").click(function(){
    var idSearchModal = document.getElementById('idSearchModal');
    var idSearchclose = document.getElementById("idSearchclose");                                          
    var idSearchclose1 = document.getElementById("idSearchclose1"); 
       idSearchModal.style.display = "block";
       idSearchModal.style.display = "block";
    idSearchclose.onclick = function() {
       idSearchModal.style.display = "none";
    }
    idSearchclose1.onclick = function() {
       idSearchModal.style.display = "none";
    } 
 }); */		
		
	
		
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
 $("#partner_idEmail").keyup(function(){
		var partner_idEmail = $('#partner_idEmail').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/password/partner_Email.do',
			type : "get",
			data : {"partner_Email":partner_idEmail},
			success : function(data) {
					 if (data == false) {
						$("#email_check3").text("확인");
						$("#email_check3").css("color", "green");
						$("#partner_Email").css("border-color", "green");
					} else{
						$("#email_check3").text("잘못된이메일입니다.");
						$("#email_check3").css("color", "red");
						$("#partner_Email").css("border-color", "red");			
						}  
					} 
				});
			});
 $("#partner_PwEmail").keyup(function(){
		var partner_PwEmail = $('#partner_PwEmail').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/partnerid/partner_Email.do',
			type : "get",
			data : {"partner_Email":partner_PwEmail},
			success : function(data) { 	
					 if (data == false) {
						$("#email_check3").text("확인");
						$("#email_check3").css("color", "green");
						$("#partner_PwEmail").css("border-color", "green");
						$("#find_Pw_partner").removeAttr("disabled");
					} else{
						$("#email_check3").text("잘못된이메일입니다.");
						$("#email_check3").css("color", "red");
						$("#partner_PwEmail").css("border-color", "red");	
					 	$("find_Pw_partner").attr("disabled"); 
						}  
					} 
				});
			});
</script>

	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>