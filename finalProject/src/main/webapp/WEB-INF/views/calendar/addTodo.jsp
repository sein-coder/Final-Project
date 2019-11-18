<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <form id="addFrm" name="addFrm">
      <table>
         <tr>
            <td>일정제목</td>
            <td><input type="text" name="schedule"></td>
         </tr>
         <tr>
            <td>일정시작일</td>
            <td><input type="date" name="start_Date" id="start"></td>
         </tr>
         <tr>
            <td>일정종료일</td>
            <td><input type="date" name="end_Date" id="end"></td>
         </tr>
         <tr>
            <td>일정 상세</td>
            <td><input type="text" name="calendar_Content"></td>
         </tr>
         <tr>
            <td><input type="hidden" name="partner_No" value="${partnerno}"></td>
         </tr>
         <tr>
            <td colspan="2">
               <button   type="button" onclick="addTodo()">일정추가</button>
            </td>
         </tr>
      </table>
   </form>
   <script>
      function addTodo(){
         var data=$("#addFrm").serialize();
          $.ajax({
            url:"${pageContext.request.contextPath}/schedule.cal",
            data:data,
            success:function(result){
               if(result=='true'){
                  var v={"title":addFrm.schedule.value,"start":addFrm.start_Date.value,"end":addFrm.end_Date.value}
                  window.opener.eventAdd(v);
                  alert("등록성공 창을 닫습니다.");
                  self.close();
               }else{
                  alert("등록실패 다시 등록하세요");
               }
            }
         }); 
      }
      
   </script>
</body>
</html>