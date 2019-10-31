<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/images/ft.gif);" data-aos="fade" data-stellar-background-ratio="0.5">
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
            
            <div class="row align-items-stretch p-4">
	          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/한식.png">
	              </span>
	              <span class="caption mb-2 d-block">한식</span>
	              <span class="number">489</span>
	            </a>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/중식.png">
				  </span>
	              <span class="caption mb-2 d-block">중식</span>
	              <span class="number">482</span>
	            </a>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/일식.png">
	              </span>
	              <span class="caption mb-2 d-block">일식</span>
	              <span class="number">191</span>
	            </a>
	          </div>
        	  <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/양식.png">
	              </span>
	              <span class="caption mb-2 d-block">양식</span>
	              <span class="number">395</span>
	            </a>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/디저트.png">
	              </span>
	              <span class="caption mb-2 d-block">디저트</span>
	              <span class="number">124</span>
	            </a>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
	            <a href="#" class="popular-category h-100">
	              <span class="icon mb-3">
	              	<img src="${pageContext.request.contextPath }/resources/icon/기타.png">
	              </span>
	              <span class="caption mb-2 d-block">기타</span>
	              <span class="number">187</span>
	            </a>
	          </div>
      		</div>
            
            
          </div>
        </div>
      </div>
    </div>  
<section id="content">
    
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">Let Eat Go</h2>
            <p class="color-black-opacity-5">사용자와 사업자 모두를 만족시키는 서비스</p>
          </div>
        </div>
		
        <div class="row">
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-1.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">하나</span>
              <h3>사용자 관점의 이익</h3>
              <p>사용자들은 더욱 더 간편하게 싸고 맛있는 푸드트럭의 음식을 접할 수 있습니다. 
              	또한 리뷰와 코멘트를 통해 사업자와 사용자간의 소통의 창구를 이용하여 더욱 질 좋은 음식을 추구할 수 있습니다.</p>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-2.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">둘</span>
              <h3>사업자 관점의 이익</h3>
              <p>푸드트럭 사업자분들은 간편한 방식으로 주문하는 추가적인 손님들의 유입과 </p>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-3.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">셋</span>
              <h3>추구하는 가치</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 팀원 소개 파트 -->
    <div class="site-section bg-light">
      <div class="container">

        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">팀원소개</h2>
          </div>
        </div>

        <div class="slide-one-item home-slider owl-carousel">
          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_3_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>박세인</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;안녕하세요 @@@조의 Let Eat Go프로젝트를 총괄하는 박세인이라고 합니다. <br> 부족한 실력으로 구현해보았지만 좋게 봐주셨으면 감사하겠습니다.&rdquo;</p>
              </blockquote>
            </div>
          </div>
          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_2_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>이지연</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
            </div>
          </div>

          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_4_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>강보승</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
            </div>
          </div>

          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_5_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>유연성</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.&rdquo;</p>
              </blockquote>
            </div>
           </div>
           <div>
             <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_5_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>국푸름</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.&rdquo;</p>
              </blockquote>
            </div>
           </div>
           <div> 
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_5_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3" style="max-width: 200px;">
                <p>박영진</p>
              </figure>
              <blockquote style="font-size: 1rem;">
                <p>&ldquo;The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.&rdquo;</p>
              </blockquote>
            </div>
          </div>

        </div>
      </div>
    </div>
</section>
<!-- 메인 음식메뉴파트 hover이벤트 -->
  <<script type="text/javascript">
	  $(".popular-category").hover(function(){
		  var img = $(this).children().eq(0).children();
		  var imgName = img.attr("src").substring(img.attr("src").lastIndexOf('/')+1);
		  img.attr("src","${pageContext.request.contextPath }/resources/icon/hover"+imgName);
	  } ,
	  function(){
		  var img = $(this).children().eq(0).children();
		  var imgName = img.attr("src").substring(img.attr("src").lastIndexOf('/')+1).replace('hover','');
		  img.attr("src","${pageContext.request.contextPath }/resources/icon/"+imgName);
	  }
	  );
  </script>

<!-- 텍스트 타이핑 효과 script -->
  <script src="${pageContext.request.contextPath }/resources/js/typed.js"></script>
  
  <script>
            var typed = new Typed('.typed-words', {
            strings: ["FAST"," FRESH"," DELICIOUS", " VARIETY"],
            typeSpeed: 80,
            backSpeed: 80,
            backDelay: 4000,
            startDelay: 1000,
            loop: true,
            showCursor: true
            });
            </script>
  <script>
  	$(function(){
  		$(".site-navbar").css("background-color", "transparent");
  	})
  </script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>