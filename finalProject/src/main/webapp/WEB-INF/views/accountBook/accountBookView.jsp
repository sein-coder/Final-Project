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

.table button{
	color : white;
}
</style>

<section id="content">
	<div class="site-section" style="background-color: #f4f4f4;">
		<div class="container" style="background-color: white;">

			<!-- 이용자 아이디 출력 구역 -->
			<div class="row mb-4 justify-content-start">
				<h2>사용자(사업자)님의 장부</h2>
			</div>
			
			<!-- 장부 구역 -->
			<div id="accountBookList" class="row justify-content-center mb-3">
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
							<th scope="col"
								style="background-color: #fff; border-color: #fff;"></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${list}" varStatus="i" var="ab">
							<tr>
								<td scope="row">${i.count }<input type="hidden" value="${ab.account_No }"></td>
								<td>${ab.account_Date }</td>
								<td>${ab.account_LocCode }</td>
								<td>${ab.account_Type }</td>
								<td>${ab.account_Clause }</td>
								<td>${ab.account_Item }</td>
								<td>${ab.account_Summary }</td>
								<td><fmt:formatNumber value="${ab.account_Income }" type="currency" /></td>
								<td><fmt:formatNumber value="${ab.account_Outcome }" type="currency" /></td>
								<td><fmt:formatNumber value="${ab.account_Balance }" type="currency" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot id="tfoot">
						<tr>
							<td colspan="10" style="padding: 0;"><button
									class="btn btn-primary btn-block" onclick="addRow();">행
									추가하기</button></td>
						</tr>
					</tfoot>
				</table>
				
				${pageBar }
				
			</div>

			<!-- 간략정보 구역 -->
			<div class="row flex-row-reverse mb-5">
				<div class="col-md-5">
					<div class="d-flex justify-content-end">
						<table class="table table-borderless">
							<tr>
								<td>최고수입 : <fmt:formatNumber value="${maxIncome }" type="currency" /></td>
								<td>최저수입 : <fmt:formatNumber value="${minIncome }" type="currency" /></td>

							</tr>
							<tr>
								<td>최고지출 : <fmt:formatNumber value="${maxOutcome }" type="currency" /></td>
								<td>최저지출 : <fmt:formatNumber value="${minOutcome }" type="currency" /></td>

							</tr>
							<tr>
								<td>평균수입 : <fmt:formatNumber value="${avgIncome }" type="currency" /></td>
								<td>평균지출 : <fmt:formatNumber value="${avgOutcome }" type="currency" /></td>
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
	<!-- 그래프 디자인 및 설정 -->
	<script type="text/javascript">		
		//그래프 데이터 리스트형 전처리
		var dateList = new Array();
		<c:forEach items="${dateList}" var="item">
			dateList.push("${item}");
		</c:forEach>		
		dateList.unshift("x");
		
		var incomeList = ${incomeList};
		incomeList.unshift("data1");
		console.log(incomeList);
		
		var outcomeList = ${outcomeList};		
		outcomeList.unshift("data2");
		
		var revenueList = ${revenueList};
		revenueList.unshift("data3");

		var chart = bb.generate({
			title : {
				text : "일별 지출/수입/잔액 그래프"
			},
			data : {
				x : "x",
				columns : [
					dateList,
					incomeList,
					outcomeList,
					revenueList ],
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
					data3 : "#f89d13"
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
				var inputNames = ['account_No','account_Date','account_LocCode','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome',
					'account_Balance']
				
				var maxlength = [ 3, 8, 2, 7, 4, 4, 15, 8, 8, 8 ];

				var tbody = $("#tbody");

				var tags = "<tr>";

				for (var i = 0; i < maxlength.length; i++) {
					if (i == 0) {
						tags += '<td scope="row" size='+maxlength[i]+'>추가중</td>'
					} else if (i == 1) {
						tags += '<td><input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date"></td>';
					} else if (i == 3) {
						tags += '<td>';
						tags += '<div class="btn-group">';
						tags += '<select id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" style="background-color : #ffc9c9; padding : 0;">분류';
						tags += '<option value="현금">현금</option>';
						tags += '<option value="카드">카드</option>';
						tags += '<option value="계좌이체">계좌이체</option>';
						tags += '<option value="기타">기타</option>';
						tags += '</select></div>'
						tags += '</td>';
					} else {
						tags += '<td><input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="text" size='+maxlength[i]+' maxlength='+maxlength[i]+'></td>';
					}
				}

				tags += '<td style="background-color: #fff; border-color: #fff;"><button class="btn btn-primary" onclick="insertAccountBook();">추가</button></td>';
				tags += '<td style="background-color: #fff; border-color: #fff;"><button id="cancelBtn" class="btn btn-primary" onclick="cancel(1);">취소</button></td>';
				tags += "</tr>";
				tbody.append(tags);
				flag = false;
			} else {
				flagAlert();
			}
		};

		$("tr").on('dblclick',function() {
			if (flag) {
				var data = $(this).children();
				var maxlength = [ 3, 8, 2, 7, 4, 4, 15, 8, 8, 8 ];
				var inputNames = ['account_No','account_Date','account_LocCode','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome',
					'account_Balance']
				if (data[0].innerText != '행 추가하기') {
					for (var i = 0; i < maxlength.length; i++) {
						var input;

						if (i == 1) {
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" value='+data[i].innerText+'>';
						} else if (i == 3) {
							input = '<div class="btn-group">';
							input += '<select id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" style="background-color : #ffc9c9">';
							input += '<option value="현금">현금</option>';
							input += '<option value="카드">카드</option>';
							input += '<option value="계좌이체">계좌이체</option>';
							input += '<option value="기타">기타</option>';
							input += '</select></div>';
						} else if (i == 7 || i == 8 || i == 9){
							var money;
							console.log(data[i].innerText);
							money = replaceAll(data[i].innerText,",","");
							money = money.substring(1,money.length);
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' type="text" class="form-control" size='+maxlength[i]+' maxlength='+maxlength[i]+' value='+money+'>';
						} else {
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' type="text" class="form-control" size='+maxlength[i]+' maxlength='+maxlength[i]+' value='+data[i].innerText+'>';
						}

						if (i != 0) {
							data[i].innerHTML = input;
						}
					}
					
					var updateBtn = "<td style='background-color: #fff; border-color: #fff;'><button class='btn btn-primary' onclick='updateAccountBook(this);'>수정</button></td>";
					var deleteBtn = "<td style='background-color: #fff; border-color: #fff;'><button class='btn btn-primary' onclick='deleteAccountBook(this);'>삭제</button></td>";
					var cancelBtn = '<td style="background-color: #fff; border-color: #fff;"><button id="cancelBtn" class="btn btn-primary" onclick="cancel(2);">취소</button></td>';
					$(this).append(updateBtn);
					$(this).append(deleteBtn);
					$(this).append(cancelBtn);
				}
				flag = false;
			} else {
				flagAlert();
			}
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
			/* update / delete */
			else {
				var data = $("#cancelBtn").parent().parent().children();
				for (var i = 0; i < data.length; i++) {
					if (i == 0) {
						continue;
					} else if (i == 3) {
						var temp = data.eq(i).children().children().val();
						data.eq(i).children().remove();
						data.eq(i).append(temp);
					} else if (i == 7 || i == 8 || i == 9){
						var temp = data.eq(i).children().val();
						temp = preprocessing(temp);
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
		
		/* 금액 전처리용 
			3자리마다 , 붙이고 \(원화표시) 추가 */
		function preprocessing(num){
			var len, point, str;
			
			num = num + "";
			len = num.length;
			point = num.length % 3;
			
			str = num.substring(0, point);
			while(point < len) {
				if(str != "") str += ","; 
				str += num.substring(point, point + 3);
				point += 3;
			}
			str = '\\'+str;
			return str;
		};
		
		/* ,를 모두 replace하는 함수 */
		function replaceAll(str, searchStr, replaceStr) {
			return str.split(searchStr).join(replaceStr);
		};
		
	</script>

	<!-- ajax통신 -->
	<script>
		function insertAccountBook(){
			$.ajax({
				url : "${pageContext.request.contextPath}/accountBook/insertAccountBook.do?partner_No=1234",
				type : "post",
				data : {
					'account_Date':$("#account_Date").val(),
					'account_LocCode':$("#account_LocCode").val(),
					'account_Type':$("#account_Type").val(),
					'account_Clause':$("#account_Clause").val(),
					'account_Item':$("#account_Item").val(),
					'account_Summary':$("#account_Summary").val(),
					'account_Outcome':$("#account_Outcome").val(),
					'account_Income':$("#account_Income").val(),
					'account_Balance':$("#account_Balance").val()
				},
				success : function(data){
					console.log("추가성공");
					location.reload();
				}
			});
		}
		
		function deleteAccountBook(id){
			var account_No = $(id).parent().parent().children().eq(0).children().val();
			$.ajax({
				url : "${pageContext.request.contextPath}/accountBook/deleteAccountBook.do",
				type : "post",
				data : {
					'account_No': account_No
				},
				success : function(data){
					console.log("삭제성공");
					location.reload();
				}
			});
		}
		
		function updateAccountBook(id){
			var account_No = $(id).parent().parent().children().eq(0).children().val();
			$.ajax({
				url : "${pageContext.request.contextPath}/accountBook/updateAccountBook.do",
				type : "post",
				data : {
					'account_No': account_No,
					'account_Date':$("#account_Date").val(),
					'account_LocCode':$("#account_LocCode").val(),
					'account_Type':$("#account_Type").val(),
					'account_Clause':$("#account_Clause").val(),
					'account_Item':$("#account_Item").val(),
					'account_Summary':$("#account_Summary").val(),
					'account_Outcome':$("#account_Outcome").val(),
					'account_Income':$("#account_Income").val(),
					'account_Balance':$("#account_Balance").val()
				},
				success : function(data){
					console.log("수정성공");
					location.reload();
				}
			});
		}
		
	</script>
	
	<!-- 페이징처리용 함수 -->
	<script>
	function fn_paging(cPage) {
		location.href='${pageContext.request.contextPath}/accountBook/accountBookView?cPage='+cPage+'&partner_No=1234';
	}
	</script>";
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />











