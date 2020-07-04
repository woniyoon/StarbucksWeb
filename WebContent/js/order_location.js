
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
	// 구매 매장 확정시 store_id를 전달하기 위해 숨겨진 form의 input에 저장
	$("#store_id").prop("value", obj.id);
	store_id = obj.id;

	
	// 지도 밑에 선택된 매장명을 보여줌
	$("span#selected_store_name").text($("input#store_name"+store_id).prop("value"));
	$("#selected_store_container").show();
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


function checkout(){
	if(store_id == "") {
		alert("매장을 선택해주세요!");
	} else {
		var form = document.loc_form;
		
		form.method = "POST";
		form.action = "/StarbucksWeb/order/payment.sb";
		form.submit();

	}
	
	
}
