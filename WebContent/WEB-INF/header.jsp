<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>


<!DOCTYPE html>
<html>
<head>
<title>Starbucks.sb</title>

<style type="text/css">

	body.index {
		border: solid 3px black !important;
		min-width: 320px;
	}
	
	header.index {
		/* border: solid 1px red; */	
		position: sticky !important;
		background: teal !important;
	    top: 0 !important;
	    left: 0 !important;
		height: 120px !important;
		background-color: #f6f5ef !important;
		border-bottom: 1px solid #e5e5e5 !important;
		z-index: 1 !important; /* 헤더가 제일 앞으로 오도록 해줌  */
	} 
	
	div#header_1 {
		/* border: solid 1px red; */
		float: left !important;
		width: 25vw !important;
		height: 120px !important;
		margin: 0 auto !important;
		padding: 0 auto !important;
	}
	
	img#logo {
		margin-top: 7% !important;
		margin-left: 13vW !important;
	}
	
	div#header_2 {
		/* border: solid 1px blue; */
		float: right !important;
		width: 50% !important;
		height: 120px !important;
		margin: 0 auto !important;
		margin-right: 10vw !important;
	}
	
	nav.index {
		text-align: right !important;

	}
	
	.nav_first {
		font-size: 10pt !important;
	}
	
	ul.index, li.index {
	    list-style: none !important;
		display: inline-block !important;
		margin-left: 0 !important;
		margin-right: 30px !important;
		color: #555 !important;
	}
	
	a.index {
		text-decoration: none !important;
	}
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" /> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>




</head>
<body class="index">

	<div id="container">
		<header class="index">
			<div id="header_1">
				<a href="<%= ctxPath%>/index.sb" class="index" >
					<img id="logo" src="<%= ctxPath%>/images/nari/starbucslogo.png" width="75px" height="75px"/> 
				</a>
			</div>
			<div id="header_2">
				<nav class="nav_first index">
					<ul class="index">
						<li class="index"><a href="<%= ctxPath%>/register/memberRegister.sb"  class="index">SIGN IN</a></li>
						<li class="index"><a href="<%= ctxPath%>/order/shoppingCart.sb"  class="index">SHOPPING BASKET</a></li>
						<li class="index"><a href="<%= ctxPath%>/member/myPage.sb"  class="index">MY STARBUCS</a></li>
						<li class="index"><a href="<%= ctxPath%>/notice/noticeList.sb"  class="index">MANAGER PAGE(임시)</a></li>
					</ul>
				</nav>
				<nav class="nav_second index">
					<ul class="index">
						<li class="index"><a href="<%= ctxPath%>/product/menu.sb"  class="index">MENU</a></li>
						<li class="index"><a href="<%= ctxPath%>/notice/noticeList.sb" class="index">NOTICE</a></li>
						<li class="index"><a href="<%= ctxPath%>/feedback/feedbackList.sb"  class="index">QNA</a></li>
					</ul>
				</nav>
			</div>
		
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->