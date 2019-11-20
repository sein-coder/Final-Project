<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="주문페이지"/>
</jsp:include>
<style>
.star-rating {
  line-height:32px;
  font-size:1.25em;	
  
}
.star-rating .icon-star{
  color: yellow;
  transition : 0.5s;
}
</style>
<section id="content" class="col-md-8 offset-md-2">
	<!-- 업체 소개 영역 -->
    <div class="site-section pl-3 pr-3">
    <div class="row">
	<div class="col-md-8">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6">
            <img src="${path }/resources/images/foodtruck/${partner.profile_Re}" alt="${partner.partner_TruckName }" class="img-fluid rounded">
          </div>
          <div class="col-md-5 ml-auto">
            <h2 class="text-primary mb-3">${partner.partner_TruckName }</h2>
				<div class="truck-rating" id="truck-star">
					<span class="font-size-regular">리뷰 평점 <fmt:formatNumber value="${partner.starCount }" pattern="0.0"/>점</span>
				</div>
				<label>총 리뷰 수
				<span>${partner.reviewCount }</span>
				</label>
				<div>
					<span class="font-size-regular">연락처 </span><p>${partner.partner_Phone}</p>
				</div>
				<div>
					<span class="font-size-regular">주소 </span><p>${partner.partner_Address}</p>
				</div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 align-center">
    	<div class="bg-light text-center mx-auto">
    			<table class="orderList col-md-12">
    				<tr class="bg-warning">
    					<td colspan="2"><h3 class="text-center">주문리스트</h3></td>
    				</tr>
    			</table>
    		<div class="order-footer text-right">
    			<label for="pay-total">총 금액</label>
    			<h4 class="pay-total" id="pay-total">0</h4>
    		</div>
    			<button class="btn btn-danger btn-lg col-md-12" data-toggle="modal" data-target="#payModal" id="completeOrder">주문완료</button>
    	</div>
    </div>
    </div>
    
    <div class="row">
    	<div class="col-md-8">
			<div class="container">
				<div class="row justify-content-center mb-5">
					<div class="col-md-7 text-center border-primary">
						<h2 class="font-weight-light text-primary"></h2>
						<p class="color-black-opacity-5">MENU</p>
					</div>
				</div>
			
				<div class="row align-items-center bg-light">
				<!-- 메뉴 반복 위치-->
					<div class="row mb-3 align-items-stretch">
					<c:forEach var="menu" items="${menu }" >
						<div class="col-md-4 col-lg-4 mb-4 mb-lg-4">
							<div class="listing-item mx-auto my-auto" style="background-color:white">
								<div class="listing-image" >
									<img src="${path }/resources/images/menu/${menu.menu_Oriname_File}" style="height:12em;" alt="${menu.menu_Name }" class="img-fluid">
								</div>
								<div class="h-entry-inner">
								<h2 class="font-size-regular text-center" style="margin-top : 1em;">${menu.menu_Name }</h2>
									<div class="meta mb-4 text-center">${menu.menu_Price }</div>
									<div class="qty text-center input-group">
										<div class="input-group-append col-md-4">
											<button class="btn btn-outline-primary" onclick="orderPlusMinus(this);">
												<span class="icon icon-plus-circle"></span>
											</button>
										</div>
										<input type="hidden" name="menu_Name" value="${menu.menu_Name }" />
										<input type="hidden" name="menu_Price" value="${menu.menu_Price }"/>
										<input class="form-control col-md-4 count menucount" name="${menu.menu_No }" type="number" value="0" step="1" readonly/>
										<div class="input-group-append col-md-4">
											<button class="btn btn-outline-primary" onclick="orderPlusMinus(this);">
												<span class="icon icon-minus-circle"></span>
											</button>
										</div>
									</div>
								</div>
							</div> 
						</div>
					</c:forEach>
    			</div>
    		</div>
    	</div>
    </div>
    </div>
    <!-- Review영역 -->
    <div class="row mt-4 mb-4">
		<h4>${partner.reviewCount}개의 리뷰가 있습니다.</h4>
		<span class="category">[리뷰는 최근 3개만 노출됩니다]</span>
	<div>
	<div class="row">
		<c:forEach var="rv" items="${reviewList}" varStatus="v" begin="0" end="2" step="1">
		<div class="col-md-4 col-lg-4">
			<div class="how-it-work-step">
				<div class="img-wrap mb-2">
					<img src="${path }/resources/images/foodtruck/${partner.profile_Re}" alt="${partner.partner_TruckName }" class="img-fluid rounded">
				</div>
					<span class="number">${v.count }</span>
					<h3><c:out value="${fn:substring(rv.member_Id,0,3)}**** "/></h3>
					<div class="meta">
						<p><fmt:formatDate value="${rv.review_Time}" pattern="yyyy년  MM월 dd일  HH시 주문"/><p>
						<div class="star-rating">
							<span class="icon-star" data-rating="1"></span>
							<span class="icon-star" data-rating="2"></span>
							<span class="icon-star" data-rating="3"></span>
							<span class="icon-star" data-rating="4"></span>
							<span class="icon-star" data-rating="5"></span>
							<input type="hidden" name="data_No" class="rating-value" value="${rv.review_Star}">
						</div>
					</div>
					<p>${rv.review_Content}</p>
					<c:forEach var="cmt" items="${comment }">
					<input type="hidden" class="order_No" value="${rv.order_No}"/>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	
