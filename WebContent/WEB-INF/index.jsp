<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>


<jsp:include page="header.jsp" />

<style type="text/css">

	body {
		border: solid 3px black;
		min-width: 320px;
	}

	div#container {
		/* border: solid 1px yellow; */
		width: 100%;
		margin: 0 auto;
	}
	
	/* 신제품 */
	div#section_new_product {
		/* border: solid 1px skyblue; */
		height: 646px;
		background-color: #f4e7c7;
		background-image: url('images/nari/section_new_product_background.jpg');
		background-repeat : no-repeat; 
		/* background-size : cover; */
	}
	
	div.new_back_size {
		/* 이미지 비율 지정해주는 곳 */
    	background-size: 110% 100%;
		
	}
	
	div#section_new_product_slogan {
		display: inline-block;
		/* width: 80%;
		height: 80%; */
		display: absolute;
	}
	
	.section_new_product_emblem {
		/* border: solid 1px blue; */
		display: inline-block;
		position: absolute; 
		top: 14vw; 
		left: 13vW; 
		width: 255px; 
		height: 269px; 
		background-image: url('images/nari/section_new_product_emblem.png'); 
		background-repeat: no-repeat; 
		background-size: 100%;

	}
	
	div.back_size_eb {
    	/* 이미지 비율 지정해주는 곳 */
    	background-size: 17vw 17vw;
    }
	
	/* 자세히보기 */
	button.section_new_product_more {   
		display: inline-block;
    	width: 125px;
    	height: 38px;
    	font-size: 15px;
    	color: white;
    	line-height: 34px;
    	text-align: center;
    	border-color: white;
    	font-weight: bolder;
    	position: absolute;
    	top: 34vw; 
		left: 13vW; 
    	background-color: transparent; /* 뒷 배경과 동일하게 배경 설정하기 */
	    background-image: none;  
	    transition-property:background-color;
    	transition-duration:1s;  	
    }
    
    button.section_new_product_more:hover {
		background-color: #ff6600;
		text-decoration: underline;
		cursor: pointer;
		
	}

    div.section_new_product_limemojito {
		background-image: url('images/nari/section_new_product_limemojito.png');
		position: absolute;
		/* 이미지 크기 지정해주는 곳 */
		width: 30vw;
		height: 40vh;
		top: 12vw;
		left: 45vw;
		/* animation: fadein 1s; */
    } 
    
    
    div.back_size_lm {
    	/* 이미지 비율 지정해주는 곳 */
    	background-size: 30vw 22vw;
    }
    
    div.section_new_product_doubleexpresso {
	    background-image: url('images/nari/section_new_product_doubleexpresso.png');
	    position: absolute;
		/* 이미지 크기 지정해주는 곳 */
		width: 30vw;
		height: 51vh;
		top: 25vw;
		left: 35vw;
		/* animation: fadein 1s;
		animation-delay: 1s; */
    }
    
    div.back_size_de {
    	/* 이미지 비율 지정해주는 곳 */
    	background-size: 28vw 28vw;
    }
    
    div.section_new_product_applemango {
	    background-image: url('images/nari/section_new_product_applemango.png');
	    position: absolute;
		/* 이미지 크기 지정해주는 곳 */
		width: 29vw;
		height: 52vh;
		top: 22vw;
		left: 61vw;
		/* animation: fadein 1s;
		animation-delay: 2s; */
    }
    
    div.back_size_am {
    	/* 이미지 비율 지정해주는 곳 */
    	background-size: 27vw 30vw;
    }
	
	/* 공지사항 */
	
	div#section_notice {
		/* border-top: solid 2px white;	
		border-bottom: solid 2px white; */
		height: 80px;
		background-color: black;
		color: white;
	}
	
	table#section_notice_table {
		margin: 0 auto;
		align-content: center;
		text-align: center;
		vertical-align: middle;
		height: 80px;
		
	}
	
	td#section_notice_title {
		font-size: 14pt;
		padding-right: 50px;
	}
	
	table#section_notice_table > tr > td {
		vertical-align: middle;
	}
	
	img#section_notice_plus {
		border-radius: 50%;
		margin-left: 50px;
	}
	
	
    @keyframes fadein {
		from { opacity: 0; }
		to { opacity: 1; }
	}
	
	/* 리워드 --------------------------------------------------------------------------- */
	
	div#section_reward {
		position: relative;
		/* border: solid 1px orange; */
		height: 335px;
		background-color: white;
		background-image: url('images/nari/reward_texbg.jpg');
		padding: 0;
		color : white;
	}
	
	img#section_reward_mystarbucks_logo {
		position: absolute	;
		top: 44%;
		left: 9vw;
	}

	
	img#section_reward_txt1 {
		/* border: solid 1px blue; */
		position: absolute	;
		top: 15%;
		left: 35vw;
		width: 27vw; 
		height: 6vw;
	}
	
	img#section_reward_txt2 {
		/* border: solid 1px yellow; */
		position: absolute	;
		top: 50%;
		left: 35vw;
		width: 20vw; 
		height: 8vw;
	}
	
	/* 버튼만들기 ---------------------------------------- */
	div#reward_button {
		/* border: solid 1px red; */
		position: absolute;
		top: 30%;
		left: 67vw;

	}
	
	button.reward_button {
		border: solid 2px black;
		width: 120px;
		height: 50px;
		margin-bottom: 30px;
		margin-right: 20px;
		border-radius: 5%;
		font-weight: bold;
		background-color: transparent; /* 뒷 배경과 동일하게 배경 설정하기 */
	    background-image: none;  
		/* padding: 0.5vw 1vw; */
	}
	
	 button.reward_button:hover {
		background-color: black;
		color: white;
		font-weight: bold;
		cursor: pointer;
	} 
	
	span.loginName {
		color: #006633;
	}
	
	span.loginName:hover {
		color: yellow;
	}
	
	button.reward_btn_signup:hover {
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	button.reward_btn_mypage {
		width: 200px;
		text-align: center;
		margin-left: 35px;
	}
	
	button.reward_btn_product {
		width: 170px;
		text-align: center;
		margin-left: 50px;
	}
	
	/* 추천메뉴 */
	
	div#section_recommended_menu {
		/* border: solid 1px purple; */
		height: 573px;
		background-image: url('images/nari/section_recommended_menu_back2.jpg');
 		background-size: 100% 100%; 
 		text-align: center;
	}
	
	img#section_recommended_text {
		width: 250px;
		height: 200px;
		position: relative;
		top: -15vh;
		margin-right: 10vw;
	}
	
	img#section_recommended_menu_1 {
		border-radius: 50%;
		position: relative;
		top: 5vh;
	}
	
	
	/* 리저브매장 */
	div#section_reserve {
		height: 573px;
		background-image: url('images/nari/section_reserve_back.jpg');
		background-size: 100vw 40vw;
	}
	
	img#section_reserve_text {
		/* border: solid 1px red; */
		background-color: transparent; /* 뒷 배경과 동일하게 배경 설정하기 */
		position: relative;
		padding-top: 150px;
		padding-left: 500px;
			
		
	}
	
	/* 지도 */
	div#section_map {
		/* border: solid 1px red; */
		height: 670px;
		width: 100%;
		/* background-color: #ffe6ff; */
		background-image: url('images/nari/section_map_backGray.jpg);
		background-repeat : no-repeat; 
	}
	

	
	
	/* ---------------------------- 바디 끝 -------------------------- */
	
	footer {
		height: 350px;
		background-color: black;
		color: white;
	}
	
	div#footer_botton {
		text-align: center;
		color: #555;
	}
	
	a.notice_title_link {
		color: white;
		text-decoration: none;
	}

	/* ---------------------------- 푸터 끝 -------------------------- */

</style>	

<script type="text/javascript">
	

	$(document).ready(function(){
		
		// 신제품 이미지 순차적으로 불러오기
		$(".fadein").hide();
		$("#fadein1").fadeIn(1000);
		$("#fadein2").delay(1000).fadeIn(1000);
		$("#fadein3").delay(2000).fadeIn(1000);
		
		
		// 다양한 메뉴를 스타벅스에서 즐겨보세요 옆으로 이동시키기
		$(function () {
		    var foundTop = $("#section_reserve_text").offset().top;
		    $(document).on("scroll", function () {
		        if ($(window).scrollTop() + $(window).height() > foundTop + 300) {
		            // alert("section_reserve_text!");
		            scroll();	
		            $(document).off("scroll");
		        }
		    });
		});
		
		
		// section_reward 관리자페이지 버튼 효과
		$(".reward_btn_mypage").mouseover(function(){
		    $("span.loginName").css("color","yellow");	
		});
		
		$(".reward_btn_mypage").mouseout(function(){
		    $("span.loginName").css("color","#006633");
		});

	}); // end of $(document).ready(function() ----------------------
		
	function scroll(){
		$(".scrollerText").animate({'left':0},0,		
							 function() {
							   $(".scrollerText").css({'left':800});
							   $(".scrollerText").animate({'left':0},3000);
							 }
		);
		// setTimeout("scroll()", 2000);
	}
	
	
	
