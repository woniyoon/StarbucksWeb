<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--     <link rel="stylesheet" type="text/css" href="/StarbucksWeb/css/order_confirmed.css"></style> -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="/StarbucksWeb/js/order_confirmed.js">
    </script> 
    <title>스타벅스 코리아</title>
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
		
		.current_state {
		    /* display: inline-block; */
		    display: table-cell;
		    vertical-align: middle;
		    height: 50px;
		    min-width: 80px;
		    background-color: #006633;
		    color:white;
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
		
		div#confirmed_div {
			height: 50vh;
			width: 100%;
		}
		
		#confirmed_order {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 40vh;
		}
		
		a#go_main {
			padding: 5px;
			color: black;
	/* 		border-radius: 5px;
			border: 1px solid grey; */
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
        <div id="confirmed_order" align="center">
			<h1> 장바구니가 비어있습니다. </h1><br/>
			<h3> 음료준비는 약 5분이 소요됩니다. </h3>
			<h3> 픽업 매장위치에서 만나요~ </h3>
			<a id="go_main" href="/StarbucksWeb/index.sb">메인으로 돌아가기</a>
		</div>
    </section>
    
    <jsp:include page="../footer.jsp" />