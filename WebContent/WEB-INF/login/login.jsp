<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

<style type="text/css">
	
	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		background-image: url("background.jpg");
		margin: 0;
	}

	/* 전체 틀 & 기본form 값*/
	
	form {
		width: 100%;
		-webkit-background-size: cover;
	}

	div#container { 
		width: 100%;
	    margin: 0 auto;
	    padding: 0;

		/* text-align: center;	 */			
		/* border: 1px solid red; */
	}

	div#frame {
		width: 31%;
		/* height: 60%; */
		margin: 10px auto;
		padding: 0;
		border: solid 1px #cccccc;
		background-color: white;
		border-radius: 3px;
	}

	div#box {
		border-top: solid 1px #cccccc;
		margin: 0 auto;
	}
	
	input {
		margin: 10px;
		box-shadow: none;
	}
	
	ul#input {
		/* width: 510px; */
		/* padding: 0 10px; */
		padding: 0;
		margin: 0; 
		list-style-type: none;
	}
	
	fieldset {
         text-align: left;
         border: 0px;
         height: 660px;
	}
	
	div#login {
		font-size: 22pt;
		color: white;
		margin: 20px;
		margin-top: 50px;
	}
	
	form
	
	
	fieldset>ul>li>label:first-child {
		display: inline-block;
		width: 10%;
		/* border: solid 1px green; */
	} 

	/*welcome*/
	
	div#wlecome {
		height: 50px;
		margin-top: 30px;
	}
	
	input.input1 {
		/* width: 580px; */
		width: 90%;
		border: 1px solid #ddd;
		height: 30px;
		margin: 5px 0;
		margin-bottom: 0px;
		padding: 8px;
		border-radius: 3px;
	}

	
	/* 아이디 저장  */
	
 	/* .storage input[type="checkbox"] {
		display: none;
	}
	
	.storage label {
		width: 100%;
		height: 50px;
	}
	
	.storage input[type="checkbox"] + label {
		position: relative;
		display: inline-block; 
		margin: 10px 10px 0 20px;
		padding: 0;
		cursor: pointer;
		height: 26px;
		background: url('/StarbucksWeb/images/hyejeong/mem_check_off.png') no-repeat;
		vertical-align: top;
		background-size: 26px;
		padding-left: 35px; 
	}
	
	
	#storage input[type="checkbox"]:checked + label {
		background: url('/StarbucksWeb/images/hyejeong/mem_check_on.png') no-repeat;
	}   */
	
	
 	 input[id="storage"] + label {
 		position: relative;
		display: inline-block; 
		margin: 10px 10px 0 20px;
		padding: 0;
		cursor: pointer;
		height: 26px;
		background: url('/StarbucksWeb/images/hyejeong/mem_check_off.png') no-repeat;
		vertical-align: top;
		background-size: 26px;
		padding-left: 35px;
	}
	
	input[id="storage"]:checked + label {
		 position: relative;
		display: inline-block; 
		margin: 10px 10px 0 20px;
		padding: 0;
		cursor: pointer;
		height: 26px;
		vertical-align: top;
		background-size: 26px;
		padding-left: 35px; 
		background: url('/StarbucksWeb/images/hyejeong/mem_check_on.png') no-repeat;
	} 
	
	input#storage {
		 position: absolute;
		 width: 26px;
		 height: 26px;
		 cursor: pointer;
		 border: 0 none;
		 background: #fff;
		 vertical-align: middle; 
	}  
	
	
	/* 로그인 버튼 */

	div#loginBtn {
		width: 100%;
		height: 60px;
	}
	
	input#btnLogin {
		/* width: 600px; */
		width: 93%;
		height: 60px;
		margin: 0 auto;
		background-color: #006633;
		border: none;
		border-radius: 2px;
		color: #ffffff;
		font-size: 17pt;
		cursor: pointer;
	}
	
	/* 하단 버튼(3) */
	
	a.bottom {
		text-decoration: none;
		color: #666;
		display: block;
		font-size: 16px;
		height: 100%;
		line-height: 54px;
		width: 100%;
	}
	
	div#bottomBtn {
		width: 100%;
		display: table;
		text-align: center;
	}
	
	ul.bottom {
		display: table;
		list-style-type: none;
	}
	
	div#bottomBtn ul li {
		box-sizing: border-box;
		float: left;
		position: relative;
		vertical-align: top;
		width: 33.3%;
	}
	
	
	div#bottomBtn ul li:after {
		border-right: 1px solid #ddd;
		color: #666;
		content: "";
		height: 22px;
		margin-top: -11px;
		position: absolute;
		right: -1px;
		top: 50%;
	}
	
	ul#input.bottom {
		margin: 0;
	}
	
	/*  a.btnJoin {
		/* flex: 1;
		width: 30%;
		float: left;
		border-right: solid 1px #cccccc; 
		border:solid 1px red;
	}*/
	
	
