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
    <script type="text/javascript" src="/StarbucksWeb/js/order_payment.js"></script>
    <title>스타벅스 코리아</title>
    <style type="text/css" >

		nav#sub_nav {
		    display: flex;
		    justify-content: flex-end;
		    width: 50%;
		    margin: 30px auto;
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
		
		ul#point_usage {
		    list-style-type: none;
		    display: flex;
		    flex-direction: column;
		    align-items: flex-end;
		    /* border: 1px solid lightcoral; */
		}
		
		section {
		    height: auto;
		    padding-bottom: 3rem;
		}   
		
		#payment_container {
		    margin: 30px auto;
		    width: 100vw;
		    height: auto;
		    padding: 3rem 0;
		}
		
		article#payment_detail {
		    /* border: 2px solid darkorange; */
		    display: inline-block;
		}
		
		table, td, tr, th {
		    border-bottom: 1px solid;
		    border-collapse: collapse;
		    padding: 10px;
		}
		
		table {
		    margin: 50px 0 30px 0;
		    /* border: 1px solid darkcyan; */
		}
		
		section#price_info {
		    display: flex;
		    justify-content: flex-end;
		    /* width: 40vw; */
			/* border: 1px solid darkolivegreen; */
		}
		
		input {
		    display: inline-block;
		    width: 80px;
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
    	
    </style>
    
    
</head>
	<jsp:include page="../header.jsp" />   
	
    <nav id="sub_nav"><a>HOME</a> > <a>메뉴</a> > <a id="current_nav_menu"></a></nav>
	<section>
        <ul class="order_progress">
            <li id="shoppingCart"><span>커스텀</span></li>
            <li id="storeLocation"><span>매장선택</span></li>
            <li id="payment"><span>결제하기</span></li>
            <li id="confirmed"><span>결제완료</span></li>
        </ul>
        <div id="payment_container" align="center">
            <h2>장바구니</h2>
            <article id="payment_detail">  <!-- 결제 요약정보 -->
                <table class="table">
                    <tr>
                        <th><input type="checkbox" /></th>
                        <th>메뉴명</th>
                        <th>변경사항</th>
                        <th>가격</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>아이스 아메리카노</td>
                        <td>얼음 적게 얼음 적게 얼음 적게</td>
                        <td>4100원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>아이스 아메리카노</td>
                        <td>얼음 많이, 물 적게</td>
                        <td>4100원</td>
                    </tr>
                </table>
                <section id="price_info">
                    <ul id="point_usage">
                        <li>
                            <label>보유 적립금</label>
                            <input type="number" readonly />
                            <button>확인</button>            
                        </li>
                        <li>
                            <label>사용 적립금</label>
                            <input type="number" value="0"/>
                            <button>적용</button>
                            <br>
                        </li>
                        <li><span>주문 매장 : </span><span>을지로입구역 스타벅스</span></li>
                        <li><span>총 금액 : </span><span>8200원</span></li>
                    </ul>    
                </section>
            </article>
            <div>
                <button class="move_button" onclick="history.back()">뒤로</button>
                <button class="move_button" id="next" onclick="javascript:location.href='order_confirmed.html'">다음</button>
            </div>
        </div>
    </section>
    <div id="snackbar">알림용 스낵바입니다</div>
    <jsp:include page="../footer.jsp" />