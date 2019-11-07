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
	<div class="site-section">
		<div class="container">

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
					<div id="map" style="width:100%;height:350px;"></div>
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
						tags += '<td><input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" onchange="checkDateData(this)"></td>';
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
							input = '<input id='+inputNames[i]+' name='+inputNames[i]+' class="form-control" type="date" value='+data[i].innerText+' onchange="checkDateData(this)">';
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
			location.reload();
			
			/* add 
			if (num == 1) {
				$("#cancelBtn").parent().parent().remove();
				flag = true;
			}
			 update / delete 
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
			} */
			
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
		
		function checkDateData(id){
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
		};
		
	</script>
	
	<!-- 페이징처리용 함수 -->
	<script>
	function fn_paging(cPage) {
		location.href='${pageContext.request.contextPath}/accountBook/accountBookView?cPage='+cPage+'&partner_No=1234';
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5306475369695   ,126.928706300305), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: false});
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
var marker = new daum.maps.Marker({
    /* position: new daum.maps.LatLng(37.537187, 127.005476), */
    map: map
})

var places = new kakao.maps.services.Places();




var positions = [
    {
        title: '막대그래프',//이름 
        latlng: new kakao.maps.LatLng(37.52634778919655,126.93359546197759),//좌표
        img : "",
        time : 	"",
        phone : ""
    }
];

    
    
    var markers=[];
    var overlays=[];
    for(var i=0; i<positions.length; i++){
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkwMc6bfZ7Q5n4UObzmIrU8h8W8m__SLdi53U98Aq561bGntx5Ww&s"; 
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 100); //10,0000 × 0.001 = 10
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        var maker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지 
        })	
        
        markers.push(maker);
    var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    			positions[i].title + 
    '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="'+positions[i].img+'" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+positions[i].time+'</div>' + 
    '                <div class="jibun ellipsis">'+positions[i].phone+'</div>' + 
    '                <div><a href="" class="link">ㅇㅇ</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
    
    
    var overlay = new kakao.maps.CustomOverlay({
   	content: content,
   	map: map,
   	position: markers[i].getPosition()       
   	});
    overlays.push(overlay);
    
    function closeOverlay(i) {
   	overlays[i].setMap(null);     
   		} 
    	
 	overlays[i].setMap(null); 
 	
    }

    $.each(overlays,function(i,item){
    	kakao.maps.event.addListener(markers[i], 'click', function() {
    		overlays[i].setMap(map);
    		}); 
    });
	
	
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />











