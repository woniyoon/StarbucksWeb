<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<jsp:include page="../header.jsp" />
    
<style type="text/css">

 	div.notice_view {
		width: 60%;
		margin: 0 auto;
	} 

	div#sub_header {
		height: 98px;
		padding-top: 30px;
	}
	
	h2>img {
		vertical-align: top;
		display: inline;
	}

	/* ---------------------------- 헤더 끝 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	thead > tr > th {
		font-size: 20px;
	    font-weight: bold;
	    color: #222222;
	    text-align: left;
	    padding: 17px 20px 34px 20px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	tbody > tr >td {
		font-size: 14px;
	    color: #666666;
	    text-align: left;
	    padding: 17px 14px;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	div#notice_button_wrap{
		display: inline-block;
		width: 100%;	
	}
	
	p#notice_button {
		display: inline-block;
		border-radius: 3px;
	    height: 45px;
	    width: 84px;
	    background: #666666;
		color: white;
		float: right;
		margin: 30px 20px 50px 0px;
	}
	
	a.notice_view {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
	}
	
	a.delete {
		cursor: pointer;
	}
	
	a.update {
		cursor: pointer;
	}
	
	.th {
		background: #f4f4f2;
	}
	
	.next_post {
		border-top: 1px solid #333333;
		border-bottom: 1px solid #dddddd;
	}
	
	.pre_post {
		border-bottom: 1px solid #333333;
	}
	
	/* 내용 */
	textarea {
		border: solid 1px #ccc;
		border-radius: 3px;
		height: 173px;
		padding: 5px;
		width: 507px;
		resize: none;
	}
	
	/* 제목 */
	input.subject {
		width: 513px;
	}

</style>    
<script type="text/javascript">

	//내용 용량제한시키기
	function fnChkByte(obj, maxByte) {
	    var str = obj.value;
	    var str_len = str.length;
	
	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";
	
	    for(var i=0; i<str_len; i++) {
		        one_char = str.charAt(i);
		        
		        if(escape(one_char).length > 4){
		            rbyte += 2;                                         //한글2Byte
		        }
		        else {
		            rbyte++;                                            //영문 등 나머지 1Byte
		        }
	
		        if(rbyte <= maxByte){
		            rlen = i+1;                                          //return할 문자열 갯수
		        }
	     }
	
	     if(rbyte > maxByte){
			  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
			  str2 = str.substr(0,rlen);                                  //문자열 자르기
			  obj.value = str2;
			  fnChkByte(obj, maxByte);
	     }
	     else {
	        document.getElementById('byteInfo').innerText = rbyte;
	     }
	}



	function updateEnd() {
		  

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
	   	  
		//  alert(document.getElementById("store_id").innertext);
		  
		  // var storeid = $('#store_id').prop("value");
		  
		 //  alert(storeid);
		  
		  if(!bRequiredInfo) {
			  var frm = document.updateFrm;
		   	  frm.method = "POST";
		   	  frm.action = "feedbackUpdateEnd.sb";
		   	  frm.submit();
		  }
	   	  
		}// end of function goRegister(event)----------


</script>
   	
	<div class="notice_view">
		<header>
			<div id="sub_header">
				<h2>
					<img src="/StarbucksWeb/images/hyejeong/ms_suggestion_ttl_black.png" alt="고객의 소리" />
				</h2>
			</div>
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->
		
		<section>
		<form name="updateFrm">
			<table class="type05" style="border-top: solid 1px black;">
	    <tr>
	        <th scope="row">분야 </th>
	        <td>
			      ${map.category}
			      <input type="hidden" name="feedback_board_seq" class="delFeedback" value="${map.feedback_board_seq}"/>
			</td>
	    </tr>
	    <tr>
	        <th scope="row">연락처</th>
	        <td>
				${map.hp1} ${map.hp2} ${map.hp3}
			</td>
	    </tr>
	    <tr>
	        <th scope="row">매장ID</th>
	        <td>
		       ${map.store_id}
			</td>
	    </tr>
	    <tr>
	        <th scope="row">방문일</th>
	        <td>
		       ${map.visit_day}
			</td>
	    </tr>
	    <tr>
	        <th scope="row">제목</th>
	        <td>
	        	<input style="width: 515px;" class="requiredInfo" type="text" class="subject" name="title" value="${map.title}" maxlength="50">
			</td>
	    </tr>
	    <tr>
	        <th scope="row">내용</th>
	        <td>
	        	<textarea class="requiredInfo" name="contents" onKeyUp="javascript:fnChkByte(this,'2500')">${map.contents}</textarea><br/>
	        	<span id="byteInfo">0</span> /2500bytes 
			</td>
	    </tr>
	    <tr>
	        <th scope="row">파일첨부</th>
	        <td>
		        <c:if test="${not empty map.file_attached}">
					<img src="/StarbucksWeb/images/hyejeong/${map.file_attached}" style="width: 400px; height: 340px;" />
				</c:if>	
			 	<c:if test="${not empty map.file_attached2}">
					<img src="/StarbucksWeb/images/hyejeong/${map.file_attached2}" style="width: 400px; height: 340px;" />
				</c:if>	 
				
	        </td>
	    </tr>
	</table>
	</form>
	
	<div id="notice_button_wrap">
		<p id="notice_button">
			<a class="update notice_view" onclick="updateEnd();">수정하기</a>
		</p>
	</div>
			
			<!-- <div>
				<table>
					<tr>
						<th class="next_post th">윗글</th>
						<td class="next_post">BC카드 ISP/페이북 시스템 점검 안내</td>
					</tr>
					<tr>
						<th class="pre_post th">아랫글</th>
						<td class="pre_post">스타벅스 앱 내 e-Coupon / Gift Shop의 e-Gift Item 수량 표기 미노출 안내</td>
					</tr>
				</table>
			</div> -->
			<br/><br/><br/>

		</section>

	</div>
	
<jsp:include page="../footer.jsp" />