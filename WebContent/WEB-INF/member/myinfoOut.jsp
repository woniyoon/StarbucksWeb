<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
        
<jsp:include page="header.jsp" /> 

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>회원탈퇴</title>
<style type="text/css">

	* {
		margin: 0px;
		padding: 0px;
	}
	
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
	
	#box3{
         width: 800px;
         height: 250px;
         margin-right: 3px;
         float: left;
         background: url("/StarbucksWeb/images/hyejeong/m_voc_top_bg.png");
         background-size: 100px 100px;
    }
     
    .txt_zone {
    	width: 800px;
    	margin-right: 50px;
    } 
    
    .p1 {
     	font-size: 18pt;
     	font-weight: bold;
     	line-height: 1.2;
     	margin-top: 80px;
     	padding-left: 50px;
    }

	.s1 {
		color: #006633;
	}    
	
	.s2 {
		font-size: 12pt;
		font-weight: normal;
	}
	
	.mem_level {
		margin-left: auto;
		margin-right: auto;
		padding-left: 50px;
	}
	
	.mem_level:after {
		content: '';
		clear: both;
		display: block;
	}
	
	ul {
		display: block;
		list-style: none;
	}
    
    li {
    	display: list-item;
		margin: 0;
		padding: 0;
		border: 0;
		float: left;
		margin-right: 10px;
 	}
 	
 	.li1 {
 		font-size: 18pt;
 		font-weight: bold;
 	}
    
 	.li2 {
 		font-size: 14pt;
 	}
 	
 	li.li2 span {
 		font-size: 18pt;
 		font-weight: bold;
 	}
    
 	.li3 {
 		font-size: 14pt;
 	}
    
    li.li3 span {
 		font-size: 18pt;
 		font-weight: bold;
 	}
    
    #box4 {
    	 width: 300px;
         height: 200px;
         float: right;
    }
    
    .panel-body {
    	cursor: pointer;
    }
	
    
    #con2 {
   		width: 1200px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
		/* border: solid 1px red; */	
    }
    
    #box5 {
    	width: 500px;
    	height: 30px;
    	margin-bottom: 20px;
    	font-size: 18pt;
    	font-weight: bold;
    	color: #222;
    }
	
	#box6 {
		width: 803px;
		height: 400px;
		border: solid 1px #ddd;
		color: #666;
		padding: 10px 5px 10px 5px;
	}
	
	#box6 ul {
		padding-left: 10px;
		font-size: 12pt;
		/* border: solid 1px pink;  */
	}
	
	#box6 li {
		margin-bottom: 10px;
	}
	
	#agree {
		width: 1000px;
    	height: 30px;
    	margin-top: 20px;
    	font-size: 18px;
    	color: #222;
    	margin-left: 10px;
	}	
	
	#delAccount {
		width: 650px;
		height: 50px;
		margin-top: 30px;
		margin-bottom: 50px;
		margin-left: 430px;
		background-color: #e2c383;
	}
	
	#delAccount p {
		font-weight: bold;
		font-size: 20px;
		text-align: center;
		padding-top: 10px;
	}
	
	#delAccount a {
		color: black;	
	}
	
	.panel-heading {
		cursor: pointer;
	}
	
</style>
    
<script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/JqueryStudy/util/myutil.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var date = new Date();
	$('#now_date').html(moment(date).format('YYYY년 MM월 DD일 '));

});


