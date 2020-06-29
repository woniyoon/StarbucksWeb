<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% 

	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="/StarbucksWeb/css/order_cart.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/js/order_cart.js"></script>
<title>스타벅스 코리아</title>
<style type="text/css">
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
		color: black;
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
	
	div.card {
		/* display: flex;
		    align-items: row; */
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		max-width: 500px;
		max-height: 600px;
		margin: 50px auto;
		padding: 30px;
		border-radius: 2%;
	}
	
	@media ( max-width :650px) {
		div.card {
			min-width: 60vw;
			max-width: 60vw;
			max-height: 600px;
			min-height: 40vh;
			/* border: 2px solid black; */
			overflow: inherit;
			font-size: 0.8em;
		}
		div.card label {
			display: inline-block;
			width: 100px;
			height: 80%;
			font-size: 0.8em;
		}
		div.card_detail_container {
			/* border: 2px solid black; */
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		div.card_detail_container>img {
			flex: 1;
			max-width: 150px;
			max-height: 180px;
			/* border: 2px solid black; */
		}
		div.card_text {
			display: flex;
			flex: 3;
			flex-direction: column;
			/* border: 1px solid pink; */
		}
	}
	
	.remove_button {
		font-size: 2rem;
		background-color: transparent;
		border: none;
	}
	
	div.card_detail_container {
		display: flex;
	}
	
	h3#menu_name {
		margin: 10px 0;
	}
	
	form {
		display: inline-block;
	}
	
	div.card_detail_container>img {
		flex: 1;
		width: 200px;
		height: 220px;
	}
	
	div.card_text {
		display: flex;
		flex: 3;
		flex-direction: column;
		align-items: center;
		/* border: 1px solid pink; */
	}
	
	div.card ul {
		/* border: 1px solid purple; */
		text-align: start;
		padding: 0px
	}
	
	div.card li {
		display: block;
		margin: 5px 0;
	}
	
	div.card label {
		display: inline-block;
		width: 100px;
		font-size: 1rem;
		/* border: 1px solid red; */
	}
	
	input, select {
		margin: 2px 0;
		width: 60px;
		box-sizing: border-box;
	}
	
	span.price {
		display: block;
		font-size: 1.3rem;
		font-weight: bold;
		/* border: 1px solid red; */
	}
	
	p {
		display: block;
		text-align: end;
		top: 0px;
		right: 0px;
		margin: 0;
	}
	
	.move_button {
		width: 100px;
		height: 50px;
		margin: 0 5px 0 5px;
		background-color: #f4f4f2;
		border: none;
		border-radius: 3px;
		box-shadow: 1px 1px 1px 0 #b6b6b65a, 0 1px 1px 0
			rgba(155, 155, 155, 0.337);
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
	
	@keyframes fadeout {
	  from {bottom: 30px; opacity: 1;}
	  to {bottom: 0; opacity: 0;}
	}
	
	form {
		display: block;
	}
}
</style>

</head>

<jsp:include page="../header.jsp" />

<nav id="sub_nav">
	<a>HOME</a> > <a>메뉴</a> > <a id="current_nav_menu"></a>
