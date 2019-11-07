<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<style>
    
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
     .popular-category2 {
  background: #fff;
  display: block;
  text-align: center;
  padding: 30px 10px;
  border-radius: 7px;
  background: #f8f9fa;
  position: relative;
  top: 0;
  -webkit-transition: .3s all ease-in-out;
  -o-transition: .3s all ease-in-out;
  transition: .3s all ease-in-out; }
.popular-category2:hover {
    -webkit-box-shadow: 0 5px 30px -5px rgba(243, 129, 129, 0.5);
    box-shadow: 0 5px 30px -5px rgba(243, 129, 129, 0.5); }
</style>
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-8">
        <div class="col-md-2 text-center popular-category2" style="border:2px solid #f38181; color:#f38181">푸드트럭존
        <br><br>
           <button type="button" class="btn btn-link" onclick="selectMap('밤도깨비야시장');">밤도깨비야시장</button>
         <br>
        
        </div>
          <div class="col-md-10 text-center border-primary">
           <!--  -->         
          <div class="col-md-8 offset-md-2  input-group mb-3 ">
           <input type="text" id="sample5_address" placeholder="주소" class="col-md-10 form-control"  placeholder="Search">
             <button class="col-md-2 btn btn-success icon icon-search" onclick="sample5_execDaumPostcode()"></button>
         </div>
         
                  <br>
         <div id="map" style="width:100%;height:350px;"></div>
         <!--  -->
          </div>
        </div>

    </div>
    </div>        
    ${list}
    ${maplist }
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4524f2a578ce5b005f1a8157e72c3d3a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5360adbac3952b61ac35a4e1cc59e4c3&libraries=services"></script>
<script>
var areas = [
    {
        name : "밤도깨비야시장",
        path : [
            new kakao.maps.LatLng(37.529926643009404, 126.92855255749603),
             new kakao.maps.LatLng(37.53101780323109, 126.93013825488057),
             new kakao.maps.LatLng(37.53145869361855, 126.92913092363709),
             new kakao.maps.LatLng(37.53054768712616, 126.92749131788898)
        ],
        img : "http://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=18679&fileTy=MEDIA&fileNo=1&thumbTy=L",
        address :    "서울 영등포구 여의동로 330<br>여의도한강공원 물빛광장",
        address2 : "(우)07337(지번)여의도동 84-9",
        page : ""
    }
];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5306475369695   ,126.928706300305), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
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

for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
}

function displayArea(area) {

    // 다각형을 생성합니다 
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: area.path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7 
    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + area.name + '</div>');
        
        customOverlay.setPosition(mouseEvent.latLng); 
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
/*         customOverlay.setPosition(mouseEvent.latLng);  */
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다 
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    }); 

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
                    
                    var content = '<div class="wrap">' + 
                    '    <div class="info">' + 
                    '        <div class="title">' + 
                                area.name + 
                    '            <div class="close" onclick="closeOverlay1()" title="닫기"></div>' + 
                    '        </div>' + 
                    '        <div class="body">' + 
                    '            <div class="img">' +
                    '                <img src="'+area.img+'" width="73" height="70">' +
                    '           </div>' + 
                    '            <div class="desc">' + 
                    '                <div class="ellipsis">'+area.address+'</div>' + 
                    '                <div class="jibun ellipsis">'+area.address2+'</div>' + 
                    '                <div><a href="'+area.page+'" target="_self" class="link">축제더보기</a></div>' + 
                    '            </div>' + 
                    '        </div>' + 
                    '    </div>' +    
                    '</div>';

         infowindow.setContent(content);  
        infowindow.setPosition(mouseEvent.latLng); 
        infowindow.setMap(map);
    });
}
function closeOverlay1() {
   infowindow.setMap(null);     
}


function selectMap(str) {
var callback = function(result, status) {
   if (status === kakao.maps.services.Status.OK) {
       var result = result[0];
       console.log(result);
       var coords = new kakao.maps.LatLng(result.y, result.x);
       console.log(result.y+" "+result.x);
       map.relayout();
       map.setCenter(coords);
   }
};
places.keywordSearch(str, callback);
}

