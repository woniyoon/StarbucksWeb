<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style type="text/css">

		nav#sub_nav {
		    display: flex;
		    justify-content: flex-end;
		    width: 50%;
		    margin: 30px auto;
		}
		
		ul.order_progress li {
		    display: table-cell;
		    vertical-align: middle;
		    height: 50px;
		    min-width: 80px;
		    background-color: white;
		    color:black;
		    border: 1px solid lightgrey;
		    margin: 0;
		    text-align: center;
		}
		
		ul.order_progress {
		    display: table;
		    margin: 0 auto;
		    /* justify-content: center; */
		    padding-inline-start: 0px;
		}
		
		/* 매장 검색 */
		section {
		    margin: 30px auto;
		    width: 100%;
		    height: auto;
		    padding-bottom: 3rem;
		}
		
		#map_container {
		    display: flex;
		    width: 80vw;
		    height: 70vh;
		    margin: 50px auto;
		    border: 1px solid rgb(21, 21, 44);
		}
		
		#search_section {
		    /* border: 5px solid red; */
		    flex: 1;
		    display: flex;
		    flex-direction: column;
		}
		
		/* #search_bar {
			flex: 1;
		    height: 50px;
		    box-sizing: content-box;
		    width: -webkit-fill-available;
		    padding: 0;
		    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
		    background-repeat: no-repeat;
		    background-position: right;
		}
		
		#store_locations {
			flex: 7;
		    width: -webkit-fill-available;
		    height: 100%;
		    border: 2px solid purple;
		    list-style-type: none;
		    padding: 0;
		    border-collapse: collapse;
		    overflow-y: auto;
		}
		
		table, tr, th, td, thead, tbody {
		    border-collapse: collapse;
		   	width: -webkit-fill-available;
		}
		
		#store_locations th { 
		    position: sticky; top: 0;
		    background-color: rgb(179, 179, 179);
		    height: 3em;
		}
		
		#store_locations td {
		    height: 4em;
		    padding: 10px;
		    border: 1px solid grey;
		} */
		
		/* .store_row {
			display: flex;
			flex-direction: row;
			cursor: pointer;
		}
		
		.store_detail {
			flex: 7;
			display: flex;
			flex-direction: column;
		}
		
		.store_detail > strong {
			font-size: 14pt;
			font-weight: bold;
			padding: 0 0 5px 0;
		}
		
		.store_row > img {
			max-width: 100%;
		} */
		
/* 		#map_section {
		    border: 5px solid #006633;
		    flex: 1;
		} */
		
		#map {
		    flex: 1;
		}
		
		.store_info {
			border: none;
			width: 200px;
			height: 120px;
			
		}
		
		.store_info_header {
			width: 100%;
			height: 20%;
			background-color: #8c8279;
			color: white;
			padding: 5px;
			box-sizing: border-box;
		}
		
		.store_info_body {
			box-sizing: border-box;
			padding: 5px;
		}
		
		.select_btn {
			background-color: #222;
			color: white;
			display: inline-block;
			border-radius: 5px;
			padding: 5px;
			margin: 0 10px 0 0;
		}
		
		.select_btn:hover {
			text-decoration: underline;
			cursor: pointer;
		}
		
		#selected_store_container {
			margin: 60px auto;
			border: 1px solid red;
			font-size: 20pt;
			display: none;
		}
		
/* 		#option_viewer {
			position: fixed;
			height: 10%;
			width: 15%;
			border-radius: 10px;
			background-color: #006633;
			color: white;
			display: none;
		}
		 */
		
		/* 페이지 이동 버튼 */
		
		.move_button {
		    width: 100px;
		    height: 50px;
		    margin: 0 5px 0 5px;
		    background-color: #f4f4f2;
		    border: none;
		    border-radius: 3px;
		    box-shadow: 1px 1px 1px 0 #b6b6b65a, 0 1px 1px 0 rgba(155, 155, 155, 0.337);
		}
		
		button#next {
		    background-color: #006633;
		    color: #fff;
		}
		
		/* section 끝 */
		
		#snackbar {
		    visibility: hidden;
		    min-width: 250px;
		    margin-left: -125px;
		    background-color: #006633;
		    color: #fff;
		    text-align: center;
		    border-radius: 2px;
		    padding: 16px;
		    position: fixed;
		    z-index: 1;
		    left: 50%;
		    bottom: 50px;
		    font-size: 17px;
		}
					
    </style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7fa563027be4561a627edb8c3c2821f"></script>
<script type="text/javascript">


var store_id = "";    

$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);
    console.log(current_state);

    // 현재 진행중인 프로세스에 따라 상태옵션 색 변경
    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());
    
    var usesOwnLocation = confirm("현재 위치를 이용하겠습니까?");
    
    var coordinates = { // 디폴트 위치
    	"lat":33.450701, 
    	"lng":126.570667
    };
    
    var container = document.getElementById('map');
    var options = { 
    		center: new kakao.maps.LatLng(coordinates.lat, coordinates.lng),
    		level: 3,
    };
    
    var map = new kakao.maps.Map(container, options); 
    	
    
