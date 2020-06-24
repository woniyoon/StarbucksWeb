<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		border-top: solid 1px #cccccc;
		border-radius: 3px;
	}
	
	input {
		margin: 10px;
		box-shadow: none;
		border: solid 1px #cccccc;
		border-radius: 3px;
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
	
	
	fieldset {
         text-align: left;
         border: 0px;
	}
	
	legend {
		font-size: 20pt;
		font-weight: bold;	
	}
	
	/* fieldset>ul#body {
		padding: 30px;
		list-style: none;
	} */
	
	fieldset>ul#body>li>label:first-child {
		display: inline-block;
		width: 10%;
		/* border: solid 1px green; */
	} 
	
	p {
		margin: 0;
		margin-top: 10px;
	}

	select {
		margin-top: 15px;
		margin-left: 10px;
		width: 100px;
		height: 40px;
		border-radius: none;
		border: solid 1px #cccccc;
	}
	/*에러메시지*/
	
	span.error {
		color: red;
		font-size: 11pt;
		float: left;
		margin: 10px;
		margin-top: 15px;
	}
	
	/* 성공메시지 */
	
	span.success {
		color: #444;
		float: left;
		margin: 10px;
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
		height: 50px;
		margin: 0 10px;
		padding-left: 8px;
		border-radius: 3px;
	}

	/* 이름~메일 */
	
	input#name {
		height: 40px;
	} 
	
	.btn-danger {
	    color: gray;
	    background-color: white;
	    /* background-color: #f2f2f2; */
	    border-color: #a6a6a6;
	}
	
	.btn-danger:hover {
	    color: black;
	    background-color: #f2f2f2;
	    border-color: #a6a6a6;
	}
	
	.btn-danger:not(:disabled):not(.disabled).active, .btn-danger:not(:disabled):not(.disabled):active, .show>.btn-danger.dropdown-toggle{
		color: black;
	    background-color: #f2f2f2;
	    border-color: #a6a6a6;
	} 
	
	.btn-danger.focus {
		box-shadow: none;
	}
	
	.btn-group-vertical>.btn.active, .btn-group-vertical>.btn:active, .btn-group-vertical>.btn:focus, .btn-group>.btn.active, .btn-group>.btn:active, .btn-group>.btn:focus {
		z-index: auto;
	}
	
	input[id="agree"] + label {
		float: right; 
		margin-top: 10px;
		cursor: pointer; 
		width: 50px; 
		height: 50px;
		background: url('/StarbucksWeb/images/hyejeong/mem_check_off.png') left center no-repeat;
	}
	
	input[id="agree"]:checked + label {
		background-image: url("/StarbucksWeb/images/hyejeong/mem_check_on.png");
	} 
	
	input[id="agree"] {
		 display: none; 
	}
	
	select#sel1 {
		margin: 10px 0 10px 10px;
		width: 70px;
		height: 30px;
		border-radius: 3px;
	}
	
	input.form-control-tel {
		width: 100px;
		margin: 10px 0;
	}

	/*회원가입 버튼*/

	div#joinBtn {
		width: 538px;
		height: 40px;
		margin: 0 auto;
		text-align: center;
	}
	
	input#btnRegister {
		width: 550px;
		height: 40px;
		margin: 0px;
		background-color: #006633;
		border: none;
		border-radius: 2px;
		color: #ffffff;
		font-size: 12pt;
	}

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

/* 
	성별 남-checked 초기값 ㅇ
	생년월일 값 초기화 - 선택값 없을시 선택하세요 error 띄우기 ㅇ
	생년월일 각각 name값 검토 ㅇ, function 다시설정
	휴대폰 input-text 삽입 ==> 고객의소리form 에서 들고오던지..ㅇ
	이름, 메일 입력작업 ㅇ
	
	이용약관 내용바꾸기
	체크박스 크기줄이기
*/



	$(document).ready(function() {
		
		var now = new Date();
		// 자바스크립트에서 현재날짜시각을 알려주는 것이다.
		var currentYear = now.getFullYear(); // 현재년도
		
		
		// 성별 기본값 - 남 (체크)
		/* $("input:radio[name=jb-radio-1]").prop("checked",true); */
		/* $('label.on').css("color","black");
		$('label.on').css("background-color","#f2f2f2");
		$('label.on').css("border-color","#a6a6a6"); */
		
	
		$("span#userid_error").hide();
		$("span#userid_success").hide();
		
		$("#userid").blur(function(){
			
			var data = $(this).val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("span#userid_success").hide();
				$("ul#able1").css("margin-bottom","40px");
				$(this).parent().find("#id_error").show();
				$("#userid").addClass("bgcol"); 
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				
				// 아이디 정규식 : 영문(대소문자 구분 없음), 숫자로 4~13자리만 입력 가능합니다.
				var regExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,12}$/;
				var bool = regExp.test($(this).val()); 

				if(!bool) { 
					// 조건에 맞지않으면
					$("span#userid_success").hide();
					$("span#userid_error").html("영문(대소문자 구분 없음), 숫자로 4~13자리만 입력 가능합니다.").show();
					$("ul#able1").css("margin-bottom","40px");
					$("#userid").addClass("bgcol");  
					
					return;
				} 
	
				$.ajax({
					url:"<%= ctxPath%>/register/idDuplicateCheck.sb",
					type:"post",
					data:{"userid":$("#userid").val()},
					dataType:"json",
					success:function(json){
						
						if(json.isUse) {
							
							$("span#userid_success").html("사용 가능한 아이디 입니다.").show();
							$("span#userid_error").hide();
							
						}
						else {
							$("span#userid_error").html("사용중이거나 이미 탈퇴한 아이디입니다.").show();
							$("span#userid_success").hide();
							
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
				});

				
				$("ul#able1").css("margin-bottom","40px");
				$(this).parent().find("#userid_error").hide();
				$(":input").prop("disabled",false).removeClass("bgcol"); 
				/* $("#id").addClas("successInput"); */
				return;
			}
			
		}); // end of $("#id").blur(function()------------------------
		
				
				
		$("span#password_error").hide();
		$("span#password_success").hide();		
		
		$("span#passwordCheck_error").hide();
		$("span#passwordCheck_success").hide();	
		
		$("#password").blur(function(){
			
			var data = $(this).val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("span#password_success").hide();
				$("ul#able2").css("margin-bottom","40px");
				$(this).parent().find("#password_error").show();
				$("#password").addClass("bgcol"); 
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				
				// 비밀번호 정규식 : 영문, 숫자 혼합하여 10~20자리 이내로 입력하세요.
				var regExp = /^[a-zA-Z0-9]{10,20}$/;
				var bool = regExp.test($(this).val()); 

				if(!bool) { 
					// 조건에 맞지않으면
					$("span#password_success").hide();
					$("span#password_error").html("영문, 숫자 혼합하여 10~20자리 이내로 입력하세요.").show();
					$("ul#able2").css("margin-bottom","40px");
					$("#password").addClass("bgcol");  
					
					return;
				} 
				
				$("ul#able2").css("margin-bottom","40px");
				$(this).parent().find("#password_error").hide();
				$("span#password_success").show();
				$(":input").prop("disabled",false).removeClass("bgcol"); 	
				
				$("#passwordCheck").blur(function(){
					var passwd = $("#password").val();
					var passwdCheck = $(this).val();
					
					if(passwd != passwdCheck) { // 암호와 암호확인값이 틀린 경우 
						$("span#passwordCheck_success").hide();
						$(this).parent().find("#passwordCheck_error").show();
						$("ul#able3").css("margin-bottom","40px");
						$("#passwordCheck").addClass("bgcol");  
					}
					else { // 암호와 암호확인값이 같은 경우 
						$("ul#able3").css("margin-bottom","40px");
						$(this).parent().find("#passwordCheck_error").hide();
						$("span#passwordCheck_success").show();
						$(":input").prop("disabled",false).removeClass("bgcol"); 
					}
					
				});// end of $("#pwdcheck").blur()--------------
			}
			
		}); // end of $("#password").blur(function()------------------------	
				
	
		// 이름 입력받기
		$("span#name_error").hide();
		
		$("#name").blur(function(){
			
			var data = $(this).val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("ul#able4").css("margin-bottom","40px");
				$(this).parent().find("#name_error").show();
				$("#name").addClass("bgcol"); 
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				$("ul#able4").css("margin-bottom","16px");
				$(this).parent().find("#name_error").hide();
				$(":input").prop("disabled",false).removeClass("bgcol"); 
				/* $("#id").addClas("successInput"); */
			}
			
		}); // end of $("#name").blur(function()------------------------
		
		
		// 메일 입력받기
		$("span#email_error").hide();	
		
		$("#email").blur(function(){
			
			var data = $(this).val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("ul#able5").css("margin-bottom","40px");
				$(this).parent().find("#email_error").show();
				$("#email").addClass("bgcol"); 
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				
				// 이메일 정규식 : 
				var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				var bool = regExp.test($(this).val()); 

				if(!bool) { 
					// 조건에 맞지않으면
					$("span#email_error").html("이메일 형식에 맞게 입력해주세요.").show();
					$("ul#able5").css("margin-bottom","40px");
					$("#email").addClass("bgcol");  
					
					return;
				} 
				
				$("ul#able5").css("margin-bottom","16px");
				$(this).parent().find("#email_error").hide();
				$(":input").prop("disabled",false).removeClass("bgcol"); 	
				
			}
			
		 });// end of $("#email").blur()--------------
	
		
	   // 출생년도 옵션
	   var yearOption = "<option>2020</option>"; //화살표 누르면 나올 년도 옵션
	   for(var i=0; i<currentYear-1950+1; i++){ 
		   yearOption += "<option>"+(1950+i)+"</option>";
	   }
	   
	   document.getElementById("Birthyyyy").innerHTML = yearOption; //birthYear의 태그를 잡아서 옵션에 넣기
		
	  /*  // 출생달 옵션
	   var monthOption = "<option>출생달</option>"; 
	   for(var i=1; i<13; i++){ 
		   monthOption += "<option>"+i+"</option>";
	   }
	   
	   document.getElementById("Birthmm").innerHTML = monthOption;
	   
	   // 출생일 옵션
	   var dayOption = "<option>출생일</option>"; 
	   for(var i=1; i<32; i++){ 
		   dayOption += "<option>"+i+"</option>";
	   }
	   
	   document.getElementById("Birthdd").innerHTML = dayOption;
	    */
	   
	}); // end of window.onload = function()--------------
	 
	function selectYear() {
		
		var sBirthYear = document.getElementById("Birthyyyy").value;

		var bNaN = isNaN( Number(sBirthYear) ); 
				/* 
	    			isNaN( Number(sBirthYear) )은 
	    			Number(sBirthYear)이 숫자가 아니라면(출생년도) true이고,
	    			Number(sBirthYear)이 숫자라면 false이다. 
				*/ 
		
		if(bNaN) {
			alert("출생년도를 선택하세요");
			document.getElementById("currentAge").innerHTML = "";
		}
				
		else {
			 // 나이를 구하려면 -(빼기)를 해야하므로 string타입을 number타입으로 바꿔주기
		    
	    	var currentAge = currentYear - Number(sBirthYear) + 1; // 현재나이
	    	
	    	document.getElementById("currentAge").innerHTML = currentAge;
		}
	
	}// end of function selectYear()-------------

	function selectMonth() {
		
		var sBirthMonth = document.getElementById("Birthmm").value;

		var bNaN = isNaN( Number(sBirthMonth) ); 
				/* 
	    			isNaN( Number(sBirthYear) )은 
	    			Number(sBirthYear)이 숫자가 아니라면(출생년도) true이고,
	    			Number(sBirthYear)이 숫자라면 false이다. 
				*/ 
		
		if(bNaN) {
			alert("출생달을 선택하세요");
			document.getElementById("currentAge").innerHTML = "";
		}
				
		else {
			 // 나이를 구하려면 -(빼기)를 해야하므로 string타입을 number타입으로 바꿔주기
		    
	    	var currentAge = currentYear - Number(sBirthMonth) + 1; // 현재나이
	    	
	    	document.getElementById("currentAge").innerHTML = currentAge;
		}
	
	}// end of function selectMonth()-------------

	function selectDay() {
		
		var sBirthYear = document.getElementById("Birthdd").value;
		
	//	alert(sBirthYear);
	//	alert(typeof sBirthYear); ==> string
	
		var bNaN = isNaN( Number(sBirthYear) ); 
				/* 
	    			isNaN( Number(sBirthYear) )은 
	    			Number(sBirthYear)이 숫자가 아니라면(출생년도) true이고,
	    			Number(sBirthYear)이 숫자라면 false이다. 
				*/ 
		
		if(bNaN) {
			alert("출생년도를 선택하세요");
			document.getElementById("currentAge").innerHTML = "";
		}
				
		else {
			 // 나이를 구하려면 -(빼기)를 해야하므로 string타입을 number타입으로 바꿔주기
		    
	    	var currentAge = currentYear - Number(sBirthYear) + 1; // 현재나이
	    	
	    	document.getElementById("currentAge").innerHTML = currentAge;
		}
	
	}// end of function selectDay()------------- */
	
	
	
	function goRegister() {
		  
	   	  var bFlag = false;
	   	  $("input:radio[name=gender]").each(function(){ // 반복문

	   		var bChecked = $(this).prop("checked");
	   		if(bChecked) {
	   			console.log(bChecked);
	   			bFlag = true;
	   			return false;
	   		} 
	   	}); 
	   	  
	   	  if(!bFlag) {
	   		  alert("성별을 선택하셔야 합니다.");
	   		  return;
	   	  }
	   	  
	   	   
	   	  if( !$("input:checkbox[id=agree]").prop("checked") ) {
	   		  alert("이용약관에 동의하셔야 합니다.");
	   		  return;
	   	  } 
	   	 
	   	  var bRequiredInfo = false;
	   	  $(".requiredInfo").each(function(){
		  	var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				$(this).focus();
				return false;
			}
		  }); // end of $(".requiredInfo").each()-------
		  // 선택자.each(); 은 선택자의 갯수만큼 반복처리를 해주는 것이다.
		  // 그러므로 $(".requiredInfo").each(); 은
		  // 클래스가 requiredInfo 인 것마다 하나하나씩 반복업무를 해주는 것이다.
	   	  
		  if(!bRequiredInfo) {
			  var frm = document.registerFrm;
		   	  frm.method = "POST";
		   	  frm.action = "memberRegister.sb";
		   	  frm.submit();
		  }
	   	  
		}// end of function goRegister(event)----------


</script>	

<div id="container">
	<form name="registerFrm" style="margin-top: 80px; margin-bottom: 80px;">
		<fieldset>
			<legend style="text-align: center;">회원가입</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="headImg">
			  		<img src="/StarbucksWeb/images/hyejeong/icon_find_sally.png" width="245px;" height="212px;"/>
			  		<br/>
			  		<p style="margin-top:20px; color: gray;">회원정보를 입력해 주세요.</p>
			  	</div>	
			  <div id="box">
				<ul id="able1" class="body">
					<li>
						<label for="userid"></label>
						<input class="input1 requiredInfo" type="text" name="userid" id="userid" autofocus placeholder="아이디" /> 
						<span class="error" id="userid_error">아이디를 입력 하세요.</span>
						<span class="success" id="userid_success">사용 가능한 아이디 입니다.</span> 
					</li>
				</ul>		
			  </div>	
			  <div id="box" >
			  	<ul id="able2" class="body">	
					<li>
						<label for="password"></label>
						<input class="input1 requiredInfo" type="password" name="password" id="password" placeholder="비밀번호"/>
						<span class="error" id="password_error">비밀번호를 입력 하세요.</span>
						<span class="success" id="password_success">사용 가능한 비밀번호 입니다.</span> 
					</li>
				</ul>		
			  </div>	
			  <div id="box">
			  	<ul id="able3" class="body">	
					<li>
						<label for="passwdCheck"></label>
						<input class="input1 requiredInfo" type="password" id="passwordCheck" placeholder="비밀번호 확인"/>
						<span class="error" id="passwordCheck_error">일치하지 않습니다.</span>
						<span class="success" id="passwordCheck_success">일치합니다.</span> 
					</li>
				</ul>	
			 </div>
			</div>
			<div id="frame" class="2">	
					<ul id="able4" class="body">	
						<li>
							<p style="font-weight: bold; margin-left: 10px; ">이름(필수)</p>
							<label for="name"></label>
							<input style="margin-top: 10px; background-color: #f2f2f2; border-radius: 3px;" type="text" name="name" id="name" class="requiredInfo" />

							<!-- 남/여 성별선택하기 -->
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-danger on">
									<input type="radio" name="gender" id="jb-radio jb-radio-1" value="1"> 남
								</label>
								<label class="btn btn-danger">
									<input type="radio" name="gender" id="jb-radio jb-radio-2" value="2"> 여
								</label>
							</div>
							<br/>
							<span class="error" id="name_error" style="margin-left: 15px; margin-top: 5px;">이름을 입력 하세요.</span>
						</li>
					</ul>	
				<div id="box">
					<ul class="body">
						<li>
							<p style="font-weight: bold; margin-left: 10px;">생년월일(필수)</p>
							<select name="Birthyyyy" id="Birthyyyy" onchange="selectYear();"></select>
							
							<!-- <select name="Birthmm" id="Birthmm" onchange="selectMonth();"> -->
							<select id="Birthmm" name="Birthmm" onchange="selectMonth();">
								<option value ="01">01</option>
								<option value ="02">02</option>
								<option value ="03">03</option>
								<option value ="04">04</option>
								<option value ="05">05</option>
								<option value ="06">06</option>
								<option value ="07">07</option>
								<option value ="08">08</option>
								<option value ="09">09</option>
								<option value ="10">10</option>
								<option value ="11">11</option>
								<option value ="12">12</option>
							</select> 
							
							<!-- <select name="Birthdd" id="Birthdd" onchange="selectDay();"> -->
								<select id="Birthdd" name="Birthdd" onchange="selectDay();">
									<option value ="01">01</option>
									<option value ="02">02</option>
									<option value ="03">03</option>
									<option value ="04">04</option>
									<option value ="05">05</option>
									<option value ="06">06</option>
									<option value ="07">07</option>
									<option value ="08">08</option>
									<option value ="09">09</option>
									<option value ="10">10</option>
									<option value ="11">11</option>
									<option value ="12">12</option>
									<option value ="13">13</option>
									<option value ="14">14</option>
									<option value ="15">15</option>
									<option value ="16">16</option>
									<option value ="17">17</option>
									<option value ="18">18</option>
									<option value ="19">19</option>
									<option value ="20">20</option>
									<option value ="21">21</option>
									<option value ="22">22</option>
									<option value ="23">23</option>
									<option value ="24">24</option>
									<option value ="25">25</option>
									<option value ="26">26</option>
									<option value ="27">27</option>
									<option value ="28">28</option>
									<option value ="29">29</option>
									<option value ="30">30</option>
									<option value ="31">31</option>
								</select> 
							<!-- <select name="birthSol" id="birthSol" onchange="selectLuSol();">
								<option>양</option>
								<option>음</option>
							</select> -->
							<p style="font-size: 9pt; margin-left: 15px;"> 회원 가입 완료 후 스타벅스 카드를 등록하시면 생일 무료음료 쿠폰이 발행됩니다.</p>
						</li>
					</ul>
				</div>
				<div id="box">
					<ul class="body">
						<li>
						   <p style="font-weight: bold; margin-left: 10px;">휴대폰(필수)</p>
							<select class="form-control-tel requiredInfo" id="sel1 hp1" name="hp1" >
						      	<option>010</option>
						        <option>011</option>
						        <option>016</option>
						        <option>017</option>
						        <option>018</option>
						        <option>019</option>
						    </select> - <input class="form-control-tel requiredInfo" type="text" id="hp2" name="hp2" maxlength="4" /> - <input class="form-control-tel requiredInfo" type="text" id="hp3" name="hp3" maxlength="4" />
		            	</li>
	            	</ul>
	            </div>	
	            <div id="box">
		            <ul class="body" id="able5">
						<li>
							<p style="font-weight: bold; margin-left: 10px;">메일(필수)</p>
							<label for="email"></label>
							<input class="input1 requiredInfo" type="email" name="email" id="email" placeholder="E-mail을 입력하세요." />
							<span class="error" id="email_error">메일을 입력해주세요.</span>
						</li>
					</ul>	
				</div>
			</div>
			<div id="frame" class="3">		
				<ul class="body">
					<li style="width:500px; height: 60px;">
						<label style="margin-left: 10px; padding-top:15px; font-weight: bold;" for="agree">이용약관 동의</label><input type="checkbox" name="agree" id="agree" /><label for="agree"></label>&nbsp;
					</li>
					<li>
						<iframe src="iframeAgree/agree.html" width="500px;" height="170px;" style="border: solid 1px navy; margin: 20px 10px;"></iframe>
					</li>
				</ul>
			</div>
			
				<ul class="body" style="width:550px; height:40px; margin:0 auto; padding: 0px;">
					<li>
						<input type="button" id="btnRegister" value="가입하기" onClick="goRegister();"/>
					</li>
				</ul>
			
			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />