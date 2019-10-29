<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="pageTitle" value="메인화면"/>
</jsp:include>

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
          </div>
        </div>
      </div>
    </div>  
<section id="content">
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">렛잇고만이 가능한 이유</h2>
            <p class="color-black-opacity-5">청년층에 가장 핫한 사업인 푸드트럭. </p>
          </div>
        </div>

        <div class="row align-items-stretch">
          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
            <a href="#" class="popular-category h-100">
              <span class="icon mb-3"><span class="flaticon-hotel"></span></span>
              <span class="caption mb-2 d-block">Hotels</span>
              <span class="number">4,89</span>
            </a>
          </div>
          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
            <a href="#" class="popular-category h-100">
              <span class="icon mb-3"><span class="flaticon-microphone"></span></span>
              <span class="caption mb-2 d-block">Events</span>
              <span class="number">482</span>
            </a>
          </div>
          <div class="col-6 col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
            <a href="#" class="popular-category h-100">
              <span class="icon mb-3"><span class="flaticon-flower"></span></span>
              <span class="caption mb-2 d-block">Spa</span>
              <span class="number">194</span>
            </a>
          </div>
      </div>
    </div>
    </div>
    
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">How It Works</h2>
            <p class="color-black-opacity-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-1.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">1</span>
              <h3>Decide What To Do</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-2.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">2</span>
              <h3>Find What You Want</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4">
            <div class="how-it-work-step">
              <div class="img-wrap">
                <img src="${pageContext.request.contextPath }/resources/images/step-3.svg" alt="Free website template by Free-Template.co" class="img-fluid">
              </div>
              <span class="number">3</span>
              <h3>Explore Amazing Places</h3>
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
                <img src="${pageContext.request.contextPath }/resources/images/person_3_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3">
                <p>Willie Smith</p>
              </figure>
              <blockquote>
                <p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
              </blockquote>
            </div>
          </div>
          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_2_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3">
                <p>Robert Jones</p>
              </figure>
              <blockquote>
                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
            </div>
          </div>

          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_4_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3">
                <p>Peter Richmond</p>
              </figure>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
            </div>
          </div>

          <div>
            <div class="testimonial">
              <figure class="mb-4">
                <img src="${pageContext.request.contextPath }/resources/images/person_5_sq.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid mb-3">
                <p>Bruce Rogers</p>
              </figure>
              <blockquote>
                <p>&ldquo;The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.&rdquo;</p>
              </blockquote>
            </div>
          </div>

        </div>
      </div>
    </div>
</section>

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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>