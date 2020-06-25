<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<title>index.sb</title>

<style type="text/css">

	body.indexS {
		border: solid 3px black;
		min-width: 320px;
	}
	
	header.index {
		/* border: solid 1px red; */	
		position: sticky;
		background: teal;
	    top: 0;
	    left: 0;
		height: 120px;
		background-color: #f6f5ef;
		border-bottom: 1px solid #e5e5e5;
		z-index: 1; /* 헤더가 제일 앞으로 오도록 해줌  */
	} 
	
	div#header_1 {
		/* border: solid 1px red; */
		float: left;
		width: 25vw;
		height: 120px;
		margin: 0 auto;
		padding: 0 auto;
	}
	
	img#logo {
		margin-top: 7%;
		margin-left: 13vW;
	}
	
	div#header_2 {
		/* border: solid 1px blue; */
		float: right;
		width: 50%;
		height: 120px;
		margin: 0 auto;
		margin-right: 10vw;
	}
	
	nav.index {
		text-align: right;

	}
	
	.nav_first {
		font-size: 10pt;
	}
	
	ul.index, li.index {
	    list-style: none;
		display: inline-block;
		margin-left: 0;
		margin-right: 30px;
		color: #555;
	}
	
	a.index {
		text-decoration: none;
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
				<a href="index.jsp" class="index" >
					<img id="logo" src="images/starbucslogo.png" width="75px" height="75px"/> 
				</a>
			</div>
			<div id="header_2">
				<nav class="nav_first index">
					<ul class="index">
						<li class="index"><a class="index">SIGN IN</a></li>
						<li class="index"><a class="index">SHOPPING BASKET</a></li>
						<li class="index"><a class="index">MY STARBUCS</a></li>
						<li class="index"><a class="index">MANAGER PAGE</a></li>
					</ul>
				</nav>
				<nav class="nav_second index">
					<ul class="index">
						<li class="index"><a class="index">MENU</a></li>
						<li class="index"><a href="notice_list.html" class="index">NOTICE</a></li>
						<li class="index"><a class="index">QNA</a></li>
					</ul>
				</nav>
			</div>
		
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->