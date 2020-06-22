<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/css/order_payment.css"></style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="/javascript/order_payment.js"></script>
    <title>스타벅스 코리아</title>
    <style type="text/css" >
    
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
		    height: auto;
		    padding-bottom: 3rem;
		}   
		
		@media (max-width:960px) {
		    #payment_detail {
		        min-width: 50vw;
		        max-width: 50vw;
		        min-height: 40vh;
		        overflow: inherit;
		    }
		
		    #payment_detail > form {
		        /* min-width: 40vw;
		        max-width: 40vw; */
		        flex: 1;
		    }
		    
		    #payment_detail_left > img {
		        max-width: 20vw;
		        max-height: 14vh;
		    }
		
		    #card_payment :first-child {
		        display: block;
		        border: 1px solid salmon;
		    }
		}
		
		#payment_container {
		    border: 3px solid red;
		    margin: 30px auto;
		    width: 100%;
		    height: auto;
		    padding: 3rem 0;
		}
		
		table, td, tr, th {
		    border-bottom: 1px solid grey;
		    border-collapse: collapse;
		    padding: 10px;
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
    
    
</head>
<body>
    <header>
        <img id="logo" src="/assets/starbucks_logo.png" width=80px height=80px />
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
            <li id="payment"><span>결제하기</span></li>
            <li id="confirmed"><span>결제완료</span></li>
        </ul>
        <div id="payment_container" align="center">
            <article id="payment_detail">  
                <aside>   <!-- 결제 요약정보 -->
                    <h4>주문 매장 : 을지로입구역 스타벅스</h4>
                    <h4>주문 메뉴</h4>
                    <table class="table">
                        <tr>
                            <th></th>
                            <th>품목</th>
                            <th>변경사항</th>
                            <th>가격</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>아이스 아메리카노</td>
                            <td>얼음 적게</td>
                            <td>4100원</td>
                        </tr>
                    </table>
                    <label>적립금</label>
                    <input type="number" readonly />
                    <button>적립금 확인</button>
                    <h4>총 금액 : </h4>

                </aside>
            </article>
            <div>
                <button class="move_button" onclick="history.back()">뒤로</button>
                <button class="move_button" id="next" onclick="javascript:location.href='order_confirmed.html'">다음</button>
            </div>
        </div>
    </section>
    <div id="snackbar">알림용 스낵바입니다</div>
    <footer></footer>
</body>
</html>