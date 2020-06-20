<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style type="text/css">
    	body {
		    position: absolute;
		    min-height: 100vh;
		    height: auto;
		    width: 100vw;
		    margin: 0 auto;
		    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		    /* border: 1px solid pink; */
		}
		
		header {
		    position: sticky;
		    display: flex;
		    align-items: center;
		    top: 0;
		    left: 0;
		    height: 10%;
		    background-color: white;
		    box-shadow: 1px 1px 1px 0 #b6b6b65a, 0 1px 1px 0 rgba(155, 155, 155, 0.337);
		    padding-left: 30px;
		}
		
		ul.nav_menu {
		    list-style-type: none;
		    /* border: 2px solid peru; */
		    display: inline-block;
		}
		
		ul.nav_menu li {
		    display: inline-block;
		    font-weight: 500;
		    font-size: 15pt;
		    margin-right: 15px;
		}
		
		.nav_menu a:active {
		    color: #006633;
		}
		
		img#logo {
		    vertical-align: middle;
		    display: inline-block;
		}                               /* header 끝 */
		
		nav {
		    display: flex;
		    justify-content: flex-end;
		    width: 50%;
		    margin: 30px auto;
		    /* border: 1px solid salmon; */
		}
		
		ul.order_progress li {
		    /* display: inline-block; */
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
		
		section {
		    margin: 30px auto;
		    width: 100%;
		    height: auto;
		    padding-bottom: 5rem;
		}
		
		p {
		    display: block;
		    text-align: end;
		    top: 0px;
		    right: 0px;
		    margin: 0;
		}
		
		p > button {
		    font-size: 2rem;
		    background-color: transparent;  
		    border: none;
		}
		
		#search_location_container {
		    display: flex;
		    width: 60vw;
		    height: 50vh;
		    margin: 50px auto;
		    border: 1px solid rgb(21, 21, 44);
		}
		
		#search_section {
		    /* border: 5px solid red; */
		    flex: 1;
		}
		
		#search_bar {
		    display: inline-block;
		    height: 50px;
		    width: -webkit-fill-available;
		    padding: 0;
		    /* border: solid 5px black; */
		    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
		    background-repeat: no-repeat;
		    background-position: right;
		}
		
		#store_locations {
		    width: -webkit-fill-available;
		    height: 90%;
		    /* border: 2px solid purple; */
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
		    /* border: 5px solid red; */
		    height: 3em;
		}
		
		#map_section {
		    border: 5px solid #006633;
		    flex: 1;
		}
		
		#map {
		    width: 100%;
		    height: 100%;
		}
		
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
		
		hr {
		    max-width: 50%; 
		}
		
		h2#total_price {
		    margin-right: 25vw;
		}
		
		#snackbar.show {
		    visibility: visible;
		    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
		    animation: fadein 0.5s, fadeout 0.5s 2.5s;
		}
		
		@-webkit-keyframes fadein {
		    from {bottom: 0; opacity: 0;} 
		    to {bottom: 50px; opacity: 1;}
		}
		
		@keyframes fadein {
		    from {bottom: 0; opacity: 0;}
		    to {bottom: 50px; opacity: 1;}
		}
		
		@-webkit-keyframes fadeout {
		    from {bottom: 50px; opacity: 1;} 
		    to {bottom: 0; opacity: 0;}
		}
		
		footer {
		    position: absolute;
		    height: 5rem;
		    bottom: 0;
		    width: 100vw;
		    background-color: rgb(46, 46, 46);
		}
		    	
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7fa563027be4561a627edb8c3c2821f"></script>
    <script type="text/javascript" src="/StarbucksWeb/js/order_location.js">
    </script> 
    <title>스타벅스 코리아</title>
</head>
<body>
    <header>
        <img id="logo" src="/StarbucksWeb/images/common/starbucks_logo.png" width=80px height=80px />
        <ul class="nav_menu">
            <li><a>ABOUT</a></li>
            <li><a>MENU</a></li>
            <li><a>MYPAGE</a></li>
            <li><a>Q&A</a></li>
        </ul>
    </header>
    <nav><a>HOME</a> > <a>메뉴</a> > <a id="current_nav_menu"></a></nav>
    <section align="center">
        <ul class="order_progress">
            <li id="shoppingCart"><span>커스텀</span></li>
            <li id="storeLocation"><span>매장선택</span></li>
            <li id="order_payment"><span>결제하기</span></li>
            <li id="order_confirmed"><span>결제완료</span></li>
        </ul>
        <div id="search_location_container" align="center">
            <aside id="search_section">
                <input type="text" id="search_bar" placeholder="지역명을 입력하세요." />
                <div  id="store_locations">
                    <table>
                        <thead><tr><th>매장 목록</th></tr></thead>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                        <tr><td>ㅎㅎ</td></tr>
                    </table>
                </div>
            </aside>
            <aside id="map_section">       <!-- 카카오맵 지도 -->
                <div id="map"></div>
            </aside>
        </div>
        <div>
            <button class="move_button" onclick="history.back()">뒤로</button>
            <button class="move_button" id="next" onclick="javascript:location.href='order_payment.html'">다음</button>
        </div>
    </section>
    <div id="snackbar">알림용 스낵바입니다</div>
    <footer></footer>
</body>
</html>