</nav>
<section>
	<ul class="order_progress">
		<li id="shoppingCart"><span>커스텀</span></li>
		<li id="storeLocation"><span>매장선택</span></li>
		<li id="payment"><span>결제하기</span></li>
		<li id="confirmed"><span>결제완료</span></li>
	</ul>
	<div class="items_container">
		<c:set var="cart" value="${cart }"></c:set>
		<c:if test="${fn:length(cart) > 0}">
			<c:forEach var="cart" varStatus="status" items="${cart }">
				<form class="order_form" id="${cart.itemSeq }">
				<div id="card${status.index}" class="card">
					<p>
						<button class="remove_button" id="${status.index}"
							onclick="remove_item(this.id, '${cart.itemSeq}')">×</button>
						<input type="hidden" id="name${status.index }"
							value="${cart.product.name}" />
					</p>
					<div class="card_detail_container">
						<img width="120px" height="120px"
							src="/StarbucksWeb/images/products/${cart.product.img}">
						<div class="card_text" id="${cart.itemSeq }">
							<h3 id="menu_name">${cart.product.name}</h3>
 							<form id="order_form">
								<ul id="${cart.itemSeq }">
									<c:choose>
										<c:when test="${cart.product.parentTable eq 'drink'}">
											<li>
												<label for="size">사이즈</label>
												<select id="${cart.itemSeq }" name="size">
													<option value="tall" selected>톨</option>
													<option value="grande">그란데</option>
													<option value="venti">벤티</option>
												</select>
												<span id="extra_size" style="display:none"></span>
											</li>
											<li>
												<label>샷</label> 
												<input id="${cart.itemSeq }" name="shot"
												type="number" value="${cart.product.shot }" min='${cart.product.shot }'
												max='5'>
												<span id="extra_shot" style="display:none"></span>
											</li>
											<li>
											<c:choose>
												<c:when test="${cart.product.syrup ne '없음' }">
													<label>${cart.product.syrup }</label> 
													<select id="syrup${cart.itemSeq }" name='default_syrup'>
														<option id='syrup' value='less'>적음</option>
														<option id='syrup' value='regular' selected>보통</option>
														<option id='syrup' value='extra'>많이</option>
													</select>
												</c:when>
												<c:otherwise>
													<label>시럽</label> 
													<select id="syrup${cart.itemSeq }" name='syrup'>
														<option id='syrup' value='none' selected>없음</option>
														<option id='syrup' value='vanilla'>바닐라시럽</option>
														<option id='syrup' value='hazelnut'>헤이즐넛시럽</option>
														<option id='syrup' value='caramel'>카라멜시럽</option>
													</select>
													<span id="extra_syrup" style="display:none"></span>
												</c:otherwise>
											</c:choose>
											</li>
											<c:if test="${cart.product.base ne '없음' }">
												<li>
													<label>${cart.product.base }</label> 
													<select id="${cart.itemSeq }" name='base'>
														<option id='base' value='less'>적음</option>
														<option id='base' value='regular' selected>보통</option>
														<option id='base' value='extra'>많이</option>
													</select>
												</li>
											</c:if>
											<c:if test="${cart.product.temperature eq 'iced' }">
												<li>	
													<label>얼음</label>
													<select id="${cart.itemSeq }" name='ice'>
														<option id="ice" value='less'>적음</option>
														<option id='ice' value='regular' selected>보통</option>
														<option id='ice' value='extra'>많이</option>
													</select>
												</li>
											</c:if>
											<c:if test="${cart.product.whippedCream ne 'none' }">
												<li>
													<label>${cart.product.whippedCream }</label> 
													<select id="${cart.itemSeq }" name='whippedCream'>
														<option id='whippedCream' value='less'>적음</option>
														<option id='whippedCream' value='regular' selected>보통</option>
														<option id='whippedCream' value='extra'>많이</option>
													</select>
												</li>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${cart.product.categoryName eq '따뜻한 푸드' }">
												<li>
													<label>워밍 옵션</label> 
													<select style='width: 80px' id="${cart.itemSeq }" name='warming'>
														<option id='warming' value='warm' selected>따뜻하게 데움</option>
														<option id='warming' value='none'>데우지 않음</option>
													</select>
												</li>
											</c:if>
										</c:otherwise>
									</c:choose>
								</ul>
							</form>
						</div>
					</div>
					<span class="price" align="right"><span id="price${cart.itemSeq}">${cart.product.price}</span>원</span>
					<input id="original_price${cart.itemSeq }" type="hidden" value="${cart.product.price }"/>
				</div>
				</form>
			</c:forEach>
		</c:if>
		<c:if test="${fn:length(cart) == 0}">
			<div>
				<h1> 장바구니가 비어있습니다. </h1>
			</div>
		</c:if>
	</div>
	<form name="form_checkout" id="form_checkout">
	</form>
	<div align="center">
		<button class="move_button">뒤로</button>
		<button class="move_button" id="next" onclick="checkout()">다음</button>
	</div>
</section>
<div id="snackbar">알림용 스낵바입니다</div>

<jsp:include page="../footer.jsp" />