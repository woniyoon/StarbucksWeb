<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function(){
		
		var path = window.location.pathname;
		var start_point = path.lastIndexOf("/")+1;
		var current_state = path.substring(start_point, path.length-3);
		console.log(current_state);
		
		// 현재 위치한 페이지에 해당하는 nav_menu 항목의 컬러만 변경
		$("#"+current_state).css({"color": "white", "background-color": "#006633", "border-color": "#006633"})
		$("#current_nav_menu").text($("li#"+current_state+" > span").text());
		
	});
</script>

<nav id="sub_nav">
	<a href="/StarbucksWeb/index.sb"><img src="/StarbucksWeb/images/bobae/home.jpg" alt="홈으로"/></a> > 
	<a href="/StarbucksWeb/product/menu.sb">메뉴</a> > 
	<a id="current_nav_menu"></a>
</nav>
<section>
	<ul class="order_progress">
		<li id="shoppingCart"><span>커스텀</span></li>
		<li id="storeLocation"><span>매장선택</span></li>
		<li id="payment"><span>결제하기</span></li>
		<li id="confirmed"><span>결제완료</span></li>
	</ul>