<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<style>
.star-rating {
  line-height:32px;
  font-size:1.25em;
}

.star-rating .fa-star{
color: yellow;
transition : 0.5s;
}
</style>
<c:out value="${order}"/>
<c:out value="${loginMember}"/>
<section id="content">
	<div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(${path}/resources/images/foodtruck/bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10" data-aos="fade-up" data-aos-delay="400">
            <div class="row justify-content-center">
              <div class="col-md-8 text-center">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="comment-form-wrap pt-5 col-md-8 offset-md-2">
       <h3 class="mb-5"><span class="icon icon-rate_review"></span> 리뷰를 남겨보세요</h3>
       <form action="${path }/order/reviewEnd" method="POST" class="p-5 bg-light" enctype="multipart/form-data">
         <div class="form-group">
           <label for="member_Id">작성자 ID *</label>
           <input type="text" class="form-control" id="member_Id" value="${loginMember.member_Id }" readonly>
           <input type="hidden" name="member_No" value="${loginMember.member_No}">
           <input type="hidden" name="order_No" value="${order.order_No}">
           <input type="hidden" name="partner_No" value="${order.partner_No}">
         </div>
         <div class="form-group">
           <label for="review_Star">푸드트럭 평가 *</label>
           <div class="star-rating">
	        <span class="icon-star" data-rating="1"></span>
	        <span class="icon-star" data-rating="2"></span>
	        <span class="icon-star" data-rating="3"></span>
	        <span class="icon-star" data-rating="4"></span>
	        <span class="icon-star" data-rating="5"></span>
	        <input type="hidden" name="review_Star" id="review_Star" class="rating-value" value="3">
	      </div>
         </div>
         <div class="form-group">
           <label for="message">리뷰 내용</label>
           <textarea name="review_Content" id="message" cols="30" rows="10" class="form-control" placeholder="200자 이내 입력가능" maxlength="200"></textarea>
         </div>
         <div class="form-group">
           <label for="website">이미지 첨부</label>
           <input type="file" name="oriname_File" id="oriname_File" accept="image/*" onchange="readURL(this)" /> 
           <img id="image" style="height:200px; width:200px;"/>
         </div>
         <div class="form-group">
           <input type="submit" value="리뷰작성완료" class="btn btn-primary text-white btn-md">
         </div>
       </form>
     </div>
</section>
<script>
var $star_rating = $('.star-rating .icon-star');

var SetRatingStar = function() {
  return $star_rating.each(function() {
    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
        return $(this).removeClass('text-secondary').addClass('text-warning');
    }else{
       return $(this).removeClass('text-warning').addClass('text-secondary');
    }
  });
};

$star_rating.on('click', function() {
  $star_rating.siblings('input.rating-value').val($(this).data('rating'));
  return SetRatingStar();
});

SetRatingStar();

$("#oriname_File").on("change",function(){

	var img = $("#oriname_File").val();
	var filename = img.substring(img.lastIndexOf("/")-1,img.length)
	var reader = new FileReader();

    reader.onload = function (e) { 
        document.getElementById("image").src = e.target.result;
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
});

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>