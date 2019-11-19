<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="주문하기"/>
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
<div class="site-blocks-padding mobile">
</div>
<section id="content">
	<div class="site-section">
		<div class="bg-light col-md-8 offset-md-2">
			<div class="row align-center">
				<div class="form-group col-md-5 ml-auto">
					<div class="row" id="menuSearch">
						<label for="foodSearch"><span class="icon icon-cutlery"></span> 메뉴로 직접 검색하기</label>
						<input type="text" list="menuData" class="form-control" name="menu_Name" id="menu_Name" placeholder="검색할 메뉴를 입력하세요."/>
						<datalist id="menuData"></datalist>
						<input type="button" class="form-control btn btn-warning" value="검색하기" onClick="searchMenuName(this);"/>
					</div>
				</div>
				<div class="form-group col-md-7 mx-#"> 
					<label for="easySearch"><span class="icon icon-search"></span> 카테고리로 검색하기</label>
					<div class="row" id="easySearch">
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="한식" style='left:-9999px'/>
								<button class="btn btn-outline-info" >한식</button>
							</label>
						</div>
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="중식" style='left:-9999px'/>
								<button class="btn btn-outline-info" >중식</button>
							</label>
						</div>
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="일식" style='left:-9999px'/>
								<button class="btn btn-outline-info" >일식</button>
							</label>
						</div>
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="양식" style='left:-9999px'/>
								<button class="btn btn-outline-info" >양식</button>
							</label>
						</div>
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="디저트" style='left:-9999px'/>
								<button class="btn btn-outline-info" >디저트</button>
							</label>
						</div>
						<div class="form-check input-toggle">
							<label class="form-check-label">
								<input type="checkbox" name="partner_Menu" class="form-check-input" value="기타" style='left:-9999px'/>
								<button class="btn btn-outline-info">기타</button>
							</label>
						</div>
					</div>
					<label for="ordering"><span class="icon icon-th-list"></span> 정렬기준</label>
					<div class="row" id="ordering">
						<div class="form-check input-order">
							<label class="form-check-label">
								<input type="checkbox" name="starCount" class="form-check-input" value="desc" style='left:-9999px'/>
								<button class="btn btn-outline-primary">리뷰 평점 높은 순</button>
							</label>
						</div>
						<div class="form-check input-order">
							<label class="form-check-label">
								<input type="checkbox" name="starCount" class="form-check-input" value="asc" style='left:-9999px'/>
								<button class="btn btn-outline-primary">리뷰 평점 낮은 순</button>
							</label>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<!-- 검색결과가 노출되는 리스팅 -->
	  	<div class="row">
			<div class="col-md-8 offset-md-2">
				<!-- 여기서 부터 DIV가 업체 리스트에 맞춰 반복되야함, image변경 필! -->
				<c:forEach var="p" items="${list }" varStatus="v">
				<div class="d-block d-md-flex listing-horizontal" id="truck-container" onClick="truckInfo(this);">
					<!-- 푸드트럭 별 대표이미지 -->
					<a href="${path }/order/orderListView?partner_No=${p.partner_No}" class="img d-block" style="background-image: url('${path}/resources/images/foodtruck/${p.profile_Re }')">
						<span class="category"><c:out value="${p.partner_Menu }"/></span>
					</a>
					<div class="lh-content">
							<h3><a href="${path }/order/orderListView?partner_No=${p.partner_No}"><c:out value="${p.partner_TruckName }"/></a></h3>
							<!-- 별점 -->
							<div class="row">
								<span>리뷰 평점</span>
								<div class="star-rating">
									<span class="icon-star" data-rating="1"></span>
									<span class="icon-star" data-rating="2"></span>
									<span class="icon-star" data-rating="3"></span>
									<span class="icon-star" data-rating="4"></span>
									<span class="icon-star" data-rating="5"></span>
									<input type="hidden" name="data_No" class="rating-value" value="${p.starCount}">
									<span>(${p.reviewCount }개의 리뷰)</span>
								</div>
								<p></p>
								<div>
									<!-- 메뉴이미지 추가부분 고려해보자 대안, 메뉴 이름을 대표메뉴로 추가? -->
									<div class="listing-item">
										<div class="listing-item-content">
											<c:forEach var="menu" items="${menuList[v.count-1] }" begin="1" end="3" step="1" varStatus="vs">
												<span class="px-3 mb-3 category">${menu.menu_Name }</span></a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
				<script>
				function truckInfo(data){
					var url = $(data).children().siblings().eq(0).attr('href');
					location.href=url;
				}
				</script>
				</c:forEach>
			</div>
		</div>
		<!-- 페이징 처리 -->
		${pageBar }
		
</section>

<script>
var keyword = '${keyword}' != null?'${keyword}' : "";
var ordering = '${ordering}' != null?'${ordering}' : "";
var url ="${path}/order";
var cPage = "${cPage}" != null? "${cPage}" : 1;

