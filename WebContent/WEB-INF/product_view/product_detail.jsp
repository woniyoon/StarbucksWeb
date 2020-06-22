<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MENU</title>

<style type="text/css">

	/* 전체 */
	#container {
		/* border: solid 1px orange; */
		width: 1100px;
		margin: 0 auto;
	}
   
	/* 타이틀 */
	div.title {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		height: 91px;
		font-size: 15px;
		/* border: solid 1px red; */
	}
   
	/* 타이틀_하위목록 */
	div.title > nav {
		display: flex;
		align-items: flex-end;
	}
	
	div.title > nav > ul {   
		/* border: solid 1px cyan; */
		right: 120px;
		top: 40px;
		list-style-type: none;   
		text-decoration: none;
	}
    
	div.title > nav > ul > li {   
		display: inline-block;
		top: 50px;
		/* border: solid 1px blue; */
	}
	
	div.title > nav > ul > li > a {
		text-decoration: none;
		color: #666666;
	} 
	
	div.title > nav > ul > li > a:hover {
	    text-decoration: underline;
	}
	
	/* 내용 전체 (사진 + 디테일) */
	div.product_view{
		width: 100%;
		height: 700px;
	    padding-bottom: 40px;
	    border-bottom: 1px solid #ddd;
	    margin-bottom: 40px;
   		/* border: solid 1px yellow; */
	}
	
	/* 사진들 */
	div.product_picture {
		position: relative;
		top: 0;
		float: left;
		border: solid 1px red;
	}
	
	div.product_img_small {
		float: left;
		padding: 5px;
		cursor: pointer; 
	}
	
	/* 사진 줌 */
	* {box-sizing: border-box;}
	
	.img-zoom-container {
		position: relative;
	}
	
	.img-zoom-lens {
		position: absolute;
		width: 350px;
		height: 250px;
		background-color: white;
		border: 1px solid black;
		opacity: 0.4;
	}
	
	.img-zoom-result {
		position: absolute;
		width: 570px;
		height: 530px;
		/* border: 3px solid black; */
	}
	
	.myimagediv {
		/* border: dotted 2px blue; */
	}	
	
	/* 돋보기 사진 */
	div.product_magnifier {
		position: absolute;
		top: 470px;
		left: 435px;
	}
	
	div.product_title {
		flex: 1;
	}
	
	/* 제품 설명 */
	div.product_details {
		float: right;
		width: 570px;
		height: 490px;
		/* border: solid 1px  blue; */
	}
	
	/* 제품설명_타이틀 */
	div.product_details_title {
		display: flex;
		flex-direction: row;
		align-items: space-between;
		height: auto;
		padding: 10px 0px 10px 10px;
		/* border: 2px solid red; */
	}
	
	/* 제품설명_타이틀 */
	div.product_details_title h3 {
	    margin-top: 0;
	    font-size: 24px;
	    font-weight: bold;
	    color: #222;
	}
	
	/* 제품설명_타이틀_영어 */
	div.product_details_title h3 span {
	    font-size: 14px;
	    font-weight: normal;
	    color: #666;
	}	
	
	/* 제품설명_타이틀_설명 */
	div.product_details_title p.title1 {
	    margin-bottom: 20px;
	    line-height: 1.6;
	    min-height: 40px;
   	    font-size: 16px;
	    color: #444;
	}
	
	/* 제품설명_버튼 */
	 div.product_button {
	 	display: flex;
	 	flex-direction: row;
	 	align-items: flex-end;
	 	justify-content: flex-end;
	 }
	 
	div.product_button a {
		clear: both;
	    display: block;
	    width: 111px;
	    height: 28px;
	    margin-left: 10px;
	    line-height: 28px;
	    font-size: 12px;
	    text-align: center;
	    text-decoration: none;
   	    vertical-align: baseline;
   	    border-radius: 3px;
	    background: #F4F4F1;
	    color: #222222; 
   	    cursor: pointer;
	}
	
	/* 버튼 호버 */
	div.product_button a:hover {
		text-decoration: underline;
		color: #fff;
		background: #006633;
	}	
	
	/* 선 */
	hr {
	 	border: solid 1px black;
	 }
	 
	/* fieldset 폼 */
	fieldset {
	 	border: solid 0px red;
	 	padding: 0;
	 }
	  
	/* 제품영양정보 */
	div.product_nutrition_title {
	   	display: flex; 
	    padding: 0;
	    margin-top: 20px;
	    border-top: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	
	/* 제품 영양정보_테이블_이름 左  */
	p.nutrition_title1 {
		flex: 2;
		padding: 0 10px;
	}
	
	/* 제품 영양정보_테이블_이름 右 */
	p.nutrition_title2 {
		flex: 1;
	}
	
	#nutrition_left {
	 	border-right: 1px dotted #ddd;
	 }
	
	/* 제품 영양정보_테이블 */
	div.product_info_content { 
		display: flex;
		position: relative;
		width:100%;	
		margin: 10px 0;
	    font-size: 16px;
		background:none;
	}
	
	/* 제품 영양정보_테이블 */
	div.product_info_content ul { 
		flex: 1;
		width:50%; 
		float:left; 
		margin:0 0 15px 0;
		padding-left: 0;
		list-style: none;
	}
	
	/* 제품 영양정보_테이블 */
	div.product_info_content li { 
		margin-bottom:15px; 
		padding: 0 10px;
		line-height:1.6;
	}
	
	/* 제품 영양정보_테이블 */
	div.product_info_content dl { 
		width:100%; 
		font-size:14px; 
		color:#444; 
	}
	
	/* 제품 영양정보_테이블 */
	div.product_info_content dl dt { 
		float:left;
		width:85%; 
		padding-bottom: 10px;
	}
	
	/* 제품 영양정보_테이블 */
	div.product_info_content dl dd { 
		float:right;
		width:15%;
		margin-left: 0;
		text-align:right;
	}
	
	/* 제품 설명 下 */
	div.title2 {
	    padding-bottom: 85px;
   	    font-size: 14px;
	    color: #666;
   	    text-align: left;
	}
	
	/* 알레르기 */
	div.allergy_triggers {
	    clear: both;
   	    position: relative;
	    padding: 3px 11px; 
   	    margin-bottom: 23px;
	    font-size: 14px;
	    color: #444;
	    border-radius: 3px;
	    background: #f4f4f2;
	}
	
	/* 하단 공통부분 푸터 */
	div.productView_footmenu {
		clear: both;
		display: flex;
   		flex-direction: row;
		padding: 30px 0 100px 0;
   		background: #f4f4f2;
		border: solid 1px green;
	}
	
	/* 하단 공통부분 푸터 左 */
	div.productView_top_left {
	    position: relative;
   	    flex: 1;
   	    float: left;
	    width: 550px;
		border-right: 1px solid #ddd;
	}
	
	div.productView_top_left ul { 
		padding-left: 10px; 
	}
	
	div.productView_top_left ul li { 
		padding-left: 0px;
		margin-bottom: 10px; 
		font-size: 14px;
		background: url("#") 0 center no-repeat; 
	}
	
	div.productView_top_left p.tit { 
		margin: 0 0 15px 0;
		font-size: 18px;
		font-weight: bold;
		color: #222;
	}
	
	div.productView_top_left p.more {
		position: absolute;
		float: right;
		left: 435px;
	}
	
	/* 하단 공통부분 푸터 右  */
	div.productView_top_right {
		float: right;
		flex: 1;
	}
	
	div.productView_top_right p.tit { 
		margin: 0 0 15px 0;
		font-size:18px;
		font-weight:bold;
		color:#222;
	}
	
	div.productView_top_right .sirenOrder {
	    display: block;
   	    width: 200px;
	    float: left;
	    margin-inline-start: 40px;
	}
	
	div.productView_top_right .sirenOrder_title {
	    position: relative;
	    width: 228px;
		float: left; 
	   /*  text-align: center; */
	}
	
	div.productView_top_right .sirenOrder_title .txt {
	    position: relative;
	    width: 300px;
		float: left; 
	   /*  text-align: center; */
	}
	
