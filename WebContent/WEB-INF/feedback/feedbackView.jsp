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

</style>    
<script type="text/javascript">

	function goDelete(feedback_board_seq) {
	  
		var feedback_board_seq = ${map.feedback_board_seq};
	    var bool = confirm("나의 문의내역을 삭제합니다.");

	      if(bool) {
	         
	         $.ajax({
	            url:"/StarbucksWeb/feedback/feedbackDelete.sb",
	            type:"POST",
	            data:{"feedback_board_seq":feedback_board_seq},
	            dataType:"JSON",
	            success:function(json){
	               if(json.n == 1) { // 특정 제품을 장바구니에서 비운후 페이지이동을 해야 하는데 이동할 페이지는 페이징 처리하여 보고 있던 그 페이지로 가도록 한다. 
	                  location.href= "javascript:history.back()";
	               }
	            },
	            error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	         });
	         
	      }
	      else {
	         alert("나의 문의내역을 삭제했습니다.");
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
		<form name="delFrm">
			<table class="type05" style="border-top: solid 1px black;">
	    <tr>
	        <th scope="row">분야 </th>
	        <td>
			      ${map.category}
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
	        	${map.title}
			</td>
	    </tr>
	    <tr>
	        <th scope="row">내용</th>
	        <td>
	        	${map.contents}
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
			<a href="feedbackList.sb" class="notice_view">목록</a>
		</p>
		<p id="notice_button">
			<a class="delete notice_view" onclick="goDelete();">삭제</a>
		</p>
		<p id="notice_button">
			<a class="update notice_view" onclick="goUpdate();">수정</a>
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