function goDel(userid) {
    
    var $target = $(event.target);
    
    var bAgree = $("input:checkbox[id=ck_agree]").prop("checked"); 
	
	if(bAgree == 0) {
	
		alert("회원탈퇴 후 마이 스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실에 대해 동의하여야 합니다.");
		
		return;
	}
	else if(bAgree == 1) {
		
		var bool = confirm("정말 회원탈퇴 하시겠습니까?");
       	
	    if(bool) {
	    //	alert("탈퇴 완료");
	    //	location.href = "http://localhost:9090/StarbucksWeb/login/loginIndex.sb";
	    	
	    	var frm = document.delMemFrm;
	    	frm.userid.value = userid;
			frm.action = "/StarbucksWeb/member/delMember.sb";
			frm.method = "post";
			frm.submit();
			
	    }
	    else {
	    	alert("회원탈퇴를 취소하셨습니다");
	    	var bAgree = $("input:checkbox[id=ck_agree]").prop("checked", false);
	    }
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
</script>

</head>
<body>
<div id="container">
     <header>
     	<div id="box1"></div>
     	<div id="box2">
     		<img src="../images/jiwon/coffeeBeans.jpg">
     		<div style="padding-right: 1000px; top: 160px; font-size: 3em; font-weight: bold; position: absolute; color: white;">
			 회원탈퇴
			</div>
     	</div>
     </header>
     
     <nav>
     	<div id="con1">
     		<div id="box3">
     		<!-- <img src="img/bg_transparent.png"> -->
     		<div class="txt_zone">
     			<p class="p1">
     				<!-- <span class="s1 userName">GOLD37</span>님의 <span class="year">2020</span>년 <span class="month">6</span>월 <span class="date">17</span>일 <span class="end">현재 스타벅스 서비스 현황입니다.</span><br> -->
     				<span class="s1 userName">${(sessionScope.loginuser).name}</span>님의 <span id="now_date"></span><span class="end">현재 스타벅스 서비스 현황입니다.</span><br>
     				<span class="s2">아래 사항들을 확인하시고, 회원탈퇴에 대해 다시 한번 신중히 결정해주세요.</span>
     			</p>
     			<ul class="mem_level">
     				<li class="li1" style="color: rgb(0,0,0);">
		     			<c:if test="${(sessionScope.loginuser).point>=10000}">
		     				<strong class="userGrade" style="color: gold;">Gold Level</strong>
		     			</c:if>
		     			<c:if test="${(sessionScope.loginuser).point>=5000 && (sessionScope.loginuser).point<10000}">
		     				<strong class="userGrade" style="color: green;">Green Level</strong>
		     			</c:if>
		     			<c:if test="${(sessionScope.loginuser).point<5000}">
		     				<strong class="userGrade" style="color: brown;">Welcome Level</strong>
		     			</c:if>
     				</li>
     				<li class="li2">유효한 포인트 : <span>${(sessionScope.loginuser).point}p</span></li>
     			</ul>
     		</div>
     		</div>
     		
     		<div id="box4">
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
			        <div class="panel-body" style="background-color: white;"><a href="javascript:goinfoOut('${(sessionScope.loginuser).userid}');">회원 탈퇴</a></div>
			        <div class="panel-body"><a href="javascript:goEditPersonal('${(sessionScope.loginuser).userid}');">비밀번호 변경</a></div>
		         </div>
		    </div>
     		</div>
     	</div>
     	
     	<div id="con2">
     		<p id="box5">마이 스타벅스 리워드 서비스 해지 시 유의사항</p>
     		<div id="box6">
     			<ul>
     				<li>회원 탈퇴 시에는 고객님의 개인정보 및 등록하신 스타벅스 카드의 정보가 모두 삭제되어, 더 이상 MSR 혜택을 받으실 수 없습니다.</li>
     				<li>회원탈퇴에 의해 등록 해지된 일반 스타벅스 카드는 재등록을 하지 않은 상태에서도 스타벅스에서 정상적으로 이용이 가능하지만, 별의 지급, 분실, 분실신고 시 잔액보장 등의 다양한 MSR 혜택은 더 이상 누리실 수 없게 됩니다.</li>
     				<li>정상 이용하셨던 일반 스타벅스 카드는 탈퇴와 함께 자동 해지되어 회원 재가입 후 본인 또는 다른 사용자에 의해 다시 등록될 수 있지만 이전에 사용하셨던 거래정보는 확인하실 수 없습니다.</li>
     				<li>중지된 카드에 잔액이 남아있는 경우, 잔액이전이나 잔액환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능하며, 중지된 카드는 재사용 또는 재등록이 불가합니다.</li>
     				<li>골드카드는 수령등록이 완료된 경우에만 회원 탈퇴가 가능합니다.</li>
     				<li>등록된 골드카드에 잔액이 남아있는 경우, 잔액 소진, 잔액 이전 또는 잔액 환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능합니다.</li>
     				<li>잔액이 남아있지 않은 골드 카드는 탈퇴와 함께 자동 중지되어 재사용 또는 재등록이 불가합니다.</li>
     			</ul>
     		</div>
     		<div id="box7" ><input type="checkbox" id="ck_agree" /><label id="agree" for="ck_agree">회원탈퇴 후 마이 스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실에 대해 동의합니다.</label></div>
     	</div>
     </nav>
     <div id="delAccount" onClick="goDel('${(sessionScope.loginuser).userid}');"><p><a>마이 스타벅스 리워드 서비스 이용내역 일괄삭제</a></p></div>
     
<form name="delMemFrm">
	<input type="hidden" name="userid"/>
</form>

<form name="myinfoEditPwdFrm">
	<input type="hidden" name="userid"/>
</form>

<form name="myinfoOutFrm">
	<input type="hidden" name="userid"/>
</form>

    
</div>

<jsp:include page="footer.jsp" />