</style>
<script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
		
	$(document).ready(function(){
		
		var product_details = document.getElementsByClassName("product_details")[0];
		var rect = product_details.getBoundingClientRect();
		console.log(rect);
		
		$(".img-zoom-result").css("left", rect.x);
		$(".img-zoom-result").css("top", rect.y);
		
		imageZoom("myimage", "myresult");
		$(".img-zoom-result").hide();
		
		// 이미지 줌
		$(".myimagediv").bind("mouseover", function(event){
			var $target = $(event.target); 
			if($target.is("div .img-zoom-lens")){  	
				console.log("이미지에서 마우스 오버");
				$(".img-zoom-result").show();
			}			
		});
		
		$(".myimagediv").bind("mouseout", function(event){
			var $target = $(event.target); 
			if($target.is("div .img-zoom-lens")){  	
				console.log("이미지에서 마우스 아웃");
				$(".img-zoom-result").hide();
			}
		});
	
	}); // ----- end of $(document).ready(function(){} -----

	
		function imageZoom(imgID, resultID) {
		  var img, lens, result, cx, cy;
		  img = document.getElementById(imgID);
		  result = document.getElementById(resultID);
		  /*create lens:*/
		  lens = document.createElement("DIV");
		  lens.setAttribute("class", "img-zoom-lens");
		  /*insert lens:*/
		  img.parentElement.insertBefore(lens, img);
		  /*calculate the ratio between result DIV and lens:*/
		  cx = result.offsetWidth / lens.offsetWidth;
		  cy = result.offsetHeight / lens.offsetHeight;
		  /*set background properties for the result DIV:*/
		  result.style.backgroundImage = "url('" + img.src + "')";
		  result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
		  /*execute a function when someone moves the cursor over the image, or the lens:*/
		  lens.addEventListener("mousemove", moveLens);
		  img.addEventListener("mousemove", moveLens);
		  /*and also for touch screens:*/
		  lens.addEventListener("touchmove", moveLens);
		  img.addEventListener("touchmove", moveLens);
		  function moveLens(e) {
		    var pos, x, y;
		    /*prevent any other actions that may occur when moving over the image:*/
		    e.preventDefault();
		    /*get the cursor's x and y positions:*/
		    pos = getCursorPos(e);
		    /*calculate the position of the lens:*/
		    x = pos.x - (lens.offsetWidth / 2);
		    y = pos.y - (lens.offsetHeight / 2);
		    /*prevent the lens from being positioned outside the image:*/
		    if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
		    if (x < 0) {x = 0;}
		    if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
		    if (y < 0) {y = 0;}
		    /*set the position of the lens:*/
		    lens.style.left = x + "px";
		    lens.style.top = y + "px";
		    /*display what the lens "sees":*/
		    result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
		  }
		  function getCursorPos(e) {
		    var a, x = 0, y = 0;
		    e = e || window.event;
		    /*get the x and y positions of the image:*/
		    a = img.getBoundingClientRect();
		    /*calculate the cursor's x and y coordinates, relative to the image:*/
		    x = e.pageX - a.left;
		    y = e.pageY - a.top;
		    /*consider any page scrolling:*/
		    x = x - window.pageXOffset;
		    y = y - window.pageYOffset;
		    return {x : x, y : y};
		  }
		}
</script>

</head>
<body>
	<div id="container">
		<!-- 타이틀 -->
		<div class="title">
			<h1>콜드 브루</h1>
			<nav>
				<ul>
					<li><a href="#"><img src="/StarbucksWeb/images/bobae/home.jpg" alt="홈으로"/></a></li>
					<li>></li>
					<li><a href="#">MENU</a></li>
					<li>></li>
					<li><a href="#">음료</a></li>
					<li>></li>
					<li><a href="#">콜드 브루</a></li> <!-- 전페이지 해당하는 type으로 이동 -->
					<li>></li>
					<li><a href="#">나이트로 바닐라 크림</a></li>	 <!-- 현페이지 -->
				</ul>
			</nav>	
		</div>
		
		<!-- 제품 상세 -->
		<div class="product_view"> 	
			<div class="product_picture">
				<p>
					<div class="product_img img-zoom-container myimagediv">
						<img id="myimage" src="/StarbucksWeb/images/bobae/1-1.jpg" alt="상세이미지" style="weight: 400px; height: 530px;">
					</div>
				</p> 

				<p>
					<div class="product_magnifier">
						<img src="/StarbucksWeb/images/bobae/zoom.jpg" alt="상세이미지" >
					</div>			
				</p>
				<p>
					<div>
						<div class="product_img_small">
							<img src="/StarbucksWeb/images/bobae/1-1.jpg" alt="상세이미지" style="width: 106px; height: 110px;">
						</div>
					</div>
				</p>
			</div>
			
			<div class="product_details">
				<div class="product_details_title">
					<div class="product_title">
						<h3>나이트로 바닐라 크림
						<br>
						<span>Nitro Vanilla Cream</span>
						</h3>
					</div>
					<div class="product_button">
						<a href="#" role="button" class="register" title="나만의 음료 등록 옵션 열기">나만의 음료로 등록</a>
						<a href="#" role="button" class="payment" title="장바구니 옵션 열기">장바구니</a>
					</div>
					<br>
				</div>
				<hr>
					<p class="title1">부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!</p>
				
		
				<form name="product_nutrition" method="post">
					<fieldset>
					<div class="product_nutrition_title">
						<p class="nutrition_title1">제품 영양 정보</p>
						<p class="nutrition_title2">Tall(톨)/355ml(12 fl oz)</p>
					</div>
					<div class="product_info_content">
						<ul id="nutrition_left">
							<li class="kcal">
                            	<dl>
                                	<dt>1회 제공량 (kcal)</dt>
                                    <dd>75</dd>
                                </dl>
                            </li>
                            <li class="cholesterol">
                                <dl>
                                    <dt>포화지방 (g)</dt>
                                    <dd>2</dd>
                                </dl>
                            </li>
                            <li class="protein">
                                <dl>
                                    <dt>단백질 (g)</dt>
                                    <dd>1</dd>
                                </dl>
                            </li>       
                        </ul>
                        <ul>
                            <li class="sodium">
                                <dl>
                                    <dt>나트륨 (mg)</dt>
                                    <dd>20</dd>
                                </dl>
                            </li>
                            <li class="sugar">
                                <dl>
                                    <dt>당류 (g)</dt>
                                    <dd>10</dd>
                                </dl>
                            </li>
                            <li class="caffein">
                                <dl>
                                    <dt>카페인 (mg)</dt>
                                    <dd>245</dd>
                                </dl>
                            </li>
                        </ul>
					</div>
				
					<div class="allergy_triggers">
						<p>알레르기 유발요인 : 우유</p>
					</div>
					</fieldset>
				</form>
			</div>	
			<div id="myresult" class="img-zoom-result" data-zoom-image="/StarbucksWeb/images/bobae/big1-1.jpg" alt=""></div>
			
		</div>
		
		<div class="title2" >부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!</div>		
		
		<div class="productView_footmenu">
			<div class="productView_footmenu_inner">
				<div class="productView_top">
					<div class="productView_top_left">
						<p class="tit">프로모션 새소식</p>
						<p class="more"><a href="#"><img src="/StarbucksWeb/images/bobae/more.jpg" alt="프로모션 새소식 더보기"></a></p>
						<ul class="promotionList">
							<li>해당 상품과 관련된 진행 중인 프로모션이 없습니다.</li>
						</ul>
					</div>
					<div class="productView_top_right">
						<p class="sirenOrder"><a href="#"><img src="/StarbucksWeb/images/bobae/sirenOrder.jpg" alt="사이렌오더란?"></a></p>
						<div class="sirenOrder_title">
							<p class="tit">사이렌오더란?</p>
							<p class="txt">매장에서 줄을 서지 않고 주문하는 쉽고 간편한 O2O (Online to Offline) 서비스로서 앱을 통해 스타벅스 음료, 푸드 및 원두의 결제 및 주문을 완료하면 매장에서 즉시 메뉴를 받을 수 있는 스타벅스만의 신개념 서비스 입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>