$(document).ready(function(){
		// 메뉴 검색 자동완성 기능
		$('#menu_Name').on('keyup', function(){
			var menu = $(this).val().trim();
			$.ajax({
				url : "${path}/order/selectMenu",
				type : "POST",
				data : {
					"menu_Name" : menu
				},
				success : function(data){
					var menuList = JSON.parse(data);
					$("#menuData").html("");
					for(var i = 0; i < menuList.length; i++){
						var option = $("<option>").attr({"value" : menuList[i].menu_Name});
						$('#menuData').append(option);
					}
				}
			})
		});
	
	// partner_Menu toggle 관련 function
	$('.input-toggle').on('click',function(){
		var thisbtn = $(this).children().children().eq(1);
		url = "${path}/order/orderListSearch?";
		if(thisbtn.attr('class').includes('btn-outline-info')){
	 		thisbtn.removeClass("btn-outline-info");
			thisbtn.addClass("btn-info");
			keyword = keyword.replace(thisbtn.siblings().val() + "/","");
			keyword += thisbtn.siblings().val()+"/";
		}else{
			thisbtn.removeClass("btn-info");
			thisbtn.addClass("btn-outline-info");
			keyword = keyword.replace(thisbtn.siblings().val() + "/","");
		}
		if(ordering != null && ordering != ''){
			location.href = url+"keyword="+keyword+"&ordering="+ordering;
		} else {
			if(keyword == null || keyword == ''){
				location.href="${path}/order";
			} else {
				location.href = url+"keyword="+keyword;
			}
		}
	});
	
	// 평점 정렬 관련 function
	$('.input-order').on('click',function(){
		var thisbtn = $(this).children().children().eq(1);
		url = "${path}/order/orderListSearch?";
			if(keyword != null && keyword != ''){
				if(thisbtn.attr('class').includes('btn-outline-primary')){
			 		thisbtn.removeClass("btn-outline-primary");
					thisbtn.addClass("btn-primary");
					ordering = ordering.replace(thisbtn.siblings().val() +"/","");
					ordering = thisbtn.siblings().val() +"/";
				}else{
					thisbtn.removeClass("btn-primary");
					thisbtn.addClass("btn-outline-primary");
					ordering = ordering.replace(thisbtn.siblings().val() + "/","");
				}
				
				 location.href = url+"keyword="+keyword+"&ordering="+ordering; 
			} else {
				if(thisbtn.attr('class').includes('btn-outline-primary')){
			 		thisbtn.removeClass("btn-outline-primary");
					thisbtn.addClass("btn-primary");
					ordering = ordering.replace(thisbtn.siblings().val() +"/","");
					ordering = thisbtn.siblings().val() +"/";
				}else{
					thisbtn.removeClass("btn-primary");
					thisbtn.addClass("btn-outline-primary");
					ordering = ordering.replace(thisbtn.siblings().val() + "/","");
				}
				if(ordering!=''){
			 	location.href = url+"ordering="+ordering;
				} else {
					location.href="${path}/order";
				}
			}
	});
	
	if(keyword != null && keyword != ' '){
		// keyword가 빈칸이 아닐 때
		var keywords = keyword.split('/');
		for(var i = 0; i < keywords.length; i++){
			$('input[name=partner_Menu]').each(function(){
				if(keywords[i] == $(this).val()){
					// 주소에 있는 값과 일치한게 있다면?
					$(this).siblings().eq(0).removeClass('btn-outline-info');
					$(this).siblings().eq(0).addClass('btn-info');
				}
			})
		}
		if(ordering != null && ordering != ' '){
			// ordering이 빈칸이 아닐 때
			var orders = ordering.split('/');
			for(var i = 0; i < orders.length; i++){
				$('input[name=starCount]').each(function(){
					if(ordering == $(this).val()+'/'){
						$(this).next().removeClass('btn-outline-primary');
						$(this).next().addClass('btn-primary');
					}
				})
			}
		}
	}else {
		// keyword가 빈칸일 때
		if(ordering != null && ordering != ' '){
			// ordering이 빈칸이 아닐 때
			var orders = ordering.split('/');
			for(var i = 0; i < orders.length; i++){
				$('input[name=starCount]').each(function(){
					if(ordering == $(this).val()+'/'){
						$(this).next().removeClass('btn-outline-primary');
						$(this).next().addClass('btn-primary');
					}
				})
			}
		} 
	}
	
	if(ordering != null && ordering != ' '){
		// ordering이 빈칸이 아닐 때
		var orders = ordering.split('/');
		for(var i = 0; i < orders.length; i++){
			$('input[name=starCount]').each(function(){
				if(ordering == $(this).val()+'/'){
					$(this).next().removeClass('btn-outline-primary');
					$(this).next().addClass('btn-primary');
				}
			})
		}
	}else {
			//ordering이 빈칸일 때
	}
	
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

// 메뉴 검색 function
function searchMenuName(){
	var menu_Name = $('#menu_Name').val();
	if($('#menu_Name').val() == null || $('#menu_Name').val().length == 0){
		alert('검색어를 입력하세요.');
	} else {
		location.href = "${pageContext.request.contextPath}/order/orderListSearch?menu_Name="+menu_Name;
	}
}

/* 페이징처리용 함수 추가 */
function fn_paging(cPage) {
	location.href='${pageContext.request.contextPath}/order?cPage='+cPage;
}

function fn_menuPaging(cPage){
	var page_url = "${path}/order/orderListSearch?cPage="+cPage;
	if(keyword != null) {
		page_url += "&keyword="+keyword;
	}
	if(ordering != null) {
		page_url += "&ordering="+ordering;
	}
	location.href=page_url;
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>