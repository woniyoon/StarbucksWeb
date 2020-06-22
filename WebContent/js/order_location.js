$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);
    console.log(current_state);

    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());

    var usesOwnLocation = confirm("현재 위치를 이용하겠습니까?");
    
    var coordinates = { // 디폴트 위치
    		"lat":33.450701, 
    		"lng":126.570667
    };

    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(coordinates.lat, coordinates.lng), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };
    
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    if (navigator.geolocation && usesOwnLocation) {
    
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            console.log(lat, lon);

            options.center = new kakao.maps.LatLng(lat, lon);

            var map = new kakao.maps.Map(container, options); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
             // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            // displayMarker(locPosition, message);
                
        });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        // var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        //     message = 'geolocation을 사용할수 없어요..'
            
        // displayMarker(locPosition, message);
    }

    console.log("ㅠㅠ");
            
});
