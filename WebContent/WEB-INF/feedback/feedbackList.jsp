<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<title>notice_list.sb</title>
<style type="text/css">
	
 	div#container_notice_list {
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
	
	div#search_header {
		
	}
	
	div#search_bar {
		width: 100%;
		height: 76px;
		background-color: #f4f4f2;
		border-radius: 3px;
    	margin-bottom: 40px;
	}
	
	div#search_bar_right {
		float: right;
		margin-right: 5%;
	}

	
	input#searchWord {
		margin-top: 20px;
		display: inline;
		width: 321px;
	    height: 36px;
	    line-height: 36px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
	    text-indent: 10px;
	    color: #666;
	}
	
	/* 버튼 타입이라 밑에 그림자 지는게 맘에 안듬 */
	input#search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	    background: #777;
	    border-radius: 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    text-align: center;
	    padding: 0;
	    cursor: pointer;
	}
	
	p.search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	}
		
	
	/* ---------------------------- 헤더 끝 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	 th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 17px 3px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
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
	
	a.notice_list {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
		cursor: pointer;
	}
	
	td.noticeTitle:hover {
		cursor: pointer;
	}
	
	div#pageBar {
		text-align: center;
		
	}

</style>

<script type="text/javascript">
	
	$(document).ready(function(){ 
		
		//console.log("searchWord : " + "${searchWord}");
		
		$("td.notice_seq").hide();
		
		if("${searchWord}" != "") {
	    	  $("#searchWord").val("${searchWord}");
	      }
		
		// 검색어 작성 후 엔터치면 검색되게 하기
		$("#searchWord").bind("keydown", function(event){ 
			if(event.keyCode == 13) {
				goSearch();
			}			
		});
		
		$(".noticeTitle").click(function(){ 
			
			var feedback_board_seq = $(this).prev().text();
			
		//	alert(notice_seq);
            location.href="feedbackView.sb?feedback_board_seq="+feedback_board_seq;    
		});
		
	}); // end of $(document).ready(function()-----------------------------
	
	function goSearch() {
		// alert("검색버튼 클릭");
		var frm = document.seachFrm;
		frm.method = "GET";
		frm.action = "feedbackList.sb";
		frm.submit();
	}
	
	
			
			
			
</script>


	<div id="container_notice_list">
		<header>
			<div id="sub_header">
				<h2>
					<img src="/StarbucksWeb/images/hyejeong/ms_suggestion_ttl_black.png" alt="고객의 소리" />
				</h2>
			</div>
			<form name="seachFrm">
				<div id="search_header">
					<div id="search_bar">
						<div id="search_bar_right">
	
							<input id="searchWord" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
							<input id="search_button" onclick="goSearch();" type="button" value="검색" /> 
						</div>
					</div>
				</div>	
			</form>
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->
		
		<section>
			<form name="noticeListFrm">
			<table>
				<thead>
					 <tr>
					 	<th>글번호</th>
					 	<th>상태</th>
					 	<th>제목</th>
					 	<th>작성자</th>
					 	<th>날짜</th>
					 	<th>조회수</th>
					 </tr>
				</thead>
				
				<tbody>
					<c:forEach var="feedback" items="${feedbackList}" >
					<tr>
					    <td>${feedback.rno}</td>
						<td>${feedback.status}</td>
						<td class="notice_seq">${feedback.feedback_board_seq}</td>
						<td class="noticeTitle">${feedback.title}</td>
						<%-- <a href="/notice/noticeView.sb?notice_seq=${notice.notice_seq}"> --%>
						<td>${feedback.username}</td>
						<td>${feedback.write_day}</td>
						<td>${feedback.hit}</td>
						
					</tr>
					</c:forEach>
				</tbody>
			
			</table>
			</form>
			</br></br>
			${totalPage}
			<div id="pageBar">
				${pageBar}
			</div>
			</br></br>
			
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a class="write notice_list" href="feedbackWrite.sb" >글쓰기</a>
				</p>
			</div>
		</section>
		
		
		
	</div>


<jsp:include page="../footer.jsp" />