<!-- 모달창 -->
<div class="modal fade" id="payModal">
    <div class="modal-dialog modal-dialog-centered" >
		<div class="modal-content" >
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	         	<h4 class="modal-title">결제하기</h4>
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
   				<div class="container">
					<div class="text-center">
						<h4 class="bg-light">주문내역</h4>
						<!-- 주문내역 리스트에 맞춰 반복 -->
						<table class="table-hover orderList col-md-12 text-center" id="list">
						</table>
					</div>
					<div class="text-center">
						<h4 class="bg-light">총 결제 금액</h4>
						<span class="text-center pay-total">원</span>
						<input type="hidden" id="total_price" value="0"/>
					</div>
					<div class="text-center">
						<h4 class="bg-light">주문요청사항</h4>
						<textarea rows="1" cols="30" placeholder="30자 이내로 기재" name="add_request" id="add_request"></textarea>	
					</div>
     					<div class="row">
       					<div class="col">
			         		<button type="button" class="form-control btn btn-primary" onClick="fadeModal();">결제하기</button>
							<!-- onClick="payOrders();" -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</section>
<script>
$(function(){
	$("input[name=data_No]").each(function(){
	      var starCount = $(this).val();
	      $($(this).siblings()).each(function(){
	         if(starCount >= $(this).data('rating')){
	            return $(this).removeClass('text-secondary').addClass('text-warning');
	         }else{
	            return $(this).removeClass('text-warning').addClass('text-secondary');
	         }
	      });
	   });
});
</script>

<script>
var payment = 0;

function orderPlusMinus(data){
	var countInput;
	var el;
	
	var menuPrice;
	
	if($(data).children().attr('class').search("plus") != -1)
	{
		el=$(data).parent().nextAll(".menucount");
		countInput = $(data).parent().siblings().eq(2);
		countInput.val(parseInt(countInput.val())+1);
		
		// 메뉴 가격 찾기
		menuPrice = $(data).parent().siblings().eq(1).val();
		
		if(countInput.val() >= 1){
			if(countInput.val() == 1){
				var tagName = $(data).parent().siblings().eq(0).val();
				var tags = "<tr class='orderdata'>";
				tags += "<td>"+tagName+"</td>";
				tags += "<td class='"+$(el).attr("name")+"'>"+$(el).val()+"</td>";
				tags += "</tr>"; 
				$('.orderList').append(tags);
			}
			else{
				var orderDataList=$(".orderList").find(".orderdata").children();
				$.each(orderDataList,function(i,item){
					if($(el).attr('name')==$(item).attr("class")){
						$(item).html($(el).val());
					}
				});
			}
			payment += menuPrice*1;
		} 
	}
	else{
		el=$(data).parent().prevAll(".menucount");
		var orderDataList=$(".orderList").find(".orderdata");
		countInput = $(data).parent().siblings().eq(3);
		
		// 메뉴 가격 찾기
		menuPrice = $(data).parent().siblings().eq(2).val();
		
		if(countInput.val() > 0){
			countInput.val(parseInt(countInput.val())-1);
			//
			$.each(orderDataList, function(i, item){
				if($(el).attr('name') == $(item).children()[1].className){
					$(item).children()[1].innerText = $(el).val();
				}
			})
			
			if(countInput.val() == 0){
				$.each(orderDataList, function(i, item){
					if($(el).attr('name') == $(item).children()[1].className){
						$(item).remove();
					}
				})
			}
		payment -= menuPrice*1;
		}
	}
	$('.pay-total').html(payment).val();
	$('#total_price').val(payment);
}
</script>


<script>
//결제포트 실행전 첫 번째 모달 숨기기
function fadeModal(){
	if(parseInt($('#pay-total').text()) <= 0){
		alert('올바른 결제금액이 아닙니다. 다시 확인하세요.');
		$('#payModal').modal('hide');
	} else {
		$('#payModal').modal('hide');
		var windowWidth = 650;
		var windowHeight = 650;
		var windowLeft = parseInt((screen.availWidth/2)-(windowWidth/2));
		var windowTop = parseInt((screen.availHeight/2)-(windowHeight/2));
		var windowSize = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop + ",screenX=" + windowLeft + ",screenY=" + windowTop;
		var open = window.open('${path}/order/payment.do?order_Price='+payment, "_target ", windowSize);
	}
}
</script>

<script type="text/javascript">
function toOrderHistory(){
	var orderlists = "";
	
	$("#list tr.orderdata").each(function(){
		orderlists += $(this).children().eq(0).text() + "-" + $(this).children().eq(1).text() + "/";
	})

	var dt = new Date();
	var date = dt.getFullYear() - 1;
	date += new String(dt.getMonth()+1);
	date += new String(dt.getDate());
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/757875684374706436365a78455477/json/DailyWeatherStation/1/5/"+date,
		type : "get",
		success : function(data){
			var temperature = 0;
			var precipitation = 0;
			
			
			for(var i=0; i<data['DailyWeatherStation']['row'].length; i++){						
				temperature += data['DailyWeatherStation']['row'][i]['SAWS_TA_AVG'];
				precipitation += data['DailyWeatherStation']['row'][i]['SAWS_RN_SUM'];
			}
			
			temperature /= data['DailyWeatherStation']['row'].length;
			precipitation /= data['DailyWeatherStation']['row'].length;	
			
			$.ajax({
				url : "${path}/order/orderEnd?temperature="+temperature+"&precipitation="+precipitation,
				type: "POST",
				data: {
					"order_List" : orderlists,
					"add_Request" : $("#add_request").val(),
					"order_Price" : payment,
					"reservation_YN" : "N",
					"partner_No" : ${partner.partner_No},
					"member_No" : ${loginMember.member_No}
				},
				success : function(data){
					alert("결제 정보가 전송 중 입니다.");
					location.href="${path}/order/complete";
				},
				fail : function(data){
					alert("결제 처리에 실패하였습니다. 관리자에게 문의하세요.");
				}
			});
		}
	});
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>