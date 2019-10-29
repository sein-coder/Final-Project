<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<section id="content">
    <div class="site-section">
      <div class="container">
      	
      	<!-- 이용자 아이디 출력 구역 -->
        <div class="row mb-4 justify-content-start">
          	<h2>사용자(사업자)님의 장부</h2>
        </div>
        
        <!-- 장부 구역 -->
        <div class="row justify-content-center mb-3">
			<table id="tbl" class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">날짜</th>
						<th scope="col">지역코드</th>
						<th scope="col">분류</th>
						<th scope="col">관</th>
						<th scope="col">항</th>
						<th scope="col">목</th>
						<th scope="col">적요</th>
						<th scope="col">수입</th>
						<th scope="col">지출</th>
						<th scope="col">잔액</th>
					</tr>
				</thead>
				<tbody class="">
					<tr>
						<td scope="row">2019-10-29</td>
						<td>A01</td>
						<td>계좌?</td>
						<td>관?</td>
						<td>항??</td>
						<td>목???</td>
						<td>테스트데이터1</td>
						<td><fmt:formatNumber value="10000000" type="currency"/></td>
						<td><fmt:formatNumber value="50000" type="currency"/></td>
						<td><fmt:formatNumber value="950000" type="currency"/></td>
					</tr>
					<tr>
						<td scope="row">2019-10-30</td>
						<td>A02</td>
						<td>계좌?</td>
						<td>관?</td>
						<td>항??</td>
						<td>목???</td>
						<td>테스트데이터2</td>
						<td><fmt:formatNumber value="1000" type="currency"/></td>
						<td><fmt:formatNumber value="40000" type="currency"/></td>
						<td><fmt:formatNumber value="650000" type="currency"/></td>
					</tr>
					<tr>
						<td scope="row">2019-10-31</td>
						<td>A03</td>
						<td>계좌?</td>
						<td>관?</td>
						<td>항??</td>
						<td>목?</td>
						<td>테스트데이터3</td>
						<td><fmt:formatNumber value="5000000" type="currency"/></td>
						<td><fmt:formatNumber value="3000000" type="currency"/></td>
						<td><fmt:formatNumber value="12350000" type="currency"/></td>
					</tr>
				</tbody>
			</table>
        </div>
        
        <!-- 간략정보 구역 -->
        <div class="row flex-row-reverse mb-5">
        	<div class="col-md-5">
       			<div class="d-flex justify-content-end">
        		<table class="table table-borderless">
        			<tr>
        				<td>최고수입 : <fmt:formatNumber value="10000000" type="currency"/></td>
        				<td>최저수입 : <fmt:formatNumber value="1000" type="currency"/></td>
        				
        			</tr>
        			<tr>
        				<td>최고지출 : <fmt:formatNumber value="3000000" type="currency"/></td>
        				<td>최저지출 : <fmt:formatNumber value="40000" type="currency"/></td>
        				
        			</tr>
        			<tr>
        				<td>평균수입 : <fmt:formatNumber value="1234323.5234" type="currency"/></td>
        				<td>평균지출 : <fmt:formatNumber value="123234.23423" type="currency"/></td>
        			</tr>
        		</table>
        		</div>
        	</div>
        </div>
        
        <!-- 차트화면 구역 -->
        <div class="row mb-3 justify-content-start">
          	<h3>월별(일별) 지출/수입/잔액 그래프</h3>
        </div>
        <div class="row mb-5" id="chart_div"></div>
        
		<!-- 통계지도 구역 -->
		<div class="row mb-3 justify-content-start">
          	<h3>지역별 순수익 지도</h3>
        </div>
		<div class="row justify-content-center">
			<img alt="지도구역" class="img-fluid" src="${pageContext.request.contextPath }/resources/images/서울지도.PNG">
		</div>

    </div>
    </div>
	<table>
		<tr>
			<td>
				<input type="text">			
			</td>
		</tr>
	</table>
	
<!-- 구글 차트라이브리 이용 -->    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['날짜',		 '수입',		 '지출',		'순수익'],
          ['2019-10-29',  10000,     5000,       5000],
          ['2019-10-30',  7000,      2000,       5000],
          ['2019-10-31',  2000,      500,        1500]
        ]);

	   var options = {
	     title : '일별 지출/수입/잔액 그래프',
	     vAxis: {title: '금액'},
	     hAxis: {title: '날짜'},
	     seriesType: 'bars',
	     series: {2: {type: 'line'}}
	     };

	  	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	     chart.draw(data, options);
      }
</script>

<!-- 테이블에 대한 이벤트 -->
<script type="text/javascript">
	$("tr").dblclick(function(){
		var data = $(this).children();
		console.log(data[0].innerText)
		
		var maxlength = [9,3,4,4,4,4,19,12,12,12];
		console.log(maxlength);
		
		for(var i=0; i<maxlength.length; i++){
			var input = '<input type="text" size='+(data.length+5)+' maxlength='+maxlength[i]+' value='+data+'>';	
			data[i].innerHTML = input;
		}
		/* if(data[0].innerText == $(this).parent().children()[0].innerHTML){ 
			var input = '<input type="text" size='+(data.length+5)+' maxlength="9" value='+data+'>';	
		}
		else if(data[1].innerText == $(this).parent().children()[1].innerHTML){ 
			var input = '<input type="text" size='+(data.length+5)+' maxlength="3" value='+data+'>';	
		}
		else if(data[2].innerText == $(this).parent().children()[2].innerHTML){ 
			var input = '<input type="text" size='+(data.length+5)+' maxlength="4" value='+data+'>';	
		}
		else if(data[3].innerText == $(this).parent().children()[3].innerHTML){ 
			var input = '<input type="text" size='+(data.length+5)+' maxlength="4" value='+data+'>';	
		}
		else if(data[4].innerText == $(this).parent().children()[4].innerHTML){ 
			var input = '<input type="text" size='+(data.length+5)+' maxlength="4" value='+data+'>';	
		}
		else if(data[5].innerText == $(this).parent().children()[5].innerHTML){ 
			var input = '<input type="text" size='+(data.length+1)+' maxlength="4" value='+data+'>';	
		}
		else if(data[6].innerText == $(this).parent().children()[7].innerHTML){ 
			var input = '<input type="text" size='+(data.length+1)+' maxlength="19" value='+data+'>';	
		}
		else if(data[7].innerText == $(this).parent().children()[7].innerHTML){ 
			var input = '<input type="text" size='+(data.length+1)+' maxlength="12" value='+data+'>';	
		}
		else if(data[8].innerText == $(this).parent().children()[8].innerHTML){ 
			var input = '<input type="text" size='+(data.length+1)+' maxlength="12" value='+data+'>';	
		}
		else{ 
			var input = '<input type="text" size='+(data.length+1)+' maxlength="12" value='+data+'>';				
		}
		$(this)[0].innerHTML = input; */
	});
	
	$("td").on('keydown',function(e){
		$(this).children().attr('size',Number($(this).children().val().length)+1);
	});
	
</script>
    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>