</script>

		<section>
			<div id="section_new_product" class="new_back_size">
				<div id="section_new_product_slogan">
					<div class="section_new_product_emblem back_size_eb"></div> 
					
					<button class="section_new_product_more" onclick="window.location.href='<%= ctxPath%>/product/menu.sb'" >자세히보기</button>
				</div>
				<div id="fadein1" class="section_new_product_limemojito back_size_lm fadein" style="cursor: pointer;" onclick="window.location.href='http://localhost:9090/StarbucksWeb/product/detail.sb?type=drink&productId=d034'"></div>
				<div id="fadein2" class="section_new_product_doubleexpresso back_size_de fadein" style="cursor: pointer;" onclick="window.location.href='http://localhost:9090/StarbucksWeb/product/detail.sb?type=drink&productId=d022'"></div>
				<div id="fadein3" class="section_new_product_applemango back_size_am fadein" style="cursor: pointer;" onclick="window.location.href='http://localhost:9090/StarbucksWeb/product/detail.sb?type=drink&productId=d030'"></div>
			</div>
			
			<div id="section_notice">
				<table id="section_notice_table">
					<tr>
						<td id="section_notice_title">공지사항 </td>
						<td>
							<a class="notice_title_link" style="color:white; text-decoration: none; font-size: 14pt;" href="http://localhost:9090/StarbucksWeb/notice/noticeView.sb?notice_seq=165&rno=165">앱 서비스/홈페이지 서비스의 중단안내 15</a>
						</td>
						<td><a href="http://localhost:9090/StarbucksWeb/notice/noticeList.sb"><img id="section_notice_plus" src="images/nari/notice_plus.png" width="30px" height="30px" /></a></td>
					</tr>
				</table>
			</div>
			
			<section>
			<div id="section_reward">
				<img id="section_reward_mystarbucks" src="images/nari/section_reward_mystarbucks.png" width="35%" height="335px"/>
				<img id="section_reward_mystarbucks_logo" src="images/nari/section_reward_mystarbucks_logo.png" />
				<img id="section_reward_txt1" src="images/nari/section_reward_txt1.png" />
				<img id="section_reward_txt2" src="images/nari/section_reward_txt2.png" />
				<div id="reward_button">
				<c:choose>
					<c:when test="${ empty (sessionScope.loginuser).userid }">
						<button class="reward_button reward_btn_signup" type="button" onclick="window.location.href='<%= ctxPath%>/register/memberRegister.sb'">회원가입</button>
						<button class="reward_button reward_btn_login" type="button" onclick="window.location.href='<%= ctxPath%>/login/loginIndex.sb'">로그인</button>
					</c:when>
					<c:when test="${ not empty (sessionScope.loginuser).userid }">
						<button class="reward_button reward_btn_mypage" type="button" onclick="window.location.href='<%= ctxPath%>/member/myPage.sb'"><span class="loginName" style="font-size: 12pt;">${(sessionScope.loginuser).name}</span>님 마이페이지</button>
					</c:when>
					
				</c:choose>	
					<br/>
					<button class="reward_button reward_btn_product" type="button" onclick="window.location.href='<%= ctxPath%>/product/menu.sb'">더 많은 상품보기</button>
				</div>	
			</div>
			</section>
			
			
			
			<div id="section_recommended_menu">
				<img id="section_recommended_text" src="images/nari/section_recommended_text1.png" />
				<img id="section_recommended_menu_1" src="images/nari/section_recommended_menu_1.jpg" width="500px" height="500px" style="cursor: pointer;" onclick="window.location.href='http://localhost:9090/StarbucksWeb/product/detail.sb?type=food&productId=f004'"/>
			</div>
			
			<div id="section_map">
			    <jsp:include page="location.jsp"/>
			</div>
			
			<div id="section_reserve">
				<div id="scroller">
					<img id="section_reserve_text" class="scrollerText" src="images/nari/section_reserve_text.png" />
				</div>
			</div>
		
		</section>
		
		<!-- --------------------------------- 바디 끝 ---------------------------------- -->


		
<jsp:include page="footer.jsp" />

