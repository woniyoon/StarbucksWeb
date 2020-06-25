<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

<style type="text/css">
	
	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		background-image: url("background.jpg");
	}
	
	
	* {
		margin: 0;
	}
	
	/* 전체 틀 & 기본form 값*/

	div#container { 
		width: 1440px;
	    margin: 0 auto;
	    padding: 50px 0;

	    
		/* text-align: center;	 */			
		/* border: 1px solid red; */
	}

	div#frame {
		width: 60%;
		height: 500px;
		margin: 10px auto;
		padding: 0;
		border: solid 1px #cccccc;
		background-color: white;
	}

	div#box {
		border-top: solid 1px #cccccc;
	}
	
	input {
		margin: 10px;
		box-shadow: none;
	}
	
	ul {
		width: 510px;
		padding: 0 10px;
		list-style-type: none;
	}
	
	fieldset {
         text-align: left;
         border: 0px;
	}
	
	legend {
		font-size: 24pt;
		font-weight: bold;	
		color: white;
	}
	
	fieldset>ul {
		padding: 30px;
		list-style: none;
	}
	
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
		width: 580px;
		height: 30px;
		margin: 15px 0;
		margin-bottom: 0px;
		padding: 8px;
		border-radius: 3px;
	}
	
	div#box {
		padding-top: 10px;
		padding-left: 10px;
	}
	
	/* 아이디 저장  */
	
/* 	input[id="storage"] + label {
		display: inline-block; 
		margin: 10px 10px 0 0;
		padding: 0;
		cursor: pointer; 
		width: 26px; 
		height: 26px;
		background: url('mem_check_off.png') no-repeat;
	}
	
	input[id="storage"]:checked + label {
		background-image: url("mem_check_on.png");
	} 
	
	input[id="storage"] {
		 display: none; 
	} */

	/* 로그인 버튼 */

	div#loginBtn {
		width: 650px;
		height: 60px;
		margin: 10px;
		padding-left: 10px;
	}
	
	input#btnLogin {
		width: 600px;
		height: 60px;
		margin: 0px;
		background-color: #006633;
		border: none;
		border-radius: 2px;
		color: #ffffff;
		font-size: 17pt;
	}
	
	/* 하단 버튼(3) */
	
	a {
		text-decoration: none;
		color: #4d4d4d;
	}
	
	div#bottomBtn {
		width: 90%;
		margin: 20px auto;
		margin-top: 50px;
		display: flex;
	}
	
	.btnJoin {
		flex: 1;
		width: 30%;
		float: left;
		border-right: solid 1px #cccccc;
	}
	
	.btnSearchId {
		flex: 1;
		margin: 0px 5%;
		width: 30%;
	}
	
	.btnSearchPasswd {
		flex: 1;
		width: 30%;
		float: right;
		border-left: solid 1px #cccccc;
	}

</style>

<script type="text/javascript">


	window.onload = function() {
		
		$("로그인버튼").click(function(){
			goLogin(); // 로그인 시도한다.
		});
		
		$("#loginPwd").keydown(function(){
			if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우
				goLogin(); // 로그인 시도한다.
			}
			
		});

		// === 로컬스토리지(localStorage)에 저장된 userid 값을 불러와서 input 태그 userid에 넣어주기 === //
		
		var loginUserid = localStorage.getItem('saveid');
		
		if( loginUserid != null) {
			$("#loginUserid").val(loginUserid);
			$("input:checkbox[id=saveid]").prop("checked",true);
		}
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

		// === 로컬 스토리지(localStorage)에 userid 값 저장시키기 === //
		if( $("input:checkbox[id=saveid]").prop("checked") ) {
		//	alert("아이디저장 체크를 하셨네요");
			
			localStorage.setItem('saveid', $("#loginUserid").val());
		}
		else {
		//	alert("아이디저장 체크를 안 하셨네요");
			localStorage.removeItem('saveid');
		}
		
		var frm = document.loginFrm;
		frm.method = "POST";
		frm.action = "<%= request.getContextPath()%>/login/login.sb";
		frm.submit();
		
	}// end of function goLogin()-----------------------------

</script>

<div id="container">
	<form name="loginFrm">
		<fieldset>
			<legend style="text-align: center;">로그인</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="wlecome">
			  		<span style="color: #006633;">Welcome!    </span><span style="color: #4d4d4d;">스타벅스커피 코리아에 오신 것을 환영합니다.</span>
			  	</div>	
			  <div id="box">
				<ul>
					<li>
						<label for="userid"></label>
						<input class="input1" type="text" name="userid" id="loginUserid" required autofocus placeholder="아이디를 입력해 주세요." />   
					</li>
				</ul>	
				<ul>	
					<li>
						<label for="password" ></label>
						<input class="input1" type="password" name="password" id="loginPwd" required placeholder="비밀번호 입력해 주세요."/>
					</li>
				</ul>	
			  </div>	
			  <div id="storage" style="text-align: left;">
				<ul>
					<li>
						<input type="checkbox" name="storage" id="storage"/><label for="storage"></label>아이디 저장
					</li>
			  	</ul>
			  </div>
			  <div id="loginBtn">
				<ul style="padding: 0px;">
					<li>
						<input type="button" id="btnLogin" value="로그인" />
					</li>
				</ul>
			  </div>
			  <div id="text" style="text-align: left; padding: 0 20px; font-size: 10pt; color: #006633;">
			  	<p>* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.</p>
				<p>* 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.</p>
			  </div>
			  <div id="bottomBtn">
			  	<ul>
					<li>
						<a href="" class="btnJoin">회원가입</a><a href="" class="btnSearchId">아이디 찾기</a><a href="" class="btnSearchPasswd">비밀번호 찾기</a>
					</li>
				</ul>
			  </div>
			</div>
			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />