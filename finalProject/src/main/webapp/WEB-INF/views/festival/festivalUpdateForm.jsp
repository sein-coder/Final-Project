<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>


.pink-textarea textarea .md-textarea :focus :not([readonly])
{
	border-bottom:1px solid #f48fb1;
	box-shadow:0 1px 0 0 #f48fb1;
}
.active-pink-textarea.md-form label.active {
	color: #f48fb1;
}

.active-pink-textarea.md-form textarea.md-textarea:focus:not ([readonly]
	 )+label {
	color: #f48fb1;
}

.btn-click {
	display: block;
	width: 100px;
	height: 50px;
	border: 1px solid #222;
	border-radius: 5px;
	text-align: center;
}

textarea {
	width: 500px;
	height: 100px;
	/*   resize:none; */
	/*   resize: horizontal; */
	resize: vertical;
}
/* 등록,취소 버튼 */
/*  button.btn-enroll{
	background-color: #f23a2e;
	color:#FFF;
	
}*/
/* 해시태그  */
    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }

    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }
    ul#tag-list {
        padding: 16px 0;
    }

    ul#tag-list li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
    
 /* 해시태그  */
    ul li.tag-item {
        padding: 4px 8px;
        background-color: #fff;
        color: #f38181;
    }

    .tag-item:hover {
        background-color: #f38181;
        color: #fff;
    }
    ul#tag-list {
        padding: 16px 0;
    }

    ul#tag-list li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }

    
