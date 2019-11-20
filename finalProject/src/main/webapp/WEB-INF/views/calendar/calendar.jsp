<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<style>
 div#calendar{
   
   width:70%;
   
   
   
 }

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<meta charset="utf-8">
<title>Full Calendar Example</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/moment/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>
<script>

   $(document).ready(function() {
      setCalendar();
    
   });

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
   
   
   function setCalendar(){

	      var calendarEl = document.getElementById('calendar');

	      calendar = new FullCalendar.Calendar(calendarEl, {
	         plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
	         header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth'
	         },
	         dateClick:function(){
	            var win=window.open("${pageContext.request.contextPath}/calendar/toDo.do?partnerno="+'${partnerno}',"일정 입력","width=500,height=500");
	         },
	         defaultView: 'dayGridMonth',
	         locale: 'ko',
	         navLinks: true, // can click day/week names to navigate views
	         editable: true,
	         allDaySlot: false,
	         eventLimit: true, // allow "more" link when too many events
	         minTime: '10:00:00',
	         maxTime: '24:00:00',
	         contentHeight: 'auto',
	         selecttable:true,
	         selectHelper:true,
	         events: [
	            {
	            title:"11월 첫날",
	            start:'2019-11-01'
	         },
	         {
	            title:"수능",
	            start:'2019-11-14'
	         }
	         <c:forEach items="${calendar}" var="calendar1">
	         ,
	         {   title:'${calendar1.schedule}',
	            start:'${calendar1.start_Date}',
	            end: (new Date("${calendar1.end_Date}").setDate(new Date("${calendar1.end_Date}").getDate()))
	         }
	         </c:forEach>  
	         ]
	      }); 
	         
	      calendar.render();
	   }
   
   
   function eventAdd(data){
      
      calendar.addEvent(data);
      calendar.render();
   }
   function eventClick(data){
      event.remove();
   }
   

   </script>
</head>
<body>
<div class="site-section">
   <div class="container">
      <div class="row justify-content-center mb-8">
   <div id="calendar"></div>
     </div>
   </div>
</div>
   <%-- ${calendar } --%>
   
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>