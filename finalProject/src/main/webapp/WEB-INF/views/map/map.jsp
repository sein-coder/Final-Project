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
    .wrap .info {width: 286px;height: 120px;border-radius:5px; border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
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
<body>
<!-- 지도를 표시할 div 입니다 -->

    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-8">
        <div class="col-md-2 text-center popular-category2" style="border:2px solid #f38181; color:#f38181">푸드트럭존
        <br>
         <c:forEach items="${zonelist}" var="zone">
        <br>
            <button type="button" class="btn btn-link" onclick="selectMap('${zone.addr}');">${zone.map_Zone}</button> 
		</c:forEach>    
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4524f2a578ce5b005f1a8157e72c3d3a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5360adbac3952b61ac35a4e1cc59e4c3&libraries=services"></script>
<script>
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
	}
}
var areas=[];
<c:forEach items="${zonelist}" var="zone">
var area = 
    {
        name : "${zone.map_Zone}",
        path : [
        	 new kakao.maps.LatLng("${zone.xcode1}", "${zone.ycode1}"),
             new kakao.maps.LatLng("${zone.xcode2}", "${zone.ycode2}"),
             new kakao.maps.LatLng("${zone.xcode3}", "${zone.ycode3}"),
             new kakao.maps.LatLng("${zone.xcode4}", "${zone.ycode4}")
        ],
        img : "${zone.img}",
        address :"${zone.addr}",
        address2 :"${zone.addr2}",
    }
;
areas.push(area);
</c:forEach>
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
/* var marker = new daum.maps.Marker({
     position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
}) */
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
                    '                <div><a href=""  class="link">축제더보기</a></div>' + 
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
function sample5_execDaumPostcode() {
	 if (document.getElementById("sample5_address").value == ''){
		 alert('위치를 입력해주세요. ex)강남');
	};
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	 var result = result[0];
        var coords = new kakao.maps.LatLng(result.y, result.x);
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


var positions=[];

$(function(){
	$.ajax({
		url : "http://openapi.seoul.go.kr:8088/757875684374706436365a78455477/json/foodTruckInfo/1/510/",
		type : "get",
		data : {
		},
		success : function(data){
			for(var i=0; i<40; i++){
			var geocoder = new kakao.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
			wtmX = data['foodTruckInfo']['row'][i]['XCODE'], // 변환할 WTM X 좌표 입니다
			wtmY = data['foodTruckInfo']['row'][i]['YCODE']; // 변환할 WTM Y 좌표 입니다
			
			geocoder.transCoord(wtmX, wtmY, transCoordCB, {
			input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
			output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
			})
			
			function transCoordCB(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				
				var position = 
			    {
			        title: data['foodTruckInfo']['row'][i]['NM'], 
			        latlng: new kakao.maps.LatLng(result[0].y, result[0].x),
			        img : "",
			        time : 	"",
			        phone : "12345"
			    };
					positions.push(position);
				console.log(positions[i]);
				 $.each(position,function(i,item){
			    // 마커를 변환된 위치에 표시합니다
			    var marker = new kakao.maps.Marker({
			        position: positions[i].latlng, // 마커를 표시할 위치입니다
			        map: map // 마커를 표시할 지도객체입니다
			    		})
				}); 
				
			    
			    
			    var content = '<div class="wrap">' + 
			    '    <div class="info">' + 
			    '        <div class="title">' + 
			    			position.title + 
			    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			    '        </div>' + 
			    '        <div class="body">' + 
			    '            <div class="img">' +
			    '                <img src="" width="73" height="70">' +
			    '           </div>' + 
			    '            <div class="desc">' + 
			    '                <div class="ellipsis">영업시간:</div>' + 
			    '                <div class="jibun ellipsis">전화번호:</div>' + 
			    '                <div><a href="" class="link">홈페이지</a></div>' + 
			    '            </div>' + 
			    '        </div>' + 
			    '    </div>' +    
			    '</div>';
			    
			    
			    var overlay = new kakao.maps.CustomOverlay({
				   	content: content,
				   	map: map,
				   	position: marker.getPosition()       
			   	});
			    
			    
			    function closeOverlay() {
			       	overlay.setMap(null);     
			     	}
			    
			    $.each(overlay,function(i,item){
			    	kakao.maps.event.addListener(marker, 'click', function() {
			    		overlay.setMap(map);
			    		}); 
			    });
			    
			    
					}
				}
			}
			
			/* for(var i=0; i<data['foodTruckInfo']['row'].length; i++){
				console.log(data['foodTruckInfo']['row'][i]['NM']+" : "+data['foodTruckInfo']['row'][i]['PERMISSION_NO']+" : "+
						data['foodTruckInfo']['row'][i]['XCODE']+" : "+data['foodTruckInfo']['row'][i]['YCODE']);			 			
			} */
		}
	});
});




/* //WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
geocoder.transCoord(wtmX, wtmY, transCoordCB, {
input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
}); */

/* //좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
function transCoordCB(result, status) {

// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {

    // 마커를 변환된 위치에 표시합니다
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
        map: map // 마커를 표시할 지도객체입니다
    })
}
} */


/* var positions=[];
<c:forEach items="${trucklist}" var="truck">
var position = 
    {
        title: '푸드트럭', 
        latlng: new kakao.maps.LatLng("${truck.XCode}","${truck.YCode}"),
        img : "",
        time : 	"${truck.map_Strart_Time}"+"~"+"${truck.map_End_Time}",
        phone : "12345"
    }
;
positions.push(position);
</c:forEach>
// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
     // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    var markers=[];
    var overlays=[];
    
    for(var i=0; i<positions.length; i++){
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
    '                <div class="ellipsis">영업시간:'+positions[i].time+'</div>' + 
    '                <div class="jibun ellipsis">전화번호:'+positions[i].phone+'</div>' + 
    '                <div><a href="" class="link">홈페이지</a></div>' + 
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
    }); */
   
</script>
            
            
    
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>