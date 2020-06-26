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

	#con2 {
		width: 900px;
		height: 50px;
		margin-top: 50px;
		margin-right: auto;
		margin-left: auto;
		font-weight: bold;
		text-align: center;
		font-size: 14pt;
		/* background-color: yellow; */
	}
	
	#con3 {
		width: 650px;
		height: 100px;
		margin-top: 10px;
		margin-right: auto;
		margin-left: auto;
		border-radius: 3px;
		background-color: #006633;
	}
	
	.btn_ok {
		color: white !important;
		text-decoration: none;
		cursor: pointer;
		font-size: 24pt;
		line-height: 100px;
		display: block;
		text-align: center;
	}		
		
	a:hover {
    	text-decoration: underline !important;
	}
	
	input[type=radio]:checked {
		border: solid 3px red;
	}

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		var now = new Date();
		// 자바스크립트에서 현재날짜시각을 알려주는 것이다.
		var currentYear = now.getFullYear(); // 현재년도
	
		
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
	  /*  var yearOption = "<option>2020</option>"; //화살표 누르면 나올 년도 옵션
	   for(var i=0; i<currentYear-1950+1; i++){ 
		   yearOption += "<option>"+(1950+i)+"</option>";
	   }
	   
	   document.getElementById("Birthyyyy").innerHTML = yearOption; //birthYear의 태그를 잡아서 옵션에 넣기 */
		
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

	
	// 정보수정 버튼 클릭시
	function goUpdateInfo() {
			
		var flagBool = false;
		
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data=="") {
				flagBool = true;
				return false;
			}
		});
		
		
		if(flagBool) {
			alert("변경사항을 입력하세요!");
			return;
		}
		
		else {
			var frm = document.updatePwdFrm;
			frm.method = "POST";
			frm.action = "/StarbucksWeb/member/myinfoEditPwdEnd.sb";
			frm.submit();
		}	
			
	}

</script>	

<div id="container">
	<form name="registerFrm" style="margin-top: 80px; margin-bottom: 80px;">
		<fieldset>
			<legend style="text-align: center;">개인정보 확인 및 수정</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	
			  <div id="box">
				<ul id="able1" class="body">
					<li>
						<p style="font-weight: bold; float: left; margin-left: 10px; ">아이디</p>
						<label for="userid"></label>
						<input style="margin-top: 10px; background-color: #f2f2f2; " class="input1 requiredInfo" type="text" name="userid" id="userid" value="${userid}" readonly /> 
					</li>
				</ul>		
			  </div>	
			  
			</div>
			<div id="frame" class="2">	
					<ul id="able4" class="body">	
						<li>
							<p style="font-weight: bold; margin-left: 10px; ">이름(필수)</p>
							<label for="name"></label>
							<input style="margin-top: 10px; background-color: #f2f2f2; border-radius: 3px;" type="text" name="name" id="name" value="${name}" class="requiredInfo" />

							<!-- 남/여 성별선택하기 -->
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<c:choose>
									<c:when test="${gender eq 1 }">
										<label class="btn btn-danger on active focus">									
									</c:when>
									<c:otherwise>
										<label class="btn btn-danger">									
									</c:otherwise>
								</c:choose>
									<input type="radio" name="gender" id="jb-radio jb-radio-1" value="1" <c:if test="${gender eq '1'}">checked</c:if>>
									남	
								</label>
								<c:choose>
									<c:when test="${gender eq 2 }">
										<label class="btn btn-danger on active focus">									
									</c:when>
									<c:otherwise>
										<label class="btn btn-danger">									
									</c:otherwise>
								</c:choose>
									<input type="radio" name="gender" id="jb-radio jb-radio-1" value="1" <c:if test="${gender eq '1'}">checked</c:if>>
									여
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
							<select name="Birthyyyy" id="Birthyyyy" onchange="selectYear();">
								<c:forEach varStatus="status" begin="1950" end="2020" step="1">
									<c:choose>
										<c:when test="${Birthyyyy eq status.current }">
											<option selected>${status.current}</option>									
										</c:when>
										<c:otherwise>
											<option>${status.current}</option>									
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select id="Birthmm" name="Birthmm" onchange="selectMonth();">
								<c:forEach varStatus="status" begin="01" end="12" step="1">
									<c:choose>
										<c:when test="${Birthmm eq status.current }">
											<option selected>${status.current}</option>									
										</c:when>
										<c:otherwise>
											<option>${status.current}</option>									
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select> 
							
								<select id="Birthdd" name="Birthdd" onchange="selectDay();">
									<c:forEach varStatus="status" begin="01" end="31" step="1">
									<c:choose>
										<c:when test="${Birthdd eq status.current }">
											<option selected>${status.current}</option>									
										</c:when>
										<c:otherwise>
											<option>${status.current}</option>									
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</select> 
								<select name="birthSol" id="birthSol" onchange="selectLuSol();">
									<option>양</option>
									<option>음</option>
								</select>
							<p style="font-size: 9pt; margin-left: 15px;">생일 무료 음료 쿠폰은 1년에 1번만 발행되므로, 변경 후에도 해당 연도 내 발행 이력이 있는 경우 추가 발행되지 않습니다.</p>
						</li>
					</ul>
				</div>
				<div id="box">
					<ul class="body">
						<li>
						   <p style="font-weight: bold; margin-left: 10px;">휴대폰(필수)</p>
							<select class="form-control-tel requiredInfo" id="sel1 hp1" name="hp1" value="${hp1}" >
						      	<option>010</option>
						        <option>011</option>
						        <option>016</option>
						        <option>017</option>
						        <option>018</option>
						        <option>019</option>
						    </select> - <input class="form-control-tel requiredInfo" type="text" id="hp2" name="hp2" value="${hp2}" maxlength="4" class="requiredInfo" /> - <input class="form-control-tel requiredInfo" type="text" id="hp3" name="hp3" value="${hp3}" maxlength="4" class="requiredInfo" />
		            	</li>
	            	</ul>
	            </div>	
	            <div id="box">
		            <ul class="body" id="able5">
						<li>
							<p style="font-weight: bold; margin-left: 10px;">메일(필수)</p>
							<label for="email"></label>
							<input class="input1 requiredInfo" type="email" name="email" id="email" value="${email}" class="requiredInfo" placeholder="E-mail을 입력하세요." />
							<span class="error" id="email_error">메일을 입력해주세요.</span>
						</li>
					</ul>	
				</div>
			</div>
			
			<div id="con2"><b>＊ 선택항목은 입력하지 않거나 동의하지 않아도 스타벅스 서비스를 이용하실 수 있습니다.</b></div>		
		
			<div id="con3"><a class="btn_ok" onClick="goUpdateInfo();" >정보수정</a></div>
		

			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />