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
		width: 85px;
		height: 30px;
		border-radius: 3px;
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
	
	/* 아이디찾기 텍스트박스 */
	
	p.idFind {
		margin-top: 30px;
	    font-size: 18px;
	    color: #222;
	    text-align: center;
	}
	
	strong {
	    display: block;
	    font-size: 24px;
	    font-weight: normal;
	    margin-bottom: 20px;
	}
	
	span.text {
		color: #666;
	    display: block;
	    line-height: 0.5;
	}

	/*아이디찾기 버튼*/

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

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

/* 
	휴대폰 유효성검사
*/



	$(document).ready(function() {
		
	
	

	}); // end of window.onload = function()--------------
	 
	
	
	
	
	function goIdFind() {


		  var frm = document.findFrm;
	   	  frm.method = "POST";
	   	  frm.action = "<%= request.getContextPath()%>/login/idFind.sb";
	   	  frm.submit();
	
		}// end of function goIdFind()----------


</script>	

<div id="container">
	<form name="findFrm" style="margin-top: 80px; margin-bottom: 80px;">
		<fieldset>
			<legend style="text-align: center;">아이디 찾기</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="headImg">
			  		<img src="/StarbucksWeb/images/hyejeong/icon_find_sally.png" width="245px;" height="212px;"/>
			  		<br/>
			  		<p class="idFind">
			  			<strong>아이디가 기억나지 않으세요?</strong>
			  			<span class="text" style="margin-top:20px; color: gray;">아래 인증 방법을 통해 아이디를 확인 하실 수 있습니다.</span>
			  		</p>
			  	</div>	

			</div>
			<div id="frame" class="2">	
					<ul id="able4" class="body">	
						<li>
							<p style="font-weight: bold; margin-left: 10px; ">이름</p>
							<label for="name"></label>
							<input style="margin-top: 10px; background-color: #f2f2f2; border-radius: 3px;" type="text" name="name" id="name" class="requiredInfo" />

							<br/>
						
						</li>
					</ul>	

				<div id="box">
					<ul class="body">
						<li>
						   <p style="font-weight: bold; margin-left: 10px;">휴대폰</p>
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
			</div>
				<ul class="body" style="width:550px; height:40px; margin:0 auto; padding: 0px;">
					<li>
						<input type="button" id="btnFind" value="아이디찾기" onClick="goIdFind()"/>
					</li>
				</ul>
			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />