<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<jsp:include page="../header.jsp" />   

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>My 메뉴</title>
<style type="text/css">

	* {
		margin: 0px;
		padding: 0px;
	}
	

	
	#box2 {
		overflow: hidden;	/* div를 벗어나는 부분을 가려주는 역할 */
		display: flex;
        align-items: center;
        justify-content: center;
        height: 150px;
	}
	
	#box2 img {
		width: 100%;
	}
	
	footer {
		margin-top: 300px;
		height: 300px;
		background-color: black;
	}
	
	#con1 {
		width: 1300px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
		/* border: solid 1px red; */	
	}	
	
	#con1:after {
		content: '';
		clear: both;
		display: block;
	}
	
	button.category {
	    width: 450px;
	    height: 50px;
	    cursor: pointer;
	    background-color: white;
	    font-size: 12pt;
	    font-weight: bold;
	    border: solid 1px #ddd;
	    margin: 0;
	    padding: 0;
	}
	
    button.category:hover {
    	color: #ffffff;
    	background-color: #006633;
	    text-decoration: underline;
	}

    #box6 {
        /* background-color: pink; */
   	 	width: 300px;
        height: 200px;
        float: right;
    }
    
    .panel-body {
    	cursor: pointer;
    }
	
	#drink_list, #food_list {
        /* background-color: navy; */
	    width: 900px;
        height: 200px;
        margin-top: 20px;
        float: left;
        /* border: solid 1px navy; */
	}
	
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
	    border-top: 1px solid #333;
	    border-bottom: 1px solid #333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	#con2 {
		width: 1300px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 200px;
		/* border: solid 1px red; */	
	}	
	
	#con2:after {
		content: '';
		clear: both;
		display: block;
	}
	
	#allCheck, #btnDelete {
		border: solid 1px gray;
	    width: 100px;
        height: 20px;
        margin-right: 10px;
        float: left;	
	}
	
	#fav_menu_container {
		display: flex;
		flex-direction: row;
		width: 900px;
	}
	
	#fav_menu_container > button {
		flex: 1;
	}
</style>

<script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	
$(document).ready(function(){
		
		// 체크박스 전체선택/전체해제
		$("#allCheck").click(function(){
		
			if($("input:checkbox[name=favoriteDrink]").is(":checked")==true) {

				$("input:checkbox[name=favoriteDrink]").attr("checked", false);
			}
			else {
				$("input:checkbox[name=favoriteDrink]").attr("checked", true);
			}
			
		}); 	
		
		
		// 맨처음 음료 버튼에 버튼 켜져있기
		$("div#food_list").css('display', "none"); // 푸드 리스트 숨기기
		
		
		
		$("button.category").click(function(event){
			
			var $target = $(event.target);
			
			
			if($target.prop("id") == "myDrink") { // 나만의 푸드 버튼을 누르면
	    		/* alert("나만의 음료 클릭"); */
	    		
	    		$("div#food_list").hide();
	    		$("div#drink_list").show();

	    		
	    		$("button#myDrink").css({'background-color':'#006633'}, {'font-color':'white'});
	    		$("button#myFood").css('background', '');
	    		
	    	}
			
			else {
				/* alert("나만의 푸드 클릭"); */
				
				$("div#drink_list").hide();
				$("div#food_list").show();
				
				$("button#myFood").css({'background-color':'#006633'}, {'font-color':'white'});
				$("button#myDrink").css('background', '');
			}
    	
		
			
			
		});
		
		
		/* 
		

		// 맨처음 음료 버튼에 버튼 켜져있기
		$("button#myDrink").toggleClass("button_on");
		$("button#myDrink").prop("disabled", false); 
		$("div#food_list").css('display', "none"); // 푸드 리스트 숨기기
		
		
		 // 카테고리 버튼이 클릭됐을 때 이벤트 
	    $("button.category").click(function(event){
	    	var $target = $(event.target);
	    	
	    	// 현재 선택된 버튼이 비활성화되있지 않다면, 초록색으로 바꿔줘야함
	        if(!$target.prop("disabled")) {
	            $target.toggleClass("button_on");
	            
	            console.log("지금 누른 버튼은 활성화되있음");
	            $("button.category").prop("disabled", false);
	            $("button.category").toggleClass("button_on")
	            $target.prop("disabled", true);
	            $target.toggleClass("button_on");
	            console.log($target.prop("id")); 
	        }
	         
	    	
	    	//푸드 리스트 보여주기
	    	if($target.prop("id") == "myFood") { // 나만의 푸드 버튼을 누르면
	    		$("div.drink_list").css('display', "none");
	    		$("div.food_list").show();
	    		
	    		alert("나만의 푸드 클릭");
	    		
	    		
	    	}
	    	
	    });
		
		
		
		 */
    	
		 
		// 체크박스에 선택된 회원들 삭제하기
		$("button#btnDelete").click(function() {
			
			// == 체크박스에서 체크된 value 값 (each사용) == //
			var arrCheckedVal = new Array();
			var id;
			
			$("input:checkbox[name=favorite]:checked").each(function(){
				arrCheckedVal.push($(this).val());
				id = $(this).prop("id");
			});
			
			arrCheckedVal = arrCheckedVal.join(",");
			
		//	alert("확인용 : "+id);

			var frm = document.deleteFrm;
			frm.seq.value = id;
			frm.action = "/StarbucksWeb/member/deleteDrink.sb";
			frm.method = "post";
			frm.submit();
			
		});
		 
		 
});
	
</script>

</head>
<body>
<div id="container">
     <div>
     	<div id="box1"></div>
     	<div id="box2">
     	<img src="../images/jiwon/coffeeBeans.jpg">
     		<div style="padding-right: 1000px; top: 165px; font-size: 3em; font-weight: bold; position: absolute; color: white;">
			 My 메뉴
			</div>
     	</div>
     </div>
     
     <nav>
    
     	<div id="con1">
     		<div id="fav_menu_container">
	     		<button class="category" id="myDrink">나만의 음료</button>
	     		<button class="category" id="myFood">나만의 푸드</button>     		
     		</div>
     		
     		<!-- <menu id="box6"></menu> -->
     		
     		<div id="box6">
     		<div class="panel panel-default">
	     		 <div class="panel-heading">
			     <h4 class="panel-title">
	     		 <a data-toggle="collapse" onclick="location.href='http://localhost:9090/Starbucks/mypage/my_menu.html'">My 메뉴</a>
	     	 	 </h4>
			    </div>
		    </div>  
		    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse2">개인정보관리</a>
			        </h4>
		      	  </div>
		      	  <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body"><a href="http://localhost:9090/Starbucks/mypage/myinfo_edit.html">개인정보확인 및 수정</a></div>
			        <div class="panel-body" style="background-color: white;"><a href="http://localhost:9090/Starbucks/mypage/myinfo_out.html">회원 탈퇴</a></div>
			        <div class="panel-body"><a href="http://localhost:9090/Starbucks/mypage/myinfo_edit_pwd.html">비밀번호 변경</a></div>
		         </div>
		    </div>
		  </div>
			
			<div id="drink_list">
			<form action="mymenuListFrm">
			<table>
				<thead>
					 <tr>
					 	<th><input type="checkbox" name="favoriteDrink"/></th>
					 	<th>No</th>
					 	<th>음료명</th>
					 	<th>등록일</th>
					 </tr>
				</thead>
				<tbody>
					
					<c:set var="flag" value="0" />
					<c:forEach var="myDrink" items="${menuList}" varStatus="status" >                                                                           
						<c:if test="${myDrink.section == 0 }">
							<c:set var="flag" value="1" />
							<tr class="menuInfo">
								<td><input type="checkbox" name="favorite" id="${myDrink.my_menu_seq}"/></td>
								<td class="mymenu_seq">${status.count}</td>
								<td class="pname">${myDrink.pname}</td>
								<td>${myDrink.register_day}</td>
							</tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${flag == 0}">
					<tr>
						<td colspan="4">데이터가 없습니다.</td>
					</tr>
					</c:if>	
				</tbody>
			</table>
			</form>
			</div>
			

			<div id="food_list">
			<table>
				<thead>
					 <tr>
					 	<th><input type="checkbox" name="favoriteFood"/></th>
					 	<th>No</th>
					 	<th>푸드명</th>
					 	<th>등록일</th>
					 </tr>
				</thead>
				<tbody>
			
					<c:forEach var="myFood" items="${menuList}" varStatus="status" >
						<c:if test="${myFood.section == 1 }">
							<tr class="menuInfo">
								<td><input type="checkbox" name="favorite" id="${myFood.my_menu_seq}"/></td>
								<td class="mymenu_seq">${status.count}</td>
								<td class="pname">${myFood.pname}</td>
								<td>${myFood.register_day}</td>
							</tr>
						</c:if>
					</c:forEach>
					
				</tbody>
			</table>
			</div>
     	</div>
     	
     	<div id="con2">	
			<label for="allCheck"></label><input type="button" id="allCheck" value="전체선택" />
		    <button id="btnDelete">선택삭제</button>
		</div>	 		
     </nav>
</div>

<form name="deleteFrm">
	<input type="hidden" name="seq" />
</form>

<jsp:include page="../footer.jsp" />