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
   Date.prototype.format = function (f) {

	    if (!this.valueOf()) return " ";
	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    var d = this;
	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

	        switch ($1) {

	            case "yyyy": return d.getFullYear(); // 년 (4자리)

	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

	            case "dd": return d.getDate().zf(2); // 일 (2자리)

	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

	            default: return $1;

	        }

	    });

	};
   
	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

	Number.prototype.zf = function (len) { return this.toString().zf(len); };
   
      function addTodo(){
         var data=$("#addFrm").serialize();
          $.ajax({
            url:"${pageContext.request.contextPath}/schedule.cal",
            data:data,
            success:function(result){
               if(result=='true'){
                  var v={"title":addFrm.schedule.value,"start":addFrm.start_Date.value,"end":(new Date(addFrm.end_Date.value).setDate(new Date(addFrm.end_Date.value).getDate()))}
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