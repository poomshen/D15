<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>
<!-- 지도표시 스크립트 -->
	<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=907df564dd90f479c37c43bccdbaa153"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨
			};
	
		var map = new daum.maps.Map(mapContainer, mapOption);
	 
		 // 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);
	
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		}); 
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
		var iwContent = '<div style="padding:5px;">KOSTA 129기 1조</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			,iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});
	
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>
</body>
</html>