function sample5_execDaumPostcode() {
    if (document.getElementById("sample5_address").value == ''){
       alert('위치를 입력해주세요. ex)강남');
   };
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var result = result[0];
        console.log(result);
        var coords = new kakao.maps.LatLng(result.y, result.x);
        console.log(result.y+" "+result.x);
        //mapContainer.style.display = "block";
        map.relayout();
        // 지도 중심을 변경한다.
        map.setCenter(coords);
        // 마커를 결과값으로 받은 위치로 옮긴다.
        /* marker.setPosition(coords) */
    }
    
};
places.keywordSearch(document.getElementById("sample5_address").value, callback);
}
var xcode=0;
var ycode=0;

function geoCoderMaker(data){
   
   console.log(data);
   //WTM 좌표를 WGS84 좌표계의 좌표로 변환한다
   
   
   // 마커 이미지의 이미지 주소입니다
   var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
     // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    var markers=[];
    var overlays=[];
    var dataCount=0;
    
   var geocoder;
   var callback2;
   var position;
   var positions=[];
   var vtitle;
      geocoder = new kakao.maps.services.Geocoder();
      
      for(var i=0;i<data.length;i++){
         wtmX = data[i]['xcode'];
         wtmY = data[i]['ycode'];
         vtitle = data[i]['nm'];
         console.log(wtmX+":"+wtmY+":"+vtitle);
         geocoder.transCoord(wtmX, wtmY, function(result, status){
        	 
            xcode=result[0].x;
             ycode=result[0].y;
             
        	 console.log(xcode);
        	 console.log(ycode);
            position={
                    latlng: new kakao.maps.LatLng(xcode,ycode),
                    img : "data:image/jpeg;base64,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",
                    time :    "09:00~21:00",
                    phone : "12345",
            }
            makerTest(position,result[0].x,result[0].y);         
         }, {
            input_coord: kakao.maps.services.Coords.WTM,
            output_coord: kakao.maps.services.Coords.WGS84
         });
      }


       
       function makerTest(position,x,y){
          console.log(x);
          console.log(y);
          if(dataCount<data.length){
             position.title=data[dataCount++].nm;
          }
          console.log(position);
          console.log(map);
           var maker = new kakao.maps.Marker({
               map: map, // 마커를 표시할 지도
               position:new kakao.maps.LatLng(y,x) , // 마커를 표시할 위치
               title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
               image : markerImage // 마커 이미지 
           });   
       
           
          var content = '<div class="wrap">' + 
          '    <div class="info">' + 
          '        <div class="title">' + 
                   position.title + 
          '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
          '        </div>' + 
          '        <div class="body">' + 
          '            <div class="img">' +
          '                <img src="'+position.img+'" width="73" height="70">' +
          '           </div>' + 
          '            <div class="desc">' + 
          '                <div class="ellipsis">영업시간:'+position.time+'</div>' + 
          '                <div class="jibun ellipsis">전화번호:'+position.phone+'</div>' + 
          '                <div><a href="${pageContext.request.contextPath}/foodTruck" target="_self" class="link">홈페이지</a></div>' + 
          '            </div>' + 
          '        </div>' + 
          '    </div>' +    
          '</div>';

          var overlay = new kakao.maps.CustomOverlay({
               content: content,
               map: map,
               position: maker.getPosition()       
            });
          overlays.push(overlay);
          
          /* kakao.maps.event.addListener(markers[i], 'click', function() {
             overlays[i].setMap(map);
             }); */
             
          overlay.setMap(null);
          
         kakao.maps.event.addListener(maker, 'click', function() {
            overlay.setMap(map);
         });
         console.log(maker);
       }
   function closeOverlay(e) {
         console.log(e);
         $.each(overlays,function(i,item){
            if(e==item.getContent)
               item.setMap(null);
         })
   } 
   }
   $(function(){
      $.ajax({
         url:"${path}/mapPosition",
         success:function(data){
            geoCoderMaker(JSON.parse(data));
            console.log(map);
         }
      });
   });
   
</script>
            
            
    
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>