</style>
    <body>
    <section class="content">
	<div class="site-section" style="padding-top: 0px">
	  <!-- Page Content -->
	<div id="container">
	
		<form
			id="frm"
			action="${pageContext.request.contextPath}/festival/festivalUpdateFormEnd.do?festival_No=${festival.festival_No}"
			method="post"
			enctype="multipart/form-data">

			<div class="site-section pb-0">
				<div class="row">
					<!-- 새로운 뷰 -->
					<div class="container p-0 pr-auto pl-auto" style="background-color: white;">
						<div class="card col-md-12 pb-0" style="border: 3px solid #ffc9c9;">

							<div class="wrapper row" style="background-color: white;">
								<div class="preview col-md-5">

									<div class="preview-pic tab-content">
										<div class="tab-pane active" id="pic-1">
											<img alt="없음" width="400px" height="252px"
												src="${pageContext.request.contextPath}/resources/images/festival/${festival.festival_Thumbnail }">
											<!-- 썸네일 부분   -->
										<div class="pull-left ml-2 mt-2" style="display:inline;">
											<input type="file" value="파일 선택" name="upFile" id="upFile"/>
											<input type="hidden" name="festival_Thumbnail" value="${festival.festival_Thumbnail }">
										</div>
										
										</div>
									</div>
									<div style="margin-top: 10px; margin-bottom: 10px;"></div>

								</div>
								<div class="details col-md-7">
									<h3 class="product-title">
										<input id="festival_Title" name="festival_Title" type="text" value="${festival.festival_Title }" placeholder="00축제" >
									</h3>
									<div class="rating">
										<div class="stars">
											<span class="fa fa-star checked"></span> <span
												class="fa fa-star checked"></span> <span
												class="fa fa-star checked"></span> <span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</div>

									</div>
									<p class="product-description" />

									<div>
										<textarea name="festival_Content" id="festival_Content" cols="40"
											rows="40" placeholder="축제 내용을 입력하세요">${festival.festival_Content }</textarea>
										<br> <span class="txsub">남은글자수 : <input size="5"
											style="background-color: white; border: 0px solid white"
											type="text" readonly disabled value="4000" name="counter"
											id="counter"></span>
									</div>
									
									<br>
									<div style="display: inline-block">
										<div class="content-tag">
											<ul class="p-0" id="tag-list">
											</ul>
											<input type="text" id="tag" size="7" placeholder="태그입력" />
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="container p-0">
					<div class="col-md-12  mt-0 pt-0"
						style="border: 3px solid #ffc9c9; border-top: 0px solid white;">

						<!-- 더 보기 버튼 생성  -->

						<input value="상세설명" class="btn btn-danger pl-0 pr-0 btn-block"  style="background-color: #f38181; border: none;"
							readonly="readonly" />
						<div
							class="btn btn-default btn-pressure btn-sensitive col-md pl-10 pr-8 mt-6"
							style="padding-left: 0; padding-right: 0;">

							<!-- 내용 추가 부분  -->

							<table class="table" style="margin: auto; text-align: left">
								<tr>
									<td scope="row">
										<div class="alert alert-danger1">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">시 작 일</a> <strong>:</strong>
											<input id="festival_StartDate" name="festival_StartDate" type="date" value=${festival.festival_StartDate} />
										</div>
									</td>
									<td>
										<div class="alert alert-danger2">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">종 료 일</a> <strong>:</strong>
											<input id="festival_EndDate" name="festival_EndDate" type="date" value=${festival.festival_EndDate} />
										</div>
									</td>
								</tr>
								<tr>
									<td scope="row">
										<div class="alert alert-danger3">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">전화번호</a> <strong>:</strong>
											<input type="tel" id="festival_Phone" name="festival_Phone"  value="${festival.festival_Phone}"
												pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
										</div>
									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">홈페이지</a> <strong>:</strong>
											<input type="url" id="festival_Homepage" name="festival_Homepage" value="${festival.festival_Homepage}">

										</div>
									</td>
								</tr>
								<tr>
									<td scope="row">
										<div class="alert alert-danger4" style="display: inline-block">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 소</a> <strong>:</strong> <input
												type="text" name="festival_Address" id="festival_Address" value="${festival.festival_Address}" >
										</div>

									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 최</a> <strong>:</strong> <input
												type="text" name="festival_Host" id="festival_Host" value="${festival.festival_Host}" >
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">주 관</a> <strong>:</strong> <input
												type="text" name="festival_Sub" id="festival_Sub" value="${festival.festival_Sub}">
										</div>
									</td>
									<td>
										<div class="alert alert-danger4">
											<a class="btn btn-xs btn-danger pull-right"
												style="background-color: #fff;">이용요금</a> <strong>:</strong>
											<input type="text" name="festival_Price" id="festival_Price" value="${festival.festival_Price}" >
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="site-navbar" style="background-color: white; justify-content: center;">
				<nav class="site-navigation position-relative text-center" role="navigation">
					<ul class=" justify-content-center">
						<li class="list-inline-item">

							<input type="submit" href="#" value="저장"  style="background-color: #f38181;border-color: #f38181;">
						</li>
						<li class="list-inline-item">
							<button class="btn-cancel" type="button" onclick="btn-cancel();" style="background-color: #f38181; border-color: #f38181; " >
								<span>취소</span>
							</button>
						</li>
					</ul>
				</nav>
			</div>
		</form>
	</div>
	</div>

	
	</body>
		
	<script>
		
	/*글자 수 제한*/
			$('#festival_Content').keyup(function (e){
	      var content = $(this).val();       
	      $('#counter').val(4000-content.length);
	
	          if(content.length > 4000) {
	            $(this).val($(this).val().substring(0, 4000));
	          }
	      });
	</script>
	<script>
	/* 해시태그 */
	//해시태그 기능
		
        var tag = {};
        var counter = 0;

        // 태그를 추가한다.
        function addTag (value) {
            tag[counter] = value; // 태그를 Object 안에 추가
            counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
        }
        
        $("#tag").on("keypress", function (e) {
            // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
            if (e.key === "Enter" || e.keyCode == 32) {
                var tagValue = $(this).val(); // 값 가져오기
                // 값이 없으면 동작 ㄴㄴ
                if (tagValue !== "") {
                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    })
                    // 태그 중복 검사
                    if (result.length == 0) { 
                        $("#tag-list").append("<li class='tag-item'>"+"#"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        $(this).val("");
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            }
        });
        </script>
        <script>
        // 해시 태그 삭제 버튼 
        // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
        $(document).on("click", ".del-btn", function (e) {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
        
        function submit(){
			var tags = "";
			
			for(var i=0; i<counter; i++){
				if(i==counter-1){
					tags += tag[i];
				}
				else if(tag[i] != "") {
					tags += tag[i] + ",";											
				}
			}
			$("#festival_Hashtag").val(tags);
			$("#frm").submit();
			return true;
        };
        </script>
    	<script>
    	/* 태그 불러오기 */
    	 	var tag = '${festival.festival_Tag}'.split(",");
    	 	var lastT= '${festival.festival_Tag}'.split(",").length;

     		$(document).ready(function(){
    	 		
    	 		for(var count=0; count<lastT;){
    	 				
    	 		$('ul#tag-list').append("<li class='tag-item p-0'>"+"#"+tag[count]+"</li>");
    	 			count++;
    	 		}
    	 	}); 
        </script>
        
        <script>
        /* 각 input 태그 체크이벤트  */

        $("input").change(function(){
        	if($(this).val()!="" && $(this).attr("id")!='tag'){
        		var img = "<img src='https://img.icons8.com/cotton/2x/like--v3.png' alt='check' width='100px' height='100px'/>"
        		$(this).parent().append(img);
        	}
        });
		</script>
    	<script>
		/* 썸네일 사진 */
		 $('#upFile').on('change',function (e) {
		        var get_file = e.target.files;
		 
		        var image = $("#pic-1").children();
		        var reader = new FileReader();
		        
		        reader.onload = (function (aImg) {
		            console.log(1);
		            return function (e) {
		                console.log(3);
		                aImg.attr("src",e.target.result);
		                aImg.attr({"width":"400px","height":"252px"});
		            }
		        })(image)
		 
		        if(get_file){
		            reader.readAsDataURL(get_file[0]);
		            console.log(2);
		        }
		    });
		</script>
		<script>
		/* 취소버튼 */
		 $('.btn-cancel').on("click",function(){
        	location.href = "${pageContext.request.contextPath }/festival/festivalList";
	    });
		</script>
		
		
	</script>
</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    
    
    
    
    