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
				<table id="tbl" class="table table-bordered table-hover" style="text-align: center;">
					<thead style="background-color: #ffc9c9; color: #fff;">
						<tr>
							<th scope="col">날짜</th>
							<th scope="col">지역코드</th>
							<th scope="col">분류</th>
							<th scope="col">항</th>
							<th scope="col">목</th>
							<th scope="col">적요</th>
							<th scope="col">수입</th>
							<th scope="col">지출</th>
							<th scope="col">잔액</th>
							<th scope="col" style="background-color: #fff; border-color: #fff;"></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td scope="row">2019-10-29</td>
							<td>A01</td>
							<td>카드</td>
							<td>항??</td>
							<td>목???</td>
							<td>테스트데이터1</td>
							<td><fmt:formatNumber value="100000" type="currency"/></td>
							<td><fmt:formatNumber value="50000" type="currency"/></td>
							<td><fmt:formatNumber value="95000" type="currency"/></td>
						</tr>
						<tr>
							<td scope="row">2019-10-30</td>
							<td>A02</td>
							<td>카드</td>
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
							<td>현금</td>
							<td>항??</td>
							<td>목?</td>
							<td>테스트데이터3</td>
							<td><fmt:formatNumber value="500000" type="currency"/></td>
							<td><fmt:formatNumber value="300000" type="currency"/></td>
							<td><fmt:formatNumber value="123500" type="currency"/></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9" style="padding: 0;"><button class="btn btn-primary btn-block" onclick="addRow();">행 추가하기</button></td>
						</tr>
					</tfoot>
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
	function addRow(){
		var maxlength = [8,4,0,4,4,15,10,10,10];

		var tbody = $("#tbody");
		var tags = "<tr>";
		
		for(var i=0; i<maxlength.length; i++){
			if(i==0){
				tags += '<td><input type="date"></td>';
			}
			else if(i==2){
				tags += '<td>';
				tags += '<div class="btn-group">';
				tags += '<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분류</button>';
				tags += '<div class="dropdown-menu">';
			  	tags += '<a class="dropdown-item" href="#">현금</a>';
			    tags += '<a class="dropdown-item" href="#">카드</a>';
			    tags += '<a class="dropdown-item" href="#">계좌이체</a>';
			    tags += '<a class="dropdown-item" href="#">기타</a>';
			    tags += '</div></div>'
				tags += '</td>';
			}
			else{
				tags += '<td><input class="form-control" type="text" size='+maxlength[i]+' maxlength='+maxlength[i]+'></td>';				
			}
		}
		
		tags += '<td style="background-color: #fff; border-color: #fff;"><button>추가</button></td>';
		tags += "</tr>";
		tbody.append(tags);
	};

	$("tr").one('dblclick',function(){
		var data = $(this).children();
		
		var maxlength = [8,4,7,4,4,15,10,10,10];
		if(data[0].innerText != '행 추가하기'){
			for(var i=0; i<maxlength.length; i++){
				var input;
				if(i==0){
					input = '<input type="date">'
				}
				else if(i==2){
					input = '<div class="btn-group">';
					input += '<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+data[i].innerText+'</button>';
					input += '<div class="dropdown-menu">';
					input += '<a class="dropdown-item" href="#">현금</a>';
					input += '<a class="dropdown-item" href="#">카드</a>';
					input += '<a class="dropdown-item" href="#">계좌이체</a>';
					input += '<a class="dropdown-item" href="#">기타</a>';
					input += '</div></div>'
				}
				else if(i==5){
					input = '<input type="text" class="form-control" size='+maxlength[i]+' maxlength='+maxlength[i]+' value='+data[i].innerText+'>';
				}
				else{
					input = '<input type="text" class="form-control" size='+maxlength[i]+' maxlength='+maxlength[i]+' value='+data[i].innerText+'>';				
				}
				data[i].innerHTML = input;
			}
			var updateBtn = "<td style='background-color: #fff; border-color: #fff;'><button>수정</button></td>";
			$(this).append(updateBtn);
		}
	});
	
</script>
    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>