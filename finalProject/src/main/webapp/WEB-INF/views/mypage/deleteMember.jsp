<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
        <div class="col">
      


	<form id="deleteMember" name="deleteMember">
		<table>
			<tr>
				<td scope="col">아이디</td>
				<td><input type="text" name="member_Id"></td>
			</tr>
			<tr>
				<td scope="col">비밀번호</td>
				<td><input type="text" name="member_Password"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><a href="#" id="deleteMember">탈퇴하기</a></td>
			</tr>
			
			</table>
	    </form>
	    
	    <script>
	    function deleteMember(){
	    	
	    	$.ajax({
	    		url:"${pageContext.request.contextPath}/deleteMemberPage",
	    		type: post,
	    		data: {loginMember:'${loginMember.member_Id}'},
	    		success:function(result){
	    			if(result=='true'){
	    				
	    			}else{
	    				
	    			}
	    		}
	    		
	    	});
	    }
	    
	    
	    
	    </script>
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    </div>
      </div>
   </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>