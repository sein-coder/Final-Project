<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>LetEatGo●푸드트럭의 모든 것</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/audiostyle.css">

<link rel="shortcut icon"
   href="${pageContext.request.contextPath }/resources/images/favicon-32x32.png">

<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
   rel="stylesheet">

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/aos.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/rangeslider.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/style.css">
</head> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4524f2a578ce5b005f1a8157e72c3d3a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5360adbac3952b61ac35a4e1cc59e4c3&libraries=services"></script>
 <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
    </script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>

   <div class="site-wrap">
      <div class="site-mobile-menu">
         <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
               <span class="icon-close2 js-menu-toggle"></span>
            </div>
         </div>
         <div class="site-mobile-menu-body"></div>
      </div>
      <header class="site-navbar" role="banner">

         <div class="container">
            <div class="row d-flex justify-content-end">

               <div class="wrap">
                  <audio id="audio"
                     src="${pageContext.request.contextPath }/resources/music/Let It Go.mp3"></audio>

                  <div class="player paused">

                     <div class="progress-bar">
                        <div class="runner"></div>
                     </div>
                     <div class="album-art">
                        <div class="cover"></div>
                     </div>

                     <div class="description align-middle">Let It Go</div>

                     <div class="visualizer">
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                     </div>

                     <div class="play-button">
                        <div class="lp-background"></div>
                        <i class="mdi mdi-play"
                           style="position: absolute; top: 15%; right: 9%;"></i> <i
                           class="mdi mdi-pause"
                           style="position: absolute; top: 16%; right: 10%;"></i>
                     </div>

                     <div class="time-indicator">
                        <i class="mdi mdi-clock"></i> <span class="time">03:39</span>
                     </div>

                  </div>

               </div>
            </div>

            <div class="row align-items-center">
               <div class="col-11 col-xl-3">
                  <a href="${pageContext.request.contextPath }"> <img
                     src="${pageContext.request.contextPath }/resources/images/logo.png"
                     class="img-fluid" />
                  </a>
               </div>
               <div class="col-12 col-md-9 d-none d-xl-block">
                  <nav class="site-navigation position-relative text-right"
                     role="navigation">
                     <ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
                        <li class="active"><a href="${pageContext.request.contextPath }"><span>Home</span></a></li>
                        <!-- nav-bar 메뉴부분 -->
                        <c:if test="${not empty loginMember && type == 'partner' }">
	                        <li><a href="${pageContext.request.contextPath }/accountBook/accountBookView?partner_No=${loginMember.partner_No}"><span>장부관리</span></a></li>
                        </c:if>
                        <c:if test="${empty loginMember || type != 'partner' }">
                        	<li><a href="${pageContext.request.contextPath }/order"><span>주문하기</span></a></li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath }/map"><span>푸드트럭존 찾기</span></a></li>
                        <li><a href="${pageContext.request.contextPath }/festival/festivalList" style="font-family: BinggraeMelona !important;"><span>축제알리미</span></a></li>
                        <c:if test="${empty loginMember }">
                           <li>
                              <button type="button" id="login"  class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal">로그인</button>
                           </li>
                           <li>
                           	  <button id="regist" class="btn btn-outline-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnrollEnd'">회원가입</button>
                           </li>
                        </c:if>
                        <c:if test="${not empty loginMember }">
                           <c:if test="${ type == 'member' && loginMember.member_Id ne 'admin'  }">
                        <li><a id="memberPage" href="${pageContext.request.contextPath }/memberPage?Member_Id=${loginMember.member_Id}"><span>고객 페이지</span></a></li>
                           </c:if>
                           <c:if test="${ type == 'partner' }">
                        <li><a href="${pageContext.request.contextPath }/partnerPage?Partner_Id=${loginMember.partner_Id}"><span>사업자 페이지</span></a></li>   
                           </c:if>
                           <c:if test="${ type == 'member' && loginMember.member_Id == 'admin' }">
                        <li><a href="${pageContext.request.contextPath }/adminPage?Member_Id=${loginMember.member_Id}"><span>관리자 페이지</span></a></li>   
                           </c:if>
                        <li><button class="btn btn-outline-primary"
                              type="button"
                              onclick="weblogout();">로그아웃</button></li>         
                        </c:if>
                     </ul>
                  </nav>
               </div>
               <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
                  style="position: relative; top: 3px;">
                  <a href="#" class="site-menu-toggle js-menu-toggle text-white">
                     <span class="icon-menu h3"></span>
                  </a>
               </div>
            </div>
         </div>
      </header>

      <!-- 모달창 -->
      <div class="modal fade" id="myModal" style="z-index:3000;">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header text-center" style="display: table;">
                  <h4 class="modal-title">로그인</h4>
               </div>

               <!-- Modal body -->
               <div class="modal-body">
                  <div class="container">
                     <div class="row">
                        <div class="col">
                           <ul class="nav nav-tabs nav-justified">
                              <li class="nav-item"><a class="nav-link active"
                              data-toggle="tab" href="#member_log" onclick="openkakao();">사용자</a></li>
                              <li class="nav-item"><a class="nav-link"
                              data-toggle="tab" href="#partner_log" onclick="closekakao();">사업자</a></li>   
                           </ul>
                           <div class="tab-content">
                              <div class="tab-pane fade " id="partner_log">
                                 <form class="form" id="frm" action="${pageContext.request.contextPath}/partner/partnerLogin.do" method="POST" onsubmit="return reCapchar();">
                                    <div class="form-group">
	                                    <input class="form-control" type="text" placeholder="아이디" name="partner_Id" /> 
	                                    <input class="form-control" type="password" placeholder="비밀번호" name="partner_Password" />
	                                    <input class="form-control btn btn-outline-primary" type="submit" class="btn btn-outline-primary" value="로그인" />
                                    </div>
                                 </form>
                              </div>
                              <div class="tab-pane fade show active" id="member_log">
                                 <form action="${pageContext.request.contextPath}/member/memberLogin.do" method="POST" class="form" onsubmit="return reCapchar();">
                                    <div class="form-group">
	                                   <input class="form-control" type="text" placeholder="아이디" name="member_Id" /> 
	                                   <input class="form-control" type="password" placeholder="비밀번호" name="member_Password" />
                                   	</div>
                                   	<div class="form-group row">
	                                    <a class="col-md-6" id="kakao" onclick="kakao();" style="cursor:pointer">
	                                    	<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="240"/>
	                                    </a>
                  						<input type="submit" class="btn btn-primary col-md-6" value="로그인" />
                                   	</div>
                                 </form>
                                 <div></div>
                              </div>
                           </div>
                            <div class="tmp-set-nav col-*-12 mb-2">
						        <ul class="nav nav-pills" >		          
						        	<li><a href="${pageContext.request.contextPath }/findIp">아이디/비밀번호찾기</a></li>
						            <li style="border-left: 2px solid #ddd; margin-left: 1em; padding-left: 1em;"><a href="${pageContext.request.contextPath }/member/memberEnrollEnd">회원가입</a></li>
						        </ul>
						    </div>
                           
                            <div id="html_element" style="margin: 0 auto;display: table;"></div>
                             <script type="text/javascript">
                               var onloadCallback = function() {
                                 grecaptcha.render('html_element', {
                                   'sitekey' : '6LcTHL0UAAAAAEkwWVCn3v37_ufKUIWC6rIZ7_LT'
                                 });
                               };
                               function reCapchar() {
                                  if (typeof (grecaptcha) != 'undefined') {
                                       if (grecaptcha.getResponse() == "") {
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
                  <button class="col-md-12 btn btn-outline-info" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
   </div>
		<script type="text/javascript">
			 var name= sessionStorage.getItem('name');
			var token=sessionStorage.getItem('token');
			var id=sessionStorage.getItem('id');
			var email=sessionStorage.getItem('email');
			var gender=sessionStorage.getItem('gender');
			var birthday=sessionStorage.getItem('birthday');
			
			Kakao.init('4524f2a578ce5b005f1a8157e72c3d3a');
			 function kakao() {
			      Kakao.Auth.loginForm({
			    	  scope: "account_email,birthday,gender",
			        success: function(authObj) {
			        	Kakao.API.request({
			 		       url: '/v2/user/me',
			 		       success: function(res) {
			 		    	  Kakao.Auth.setAccessToken(Kakao.Auth.getAccessToken(), true);
					    	   if(JSON.stringify(res.kakao_account["email"])!=null){
					    	   var name=res.properties['nickname'];
					    	   var token=authObj.access_token;
					    	   var id=res.id;
					    	   var email=JSON.stringify(res.kakao_account["email"]);
					    	   var gender=JSON.stringify(res.kakao_account["gender"]);
					    	   var birthday=JSON.stringify(res.kakao_account["birthday"]);
					    		 sessionStorage.setItem('name', name);
					    		sessionStorage.setItem('token', token);
					    		sessionStorage.setItem('id', id);
					    		sessionStorage.setItem('email', email);
					    		sessionStorage.setItem('gender', gender);
					    		sessionStorage.setItem('birthday', birthday); 
					    		location.href="${pageContext.request.contextPath}/kakao?email="+email+"&gender="+gender+"&id="+id;
					    	   }else{
					    		   alert("이메일 동의해주십시오.");
					    	   }
			 		      }
				       })
			        },
			        fail: function(err) {
			          alert(JSON.stringify(err));
			        }
			      });
			    }; 
		     
		     function weblogout() {
		    	 Kakao.Auth.logout(function(){
		    		 sessionStorage.clear();
					 location.href='${pageContext.request.contextPath}/Logout.do';
 		    		 });
			}
		     function openkakao() {
		    	 document.getElementById('kakao').style.display = 'block';
				}
           	function closekakao() {
           		 document.getElementById('kakao').style.display = 'none';
			}
			</script>

   <script type="text/javascript"
      src="https://www.gstatic.com/charts/loader.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

   <!-- hover event 추가 -->
   <script>
      $(function() {
         $("nav>ul>li").hover(function() {
            $(this).addClass("active");
         }, function() {
            $(this).removeClass("active");
         })
         
         $('.lp-background').css('background-image', 'url(${pageContext.request.contextPath}/resources/music/lp.png)');
      });
   </script>

   <!-- 바꾸고, 마커변경하는거, 경로안내 -->
   <script type="text/javascript">
      function permissionAPI(){
         console.log("api실행")
         $.ajax({
            url : "http://openapi.seoul.go.kr:8088/757875684374706436365a78455477/json/foodTruckInfo/1/510/",
            type : "get",
            data : {
            },
            success : function(data){
               for(var i=0; i<data['foodTruckInfo']['row'].length; i++){
                  console.log(data['foodTruckInfo']['row'][i]['NM']+" : "+data['foodTruckInfo']['row'][i]['PERMISSION_NO']+" : "+
                        data['foodTruckInfo']['row'][i]['XCODE']+" : "+data['foodTruckInfo']['row'][i]['YCODE']);                  
               }
               
               for(var i=0; i<data['foodTruckInfo']['row'].length; i++){
                  console.log(data['foodTruckInfo']['row'][i]['NM']+" : "+data['foodTruckInfo']['row'][i]['XCODE']+","+data['foodTruckInfo']['row'][i]['YCODE']);                  
               }
            }
         });
      }
   </script>

   <script
      src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

   <script src="${pageContext.request.contextPath }/resources/js/audio.js"></script>

   <script>   
   
   $('.player').click(function() {
        if ($("#audio")[0].paused == false) {
           $("#audio")[0].pause();
        } else {
           $("#audio")[0].play();
        }
      });
   </script>