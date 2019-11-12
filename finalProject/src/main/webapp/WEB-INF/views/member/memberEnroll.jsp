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
         	<p></p>
          <p>회원가입</p>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#login_member">사용자</a>
              </li>
               <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#login_partner">사업자</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade" id="login_member">
                <form action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
				<div class="form-group">
					<label for="form-label">아이디</label>
				<input type="text" class="form-control" placeholder="영문숫자조합" id="member_Id" name="member_Id" required/>
				<div class="" id="id_check1"></div>
				</div>
				<div class="form-group">
					<label for="form-label">비밀번호</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="member_Password" name="member_Password" required/>
				<div class="" id="pw_check1"></div>
				</div>
				<div class="form-group">
					<label for="form-label">비밀번호확인</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="member_PasswordCheck" required/>
				<div class="" id="pwc_check1"></div>
				</div>
				<div class="form-group">
					<label for="form-label">이메일</label>
				<input type="email" class="form-control" placeholder="이메일" id="member_Email" name="member_Email" required/>
				<div class="" id="email_check1"></div>
				</div>
				<div class="form-group">
					<label for="form-label">전화번호</label>
				<input type="tel" class="form-control" placeholder="전화번호" id="member_Phone" name="member_Phone"  required/>
				<div class="" id="tel_check1"></div>
				</div>
			    <input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
				<input type="reset" class="btn btn-outline-success" value="취소">
		<!--Partner  -->		
			</form>
              </div>
               <div class="tab-pane fade show active" id="login_partner">
              	 <form action="${pageContext.request.contextPath }/partner/partnerEnrollEnd.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
				<div class="form-group">
					<label for="form-label">아이디</label>
						<input type="text" class="form-control" placeholder="영문숫자조합" id="partner_Id" name="partner_Id" required/>
						<div class="check_font" id="id_check2"></div>
				</div>
				<div class="form-group">
					<label for="form-label">업체명</label>
				<input type="text" class="form-control" placeholder="업체명" id="partner_TruckName" name="partner_TruckName" required/>
				<div class="check_font" id="trn-check"></div>
				</div>
				
			    <div class="form-group">
					<label for="form-label">비밀번호</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partner_Password" name="partner_Password" required/>
				<div class="check_font" id="pw_check2"></div>
				</div>
				<div class="form-group">
					<label for="form-label">비밀번호확인</label>
				<input type="password" class="form-control" placeholder="특수문자포함10자이상" id="partner_PasswordCheck" required/>
				<div class="check_font" id="pwc_check2"></div>
				</div>
				<div class="form-group">
					<label for="form-label">주소</label>
				<input type="text" class="form-control" placeholder="주소" id="partner_Address" name="partner_Address" required/>
				<div class="check_font" id="add_check"></div>
				</div> 
				<div class="form-group">
					<label for="form-label">이메일</label>
				<input type="email" class="form-control" placeholder="이메일" id="partner_Email" name="partner_Email" required/>
				<div class="check_font" id="email_check2"></div>
				</div>
				<div class="form-group">
					<label for="form-label">전화번호</label>
				<input type="tel" class="form-control" placeholder="전화번호" id="partner_Phone" name="partner_Phone" required/>
				<div class="check_font" id="tel_check2"></div>
				</div>
				<div class="form-group">
					<label for="form-label">메뉴종류</label>
			    <div> 
			      <label><input type="radio" name="partner_Menu" value="한식"> 한식 </label>
			      <label><input type="radio" name="partner_Menu" value="중식"> 중식 </label>
			      <label><input type="radio" name="partner_Menu" value="일식"> 일식 </label>
			      <label><input type="radio" name="partner_Menu" value="양식"> 양식 </label>
			    </div>
			    </div>
			    <div class="form-group">
					<label for="form-label">인허가번호</label>
			    <input type="text" class="form-control" placeholder="인허가번호" id="partner_Permission_No" name="partner_Permission_No"/>
			    </div>
			    <div class="form-group">
					<label for="form-label">사업장 대표이미지</label><br/>
        		<img id="image" />
				<input type="file" name="upFile" id="upFile" accept="image/*" onchange="readURL(this)" /> 
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

	//Partner
	$("#partner_Id").blur(function(){
		var partner_Id = $('#partner_Id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/partner/checkId.do',
			type : "get",
			data : {"partner_Id":partner_Id},
			success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+data);
					if (data == false) {
						$("#id_check2").text("사용중인 아이디입니다 ");
						$("#id_check2").css("color", "red");
						$("#partner_Id").css("border-color", "red");
					} else{
						var regExp = /^[A-Za-z0-9+]{4,12}$/;
							if(regExp.test($('#partner_Id').val())){
								$("#id_check2").text("사용가능한 아이디입니다");
								$("#id_check2").css("color", "green");
								$("#partner_Id").css("border-color", "green");
							} else {
								$("#id_check2").text("아이디는 영문/숫자를 포함한 4-12자리까지 입력가능합니다.");
								$("#id_check2").css("color", "red");
								$("#partner_Id").css("border-color", "red");
							}
						} 
					}
				});
			});
	
	$("#partner_Password").blur(function validate(){
		var regPw =  /^[A-Za-z0-9]{8,12}$/;
		if(regPw.test($('#partner_Password').val())){
			$("#pw_check2").text("사용가능한 비밀번호 입니다.")
			$("#pw_check2").css("color", "green");
			$("#partner_Password").css("border-color", "green");
		} else {
			$("#pw_check2").text("패스워드는 영문숫자조합 8자리에서 12자리까지 입력가능합니다.")
			$("#pw_check2").css("color", "red");
			$("#partner_Password").css("border-color", "red");
		}
		
	});

    $('#partner_PasswordCheck').blur(function(){

        if($('#partner_Password').val() != $('#partner_PasswordCheck').val()){
          $('#pwc_check2').html('비밀번호 일치하지 않음');
          $('#pwc_check2').attr('color', '#f82a2aa3');
        } else{
          $('#pwc_check2').html('비밀번호 일치함');
          $('#pwc_check2').attr('color', '#199894b3');
        }
    });
	
    $("#partner_Email").blur(function(){
    var regEmail= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	if(regEmail.test($("#partner_Email").val())){
    		$("#email_check2").text("")
    		$("#email_check2").css("color", "green");
    		$("#partner_Email").css("border-color", "green");
    	}else{	
    		$("#email_check2").text("이메일형식을 맞춰주세요. ex) letEatGo@naver.com")
    		$("#email_check2").css("color", "green");
    		$("#partner_Email").css("border-color", "green");
    	} 
    });
    $("#partner_Phone").blur(function(){
    var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test($('#partner_Phone').val())) {
    	$("#tel_check2").text("잘못된 휴대폰 번호입니다.");
		$("#tel_check2").css("color", "red");
		$("#partner_Phone").css("border-color", "red");
    }else{
    	$("#tel_check2").text("");
		$("#tel_check2").css("color", "green");
		$("#partner_Phone").css("border-color", "green");
    }
    });
     //인허가 번호조회
     $('#partner_Permission_No').keyup(function(){
    	var permission_no = $('#partner_Permission_No').val();
    	$.ajax({
    		url : '${pageContext.request.contextPath}/partner/permission.do',
    		type : "get",
    	 	data : {"partner_Permission_No":partner_Permission_No}, 
    		success : function(data){
    		console.log(data);
    		}	
    	});
    }) ; 
     
 	$("#upFile").on("change",function(){

 		var img = $("#upFile").val();
 		
 		var filename = img.substring(img.lastIndexOf("/")-1,img.length)
 		console.log(img.lastIndexOf("/"));
 		
 		var reader = new FileReader();

	    reader.onload = function (e) { 
	        document.getElementById("image").src = e.target.result;
	    };

	    // read the image file as a data URL.
	    reader.readAsDataURL(this.files[0]);
	});;

	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	
	
     
    //Member 
    $("#member_Id").blur(function(){
    	var member_Id = $('#member_Id').val();
    	$.ajax({
    		url : '${pageContext.request.contextPath}/member/checkId.do',
    		type : "get",
    		data : {"member_Id":member_Id},
    		success : function(data) {
    		console.log("1 = 중복o / 0 = 중복x : "+data);
    				if (data == false) {
    					$("#id_check1").text("사용중인 아이디입니다 ");
    					$("#id_check1").css("color", "red");
    					$("#member_Id").css("border-color", "red");
    				} else{
    					var regExp = /^[A-Za-z0-9+]{4,12}$/;
    						if(regExp.test($('#member_Id').val())){
    							$("#id_check1").text("사용가능한 아이디입니다");
    							$("#id_check1").css("color", "green");
    							$("#member_Id").css("border-color", "green");
    						} else {
    							$("#id_check1").text("아이디는 영문/숫자를 포함한 4-12자리까지 입력가능합니다.");
    							$("#id_check1").css("color", "red");
    							$("#member_Id").css("border-color", "red");
    						}
    					} 
    				}
    			});
    		});
    $("#member_Password").blur(function validate(){
    	var regPw =  /^[A-Za-z0-9]{8,12}$/;
    	if(regPw.test($('#member_Password').val())){
    		$("#pw_check1").text("사용가능한 비밀번호 입니다.")
    		$("#pw_check1").css("color", "green");
    		$("#member_Password").css("border-color", "green");
    	} else {
    		$("#pw_check1").text("패스워드는 영문숫자조합 8자리에서 12자리까지 입력가능합니다.")
    		$("#pw_check1").css("color", "red");
    		$("#member_Password").css("border-color", "red");
    	}
    	
    });

        $('#member_PasswordCheck').blur(function(){

            if($('#member_Password').val() != $('#member_PasswordCheck').val()){
              $('#pwc_check1').html('비밀번호 일치하지 않음');
              $('#pwc_check1').attr('color', '#f82a2aa3');
            } else{
              $('#pwc_check1').html('비밀번호 일치함');
              $('#pwc_check1').attr('color', '#199894b3');
            }
        });
    	
        $("#member_Email").blur(function(){
        var regEmail= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        	if(regEmail.test($("#member_Email").val())){
        		$("#email_check1").text("")
        		$("#email_check1").css("color", "green");
        		$("#member_Email").css("border-color", "green");
        	}else{	
        		$("#email_check1").text("이메일형식을 맞춰주세요. ex) letEatGo@naver.com")
        		$("#email_check1").css("color", "green");
        		$("#member_Email").css("border-color", "green");
        	} 
        });
        $("#member_Phone").blur(function(){
        var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
        if (!regPhone.test($('#member_Phone').val())) {
        	$("#tel_check1").text("잘못된 휴대폰 번호입니다.");
    		$("#tel_check1").css("color", "red");
    		$("#member_Phone").css("border-color", "red");
        }else{
        	$("#tel_check1").text("");
    		$("#tel_check1").css("color", "green");
    		$("#member_Phone").css("border-color", "green");
        }
        });
    


</script>

		





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>