/* 	a.btnSearchId {
		flex: 1;
		margin: 0px 5%;
		width: 30%; 
		border:solid 1px red;
	} */
	
	a.btnSearchPasswd {
		/* flex: 1;
		width: 30%;
		float: right;
		border-left: solid 1px #cccccc; 
		border:solid 1px red;*/
		border-right: none;
	}  
	
	div#bottomBtn ul li.last:after {
		border-right: none;
	}

</style>

<script type="text/javascript">


	window.onload = function() {
		
		$("#loginBtn").click(function(){
			goLogin(); // 로그인 시도한다.
		});
		
		$("#loginPwd").keydown(function(){
			if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우
				goLogin(); // 로그인 시도한다.
			}
			
		});

		// === 로컬스토리지(localStorage)에 저장된 userid 값을 불러와서 input 태그 userid에 넣어주기 === //
		
		/* var loginUserid = localStorage.getItem('saveid');
		
		if( loginUserid != null) {
			$("#loginUserid").val(loginUserid);
			$("input:checkbox[id=storage]").prop("checked",true);
		} */
	}
	

	/* === 로그인 처리 함수 === */
	function goLogin() {
		
	//	alert("확인용 로그인 처리");
	
		var loginUserid = $("#loginUserid").val().trim();
		var loginPwd = $("#loginPwd").val().trim();
		
		if(loginUserid == "") {
			alert("아이디를 입력해 주세요.");
			$("#loginUserid").val("");
			$("#loginUserid").focus();
			return; // goLogin() 함수 종료.
		}
		
		
		if(loginPwd == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#loginPwd").val("");
			$("#loginPwd").focus();
			return; // goLogin() 함수 종료.
		}

		/* // === 로컬 스토리지(localStorage)에 userid 값 저장시키기 === //
		if( $("input:checkbox[id=storage]").prop("checked") ) {
		//	alert("아이디저장 체크를 하셨네요");
			
			localStorage.setItem('saveid', $("#loginUserid").val());
		}
		else {
		//	alert("아이디저장 체크를 안 하셨네요");
			localStorage.removeItem('saveid');
		} */
		
		var frm = document.loginFrm;
		frm.method = "POST";
		frm.action = "<%= request.getContextPath()%>/login/login.sb";
		frm.submit();
		
	}// end of function goLogin()-----------------------------

</script>


	<form name="loginFrm" style="background: url('/StarbucksWeb/images/hyejeong/login_bg.jpg') center top no-repeat fixed #0a0807;">
		<fieldset>
			<div id="form" style="text-align: center;">
			<div id="login" style="text-align: center; ">로그인</div>
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="wlecome">
			  		<span style="color: #006633;">Welcome!    </span><span style="color: #4d4d4d;">스타벅스커피 코리아에 오신 것을 환영합니다.</span>
			  	</div>	
			  <div id="box">
				<ul id="input">
					<li>
						<label for="userid"></label>
						<input class="input1" type="text" name="userid" style="margin-top: 20px;" id="loginUserid" required autofocus placeholder="아이디를 입력해 주세요." />   
					</li>
				</ul>	
				<ul id="input">	
					<li>
						<label for="password" ></label>
						<input class="input1" type="password" name="password" id="loginPwd" style="margin-top: 10px;" required placeholder="비밀번호 입력해 주세요."/>
					</li>
				</ul>	
			  </div>	
			   <div id="storage" style="text-align: left;">
				<ul id="input">
					<li style="height: 50px;">
						<input type="checkbox" name="storage" id="storage" style="margin-left: 20px; border: 0 none; background: #fff; "/><label for="storage">아이디 저장</label>
					</li>
			  	</ul>
			  </div> 
			  
			  <!-- <div class="storage" style="text-align: left;">
				<input type="checkbox" name="storage" id="storage" style="margin-left: 20px; border: 0 none; background: #fff; "/>
				<label for="storage">
					아이디 저장
				</label>
			  </div> -->
			  <div id="loginBtn">
				<ul id="input" style="padding: 0px;">
					<li>
						<input type="button" id="btnLogin" value="로그인" />
					</li>
				</ul>
			  </div>
			  <div id="text" style="text-align: left; padding: 0 20px; font-size: 10pt; color: #006633;">
			  	<p>* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.<br/>
			  	* 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.</p>
			  </div>
			  <div id="bottomBtn">
			  	<ul id="input" class="bottom" style="width: 100%;">
					<li>
						<a href="<%= ctxPath%>/register/memberRegister.sb" class="bottom btnJoin">회원가입</a>
					</li>
					<li>
						<a href="" class="bottom btnSearchId">아이디 찾기</a>
					</li>
					<li class="last">
						<a href="" class="bottom btnSearchPasswd">비밀번호 찾기</a>
					</li>
				</ul>
			  </div>
			</div>
			</div>	
		</fieldset>
	</form>



<jsp:include page="../footer.jsp" />