<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body { 
	height: 100%; 
	margin: 0; 
	padding: 0; 
}

#map {
	width: 800px;
	height: 100%;
	margin: 0 auto;
	overflow: hidden;
}

#header {
	align-items: center;
	position: fixed;
	top: 0;
    right: 0;
    left: 0;
	background: #fff;
	z-index: 20;
	position: relative;
    width: 100%;
    max-width: 76.8rem;
/*     height: 4.4rem; */
    margin: 0 auto;
    border-bottom: none;
   /*  font-size: 1.7rem; */
    display: flex; 
}

#x {
	width: 45%;
}

#x button {
	position: relative;
    left: 100px;
    bottom: 5px;
    font-size: 30pt;
}

#btn {
	right: 100px;
    top: 10px;
    position: absolute;
}

#btn button{
	position: relative;
	    top: 10px;
}

button {
	border: none;
	text-transform: none;
	background: none;
}

.bAddr {
	padding:5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	font-size : 10pt;
}

.wrap {
    display: block;
    background: #50627F;
    font-size : 10pt;
    color: #fff;
    text-align: center;
    width : 250px;
    height: 50px;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
    position: relative;
}

.info_title {
	border-radius: 4px;  
	font-weight : bold;
	position: relative;
    margin: 0 auto;
    border-bottom: 1px solid lightgrey;
}
 
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26152d095dcbd98e75d86172615ba45b&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
window.onload = function() {
	var position = new daum.maps.LatLng(${param.lat}, ${param.lon});  
	//위도, 경도
	var container = document.getElementById("map"); //지도를 표시할 div영역
	var options = {
			center : position, //지도의 위치
			level : 2 //지도를 얼마나 확대해서 보여줄 건지 레벨
			
	};
	var map = new daum.maps.Map(container, options)//지도 생성

	//마커 생성
	var marker = new daum.maps.Marker({
		position: position //지도 중심 좌표에 마커 생성.
	});
	marker.setMap(map);//마커 표시
	
	marker.setDraggable(true); //마커를 드래그 할 수 있게끔 하기
	

	// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
    // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
	kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

	function displayMarker() {
	    
	    // 마커의 위치를 지도중심으로 설정합니다 
	    marker.setPosition(map.getCenter()); 
	    marker.setMap(map); 

	}
	
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1});// 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
 	var content = '<div class="wrap">' + 
     '    <div class="info">' + 
    '        <div class="info_title">' + 
    '            현재위치' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="desc">' + 
    '                <div class="addr">제주특별자치도 제주시 첨단로 242</div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>'; 
    
    infowindow.setContent(content);
    infowindow.open(map, marker);

	
	//클릭했을 때 주소 내보내기
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
	
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});
}

function searchDetailAddrFromCoords(coords, callback) {
	//주소 - 좌표 변환 객체
	var geocoder = new kakao.maps.services.Geocoder();
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}



</script>
</head>
<body>

	<div id="header">
		<div id="x">
			<button>x</button>
		</div>
		<h3>지도로 위치 지정</h3>
		<div id="btn">
			<button><img width="30px" height="30px" src="//yaimg.yanolja.com/joy/sunny/static/images/btn-home-v7.svg" alt="홈"></button>
		</div>
	</div>

<div id="map"></div>

</body>
</html>