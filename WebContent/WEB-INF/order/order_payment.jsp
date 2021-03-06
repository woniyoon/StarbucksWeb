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
		    padding-inline-start: 0px;
		}
		
		ul#point_usage {
		    list-style-type: none;
		    display: flex;
		    flex-direction: column;
		    align-items: flex-end;
		}
		
		ul#point_usage li {
			margin: 2px 0;
		}
		
		section {
		    height: auto;
		    padding-bottom: 3rem;
		}   
		
		#payment_container {
		    margin: 30px auto;
		    height: auto;
		    padding: 3rem 0;
		}
		
		article#payment_detail {
		    display: inline-block;
		}
		
		table, td, tr, th {
		    border-bottom: 1px solid;
		    border-collapse: collapse;
		    padding: 10px;
		}
		
		table {
		    margin: 50px 0 30px 0;
		}
		
		section#price_info {
		    display: flex;
		    justify-content: flex-end;
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
    	
    	#overlay {
		  position: fixed; /* Sit on top of the page content */
		  display: flex;
		  align-items: center;
		  width: 100%; /* Full width (cover the whole page) */
		  height: 100%; /* Full height (cover the whole page) */
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background-color: rgba(0,0,0,0.8); /* Black background with opacity */
		  z-index: 1000; /* Specify a stack order in case you're using a different order for other elements */
		}
		
		@import url(https://fonts.googleapis.com/css?family=Roboto:100);
		
		#loading {
		  display: inline-block;
		  margin: auto;
		  width: 50px;
		  height: 50px;
		  border: 3px solid rgba(255,255,255,.3);
		  border-radius: 50%;
		  border-top-color: #fff;
		  animation: spin 1s ease-in-out infinite;
		  -webkit-animation: spin 1s ease-in-out infinite;
		}
		
		@keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
		@-webkit-keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
    	
    </style>

</script>    
</head>
	<jsp:include page="../header.jsp" />   
	<div id="overlay" align="center">
		<div id="loading"></div>
	</div>
    <jsp:include page="progress_nav.jsp" />
        <div id="payment_container" align="center">
            <h2>결제사항</h2>
            <form id="payment_form" name="payment_form">
	            <article id="payment_detail">  <!-- 결제 요약정보 -->
	                <table class="table">
	                    <tr>
	                        <th><input id="selectAll" type="checkbox" /></th>
	                        <th>no</th>
	                        <th>메뉴명</th>
	                        <th>변경사항</th>
	                        <th>가격</th>
	                    </tr>
	                    <c:choose>
	                    	<c:when test="${not empty cartList }">
	                    		<c:forEach var="cart" items="${cartList }" varStatus="status">
		                    		<tr class="items">
			                    		<td><input class="item_checkbox" type="checkbox" id="${cart.itemSeq }"/><input type="hidden" id="item_seq${status.index}" name="item_seq" value="${cart.itemSeq }" /></td>
			                    		<td>${status.count }</td>
			                    		<td>${cart.product.name }<input type="hidden" id="product_id${status.index}" value="${cart.product.productId }" /></td>
			                    		<td>${cart.product.custom }</td>                    		
			                    		<td><span id="price${cart.itemSeq }">${cart.product.price }<input type="hidden" id="price_per_item${status.index}" name="price_per_item" value="${cart.product.price }" /></span>원</td>
		                    		</tr>
	                    		</c:forEach>
	                    	</c:when>
	                    </c:choose>
	                </table>
	                <section id="price_info">
	                    <ul id="point_usage" align="left">
	                        <li>
	                            <label>보유 적립금</label>
	                            <input id="my_point" type="number" readonly />
	                        </li>
	                        <li>
	                            <label>사용 적립금</label>
	                            <input id="point_to_use" name="deducted_point" type="number" value="0" min="0" step="100"/>
	                            <button type="button" onclick="apply_points()">적용</button>
	                            <br>
	                        </li>
	                        <li><span>주문 매장 : </span><span id="store_name">${store_name }<input type="hidden" id="store_id" name="store_id" value="${store_id }" /></span></li>
	                        <li><span>총 금액 : </span><span id="final_price"></span>원<input type="hidden" id="price_to_pay" name="price_to_pay" /></li>
	                    </ul>    
	                </section>
	            </article>
	            <input type="hidden" name="slip_no" />
            </form>
            <div>
                <button type="button" class="move_button" onclick="history.back()">뒤로</button>
                <button type="button" class="move_button" id="next" onclick="goToPay()">결제</button>
            </div>
        </div>
    </section>
    <jsp:include page="../footer.jsp" />