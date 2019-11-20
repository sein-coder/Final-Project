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
@media(min-width:768px) {
     .bb-text {font-size: 13px; font-family: BinggraeMelona;}
     .bb-line {stroke-width: 1px; font-family: BinggraeMelona;}
     .bb-axis {font-size: 13px; font-family: BinggraeMelona;}
	 .bb-legend-item{font-size:13px; font-family: BinggraeMelona;}

</style>

<section id="content">
	<div class="site-section" style="background-color: #f4f4f4;">
		<div class="container mt-3" style="background-color: white;">
			<c:if test="${empty loginMember }">
				<script type="text/javascript">
					alert("로그인 후 이용할 수 있는 서비스입니다.");
					location.href = "${pageContext.request.contextPath}/"
				</script>
			</c:if>
			<c:if test="${not empty loginMember }">
				<c:if test="${not empty account }">
				
				<!-- 이용자 아이디 출력 구역 -->
				<div class="row pl-4 pt-3 mb-1 justify-content-start">
					<h2>${loginMember.partner_TruckName }님의 11월 통계 및 장부</h2>
				</div>
				<div class="row pl-4 mb-4 justify-content-start">
					<h4>${account.account_Bank}&nbsp;${account.account_Number }(예금주 : ${account.account_Name})&nbsp;계좌의 현재 잔액은&nbsp; :&nbsp; <span id="balance"></span>입니다.</h4>				
				</div>				
				<!-- Content Row -->
		        <div class="row m-1 mb-4">
		
		            <!-- Earnings (Monthly) Card Example -->
		            <div class="col-xl-3 col-md-6 mb-4">
		              <div class="card border-left-primary shadow h-100 py-2">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="col mr-2">
		                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">현재까지 매출&nbsp;(월 단위)</div>
		                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
		                    </div>
		                    <div class="col-auto">
		                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		            
		            <div class="col-xl-3 col-md-6 mb-4">
		              <div class="card border-left-info shadow h-100 py-2">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="col mr-2">
		                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">예상 매출 달성률&nbsp;(월 단위)</div>
		                      <div class="row no-gutters align-items-center">
		                        <div class="col-auto">
		                          <div id="goalMonthly" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">0%</div>
		                        </div>
		                        <div class="col">
		                          <div class="progress progress-sm mr-2">
		                            <div id="goalMonthlyBar" class="progress-bar bg-info" role="progressbar" style="width: 0%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="col-auto">
		                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		
		            <!-- Earnings (Monthly) Card Example -->
		            <div class="col-xl-3 col-md-6 mb-4">
		              <div class="card border-left-success shadow h-100 py-2">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="col mr-2">
		                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">직전 일 대비 매출 증감율</div>
		                      <div id="yt_IncomeRate" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
		                    </div>
		                    <div class="col-auto">
		                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <!-- Earnings (Monthly) Card Example -->
	
		            <!-- Pending Requests Card Example -->
		            <div class="col-xl-3 col-md-6 mb-4">
		              <div class="card border-left-warning shadow h-100 py-2">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="col mr-2">
		                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">현재까지 순수익&nbsp;(월 단위)</div>
		                      <div id="sumRevenue" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
		                    </div>
		                    <div class="col-auto">
		                      <i class="fas fa-comments fa-2x text-gray-300"></i>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		        </div>
		        
		        				<!-- 장부 구역 -->
				<div id="accountBookList" class="row justify-content-center m-2 mb-3">
					<table id="tbl" class="table table-bordered table-hover" style="text-align: center;">
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
	
				<!-- 차트화면 구역 -->
				<div class="row ml-2 mb-3 justify-content-start">
					<h3>일별 예상매출 대비 매출 (월 단위)</h3>
				</div>
				<div class="mb-4 m-3" style="border: 1px solid #f38181; border-radius: 10px"">
					<div class="row m-3" id="areaChart"></div>
				</div>
	
				<!-- 작은 차트 구역 -->
				<h3 class="mb-3 ml-2">예상 매출 및 순수익</h3>
				<div class="row m-3 pb-2 justify-content-start">
					<div class="col mr-1" style="border: 1px solid #f38181; border-radius: 10px">
						<h5 class="mt-2">-일별 순수익 경향 그래프 (월 단위)-</h5>
						<div id="areaChart2"></div>				
					</div>
					<div class="col ml-1" style="border: 1px solid #f38181; border-radius: 10px">
						<h5 class="mt-2">-최근 일별 수익 분류 매출액-</h5>
						<div id="barChart"></div>
					</div>
				</div>
				
				<!-- 작은 원형 차트 구역 -->
				<h3 class="mb-3 ml-2">연령대 및 성별 선호도</h3>
				<div class="row m-3 pb-5 justify-content-start">
					<div class="col-md-3 mr-1" style="border: 1px solid #f38181; border-radius: 10px">
						<h5 class="mt-2">-연령대별 선호도-</h5>
						<div id="pieChart"></div>			
					</div>
					<div class="col-md-3 ml-1" style="border: 1px solid #f38181; border-radius: 10px">
						<h5 class="mt-2">-성별 선호도-</h5>
						<div id="pieChart2"></div>
					</div>
					<!-- 소규모통계자료 추가 -->
					<div class="col ml-1" style="border: 1px solid #f38181; border-radius: 10px">
						<div class="row pt-3 mt-2">
							<div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">일일&nbsp;최고수입&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
				                      	<fmt:formatNumber value="${maxIncome }" type="currency" />
				                      </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>
				            
				            <div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">일일&nbsp;최저수입&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
				                      	<fmt:formatNumber value="${minIncome }" type="currency" />
				                      </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>

							<div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">일일&nbsp;최고지출&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
				                      	<fmt:formatNumber value="${maxOutcome }" type="currency" />
				                      </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>
				            
				            <div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">일일&nbsp;최저지출&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
				                      	<fmt:formatNumber value="${minOutcome }" type="currency" />
				                      </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>
			            
			            	<div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">일일&nbsp;평균수입&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
				                      	<fmt:formatNumber value="${avgIncome }" type="currency" />
				                      </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>

			            	<div class="col-xl-6 col-md-6 mb-4">
				              <div class="card border-left-primary shadow h-100 py-2">
				                <div class="card-body p-2">
				                  <div class="row no-gutters align-items-center">
				                    <div class="col mr-2">
				                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">일일&nbsp;평균지출&nbsp;(월 단위)</div>
				                      <div id="monthlyIncome" class="h5 mb-0 font-weight-bold text-gray-800">
										<fmt:formatNumber value="${avgOutcome }" type="currency" />
									  </div>
				                    </div>
				                    <div class="col-auto">
				                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </div>

						</div>
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
							$("#accountfrm").submit();
						}
						
						function accountExit(){
							$("#myModal2").hide();
							location.href = "${pageContext.request.contextPath}/";
						}
						
					</script>
						
				</c:if>
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
	
	var pincomeList = ${pincomeList};
	pincomeList.unshift("data4");
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
			data : {
				x : "x",
				columns : [ dateList, incomeList, pincomeList ],
				names : {
					data1 : "매출",
					data4 : "예상매출"
				},
				types : {
					data1 : "area-spline",
					data4 : "area-spline"
				},
				colors : {
					data1 : "#f89d13",
					data4 : "#f38181"
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
	<!-- 수익 분류 차트 -->
	<script type="text/javascript">
	function makeTypeChart(list1, list2, list3, list4, list5) {
		
		var chart = bb.generate({
			  data: {
			    x: "x",
			    columns: [
			    	list1,
			    	list2,
			    	list3,
			    	list4,
			    	list5
			    ],
			    type: "bar",
				names : {
					data5 : "현금",
					data6 : "카드",
					data7 : "계좌이체",
					data8 : "기타"
				},
				colors : {
					data5 : "#f38181",
					data6 : "#f89d13",
					data7 : "#ffc9c9",
					data8 : "#FBF697"
				},
			    groups: [
			      [
			        "data5",
			        "data6",
			        "data7",
			        "data8"
			      ]
			    ]
			  },
			  axis: {
			    rotated: true,
			    x: {
			      type: "category",
			      clipPath: false,
			      inner: false,
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
	}
	</script>

	<script type="text/javascript">
		function makeRoundChart(labelList, countList){
			
			maleData = ["남자", 0];
			femaleData = ["여자", 0];
			
			for(var i = 0; i < labelList.length; i++){
				if(labelList[i].includes("남",0)){
					maleData[1] = parseInt(countList[i]);
				}else{
					femaleData[1] += parseInt(countList[i]);
				}
			}			
			
			var chart = bb.generate({
				  data: {
				    columns: [
					maleData,
					femaleData
				    ],
				    type: "pie",
				  },
				  bindto: "#pieChart2"
				});
			}
	function makeRoundChart2(labelList, countList){
		

		youngData = ["10~20대",0];
		middleData = ["30~40대",0];
		matureData = ["50~대",0];
		
		for(var i = 0; i < labelList.length; i++){
			if(labelList[i].substring(0,2) == 10 || labelList[i].substring(0,2) == 20){
				youngData[1] = parseInt(countList[i]);
			}else if(labelList[i].substring(0,2) == 30 || labelList[i].substring(0,2) == 40){
				middleData[1] += parseInt(countList[i]);
			}else{
				matureData[1] += parseInt(countList[i]);
			}
		}			
		
		var chart = bb.generate({
			  data: {
			    columns: [
			    	youngData,
			    	middleData,
			    	matureData
			    ],
			    type: "pie",
			  },
			  bindto: "#pieChart"
			});
		}
	</script>

	<!-- 테이블에 대한 이벤트 -->
	<script type="text/javascript">
		var flag = true;

		function addRow() {
			if (flag) {
				var inputNames = ['account_No','account_Date','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome']
				
				var maxlength = [ 3, 8, 7, 4, 4, 15, 8, 8];

				var tbody = $("#tbody");

				var tags = "<tr>";

				for (var i = 0; i < maxlength.length; i++) {
					if (i == 0) {
						tags += '<td scope="row" size='+maxlength[i]+'>추가중</td>'
					} else if (i == 1) {
						tags += '<td><input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date"></td>';
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
				var maxlength = [ 3, 8, 7, 4, 4, 15, 8, 8];
				var inputNames = ['account_No','account_Date','account_Type',
					'account_Clause','account_Item','account_Summary','account_Income','account_Outcome']
				if (data[0].innerText != '행 추가하기') {
					for (var i = 0; i < maxlength.length; i++) {
						var input;

						if (i == 1) {
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" value='+data[i].innerText+'>';
						} else if (i == 2) {
							input = '<div class="btn-group">';
							input += '<select id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" style="background-color : #ffc9c9">';
							input += '<option value="현금">현금</option>';
							input += '<option value="카드">카드</option>';
							input += '<option value="계좌이체">계좌이체</option>';
							input += '<option value="기타">기타</option>';
							input += '</select></div>';
						} else if (i == 6 || i == 7 ){
							var money;
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
			var temperature = 0; 
			var precipitation = 0;
			
			var date = $("#account_Date").val().replace($("#account_Date").val().split("-")[0],$("#account_Date").val().split("-")[0]-1);
			date = replaceAll(date,"-","");
			
			alert(date);
			
			$.ajax({
				url: "http://openapi.seoul.go.kr:8088/757875684374706436365a78455477/json/DailyWeatherStation/1/5/"+date,
				type : "get",
				success : function(data){
					for(var i=0; i<data['DailyWeatherStation']['row'].length; i++){						
						temperature += data['DailyWeatherStation']['row'][i]['SAWS_TA_AVG'];
						precipitation += data['DailyWeatherStation']['row'][i]['SAWS_RN_SUM'];
					}
					
					temperature /= data['DailyWeatherStation']['row'].length;
					precipitation /= data['DailyWeatherStation']['row'].length;
					
					console.log(temperature);
					console.log(precipitation);
					
					$.ajax({
						url : "${pageContext.request.contextPath}/accountBook/insertAccountBook.do?partner_No=${partner_No}",
						type : "post",
						data : {
							'temperature':temperature,
							'precipitation':precipitation,
							'account_Date':$("#account_Date").val(),
							'account_Type':$("#account_Type").val(),
							'account_Clause':$("#account_Clause").val(),
							'account_Item':$("#account_Item").val(),
							'account_Summary':$("#account_Summary").val(),
							'account_Outcome':$("#account_Outcome").val(),
							'account_Income':$("#account_Income").val()
						},
						success : function(data){
							location.reload(); 
						}
					});
					
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
					location.reload();
				}
			});
		}
		
		function updateAccountBook(id){
			var temperature = 0; 
			var precipitation = 0;
			
			var date = $("#account_Date").val().replace($("#account_Date").val().split("-")[0],$("#account_Date").val().split("-")[0]-1);
			date = replaceAll(date,"-","");

			
			$.ajax({
				url: "http://openapi.seoul.go.kr:8088/757875684374706436365a78455477/json/DailyWeatherStation/1/5/"+date,
				type : "get",
				success : function(data){
					for(var i=0; i<data['DailyWeatherStation']['row'].length; i++){						
						temperature += data['DailyWeatherStation']['row'][i]['SAWS_TA_AVG'];
						precipitation += data['DailyWeatherStation']['row'][i]['SAWS_RN_SUM'];
					}
					
					temperature /= data['DailyWeatherStation']['row'].length;
					precipitation /= data['DailyWeatherStation']['row'].length;
					
					var account_No = $(id).parent().parent().children().eq(0).children().val();	
					$.ajax({
						url : "${pageContext.request.contextPath}/accountBook/updateAccountBook.do",
						type : "post",
						data : {
							'temperature':temperature,
							'precipitation':precipitation,
							'account_No': account_No,
							'account_Date':$("#account_Date").val(),
							'account_Type':$("#account_Type").val(),
							'account_Clause':$("#account_Clause").val(),
							'account_Item':$("#account_Item").val(),
							'account_Summary':$("#account_Summary").val(),
							'account_Outcome':$("#account_Outcome").val(),
							'account_Income':$("#account_Income").val()
						},
						success : function(data){
							location.reload();
						}
					});
					
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

	</script>

	<!-- 통계용 함수 -->
	<script>
	$(document).ready(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/accountBook/cardCalculate.do?partner_No=${partner_No}",
			success : function(data){
				$("#monthlyIncome").html(preprocessing(data.monthlyIncome));
				$("#yt_IncomeRate").html(data.yt_IncomeRate+"% ("+preprocessing(data.yt_Income)+")");
				$("#sumRevenue").html(preprocessing(data.sumRevenue));
				$("#goalMonthly").html(data.goalMonthly+"%");
				$("#goalMonthlyBar").width(data.goalMonthly);
			}
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/accountBook/Balance.do?partner_No=${partner_No}",
			type : "post",
			success : function(data){
				console.log(data.sum["SUM(ACCOUNT_INCOME)"]);
				console.log(data.sum["SUM(ACCOUNT_OUTCOME)"]);
				var balance = parseInt("${account.account_Balance}");
				balance += (data.sum["SUM(ACCOUNT_INCOME)"]-data.sum["SUM(ACCOUNT_OUTCOME)"]);
				
				$("#balance").text(preprocessing(balance));
				
			}
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/accountBook/calculate.do?partner_No=${partner_No}",
			type : "post",
			success : function(data){
				/* 수익 분류용 데이터 */
				var caldateList = data.caldateList;
				caldateList.unshift("x");
				
				var cashList = data.cashList;
				cashList.unshift("data5");

				var cardList = data.cardList;
				cardList.unshift("data6");

				var bankTransferList = data.bankTransferList;
				bankTransferList.unshift("data7");
				
				var otherList = data.otherList;
				otherList.unshift("data8");
				
				makeTypeChart(caldateList, cashList, cardList, bankTransferList, otherList);
			}
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/accountBook/roundChartcalculate.do?partner_No=${partner_No}",
			type : "post",
			success : function(data){				
				makeRoundChart(data.labelList, data.countList);
				makeRoundChart2(data.labelList, data.countList);
			}
		});
	});			
	
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />











