<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<jsp:include page="../header.jsp" /> 
    
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>마이페이지</title>

<style type="text/css">

	* {
		margin: 0px;
		padding: 0px;
	}
	
/*
 	#box1 {
		height: 100px; 
		margin: 0;
		padding: 0;
		background-color : green;
	}
 */	
 
	#box2 {
		overflow: hidden;	/* div를 벗어나는 부분을 가려주는 역할 */
		display: flex;
        align-items: center;
        justify-content: center;
        height: 150px;
	}
	
	#box2 img {
		width: 100%;
	}

	#con1 {
		width: 1200px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
	}	
	
	#con1:after {
		content: '';
		clear: both;
		display: block;
	}
	
	#box3 {
        width: 400px;
        height: 250px;
        /* background-color: deeppink; */
        margin-right: 3px;
        float: left;
        border: solid 1px deepbink;
        background: url("/StarbucksWeb/images/hyejeong/m_voc_top_bg.png");
        background-size: 100px 100px;
     }
     
     h5 {
		display: block;
	    font-size: 14pt;
	    padding-left: 30px;
	    font-weight: bold;
	}
	
	.star_reward {
		display: block;
	    width: 67.5%;
	    height: 50.1%;
	    position: relative;
	    margin: 0 auto;
	}
    
    .star_reward img {
    	width: 250px;
    	height: 150px;
    }
    
    .totalStar {
    	font-size: 40pt;
    	font-weight: bolder;
    	/* border: solid 1px blue; */
    	position: absolute;
    	margin-left: -143px;
    	margin-top: 25px;
    	
    }
    
    #box3 p {
  		margin-top: 40px;  
    	text-align: center;
    	font-size: 14pt;
    }
    
    .level {
    	color: #0d5f34;
    }
    
     #box4 {
        width: 400px;
        height: 250px;
        float: left;
		background: url("/StarbucksWeb/images/hyejeong/m_voc_top_bg.png");
        background-size: 100px 100px;
     }
     
     #box4 p {
		margin-top: 70px;
		padding-left: 30px;     
     }
         
     #box4 span {
	    width: 300px;
     	font-size: 16pt;
	    line-height: 35px;
	    margin-top: 30px;
     }
    
    .recommended_menu ul {
    	list-style: none;
    	padding-left: 30px;
    	margin-top: 50px;
    }
    
    .user_edit ul {
    	list-style: none;
    	padding-left: 30px;
    	margin-top: 50px;
    }
    
    .recommended_menu ul li {
    	float: left;
    	margin-right: 10px;
    }
    
    .user_edit ul li {
    	float: left;
    	margin-right: 10px;
    }
    
    #box4 .btn_black {
		width: 125px;
		height: 35px;
    	background: #222;
   		border: 1px solid #222222;
   		font-size: 12pt;
   		text-align: center;
   		border-radius: 3px;
		padding-top: 5px;
    }
    
    #box4 .btn_gray {	
    	width: 125px;
		height: 35px;
    	background: #777;
   		border: 1px solid #777;
   		font-size: 12pt;
   		text-align: center;
   		border-radius: 3px;
   		padding-top: 5px;
    }
    
    .btn_black a, .btn_gray a {
    	color: #fff;
    	font-weight: bold;
    	cursor: pointer;
	}
    
    #box5 {
   	 	width: 300px;
        height: 200px;
        float: right;
    }
    
    #con2 {
   		width: 1200px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
    }
	
	#box6 {
		width: 803px;
		height: 400px;
		margin-top: 30px;
		margin-bottom: 30px;
		border: solid 1px #ddd;
		background: url("/StarbucksWeb/images/hyejeong/m_voc_top_bg.png");
        background-size: 100px 100px;		
	}
	
	.rank_head {
		font-size: 12pt;
		text-align: center;
		margin-top: 20px;
	}
	
	select {
		height: 30px;
	    width: 78px;
	    font-size: 14pt;
	}
	
	.panel-heading {
		cursor: pointer;
	}
	
	ul.index {
		margin-top: 13.333px;	
	}
	
</style>

<script type="text/javascript">

$(document).ready(function(){
	

	$("#random").click(function(){		
		showImage();
	});
		
	
});


	// 음료 이미지
	var imgArray = new Array();
	imgArray[0] = "../images/jiwon/menu1.jpg";
	imgArray[1] = "../images/jiwon/menu2.jpg";
	imgArray[2] = "../images/jiwon/menu3.jpg";
	imgArray[3] = "../images/jiwon/menu4.jpg";
	imgArray[4] = "../images/jiwon/menu5.jpg";
	
	
	// 확인 클릭 시 음료이미지 랜덤으로 보여주기
	function showImage(){
	
		var total = {};	// {0: 0, 1:0, 2:0 }
	
		var imgCnt = $(".recommended_menu > ul").children().length;
	
		for (var i=0; i<imgCnt; i++) {
			var imgNum = Math.round(Math.random()*4);
			
			while(total[imgNum] != null) {
				imgNum = Math.round(Math.random()*4);				
				console.log(total);
			}
				
			total[imgNum] = 0;
			console.log(imgNum);
			var objImg = document.getElementById("randomImg" + (i+1));
			objImg.src = imgArray[imgNum];
		}
	
	}
	
	
	// 비밀번호 변경
	function goEditPersonal(userid) {
		var frm = document.myinfoEditPwdFrm;
		frm.userid.value = userid;
		
		frm.method = "POST";
		frm.action = "/StarbucksWeb/member/myinfoEditPwd.sb";
		frm.submit();
	}

	
	// 회원정보 변경
	function goEditInfo(name) {
 		var frm = document.goEditInfoFrm;

		frm.method = "POST";
		frm.action = "/StarbucksWeb/member/myinfoEdit.sb";
		frm.submit(); 
		
	//	alert("확인용 :"+ name);
	}
	
	// 회원탈퇴
	function goinfoOut(userid) {
		var frm = document.myinfoOutFrm;
		frm.userid.value = userid;
		
		frm.method = "POST";
		frm.action = "/StarbucksWeb/member/myinfoOut.sb";
		frm.submit();
	} 
	
	