//    var rect = container.getBoundingClientRect();
//    console.log("rect.right : " + rect.right);
//    console.log("rect.bottom : " + rect.bottom);
//    
//    var height = $("div#test").css("height");
//    var width = $("div#test").css("width");
//        
//    $("div#test").css({"z-index": 1000, "left": rect.right - 380 , "top": rect.bottom - 140 });

    
	var positionArr = [];
    
    $.ajax({ 
		url: "/StarbucksWeb/location.sb",
		async: false,
		dataType: "json",
		success: function(json){ 
			
			$.each(json, function(index, item){ 
				var position = {}; // position 이라는 객체 생성
				
				if(navigator.geolocation && usesOwnLocation) {
				    
				    navigator.geolocation.getCurrentPosition(function(position) {
			            
			            var lat = position.coords.latitude, // 위도
			                lon = position.coords.longitude; // 경도
			            
			            console.log(lat, lon);
			
			            var position = new kakao.maps.LatLng(lat, lon);
			
					    map.setCenter(position);					

			        });
				    
				} else if(!usesOwnLocation && index == 5) {
					var locPosition = new kakao.maps.LatLng(item.latitude, item.longitude);     
				    map.setCenter(locPosition);	
				} 			    
				
				console.log(item);
				
				// 마커 위에 나타낼 인포 element 만들기
				position.content = "<div class='store_info' id='store_info"+item.store_id+"'>"+ 
					        	   "  <div class='store_info_header' align='left'>"+ 
							       "    <strong>"+item.store_name.substring(5)+"</strong>"+  
							       "  </div>"+
							       "  <div class='store_info_body'>"+  
							       "    <span class='address'>"+item.address+"</span>"+ 
							       "  </div>"+ 
							       " <div align='right'><div class='select_btn' id='"+item.store_id+"' onclick='selectLocation(this)'>선택</div></div>"+
							       "<input id='store_name"+item.store_id+"' type='hidden' value='"+item.store_name.substring(4)+"'/>"
							       "</div>";
				
				position.latlng = new kakao.maps.LatLng(item.latitude, item.longitude);
				position.zIndex = item.zIndex;
				
				positionArr.push(position);
	       
			});					
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    }
		
	});
    
 
    
 // 인포윈도우를 가지고 있는 객체 배열의 용도 
	var infowindowArr = new Array(); 
	
	var imageSrc = "/StarbucksWeb/images/j1/location_pin.png";       
    var imageSize = new kakao.maps.Size(38, 60);   
    var imageOption = {offset: new kakao.maps.Point(15, 39)};         
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	// == 객체 배열 만큼 마커 및 인포윈도우를 생성하여 지도위에 표시한다. == //
	for(var i=0; i<positionArr.length; i++) {
		
		// == 마커 생성하기
		var marker = new kakao.maps.Marker({ 
			map: map,
			position: positionArr[i].latlng,	
			image: markerImage,
		});
		
		// 지도에 마커를 표시한다.
		marker.setMap(map);
		
		// == 인포윈도우(말풍선) 생성하기 ==
		var infowindow = new kakao.maps.InfoWindow({ 
			content: positionArr[i].content,
			removable: true,
			zIndex: i+1
		});
		
		
		// 인포윈도우를 가지고 있는 객체배열에 넣기
		infowindowArr.push(infowindow);	
		
		
		// == 마커위에 인포윈도우를 표시하기
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 등록합니다 
	    // for문에서 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, infowindowArr));

	}

}); // end of $(document).ready() ----------------------------------------
    
//window.onresize = function(event) {
//
//	var map_container = document.getElementById("map_container");
//	console.log(map_container);
//    var rect = map_container.getBoundingClientRect();
//    console.log("rect.right : " + rect.right);
//    console.log("rect.bottom : " + rect.bottom);
//    var height = $("div#option_viewer").css("height");
//    var width = $("div#option_viewer").css("width");
//    console.log(height);
//    
//    $("div#option_viewer").css({"left": rect.right - width , "top": rect.bottom - height});
//    
//    console.log("test");
//};
//  


function selectLocation(obj){
	// 구매 매장 확정시 store_id를 전달하기 위해 전역변수에 저장
	store_id = obj.id;
	console.log("선택한 매장의 아이디 : " + store_id);
	console.log($("input#store_name"+obj.id).prop("value"));
	
	// 지도 밑에 선택된 매장명을 보여줌
	$("span#selected_store_name").text($("input#store_name"+store_id).prop("value"));
	$("#selected_store_container").show();
//	$("div#option_viewer").show();	
}
    
    

function makeOverListener(map, marker, infowindow, infowindowArr) {
    return function() {    	
    	for(var i=0; i<infowindowArr.length; i++) {
    		if(i == infowindow.getZIndex()-1) {
    			infowindowArr[i].open(map, marker);
    		}
    		else{
    			infowindowArr[i].close();
    		}
    	}
    };
}





</script>
    
 
</head>
    
	<%-- <jsp:include page="../header.jsp" />   
    
    <nav id="sub_nav"><a>HOME</a> > <a>메뉴</a> > <a id="current_nav_menu"></a></nav>
    
    <section>
        <ul class="order_progress">
            <li id="shoppingCart"><span>커스텀</span></li>
            <li id="storeLocation"><span>매장선택</span></li>
            <li id="payment"><span>결제하기</span></li>
            <li id="confirmed"><span>결제완료</span></li>
        </ul> --%>
        <div id="map_container" align="center">
	        <div id="map"></div>
        </div>
<!--         <div id="option_viewer"><label>선택된 매장 : </label><br><span id="selected_store_name"></span></div>  -->
        <div id="selected_store_container" align="center"><label>선택된 매장 : </label><span id="selected_store_name"></span></div>
        <%-- <div align="center">
            <button class="move_button" onclick="history.back()">뒤로</button>
            <button class="move_button" id="next" onclick="javascript:location.href='order_payment.html'">다음</button>
        </div>
    </section>
   
    <jsp:include page="../footer.jsp" /> --%>