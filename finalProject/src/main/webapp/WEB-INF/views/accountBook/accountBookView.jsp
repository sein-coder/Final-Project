<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="pageTitle" value="메인화면"/>
</jsp:include>

<%-- <div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/ft.gif);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-10">
            
            <!-- 텍스트 타이핑 효과 -->
            <div class="row justify-content-center mb-4">
              <div class="col-md-12 text-center">
                <h1 data-aos="fade-up">렛잇고만의 <span class="typed-words"></span> 푸드트럭</h1>
                <!-- url을 서버주소에 맞게 변경해야함 -->
                <p data-aos="fade-up" data-aos-delay="100">푸드트럭의 모든 것 <a href="#" target="_blank">LetEatGo</a>[렛잇고]</p>
              </div>
            </div>
			
			
			<!-- 중간 검색 박스 -->
            <div class="form-search-wrap p-2" id="medium-box" data-aos="fade-up" data-aos-delay="200">
              <form method="post">
                <div class="row align-items-center">
                  <div class="col-lg-12 col-xl-5 no-sm-border border-right">
                    <input type="text" name="" class="form-control" placeholder="메뉴검색 ex)스테이크...">
                  </div>
                  <div class="col-lg-12 col-xl-5 no-sm-border border-right">
                    <div class="wrap-icon">
                      <span class="icon icon-room"></span>
                      <input type="text" class="form-control" placeholder="푸드트럭 위치찾기">
                    </div>
                  </div>
                  <div class="col-lg-12 col-xl-2 ml-auto text-right">
                    <input type="submit" class="btn text-white btn-primary" value="검색하기">
                  </div>
                  
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>
    </div> --%>  
<section id="content">
    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col">
          	<h2>사용자(사업자)님의 장부</h2>
          </div>
        </div>		
        <div class="row justify-content-center mb-5">
          <div class="col-md-10 text-center">
			<table class="table">
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
						<th scope="row">2019-10-29</th>
						<th>A01</th>
						<th>계좌?</th>
						<th>관?</th>
						<th>항??</th>
						<th>목???</th>
						<th>테스트데이터1</th>
						<th><fmt:formatNumber value="10000000" type="currency"/></th>
						<th><fmt:formatNumber value="50000" type="currency"/></th>
						<th><fmt:formatNumber value="950000" type="currency"/></th>
					</tr>
					<tr>
						<th scope="row">2019-10-30</th>
						<th>A02</th>
						<th>계좌?</th>
						<th>관?</th>
						<th>항??</th>
						<th>목???</th>
						<th>테스트데이터2</th>
						<th><fmt:formatNumber value="1000" type="currency"/></th>
						<th><fmt:formatNumber value="40000" type="currency"/></th>
						<th><fmt:formatNumber value="650000" type="currency"/></th>
					</tr>
					<tr>
						<th scope="row">2019-10-31</th>
						<th>A03</th>
						<th>계좌?</th>
						<th>관?</th>
						<th>항??</th>
						<th>목?</th>
						<th>테스트데이터3</th>
						<th><fmt:formatNumber value="5000000" type="currency"/></th>
						<th><fmt:formatNumber value="3000000" type="currency"/></th>
						<th><fmt:formatNumber value="12350000" type="currency"/></th>
					</tr>
				</tbody>
			</table>
          </div>
        </div>
        
        <div class="row flex-row-reverse">
        	<div class="col-md-7">
       			<div class="d-flex justify-content-end mr-5">
        		<table class="table">
        			<tr>
        				<td>최고수입 : <fmt:formatNumber value="10000000" type="currency"/></td>
        				<td>최저수입 : <fmt:formatNumber value="1000" type="currency"/></td>
        				<td>평균수입 : <fmt:formatNumber value="1234323.5234" type="currency"/></td>
        			</tr>
        			<tr>
        				<td>최고지출 : <fmt:formatNumber value="3000000" type="currency"/></td>
        				<td>최저지출 : <fmt:formatNumber value="40000" type="currency"/></td>
        				<td>평균지출 : <fmt:formatNumber value="123234.23423" type="currency"/></td>
        			</tr>
        		</table>
        		</div>
        	</div>
        </div>
        
        <div class="row" id="chart_div">
        
        </div>

    </div>
    </div>
    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['날짜',		 '수입',		 '지출',		 '순수익'],
          ['2019-10-29',  10000,      5000,         5000],
          ['2019-10-30',  7000,      2000,        5000],
          ['2019-10-31',  2000,      500,        1500]
        ]);

        var options = {
          title : '월별(또는 일별) 지출/수입/잔액 그래프',
          vAxis: {title: '금액'},
          hAxis: {title: '날짜'},
          seriesType: 'bars',
          series: {2: {type: 'line'}}
          };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>