</script>
</head>
<body onload="showImage()">
<form name="goEditInfoFrm">
<div id="container">
     <header>
     	<div id="box1"></div>
     	<div id="box2">
     	<img src="../images/jiwon/coffeeBeans.jpg">
     		<div style="padding-right: 1000px; top: 150px; font-size: 3em; font-weight: bold; position: absolute; color: white;">
			 My Starbucks
			</div>
     	</div>
     </header>
     
     <nav>
     	<div id="con1">
     		<div id="box3">
			
     		<h5>My 리워드</h5>
     		
     		<figure class="star_reward"><img src="../images/jiwon/star_reward.png">
     			<span class="totalStar">S</span> 
     		</figure>
     		
     		<p>${(sessionScope.loginuser).name}님의 현재 포인트 : <strong class="level">${(sessionScope.loginuser).point}P</strong></p>
     		
     		</div>
     		
     		
     		<div id="box4"> 
     			<p>
	     		<span>
		     		<strong class="userName">${(sessionScope.loginuser).userid}</strong>님은<br>현재 
		     			<c:if test="${(sessionScope.loginuser).point>=10000}">
		     				<strong class="userGrade" style="color: gold;">Gold Level</strong>
		     			</c:if>
		     			<c:if test="${(sessionScope.loginuser).point>=5000 && (sessionScope.loginuser).point<10000}">
		     				<strong class="userGrade" style="color: green;">Green Level</strong>
		     			</c:if>
		     			<c:if test="${(sessionScope.loginuser).point<5000}">
		     				<strong class="userGrade" style="color: brown;">Welcome Level</strong>
		     			</c:if>
		     		이십니다.
	     		</span>
	     		</p>
	     		<div class="user_edit">
		     		<ul>
		     			<li class="btn_black"><a href="javascript:goEditInfo('${(sessionScope.loginuser).name}');">
		     			<input type="hidden" name="name" value="${(sessionScope.loginuser).name}"/>
		     			<input type="hidden" name="userid" value="${(sessionScope.loginuser).userid}"/>
		     			<input type="hidden" name="gender" value="${(sessionScope.loginuser).gender}"/>
		     			
		     			<%-- >
		     			
 		     			<input type="hidden" name="Birthyyyy" value="${(sessionScope.loginuser).Birthyyyy}"/>
		     			<input type="hidden" name="Birthmm" value="${(sessionScope.loginuser).Birthmm}"/>
		     			<input type="hidden" name="Birthdd" value="${(sessionScope.loginuser).Birthdd}"/>
 		     			<input type="hidden" name="birthSol" value="${(sessionScope.loginuser).birthSol}"/>
 		     			
 		     			--%>
 		     			
		     			<input type="hidden" name="hp1" value="${(sessionScope.loginuser).hp1}"/>
		     			<input type="hidden" name="hp2" value="${(sessionScope.loginuser).hp2}"/>
		     			<input type="hidden" name="hp3" value="${(sessionScope.loginuser).hp3}"/>
		     			<input type="hidden" name="email" value="${(sessionScope.loginuser).email}"/>
		     			개인정보 수정</a></li>
		     			<li class="btn_gray"><a href="javascript:goEditPersonal('${(sessionScope.loginuser).userid}');">비밀번호 변경</a></li>
		     		</ul>
	     		</div>
     		</div>
     		
     		
     		<div id="box5">
     		<div class="panel panel-default">
	     		 <div class="panel-heading">
			     <h4 class="panel-title"> 
	     		 <a data-toggle="collapse" onclick="location.href='http://localhost:9090/StarbucksWeb/member/myMenu.sb'">My 메뉴</a>
	     	 	 </h4>
			    </div>
		    </div> 
     		<div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse2">개인정보관리</a>
			        </h4>
		      	  </div>
		      	  <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body"><a href="http://localhost:9090/StarbucksWeb/member/myinfoEdit.sb">개인정보확인 및 수정</a></div>
			        <%-- <div class="panel-body" style="background-color: white;"><a href="http://localhost:9090/StarbucksWeb/member/myinfoOut.sb" value="${(sessionScope.loginuser).email}">회원 탈퇴</a></div> --%>
			        <div class="panel-body" style="background-color: white;"><a href="javascript:goinfoOut('${(sessionScope.loginuser).userid}');">회원 탈퇴</a></div>
			        <div class="panel-body"><a href="javascript:goEditPersonal('${(sessionScope.loginuser).userid}');">비밀번호 변경</a></div>
		         </div>
		    </div>
     		</div>
     	</div>
     	
     	<div id="con2">
     		<div id="box6">
     			<header class="rank_head">
		     		<p>스타벅스 코리아를 사랑하는
		     		<!-- <label>연령대</label> -->
		     		<select>
		     			<option value="10">10대</option>
		     			<option value="20" selected="selected">20대</option>
		     			<option value="30">30대</option>
		     			<option value="40">40대</option>
		     			<option value="50">50대</option>
		     		</select>
		     		<!-- <label>성별</label> -->
		     		<select>
		     			<option value="woman">여성</option>
		     			<option value="man">남성</option>
		     		</select>
		     		이 즐기는 메뉴가 궁금하시죠? <button title="메뉴 확인하기" id="random">확인</button></p>
	     		</header>

				<div class="recommended_menu">
		     		<ul>
		     			<li><img id = "randomImg1" border="0" width="230px" height="250px"></li>
		     			<li><img id = "randomImg2" border="0" width="230px" height="250px"></li>
		     			<li><img id = "randomImg3" border="0" width="230px" height="250px"></li>
		     		</ul>
	     		</div>
     		</div>
     	</div>
     </nav>
</div>
</form>

<form name="myinfoEditPwdFrm">
	<input type="hidden" name="userid"/>
</form>

<form name="myinfoOutFrm">
	<input type="hidden" name="userid"/>
</form>

<jsp:include page="../footer.jsp" />