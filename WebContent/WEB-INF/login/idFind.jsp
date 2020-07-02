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

	/*회원가입 버튼*/

	div#joinBtn {
		width: 538px;
		height: 40px;
		margin: 0 auto;
		text-align: center;
	}
	
	input#btnLogin {
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
	성별 남-checked 초기값 ㅇ
	생년월일 값 초기화 - 선택값 없을시 선택하세요 error 띄우기 ㅇ
	생년월일 각각 name값 검토 ㅇ, function 다시설정
	휴대폰 input-text 삽입 ==> 고객의소리form 에서 들고오던지..ㅇ
	이름, 메일 입력작업 ㅇ
	
	이용약관 내용바꾸기
	체크박스 크기줄이기
*/


	function gologin() {

		 
		  var frm = document.registerFrm;
	   	  frm.method = "POST";
	   	  frm.action = "<%= request.getContextPath()%>/login/loginIndex.sb";
	   	  frm.submit();
		
	   	  
		}// end of function gologin(event)----------


</script>	

<div id="container">
	<form name="registerFrm" style="margin-top: 80px; margin-bottom: 80px;">
		<fieldset>
			<legend style="text-align: center;">아이디 찾기</legend>
			<div id="form" >
			<div id="frame" class="1" style="text-align: center;">
			  	<div id="headImg">
			  		<img src="/StarbucksWeb/images/hyejeong/icon_find_sally.png" width="245px;" height="212px;"/>
			  		<br/>
			  		<p class="idFind">
			  			<strong>고객님의 아이디는 <span style="color: #006633;">${userid}</span> 입니다.</strong>
			  		</p>
			  	</div>	

			</div>
			
				<ul class="body" style="width:550px; height:40px; margin:0 auto; padding: 0px;">
					<li>
						<input type="button" id="btnLogin" value="로그인" onClick="gologin();"/>
					</li>
				</ul>
			</div>	
		</fieldset>
	</form>
</div>


<jsp:include page="../footer.jsp" />