<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<section>
<div class="site-section">
   <div class="container">
      <div class="row">
        <div class="col">
          <p>회원가입</p>
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
              	 <form action="${pageContext.request.contextPath }/partner/partnerEnrollEnd.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
				<div class="form-group">
					<label for="partner_id">아이디</label>
						<input type="text" class="form-control" placeholder="영문숫자조합" id="partner_Id" name="partner_Id" />
						<div class="check_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="partner_id">업체명</label>
				<input type="text" class="form-control" placeholder="업체명" id="partnerName" name="partner_TruckName"/>
				</div>
				
			    <div class="form-group">
					<label for="partner_id">비밀번호</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partnerPw" name="partner_Password"/>
				</div>
				<div class="form-group">
					<label for="partner_id">비밀번호확인</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partnerPw2"/>
				</div>
				<div class="form-group">
					<label for="partner_id">주소</label>
				<input type="text" class="form-control" placeholder="주소" id="partnerAddress" name="partner_Address"/>
				</div> 
				<div class="form-group">
					<label for="partner_id">이메일</label>
				<input type="email" class="form-control" placeholder="이메일" id="partnerEmail" name="partner_Email"/>
				</div>
				<div class="form-group">
					<label for="partner_id">전화번호</label>
				<input type="tel" class="form-control" placeholder="전화번호" id="partnerPhone" name="partner_Phone" />
				</div>
				<div class="form-group">
					<label for="partner_id">메뉴종류</label>
			    <div> 
			      <label><input type="radio" name="partner_Menu" value="한식"> 한식 </label>
			      <label><input type="radio" name="partner_Menu" value="중식"> 중식 </label>
			      <label><input type="radio" name="partner_Menu" value="일식"> 일식 </label>
			      <label><input type="radio" name="partner_Menu" value="양식"> 양식 </label>
			    </div>
			    </div>
			    <div class="form-group">
					<label for="partner_id">전화번호</label>
			    <input type="number" class="form-control" placeholder="인허가번호" id="partner_Permission_No" name="partner_Permission_No"/>
			    <button type="button" >조회</button>
			    </div>
			    <div class="form-group">
					<label for="partner_id">사업장 대표이미지</label><br/>
				<input type="file" name="upFile" id="LoadImg();" accept="image/*" onchange="fileUpload(fis)" /> 
				</div>
			    
			    <input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
				<input type="reset" class="btn btn-outline-success" value="취소">
				
			</form>
              </div>
              
              <div class="tab-pane fade" id="login_member">
                <form action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
				<div class="form-group">
					<label for="partner_id">아이디</label>
				<input type="text" class="form-control" placeholder="영문숫자조합" id="member_Id" name="member_Id"/>
				</div>
				<div class="form-group">
					<label for="partner_id">비밀번호</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="member_Password" name="member_Password"/>
				</div>
				<div class="form-group">
					<label for="partner_id">비밀번호확인</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="memberPw2"/>
				</div>
				<div class="form-group">
					<label for="partner_id">이메일</label>
				<input type="email" class="form-control" placeholder="이메일" id="member_Email" name="member_Email"/>
				</div>
				<div class="form-group">
					<label for="partner_id">전화번호</label>
				<input type="tel" class="form-control" placeholder="전화번호" id="member_Phone" name="member_Phone" />
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
<script>
	$("#partner_Id").blur(function(){
		var partner_Id = $('#partner_Id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/partner/checkId.do?partner_Id='+partner_Id,
			type : "get",
			data : {"partner_Id":partner_Id},
			success : function(data) {
console.log(data);							
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 ");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						if(id.test(partner_Id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("사용가능한 아이디입니다");
							$("#reg_submit").attr("disabled", false);
				
						} else if(partner_Id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
/* 	function LoadImg(value) 
	{
		if(value.files && value.files[0]) 
		{
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#LoadImg').attr('src', e.target.result);
			}
		
			reader.readAsDataURL(value.files[0]);
		}
	}
	function fileUpload(fis) {
		var str = fis.value;
		alert("파일네임: "+ fis.value.substring(str.lastIndexOf("\\")+1));
		} */
/* function chk_file_type(obj) {
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();
	 var check_file_type=new Array();​

	 check_file_type=['jpg','gif','png','jpeg','bmp'];

	 if(check_file_type.indexOf(file_type)==-1){
	  alert('이미지 파일만 선택할 수 있습니다.');
	  var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  return false;
	 }
	} */

	/* var idCheck=0;
	$("#idCheck").click(function(){
		var member_Id= $("#member_Id").val();
			
		$.ajax({
			
		} */
		/* $("#id_check_sucess").hide();
		 $(".id_Check").show();
		$(".form-control").attr("check_result","fail");
	})
	 if ($('.form-control').val() == '') {
      alert('아이디을 입력해주세요.')
      return;
    } */
</script>

		





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>