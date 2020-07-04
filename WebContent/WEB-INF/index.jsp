<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
	
	button.reward_btn_signup:hover {
		background-color: black;
		color: white;
		font-weight: bold;
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
	
	div#section_map {
		/* border: solid 1px red; */
		height: 710px;
		/* background-color: #ffe6ff; */
		background-image: url('images/nari/setion_map_back.jpg);
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
	
	/* -----------------------------------------------------------------  */
	
	.none {
		display:none
	}
	
	#ticker {
		float:left;width:100px;
	}
	.navi {
		float:right;
	}
	.block {
		border:2px solid #d81f25; padding:0 5px; height:20px; overflow:hidden; background:#fff; width:350px; font-family:Gulim; font-size:12px;float:left;
	}
	.block ul, .block li { 
		margin:0; padding:0; list-style:none;
	}
	.block li a { 
		display:block; height:20px; line-height:20px; color:white; text-decoration:none;
	}
	
	/* ---------------------------- 푸터 끝 -------------------------- */

</style>	

<script type="text/javascript">
	

	$(document).ready(function(){
		
		
		
	});
</script>



		<section>
			<div id="section_new_product" class="new_back_size">
				<div id="section_new_product_slogan">
					<div class="section_new_product_emblem back_size_eb"></div> 
					
					<button class="section_new_product_more" onclick="alert('자세히보기')" >자세히보기</button>
				</div>
				<div class="section_new_product_limemojito back_size_lm" style="cursor: pointer;" onclick="window.location.href='/product/menu.sb'"></div>
				<div class="section_new_product_doubleexpresso back_size_de" style="cursor: pointer;" onclick="window.location.href='/product/menu.sb'"></div>
				<div class="section_new_product_applemango back_size_am" style="cursor: pointer;" onclick="window.location.href='/product/menu.sb'"></div>
			</div>
			
			<div id="section_notice">
				<table id="section_notice_table">
					<tr>
						<td id="section_notice_title">공지사항 </td>
						<td>
						<div class="block">
							<ul id="ticker">
								<li><a href="<%= ctxPath%>/notice/noticeList.sb">제목1</a></li>
								<li><a href="<%= ctxPath%>/notice/noticeList.sb">제목2</a></li>
								<li><a href="<%= ctxPath%>/notice/noticeList.sb">제목3</a></li>
								<li><a href="<%= ctxPath%>/notice/noticeList.sb">제목4</a></li>
							</ul>
						</div>
						
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
					<button class="reward_button reward_btn_signup" type="button" onclick="window.location.href='<%= ctxPath%>/register/memberRegister.sb'">회원가입</button>
					<button class="reward_button reward_btn_login" type="button" onclick="window.location.href='<%= ctxPath%>/login/loginIndex.sb'">로그인</button>
					<br/>
					<button class="reward_button reward_btn_product" type="button" onclick="window.location.href='/product/menu.sb'">더 많은 상품보기</button>
				</div>	
			</div>
			</section>
			
			<div id="section_recommended_menu">
				<img id="section_recommended_text" src="images/nari/section_recommended_text1.png" />
				<img id="section_recommended_menu_1" src="images/nari/section_recommended_menu_1.jpg" width="500px" height="500px" style="cursor: pointer;" onclick="window.location.href='/product/menu.sb'"/>
			</div>
			
			<div id="section_reserve">
			
			</div>
			
			<div id="section_map">
			    <jsp:include page="location.jsp"/>
			</div>
		
		</section>
		
		<!-- --------------------------------- 바디 끝 ---------------------------------- -->

<script>
	jQuery(function($)
		{
		    var ticker = function()
		    {
		        timer = setTimeout(function(){
		            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
		            {
		                $(this).detach().appendTo('ul#ticker').removeAttr('style');
		            });
		            ticker();
		        }, 2000);         
		      };
		// 0번 이전 기능
		      $(document).on('click','.prev',function(){
		        $('#ticker li:last').hide().prependTo($('#ticker')).slideDown();
		        clearTimeout(timer);
		        ticker();
		        if($('#pause').text() == 'Unpause'){
		          $('#pause').text('Pause');
		        };
		      }); // 0번 기능 끝
		  
		// 1. 클릭하면 다음 요소 보여주기... 클릭할 경우 setTimeout 을 clearTimeout 해줘야 하는데 어떻게 하지..
		      $(document).on('click','.next',function(){
		            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
		                    {
		                        $(this).detach().appendTo('ul#ticker').removeAttr('style');
		                    });
		            clearTimeout(timer);
		            ticker();
		            //3 함수와 연계 시작
		            if($('#pause').text() == 'Unpause'){
		              $('#pause').text('Pause');
		            }; //3 함수와 연계
		          }); // next 끝. timer 를 전연변수보다 지역변수 사용하는게 나을 것 같은데 방법을 모르겠네요.

		  //2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
		  var autoplay = true;
		      $(document).on('click','.pause',function(){
		            if(autoplay==true){
		              clearTimeout(timer);
		              $(this).text('재생');
		              autoplay=false;
		            }else{
		              autoplay=true;
		              $(this).text('정지');
		              ticker();
		            }
		          }); // 재생정지기능 끝  
		  // 3. 재생정지 함수 시작. 2와 기능 동일함.
		    var tickerpause = function()
		  {
		    $('#pause').click(function(){
		      $this = $(this);
		      if($this.text() == 'Pause'){
		        $this.text('Unpause');
		        clearTimeout(timer);
		      }
		      else {
		        ticker();
		        $this.text('Pause');
		      }
		    });
		   
		  };
		  tickerpause();
		  //3 재생정지 함수 끝
		  //4 마우스를 올렸을 때 기능 정지
		  var tickerover = function()
		  {
		    $('#ticker').mouseover(function(){
		      clearTimeout(timer);
		    });
		    $('#ticker').mouseout(function(){
		      ticker();
		    });  
		  };
		  tickerover();
		  // 4 끝
		    ticker();
		    
		});

</script>

		
<jsp:include page="footer.jsp" />

