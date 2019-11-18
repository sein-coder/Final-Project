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
              <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#find_member">사용자</a></li>
               <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#find_Pw">사업자</a></li>
            </ul>  
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#find_Id">계정찾기</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#find_Pw">비밀번호찾기</a>
              </li>
            </ul>    
   </div>                  
            <div class="tab-content" id="find_member">
              <div class="tab-pane fade show active" id="find_Id">
            <form action="${pageContext.request.contextPath}/member/find_id.do" method="post"  onsubmit="return validate();">            
					<div class="form-group">
						<label for="form-label">계정 찾기</label>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="member_Email" name="member_Email" required/></label>
						<span id="email_check" class="w3-text-red"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-success" id="find_id_member">아이디찾기</button>
				
				</form>
				</div>
			 <div class="tab-pane fade" id="find_Pw">
            <form action="${pageContext.request.contextPath}/member/find_pw.do" method="post" onsubmit="return validate();">
					<div class="form-group">
						<label for="form-label">비밀번호 찾기</label>
						<div>	
						<label>아이디<input type="text" class="form-control" id="member_Id" name="member_Id" required/></label>
							<span id="id_check" class="btn-outline-primary"></span>
						</div>
						<div>
						<label>가입시 이메일<input type="email" class="form-control" id="member_Email2" name="member_Email" required/></label>
						<span id="email_check1" class="w3-text-red"></span>
						</div>
					<button type="submit" class="btn btn-outline-success" id="find_Id_partner">비밀번호찾기</button>
					</div>
				</form>
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
		console.log("1 = 중복o / 0 = 중복x : "+data);
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
	
		
$("#member_Id").keyup(function(){
	var member_Id = $('#member_Id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/checkId.do',
		type : "get",
		data : {"member_Id":member_Id},
		success : function(data) {
		console.log("1 = 중복o / 0 = 중복x : "+data);
				if (data == false) {
					$("#id_check").text("아이디가 없습니다.");
					$("#id_check").css("color", "red");
					$("#member_Id").css("border-color", "red");
				} else{
					$("#id_check").text("아이디가 일치합니다.");
					$("#id_check").css("color", "green");
					$("#member_Id").css("border-color", "green");
				}
			}
		});	
	});		
</script>

	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>