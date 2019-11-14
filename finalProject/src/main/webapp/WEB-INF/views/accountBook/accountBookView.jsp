<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4524f2a578ce5b005f1a8157e72c3d3a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5360adbac3952b61ac35a4e1cc59e4c3&libraries=services"></script>
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
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}

    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
     .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
     .info .link {color: #5085BB;}  

</style>

<section id="content">
	<div class="site-section" style="background-color: #f4f4f4;">
		<div i class="container" style="background-color: white;">
			
			<c:if test="${not empty account }">
			
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
				<h3>월별(일별) 지출/수입 그래프</h3>
			</div>
			<div class="row mb-5" id="areaChart"></div>

			<!-- 통계지도 구역 -->
			<h3>예상 매출 및 순수익</h3>
			<div class="row mb-3 justify-content-start">
				<div class="col">
					<h4>일별 순수익 그래프</h4>
					<div class="mb-5" id="areaChart2"></div>				
				</div>
				<div class="col">
					<h4>일별 수익 분류 매출액</h4>
					<div class="mb-5" id="barChart"></div>
				</div>
			</div>

			
			</c:if>
			<c:if test="${empty account }">

				<div class="modal fade" id="myModal2">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">계좌 등록</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<div class="container">
									<div class="row">
										<div class="col">
											<p>장부관리 기능을 활용하기 위해서 계좌를 등록해주세요.</p>
												<div class="tab-pane fade show active" id="member_log">
													<div>
													<form id="accountfrm" action="${pageContext.request.contextPath}/accountBook/insertAccount.do?partner_No=${partner_No}" method="POST">
														<div class="row justify-content-start pb-3 pl-5">
															<span class="pr-1">계좌 번호 : </span>
															<input type="text" placeholder="계좌번호를 입력해주세요('-빼고')" name="account_Number" size="40"/>
														</div>
														<div class="row justify-content-start pb-3 pl-5">
															<span class="pr-1">계좌 번호 : </span>
															<input type="text" placeholder="예금주명" name="account_Name" /> 
														</div> 
														<div class="row justify-content-center">
															<div class="btn-group btn-group-toggle" data-toggle="buttons">
															  <label class="btn btn-secondary active mr-3">
															    <input type="radio" name="account_Bank" autocomplete="off" value="농협" checked> 농협
															  </label>
															  <label class="btn btn-secondary mr-3">
															    <input type="radio" name="account_Bank" autocomplete="off" value="신한"> 신한
															  </label>
															  <label class="btn btn-secondary mr-3">
															    <input type="radio" name="account_Bank" autocomplete="off" value="국민"> 국민
															  </label>
															  <label class="btn btn-secondary mr-3">
															    <input type="radio" name="account_Bank" autocomplete="off" value="신협"> 신협
															  </label>
															  <label class="btn btn-secondary mr-3">
															    <input type="radio" name="account_Bank" autocomplete="off" value="우리"> 우리
															  </label>
															</div>
														</div>
													</form>
													</div>
												</div>
											<script type="text/javascript">
												var onloadCallback = function() {
													grecaptcha
															.render(
																	'html_element',
																	{
																		'sitekey' : '6LcTHL0UAAAAAEkwWVCn3v37_ufKUIWC6rIZ7_LT'
																	});
												};
												function reCapchar() {
													if (typeof (grecaptcha) != 'undefined') {
														if (grecaptcha
																.getResponse() == "") {
															alert("스팸방지코드 확인하세요");
															return false;
														}
													}
												}
											</script>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="accountsubmit();">계좌등록</button>
								<button type="button" class="btn btn-secondary" onclick="accountExit();">닫기</button>
							</div>							
						</div>
					</div>
				</div>

				<script>
					$(document).ready(function() {
						$("#myModal2").modal();
					});
					
					function accountsubmit(){
						console.log("실행");
						$("#accountfrm").submit();
					}
					
					function accountExit(){
						$("#myModal2").hide();
						location.href = "${pageContext.request.contextPath}/";
					}
					
				</script>
					
			</c:if>
			
		</div>
	</div>
	
	<!-- 통계용 데이터 처리 -->
	<script type="text/javascript">
	//그래프 데이터 리스트형 전처리
	var dateList = new Array();
	<c:forEach items="${dateList}" var="item">
	dateList.push("${item}");
	</c:forEach>
	dateList.unshift("x");

	var incomeList = ${incomeList};
	incomeList.unshift("data1");

	var outcomeList = ${outcomeList};
	outcomeList.unshift("data2");

	var revenueList = ${revenueList};
	revenueList.unshift("data3");
	</script>
	
	<!-- 그래프 디자인 및 설정 -->
	<script type="text/javascript">
		/* 그래프 원화 formatting */
		d3.formatDefaultLocale({
			"decimal" : ".",
			"thousands" : ",",
			"grouping" : [ 3 ],
			"currency" : [ "₩", "" ]
		});

		var chart = bb.generate({
			title : {
				text : "일별 지출/수입 그래프"
			},
			data : {
				x : "x",
				columns : [ dateList, incomeList, outcomeList ],
				names : {
					data1 : "수입",
					data2 : "지출"
				},
				types : {
					data1 : "area-spline",
					data2 : "area-spline"
				},
				colors : {
					data1 : "#f38181",
					data2 : "#f89d13"
				},
				labels : {
					position : {
						y : -5
					},
					format : {
						data1 : function(x) {
							return d3.format('$,')(x);
						},
						data2 : function(x) {
							return d3.format('$,')(x);
						}
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
				},
				y : {
					tick : {
						format : function(x) {
							return d3.format("$,")(x);
						}
					}
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
			bindto : "#areaChart"
		});
	</script>
	
	<!-- 두번째 순수익 차트 -->
	<script type="text/javascript">
	var chart = bb.generate({
		title : {
			text : "일별 순수익 경향 그래프"
		},
		data : {
			x : "x",
			columns : [ dateList, revenueList ],
			names : {
				data3 : "순수익"
			},
			types : {
				data3 : "area-spline"
			},
			colors : {
				data3 : "#f38181"
			},
			labels : {
				position : {
					y : -5
				},
				format : {
					data3 : function(x) {
						return d3.format('$,')(x);
					}
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
			},
			y : {
				tick : {
					format : function(x) {
						return d3.format("$,")(x);
					}
				}
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
		bindto : "#areaChart2"
	});
	</script>

	<script type="text/javascript">
	var chart = bb.generate({
		  data: {
		    x: "x",
		    columns: [
		    	dateList,
			["data1", 50, 50, 40, 40],
			["data2", 10, 10, 25, 15],
			["data3", 20, 25, 20, 35],
			["data4", 20, 15, 15, 10]
		    ],
		    type: "bar",
			names : {
				data1 : "현금",
				data2 : "카드",
				data3 : "계좌이체",
				data4 : "기타"
			},
		    groups: [
		      [
		        "data1",
		        "data2",
		        "data3",
		        "data4"
		      ]
		    ]
		  },
		  axis: {
		    rotated: true,
		    x: {
		      type: "category",
		      tick: {
		        text: {
		          position: {
		            x: 0,
		            y: 0
		          }
		        }
		      }
		    },
		    y: {
		      show: false
		    }
		  },
		  bindto: "#barChart"
		});
	</script>

	

	<!-- 테이블에 대한 이벤트 -->
	<script type="text/javascript">
		var flag = true;

		function addRow() {
			if (flag) {
				var inputNames = ['account_No','account_Date','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome',
					'account_Balance']
				
				var maxlength = [ 3, 8, 7, 4, 4, 15, 8, 8, 8 ];

				var tbody = $("#tbody");

				var tags = "<tr>";

				for (var i = 0; i < maxlength.length; i++) {
					if (i == 0) {
						tags += '<td scope="row" size='+maxlength[i]+'>추가중</td>'
					} else if (i == 1) {
						tags += '<td><input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" onchange="checkDateData(this)"></td>';
					} else if (i == 2) {
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
				var maxlength = [ 3, 8, 7, 4, 4, 15, 8, 8, 8 ];
				var inputNames = ['account_No','account_Date','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome',
					'account_Balance']
				if (data[0].innerText != '행 추가하기') {
					for (var i = 0; i < maxlength.length; i++) {
						var input;

						if (i == 1) {
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" value='+data[i].innerText+' onchange="checkDateData(this)">';
						} else if (i == 2) {
							input = '<div class="btn-group">';
							input += '<select id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" style="background-color : #ffc9c9">';
							input += '<option value="현금">현금</option>';
							input += '<option value="카드">카드</option>';
							input += '<option value="계좌이체">계좌이체</option>';
							input += '<option value="기타">기타</option>';
							input += '</select></div>';
						} else if (i == 6 || i == 7 || i == 8){
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
			location.reload();			
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
				url : "${pageContext.request.contextPath}/accountBook/insertAccountBook.do?partner_No=${partner_No}",
				type : "post",
				data : {
					'account_Date':$("#account_Date").val(),
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
		
/* 		function checkDateData(id){
			var account_No = $(id).parent().parent().children().eq(0).children().val();
			console.log(account_No);
			if(typeof account_No == "undefined"){
				account_No = -1;
			}
			console.log(account_No);
 			$.ajax({
				url : "${pageContext.request.contextPath}/accountBook/checkDateData.do?partner_No=1234",
				type : "post",
				data : {
					'account_Date':$(id).val(),
					'account_No' : account_No
				},
				success : function(data){
					if(data.result){
						return false;
					}else{
						alert("중복되는 날짜가 존재합니다. 날짜를 다시 선택해주세요.")
						$(id).val("");
					}
				}
			}); 
		}; */
		
	</script>
	
	<!-- 페이징처리용 함수 -->
	<script>
	function fn_paging(cPage) {
		location.href='${pageContext.request.contextPath}/accountBook/accountBookView?cPage='+cPage+'&partner_No=${partner_No}';
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5306475369695   ,126.928706300305), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />











