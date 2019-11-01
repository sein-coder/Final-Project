<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<script src="https://d3js.org/d3.v5.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/billboard.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/billboard.css"
	rel="stylesheet" type="text/css">

<style>
.table tr, .table th, .table td, .table input, .table select, .table button
	{
	padding: 0px;
	height: 25px;
}

.table input, .table select, .table .btn-group {
	width: 100%;
	height: 100%;
}
</style>

<section id="content">
	<div class="site-section">
		<div class="container">

			<!-- 이용자 아이디 출력 구역 -->
			<div class="row mb-4 justify-content-start">
				<h2>사용자(사업자)님의 장부</h2>
			</div>

			<!-- 장부 구역 -->
			<div class="row justify-content-center mb-3">
				<table id="tbl" class="table table-bordered table-hover"
					style="text-align: center;">
					<thead style="background-color: #ffc9c9; color: #fff;">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">날짜</th>
							<th scope="col">지역코드</th>
							<th scope="col">분류</th>
							<th scope="col">항</th>
							<th scope="col">목</th>
							<th scope="col">적요</th>
							<th scope="col">수입</th>
							<th scope="col">지출</th>
							<th scope="col">잔액</th>
							<th scope="col"
								style="background-color: #fff; border-color: #fff;"></th>
							<th scope="col"
								style="background-color: #fff; border-color: #fff;"></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td scope="row">1</td>
							<td>2019-10-29</td>
							<td>A01</td>
							<td>카드</td>
							<td>항??</td>
							<td>목???</td>
							<td>테스트데이터1</td>
							<td><fmt:formatNumber value="100000" type="currency" /></td>
							<td><fmt:formatNumber value="50000" type="currency" /></td>
							<td><fmt:formatNumber value="95000" type="currency" /></td>
						</tr>
						<tr>
							<td scope="row">2</td>
							<td>2019-10-30</td>
							<td>A02</td>
							<td>카드</td>
							<td>항??</td>
							<td>목???</td>
							<td>테스트데이터2</td>
							<td><fmt:formatNumber value="1000" type="currency" /></td>
							<td><fmt:formatNumber value="40000" type="currency" /></td>
							<td><fmt:formatNumber value="650000" type="currency" /></td>
						</tr>
						<tr>
							<td scope="row">3</td>
							<td>2019-10-31</td>
							<td>A03</td>
							<td>현금</td>
							<td>항??</td>
							<td>목?</td>
							<td>테스트데이터3</td>
							<td><fmt:formatNumber value="500000" type="currency" /></td>
							<td><fmt:formatNumber value="300000" type="currency" /></td>
							<td><fmt:formatNumber value="123500" type="currency" /></td>
						</tr>
					</tbody>
					<tfoot id="tfoot">
						<tr>
							<td colspan="10" style="padding: 0;"><button
									class="btn btn-primary btn-block" onclick="addRow();">행
									추가하기</button></td>
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
								<td>최고수입 : <fmt:formatNumber value="10000000"
										type="currency" /></td>
								<td>최저수입 : <fmt:formatNumber value="1000" type="currency" /></td>

							</tr>
							<tr>
								<td>최고지출 : <fmt:formatNumber value="3000000"
										type="currency" /></td>
								<td>최저지출 : <fmt:formatNumber value="40000" type="currency" /></td>

							</tr>
							<tr>
								<td>평균수입 : <fmt:formatNumber value="1234323.5234"
										type="currency" /></td>
								<td>평균지출 : <fmt:formatNumber value="123234.23423"
										type="currency" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- 차트화면 구역 -->
			<div class="row mb-3 justify-content-start">
				<h3>월별(일별) 지출/수입/잔액 그래프</h3>
			</div>
			<div class="row mb-5" id="barChart"></div>

			<!-- 통계지도 구역 -->
			<div class="row mb-3 justify-content-start">
				<h3>지역별 순수익 지도</h3>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8">
					<img alt="지도구역" class="img-fluid"
						src="${pageContext.request.contextPath }/resources/images/서울지도.PNG">
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		var chart = bb.generate({
			title : {
				text : "일별 지출/수입/잔액 그래프"
			},
			data : {
				x : "x",
				columns : [
						[ "x", '209-12-31', '2010-01-01', '2010-01-02',
								'2010-01-03', '2010-01-04', '2010-01-05' ],
						[ "data1", 30, 200, 100, 400, 150, 250 ],
						[ "data2", 130, 100, 140, 200, 150, 50 ],
						[ "data3", 130, 150, 200, 300, 200, 100 ] ],
				names : {
					data1 : "수입",
					data2 : "지출",
					data3 : "순수익"
				},
				types : {
					data1 : "bar",
					data2 : "bar",
					data3 : "spline"
				},
				colors : {
					data1 : "#f38181",
					data2 : "#ffc9c9",
					data3 : "f89d13"
				},
				labels : {
					position : {
						y : -5
					}
				}
			},
			bar : {
				width : {
					ratio : 0.75
				},
				padding : 5
			},
			axis : {
				x : {
					type : "category",
					tick : {
						multiline : false,
						tooltip : true
					},
					height : 40
				}
			},
			grid : {
				x : {
					show : true
				},
				y : {
					show : true
				}
			},
			zoom : {
				enabled : true
			},
			bindto : "#barChart"
		});

		/* 1초후 불러오는 데이터셋 */
		/* setTimeout(function() {
			chart.load({
			columns: [
				["data3", 130, 150, 200, 300, 200, 100]
			]
		});
		}, 1000); */
	</script>


	<!-- 테이블에 대한 이벤트 -->
	<script type="text/javascript">
		var flag = true;

		function addRow() {
			if (flag) {
				var maxlength = [ 3, 8, 4, 0, 4, 4, 15, 10, 10, 10 ];

				var tbody = $("#tbody");

				var tags = "<tr>";

				for (var i = 0; i < maxlength.length; i++) {
					if (i == 0) {
						tags += '<td scope="row" size='+maxlength[i]+'>4</td>'
					} else if (i == 1) {
						tags += '<td><input class="form-control" type="date"></td>';
					} else if (i == 3) {
						tags += '<td>';
						tags += '<div class="btn-group">';
						tags += '<select class="form-control" style="background-color : #ffc9c9; padding : 0;">분류';
						tags += '<option value="현금">현금</option>';
						tags += '<option value="카드">카드</option>';
						tags += '<option value="계좌이체">계좌이체</option>';
						tags += '<option value="기타">기타</option>';
						tags += '</select></div>'
						tags += '</td>';
					} else {
						tags += '<td><input class="form-control" type="text" size='+maxlength[i]+' maxlength='+maxlength[i]+'></td>';
					}
				}

				tags += '<td style="background-color: #fff; border-color: #fff;"><button class="btn">추가</button></td>';
				tags += '<td style="background-color: #fff; border-color: #fff;"><button id="cancelBtn" class="btn" onclick="cancel(1);">취소</button></td>';
				tags += "</tr>";
				tbody.append(tags);
				flag = false;
			} else {
				flagAlert();
			}
		};

		$("tr")
				.on(
						'dblclick',
						function() {
							if (flag) {
								var data = $(this).children();
								var maxlength = [ 3, 8, 4, 7, 4, 4, 15, 10, 10,
										10 ];
								if (data[0].innerText != '행 추가하기') {
									for (var i = 0; i < maxlength.length; i++) {
										var input;

										if (i == 1) {
											input = '<input class="form-control" type="date" value='+data[i].innerText+'>';
										} else if (i == 3) {
											input = '<div class="btn-group">';
											input += '<select class="form-control" style="background-color : #ffc9c9">';
											input += '<option value="현금">현금</option>';
											input += '<option value="카드">카드</option>';
											input += '<option value="계좌이체">계좌이체</option>';
											input += '<option value="기타">기타</option>';
											input += '</select></div>';
										} else {
											input = '<input type="text" class="form-control" size='+maxlength[i]+' maxlength='+maxlength[i]+' value='+data[i].innerText+'>';
										}

										if (i != 0) {
											data[i].innerHTML = input;
										}

									}
									var updateBtn = "<td style='background-color: #fff; border-color: #fff;'><button class='btn'>수정</button></td>";
									var cancelBtn = '<td style="background-color: #fff; border-color: #fff;"><button id="cancelBtn" class="btn" onclick="cancel(2);">취소</button></td>';
									$(this).append(updateBtn);
									$(this).append(cancelBtn);
								}
								flag = false;
							} else {
								flagAlert();
							}
						});

		$(".dropdown-item").on("click", function() {// a태그 클릭시 작동
			console.log("실행");
		});

		function flagAlert() {
			alert("현재 작업을 완료해주세요.");
		}

		function cancel(num) {
			/* add */
			if (num == 1) {
				$("#cancelBtn").parent().parent().remove();
				flag = true;
			}
			/* update */
			else {
				var data = $("#cancelBtn").parent().parent().children();
				for (var i = 0; i < data.length; i++) {
					if (i == 0) {
						continue;
					} else if (i == 3) {
						var temp = data.eq(i).children().children().val();
						data.eq(i).children().remove();
						data.eq(i).append(temp);
					} else {
						var temp = data.eq(i).children().val();
						data.eq(i).children().remove();
						data.eq(i).append(temp);
					}
				}

				flag = true;
			}
		};
	</script>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />