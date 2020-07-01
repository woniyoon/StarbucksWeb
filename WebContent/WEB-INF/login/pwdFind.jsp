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
	
	ul.body2 {
		width: 510px;
		padding: 10px 15px;
		list-style-type: none;
		padding-inline-start: 15px;
	}
	
	ul.body3 {
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
		height: 40px;
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
	    font-size: 24px;
	    font-weight: normal;
	    margin-bottom: 20px;
	}
	
	strong#code {
	    display: block;
	    font-size: 20px;
	    font-weight: normal;
	    margin-top: 30px;
	}
	
	span.text {
		color: #666;
	    display: block;
	    line-height: 0.5;
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
	
	input#btnConfirmCode {
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



		$(document).ready(function(){
			
 			// 찾기
			$("#btnFind").click(function(){
				
				var useridVal = $("#userid").val().trim();
				var emailVal = $("#email").val().trim();
				
				if(useridVal != "" && emailVal != "") {
					var frm = document.pwdFindFrm;
					frm.method = "POST";
					frm.action = "<%= request.getContextPath()%>/login/pwdFind.sb";
					frm.submit();
				}
				else {
					alert("아이디와 이메일을 입력하세요!!");
					return;
				}
			});// end of $("#btnFind").click(function(){})-------------------------------------
			
			var method = "${method}";
			var userid = "${userid}";
			var email = "${email}";
			var n = "${n}";
			
			if(method=="POST" && n==1) {
				$("#userid").val(userid);
				$("#email").val(email);
				$(".body2").hide();
			}
			else {
				$(".body2").show();
			}
			
			
			// 인증하기
			$("#btnConfirmCode").click(function(){
				var frm = document.verifyCertificationFrm;
				frm.userid.value = $("#userid").val();
				frm.userCertificationCode.value = $("#input_confirmCode").val();
				
				frm.action = "<%= ctxPath%>/login/verifyCertification.sb";
				frm.method = "POST";
				frm.submit();
	
			}); 
			
			
			
		});// end of $(document).ready(function(){})---------------	


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
			  			<strong>비밀번호가 기억나지 않으세요?</strong>
			  			<span class="text" style="margin-top:20px; color: gray;">아래 인증 방법을 통해 비밀번호를 재설정 하실 수 있습니다.</span>
			  		</p>
			  	</div>	

			</div>
			<div id="frame" class="2">	
					<ul id="able4" class="body">	
						<li>
							<p style="font-weight: bold; margin-left: 10px; ">아이디</p>
							<label for="userid"></label>
							<input style="margin-top: 10px; background-color: #f2f2f2; border-radius: 3px;" type="text" name="userid" id="userid" class="requiredInfo" />

							<br/>
							
						</li>
					</ul>	

				<div id="box">
					<ul class="body">
						<li>
							<p style="font-weight: bold; margin-left: 10px; ">메일</p>
							<label for="email"></label>
							<input style="margin-top: 10px; width:300px; border-radius: 3px;" type="text" name="email" id="email" class="requiredInfo" />

							<br/>
							
						</li>
	            	</ul>
	            </div>	
	            
	           <!-- 비밀번호찾기 메일인증코드 시작-->
	           <c:if test="${n == 1}">
	           	<div id="box" align="center" style="background-color: #f4f4f2;">
			   	   <strong id="code"><span>인증코드가 ${email}로 발송되었습니다.</span></strong><br/>
			   	   <span style="font-size: 13pt; color: gray;">인증코드를 입력해주세요</span><br/>
			   	   <input type="text" name="input_confirmCode" id="input_confirmCode" required />
			   	   <br/><br/>
			   	   
			   	 </div>  
   	  			</c:if> 
   	  
		   	  <c:if test="${n == 0}">
			   	  <span style="color: red;">사용자 정보가 없습니다.</span> 
		   	  </c:if> 
		   	  
		   	  <c:if test="${n == -1}">
			   	  <span style="color: red;">메일발송이 실패했습니다.</span>  
		   	  </c:if> 
   	  		 <!-- 비밀번호찾기 메일인증코드 끝-->
   	  		
			</div>
			
			<c:if test="${n == 1}">
				<ul class="body3" style="width:550px; height:40px; margin:0 auto; padding: 0px;">
						<li>
							<input type="button" id="btnConfirmCode" value="인증하기"/>
						</li>
			    </ul>
			</c:if>


			
			<ul class="body2" style="width:550px; height:40px; margin:0 auto; padding: 0px;">
				<li>
					<input type="button" id="btnFind" value="비밀번호 찾기"/>
				</li>
			</ul>
			
			</div>	
		</fieldset>
	</form>
	
	
<form name="verifyCertificationFrm">
	<input type="hidden" name="userid" />
	<input type="hidden" name="userCertificationCode" />
</form>
	
</div>




<jsp:include page="../footer.jsp" />