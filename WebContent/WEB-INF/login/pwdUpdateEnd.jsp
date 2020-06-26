<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxPath = request.getContextPath();
%> 

<jsp:include page="../header.jsp" />    

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
	
	body {
		font-family: 'nbg', '맑은 고딕', HelveticaNeue, DroidSans, Sans-serif, Helvetica;
	}
	
	* {
		margin: 0;
	}
	
	/* 전체 틀 & 중간항목 기본form 값*/

	div#container { 
		/* width: 100%;
	    margin: 0 auto;
	    padding: 0; */
		/* text-align: center;	 */			
		/* border: 1px solid red; */
	}

	div#frame {
		width: 550px;
		margin: 20px auto;
		padding: 0;
		border: solid 1px #cccccc;
		border-radius: 3px;
	}

	div#box {
		border-radius: 3px;
		padding: 30px 20px;
		
	}
	
	input {
	/* 	width: 520px;
		padding: 5px;
		margin: 10px;
		margin-top: 15px;
		box-shadow: none;
		border: solid 1px #cccccc;
		border-radius: 3px; */
		
		
		box-shadow: none;
		border: solid 1px #cccccc;	
		border-radius: 3px;
	    box-sizing: border-box;
	    display: block;
	    font-size: 14px;
	    padding: 20px 20px 20px 0;
	    text-indent: 20px;
	    width: 100%;
	    max-width: 520px;
	    -webkit-appearance: none;
	}
	
	ul {
		list-style-type: none;
	}
	
	ul.body {
		width: 510px;
		padding: 10px 15px;
		list-style-type: none;
		padding-inline-start: 15px;
	}
	
	ul#btn {
		width: 548px;
		height: 100px;
		margin: 0 auto;
		padding: 0;
		text-align: center;
	}
	
	
	fieldset {
         text-align: left;
         border: 0px;
	}
	
	legend {
		font-size: 20pt;
		font-weight: bold;	
	}

	
	fieldset>ul#body>li>label:first-child {
		display: inline-block;
		width: 10%;
		/* border: solid 1px green; */
	} 
	
	p {
		margin: 0;
		margin-top: 10px;
	}
	
	

	/* 입력 - 가능 */
	
	.successInput {
		background: #f2f2f2;
	}
	
	/* 입력 - 비활성화 */
	
	.bgcol {
		border: solid 1px red;
	}
	
	/*아이디~비밀번호확인*/
	
	div#headImg {
		padding: 10px;
		margin: 20px;
	}
	
	input.input1 {
		width: 500px;
		height: 80px;
		margin: 0 10px;
		padding-left: 8px;
		border-radius: 3px;
	}
	
	input {
		height: 58px;
	}

	/* 이름~메일 */
	
	input#name {
		height: 40px;
	} 

	/* 아이디찾기 텍스트박스 */
	
	p.idFind {
		margin-top: 30px;
	    font-size: 18px;
	    color: #222;
	    text-align: center;
	}
	
	strong {
	    display: block;
/* 	    margin-left: 20px;
 */	    font-size: 20px;
	    font-weight: bold;
	}
	
	
	span.text {
		color: #666;
	    display: block;
	    line-height: 0.5;
	}
	
	ul.notice {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding: 0px;
	}
	
	.safe_pw_notice {
	    background: #f4f4f2;
	    padding: 30px 20px;
	}
	
	.safe_pw_notice ul li {
		display: list-item;
	    color: #666;
	    font-size: 14px;
	    line-height: 24px;
	    margin-bottom: 0px;
	    position: relative;
	    padding-left: 15px;
	}

	.safe_pw_notice ul li:before {
	    background: #999;
	    border-radius: 100%;
	    content: "";
	    height: 6px;
	    left: 0;
	    position: absolute;
	    top: 8px;
	    width: 6px;
	}

	/*비밀번호찾기 버튼*/

	div#joinBtn {
		width: 538px;
		height: 40px;
		margin: 0 auto;
		text-align: center;
	}
	
	input#btnFind {
		width: 550px;
		height: 40px;
		margin: 0px;
		background-color: #006633;
		border: none;
		border-radius: 2px;
		color: #ffffff;
		font-size: 12pt;
		cursor: pointer;
	}
	
	.btn2_mem_login {
	    height: 75px;
	    margin: 0 auto;
	    margin-top: 25px;
	    width: 100%;
	    
	}
	
	.btn2_mem_login li {
	    border-radius: 3px;
	    width: 48%;
	    float: left;
	}
	
	
	.btn2_mem_login li a {
	    color: #fff;
	    display: block;
	    font-size: 24px;
	    height: 75px;
	    line-height: 75px;
	    text-align: center;
	    width: 100%;
	}
	
	.btn2_mem_login li.btn1 {
   		 background: #666;
	}	
	
	.btn2_mem_login li.btn2 {
	    background: #222;
	    margin-left: 4%;
	}

	a.btn_ok {
		color: #fff;
		cursor: pointer;
	}
	
	span#password_error {
		color: red;
	}
	
	
	
	
	

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">



	$(document).ready(function(){
		
		
		$("span#password_error").hide();	
		$("span#password2_error").hide();
		
		$("input#password").blur(function(){
			
			var data = $(this).val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("span#password_success").hide();
				$(this).parent().find("#password_error").show();
				$("input#password").addClass("bgcol"); 
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				
				// 비밀번호 정규식 : 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이내로 입력하세요.
				var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
				var bool = regExp.test($(this).val()); 

				if(!bool) { 
					// 조건에 맞지않으면
					$("span#password_error").html("숫자,영문자,특수문자가 포함된 형태의 8~15글자 이내로 입력하세요.").show();
					$("input#password").addClass("bgcol");  
					
					return;
				} 
				
				$(this).parent().find("#password_error").hide();
				$(":input").prop("disabled",false).removeClass("bgcol"); 	
				
				$("input#password2").blur(function(){
					var passwd = $("#password").val();
					var passwdCheck = $(this).val();
					
					if(passwd != passwdCheck) { // 암호와 암호확인값이 틀린 경우 
						$(this).parent().find("#password2_error").show();
						$("input#passwordCheck").addClass("bgcol");  
					}
					else { // 암호와 암호확인값이 같은 경우 
						$(this).parent().find("#password2_error").hide();
						$(":input").prop("disabled",false).removeClass("bgcol"); 
					}
					
				});// end of $("#pwdcheck").blur()--------------
			}
			
		}); // end of $("#password").blur(function()------------------------	 
		

		$(".btn_ok").click(function(){

			var frm = document.pwdFindFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/login/pwdUpdateEnd.sb";
			frm.submit();	
			
			

		});
	});


</script>	

<div id="container">
	<form name="pwdFindFrm" style="margin-top: 80px; margin-bottom: 80px;">
		<fieldset>
			<legend style="text-align: center;">비밀번호 찾기</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="headImg">
			  		<img src="/StarbucksWeb/images/hyejeong/icon_find_sally.png" width="245px;" height="212px;"/>
			  		<br/>
			  		<p class="idFind">
			  			<strong><span style="color: #006633;">${userid}</span> 님의 비밀번호를 변경합니다.</strong>
			  			<span class="text" style="margin-top:20px; color: gray;">새로 사용할 비밀번호를 등록해주세요.</span>
			  			<input type="hidden" name="userid" value="${userid}" />
			  		</p>
			  	</div>	

			</div>
			<div id="frame" class="2">	

					<div id="box">
							<label for="password"><strong>새 비밀번호</strong></label>
							<input type="password" name="password" id="password" maxlength="20" placeholder="비밀번호를 입력해 주세요." data-warn_id="warn_user_pwd_new" class="input_warn" autocomplete="off"><br/>
							<span class="error" id="password_error">비밀번호를 입력 하세요.</span>
					</div>
					<div id="box">
							<label for="password2"><strong>새 비밀번호 확인</strong></label>
							<input type="password" name="password2" id="password2" maxlength="20" placeholder="비밀번호를 다시 한번 입력해 주세요." data-warn_id="warn_user_pwd_new" class="input_warn" autocomplete="off"><br/>
							<span class="error" id="password2_error">일치하지 않습니다.</span>
					</div>
					
					<div class="safe_pw_notice">
							<strong id="notice">안전한 비밀번호 만들기</strong>
							<ul class="notice">
								<li>
									<!-- 영문/숫자/특수기호를 혼합하여 8자 이상 입력하거나,
									영문/숫자를 혼합하여 10자 이상 입력하세요. -->
									숫자,영문자,특수문자가 포함된 형태의 8~15글자 이내로 입력하세요.
								</li>
								<li>
									아이디와 같은 비밀번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 동일하게 반복된 숫자 등 다른 사람이 쉽게 알아낼 수 있는 비밀번호는 유출 위험이 높아 사용하지 않는 것이 좋습니다.
								</li>
								<li>
									이전에 사용하셨던 비밀번호를 재사용할 경우 도용의 우려가 있으니, 가급적 새로운 비밀번호를 사용해 주세요.
								</li>
							</ul>
						</div>
			</div>
			
			<div class="btn2_mem_login" style="text-align: center;">
				<ul id="btn">
					<li class="btn1"><a href="<%= ctxPath%>/login/loginIndex.sb" title="로그인 페이지로 이동" class="btn_cancel">취소</a></li>
					<li class="btn2"><a title="비밀번호 변경 후 로그인 페이지로 이동" class="btn_ok" style="color: #fff;">확인</a></li>
				</ul>
			</div>

			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />