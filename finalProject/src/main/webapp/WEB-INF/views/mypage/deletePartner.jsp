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

<script>
$(document).ready(function(){
     $("#pbtnDelete").click(function(){
        document.deletePartner.action="${path}/partner/deletePartnerPage"; 
        document.deletePartner.submit();
     });
});



</script>
      


   <form id="deletePartner" name="deletePartner">
      <table>
         <tr>
            <td><input type="hidden"  name="partner_Id" value="${loginMember.partner_Id }"></td>
         </tr>
         <tr>
            <td scope="col">비밀번호</td>
            <td><input type="password"  name="partner_Password" value=""></td>
         </tr>
         <tr>
            <td colspan=2 align="center">
              <input type="button" class="btn btn-outline-success" value="회원 탈퇴" id="pbtnDelete"/>
            </td>
         </tr>
         
         </table>
       </form>
       
       
       </div>
      </div>
   </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>