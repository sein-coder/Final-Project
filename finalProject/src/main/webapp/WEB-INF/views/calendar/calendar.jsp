<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	var calendar;
	function setCalendar(){

		var calendarEl = document.getElementById('calendar');

		calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			dateClick:function(){
				var win=window.open("${pageContext.request.contextPath}/calendar/toDo.do","일정 입력","width=500,height=500");
				
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
			}]
		});
		
				
		calendar.render();

	}
	function eventAdd(data){
		//console.log(calendar);
		//console.log(data);
		calendar.addEvent(data);
		//console.log(calendar.getEvents());
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
	
	
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
