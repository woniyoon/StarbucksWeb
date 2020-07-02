<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	.titlePointer:hover {
		cursor: pointer;
	}

</style>    

<script>


	$(document).ready(function(){ 
	
		$(".noticeNO").hide();
		
		

		// 윗글 보기 
		$(".postNotice").click(function(){ 
			
			var notice_seq = $(this).prev().prev().text();
			// alert(notice_seq);
			var rno = $(this).prev().text();
			rno = parseInt(rno);
			// alert(rno);
			// $(".postNotice").val("${postTitlemap.title}");
			
			// 만약 더이상 윗글이 없는 경우
			if ( $(".postNotice").val() == "" ) {
				// location.href="postNotice.sb?rno="+(rno+1);
				$(".postNotice").text("글이 없습니다.");
				$(this).removeClass("titlePointer");
			}
			else {
				location.href="postNotice.sb?rno="+(rno+1);
				 
			} 
			

		});
		
		// 아랫글 보기
		$(".preNotice").click(function(){ 
			var notice_seq = $(this).prev().prev().text();
			// alert(notice_seq);
			var rno = $(this).prev().text();
			rno = parseInt(rno);
			// alert(rno);
			
			location.href="postNotice.sb?rno="+(rno-1);

		});
		

		
		
		
	});

	function deleteNotice() {
		
		var notice_seq = $(".delNotice").val();
		//alert(notice_seq);
		
		var bool = confirm("글을 삭제하시겠습니까?");
		
		if(bool) {
			
			$.ajax({ 
				url: "/StarbucksWeb/notice/noticeDel.sb",
				type: "POST",
				data: {"notice_seq":notice_seq},
				dataType: "JSON",
				success:function(json){
					if(json.n == 1) {
						// alert("삭제성공!");
						location.href="/StarbucksWeb/notice/noticeList.sb"; // 페이지 넘어가기
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
				
			}); 
		}
		else {
			alert("삭제 취소!");
		}
		
	}


</script>
    
	<div class="notice_view">
		<header>
			<div id="sub_header">
				<h2>
					<img src="/StarbucksWeb/images/nari/notice_title.jpg" alt="공지사항" />
				</h2>
			</div>
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->
		
		<section>
			<table>
				<thead>
					 <tr>
					 	<th>${map.title}</th>
					 	<input type="hidden" class="delNotice" value="${notice_seq}"/>
					 </tr>
				</thead>
				
				<tbody>
					<tr>
						<td>
							${map.contents}
							<br/><br/><br/><br/><br/>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a href="noticeList.sb" class="notice_view">목록</a>
				</p>
				<p id="notice_button">
					<a class="delete notice_view" onclick="deleteNotice();">삭제</a>
				</p>
			</div>
			
			<div>
				<table>
					<tr>
						<th class="next_post th">윗글</th>
						<td class="noticeNO" >${notice_seq}</td>
						<td class="noticeNO postrno" >${rno}</td>
						<td class="next_post postNotice titlePointer">${postTitlemap.title}</td>
					</tr>
					<tr>
						<th class="pre_post th">아랫글</th>
						<td class="noticeNO" >${notice_seq}</td>
						<td class="noticeNO prerno" >${rno}</td>
						<td class="pre_post preNotice titlePointer">${preTitlemap.title}</td>
					</tr>
				</table>
			</div>
			<br/><br/><br/>

		</section>

	</div>
	
<jsp:include page="../footer.jsp" />