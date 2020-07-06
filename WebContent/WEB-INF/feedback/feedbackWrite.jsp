<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> --%>
<style type="text/css">
	
	/* 전체 틀 */
	
	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		margin: 0;
	}
	
	/* * {
		margin: 20 0 0 0px;
	} */

	div#container { 
		width: 100%;
	}
	
	div#middle {
		width: 78%;
		margin: 0 auto;
	}
	
	ul#feed {
		list-style-type: none;
	}
	
	a {
		color: #4d4d4d;
		text-decoration: none;
	}
	
	.radio input {
		vertical-align: text-bottom;
	}
	
	input {
		border: solid 1px #ccc;
		border-radius: 3px;
		height: 23px;
	}
	
	.radio label {
		vertical-align:-1px
	}
	
	select {
		border: solid 1px #ccc;
		border-radius: 3px;
		height: 27px;
	}
	
	/* input#selectChain {
		width: 130px;
		border: none;
		font-weight: bold;
	} */

	/* 상단(제목) */
	div#top {
		width: 100%;
		height: 180px;
		background-image: url("/StarbucksWeb/images/hyejeong/ms_sub_ttl_bg.jpg");
	}
	
	/* 상단링크 */
	
	div#link {
		margin-right: 210px;
		text-align: right;
		font-size: 10pt;
	}
	
	/* 모달  */
	.modal-header {
	    padding: 15px;
	    height: 56px;
	    background-color: #8c8279;
	    color : white;
	    border-bottom: 1px solid #8c8279;
	}

	/* 텍스트박스 */
	
	div#text {
		height: 150 px;
		margin-top: 40px;
		margin-bottom: 20px;
		padding: 20px;
		border-radius: 3px;
		background: url("/StarbucksWeb/images/hyejeong/m_voc_top_bg.png") right no-repeat ;
		background-color: #f4f4f2;
		
		text-align: left;
	}
	
	p {
		margin: 0;
		font-size: 10pt;
	}
	
	div#text>button {
		margin-top: 10px;
		padding: 5px;
	}
	
	button#viewMyComplain{
		background: #e2c383;
		border: 1px solid #bb9f65;
		border-radius: 3px;
		color: #222;
		font-size: 12px;
		font-weight: bold;
		height: 28px;
		width: 131px;
	}
	
	/* 테이블 */
	
	table.type05 {
		width: 100%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	    margin: 5px 0;
	}
	
	table.type05 th {
	    width: 20%;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: middle;
	    border-bottom: 1px solid #ccc;
	    background: #f2f2f2;
	}
	
	table.type05 td {
	    width: 80%;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	.form-control-tel {
		width: 70px;
	}
	
	/* 텍스트박스2 */
	
	div#text2 {
		margin-top: 30px;
		border: solid 1px #ccc;
		border-radius: 3px;
		padding: 15px;
	}
	
	div#text2> ul#feed {
		padding-left: 25px;
		list-style-type: disc;
		color: gray;
		font-size: 10pt;
		
	}
	
	input[id="calendar"] + label {
		display: inline-block;
		margin-top: 10px;
		cursor: pointer; 
		width: 14px; 
		height: 14px;
		background: url('/StarbucksWeb/images/hyejeong/icon_calendar.gif') center no-repeat;
		margin-left: -6px;
	}

	
	input[id="calendar"] {
		 display: none; 
	}
	
	label#calendar {
		border-bottom: solid 1px #ccc;
		border-right: solid 1px #ccc;
		border-top: solid 1px #ccc;
		border-radius: 3px;
		padding: 5.5px;
		padding-left: 8px;
		padding-right: 8px;
	}
	
	.search label {
		vertical-align: bottom;
	}
	

	/* 제목 */
	input.subject {
		width: 513px;
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
	
	input.form-control-tel {
		width: 100px;
	}
	
	li.file {
		font-size: 10pt;
	}
	
	input#file {
		width: 402px;
		height: 26px;
	}
	
	input#file2 {
		width: 402px;
		height: 26px;
	}
	
	div.button {
		display: inline-block;
		width: 62px;
		height: 28px;
		background: #777;
	    border: none;
	    border-radius: 3px;
	    color: #fff;
	    cursor: pointer;
	    font-size: 10pt;
	    text-align: center;
	    vertical-align: middle;
	    line-height: 2;
	    margin-left: 9px;
	}
	
	.plus {
		background: url("/StarbucksWeb/images/hyejeong/file_add.gif") no-repeat;
		border: 1px solid #ddd;
	    border-radius: 3px;
	    /* float: right; */
	   /*  margin-right: 482px; */
	    height: 26px;
	    margin-left: 10px;
	    vertical-align: middle;
	    overflow: hidden;
	   /*  text-indent: -20000px; */
	    width: 26px;
	}
	
	.minus {
		background: url("/StarbucksWeb/images/hyejeong/file_remove.gif") no-repeat;
		border: 1px solid #ddd;
	    border-radius: 3px;
	    /* float: right; */
	   /*  margin-right: 482px; */
	    height: 26px;
	    margin-left: 10px;
	    vertical-align: middle;
	    overflow: hidden;
	   /*  text-indent: -20000px; */
	    width: 26px;
	}
	
	div#fileattach {
		
		margin-top: 10px;
	}

	
	/* 글쓰기 버튼 */
	
	input#btnWrite {
		margin-top: 15px;
		margin-right: 5px;
		font-size: 12px;
		font-weight: bold;
		background: #e2c383;
		border: 1px solid #bb9f65;
		color: #222;
		height: 28px;
		width: 141px;
	
	/* pagination */
	
	.pagination>li>a {
		border: none;
		color: gray;
	}
	
	.pagination>.active>a,
	.pagination>.active>a:focus, 
	.pagination>.active>a:hover, 
	.pagination>.active>span, 
	.pagination>.active>span:focus, 
	.pagination>.active>span:hover
	 {
		background-color: white;
		border: none;
		color: green;
		text-decoration: underline;
		cursor: pointer;
	}

</style>
<script type="text/javascript">



	
	

	$(document).ready(function() {

		$("span#pickStore").hide();
		
		$("div#fileattach").hide();
		
		$(".novisit").click(function(){
			$(".search").hide();
		}); 
		
		$(".visit").click(function(){
			$(".search").show();
		}); 

		    

			<%-- $("#btnFind").click(function(){
				var frm = document.idFindFrm;
				frm.action = "<%= ctxPath%>/login/idFind.up";
				frm.method = "POST";
				frm.submit();
			}); --%>
			
		


			
		$("input#addfile").bind("change", function(){
			var file = $(this).val();
			/* var lastIndex = file.lastIndexOf("\\");
		//	console.log(lastIndex);
			var fileName = file.substring(lastIndex+1, file.length);
		//	console.log(fileName); */
			$("input#file").val(file);
		});
		
		 $("input#removefile").bind("change", function(){
			var file2 = $("#removefile").val();
			/* var lastIndex2 = file2.lastIndexOf("\\");
			console.log(lastIndex2);
			var fileName2 = file2.substring(lastIndex2+1, file.length);
			console.log(fileName2);
 */			$("input#file2").val(file2);
		});
		 
		
			
	/* 	$("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd'  //Input Display Format 변경
           ,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
           ,changeYear: true        //콤보박스에서 년 선택 가능
           ,changeMonth: true       //콤보박스에서 월 선택 가능                
           ,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
           ,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
           ,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
           ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
         //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
         //,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
       });                    
       
       //초기값을 오늘 날짜로 설정
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  */
	});


	   
   
   
   
   
	// 내용 용량제한시키기
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
   
   
   function findchain() {
	
		// window.name = "부모창 이름"; 
	       window.name = "parentForm";
	       // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	       openWin = window.open("<%= request.getContextPath()%>/feedback/chainFind.sb",
	               "childForm", "left=350px, top=100px, width=800px, height=700px, resizable = no, scrollbars = no"); 

	       
		<%-- // 팝업창 띄우기
		var url = "<%= request.getContextPath()%>/feedback/chainFind.sb";
		
		window.open(url, "chainfind",
					"left=350px, top=100px, width=800px, height=600px, resizable = no, scrollbars = no"); // 팝업창 띄움(view단주소, 팝업창이름, 위치) --%>

	}
   
   
    function find(id) {
    	console.log(id);
    	$("input#"+id).click();
    }

	function fileAdd() {
		
		$("button#fileadd").hide();
		$("div#fileattach").show();
		
	} 
	
	function fileMinus() {
		$("div#fileattach").hide();
		$("button#fileadd").show();
	}
	
	
	function goRegister() {
		  

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
			  var frm = document.writeFrm;
		   	  frm.method = "POST";
		   	  frm.action = "feedbackPost.sb";
		   	  frm.enctype= "multipart/form-data";
		   	  frm.submit();
		  }
	   	  
		}// end of function goRegister(event)----------

	
</script>


<div id="container" style="margin: 0 auto;">
	<div id="top">
	<h1 style="margin:0; margin-left:160px; padding-top:100px; color: white;">고객의 소리</h1>
	<div id="link">
		<ul id="feed" >
		    <li>
			  	<a href="" class="btnMain"><img src="/StarbucksWeb/images/hyejeong/icon_home_w.png" alt="홈으로"></a>&nbsp;<span style="color: white;">></span>&nbsp;<a href="" class="btnComplain" style="color: white;">고객의소리</a>
		    </li>
		</ul>
	</div>
	</div>
	<div id="middle">
	<div id="text">
		<h3>귀한 말씀 들려 주십시오.작은 소리도 듣겠습니다.</h3>
		<p>스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.</p>
		<p>만족스러운 서비스였는지,불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다.보다 나은 서비스로 보답하겠습니다.</p>
		<p>　</p>
		<p>· 고객의 소리 운영시간 : 월~일 09:00 ~ 18:00 (연중무휴)</p>
		<br/>
		<!-- <button id="viewMyComplain">나의 문의 내역 보기</button> -->
	</div>
		<p style="text-align:right; font-size: 8pt;"><span style="color: red;">*</span>표시 항목은 필수 입력 사항입니다.</p>
	<form name="writeFrm" >
	<table class="type05" style="border-top: solid 1px black;">
	    <tr>
	        <th scope="row">분야 <span style="color: red;">*</span></th>
	        <td>
			    <div class="radio">
			      <label><input type="radio" id="section" name="category" value="문의" checked > 문의 </label><label><input type="radio" id="section" name="category" value="칭찬" > 칭찬 </label><label><input type="radio" id="section" name="category" value="제안"> 제안 </label><label><input type="radio" id="section" name="category" value="불만" > 불만 </label>
			    </div>
			    
			</td>
	    </tr>
	    <tr>
	        <th scope="row">연락처</th>
	        <td>
				<select class="form-control-tel" id="sel1" name="hp1">
			      	<option>010</option>
			        <option>011</option>
			        <option>016</option>
			        <option>017</option>
			        <option>018</option>
			        <option>019</option>
			    </select> - <input class="form-control-tel" name="hp2" type="text" maxlength="4" /> - <input class="form-control-tel" name="hp3" type="text" maxlength="4" />
			</td>
	    </tr>
	    <tr>
	        <th scope="row">장소 <span style="color: red;">*</span></th>
	        <td>
	        	<div class="radio">
      				<label><input type="radio" class="visit" name="visit" value="visit" checked> 매장 방문 </label><label><input type="radio" class="novisit" name="visit" value="novisit"> 매장 방문 외 </label>
    			</div>
    			<div class="search">
<!-- 		        	&nbsp;방문매장&nbsp;<button id="findChain" onclick="findchain()" type="button" style="width: 64px; height:28px; margin:5px 3px; margin-bottom:6px; background-color: #666; color: white; border-radius: 3px; font-size: 12px; font-weight: bold; cursor: pointer;">매장찾기</button><span id="pickStore">선택하신 매장은 <strong id="selectChain"></strong>입니다.</span><br/> -->
		        	&nbsp;방문매장&nbsp;<button id="findChain" onclick="findchain()" type="button" style="width: 64px; height:28px; margin:5px 3px; margin-bottom:6px; margin-right:10px; background-color: #666; color: white; border-radius: 3px; font-size: 12px; font-weight: bold; cursor: pointer;">매장찾기</button><span id="pickStore" style="margin-left:10px; font-size:14px; color: #666;">선택하신 매장은 <span id="selectChain" style="font-weight: bold;"></span>입니다.</span><input type="text" style="color: white; border: none;" id="store_id" name="store_id" /><br/>
		        	
		        	&nbsp;방문일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="calendar"><input type="date" id="datepicker" name="visit_day" max="today"><!-- <input id="calendar datepicker" type="date" max="today" class="requiredInfo"> --> <!-- <label id="calendar" for="calendar"></label> --></span> 
					
				</div>
			</td>
	    </tr>
	    <tr>
	        <th scope="row">제목 <span style="color: red;">*</span></th>
	        <td>
	        	<input style="width: 515px;" class="requiredInfo" type="text" class="subject" name="title" maxlength="50">
			</td>
	    </tr>
	    <tr>
	        <th scope="row">내용 <span style="color: red;">*</span></th>
	        <td>
	        	<textarea class="requiredInfo" name="contents" placeholder="관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보 보안, 불충분한 증거/ 귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다." onKeyUp="javascript:fnChkByte(this,'2500')"></textarea><br/>
	        	<span id="byteInfo">0</span> /2500bytes
			</td>
	    </tr>
	    <tr>
	        <th scope="row">파일첨부</th>
	        <td id="file" style="height: 120px;">
	        	<input type="text" id="file" maxlength="50" ><input id="addfile" type="file" name="file_attached" style="display:none" /><div class="button" id="addfile" onclick="find(this.id)">찾아보기</div><button id="fileadd" class="plus" type="button" onclick="fileAdd()"></button>
	        	<%-- <input type="text" id="file" maxlength="50" name="file_attached"><input id="addfile" type="file" style="display:none" /><div class="button" id="addfile" onclick="find(this.id)">찾아보기</div><button id="fileadd" class="plus" type="button" onclick="fileAdd()"></button> --%>
	        	<div id="fileattach">
	        		<input type="text" id="file2" maxlength="50" ><input id="removefile" type="file" name="file_attached2" style="display:none" /><div class="button" id="removefile" onclick="find(this.id)">찾아보기</div><button id="fileminus" class="minus" type="button" onclick="fileMinus()"></button>
	        	<%-- <input type="text" id="file2" maxlength="50" name="file_attached2"><input id="removefile" type="file" style="display:none" /><div class="button" id="removefile" onclick="find(this.id)">찾아보기</div><button id="fileminus" class="minus" type="button" onclick="fileMinus()"></button> --%>
	        	</div>
	        	<ul id="feed" style="padding-left:18px; list-style: disc; color: #444; line-height: 16px;">
  					<li class="file">
  						파일첨부는 아래의 파일만 등록이 가능하며 최대 2개(1개당 최대5MB), 총 10MB까지 등록이 가능합니다.<br/>
  						(등록 가능 확장자 : jpg, jpeg, png, gif)
  					</li>
  				</ul>	
	        </td>
	    </tr>
	</table>
  <div id="text2">
  	<ul id="feed">
  		<li>전화 상담 요청은 불가하오니 양해 부탁 드립니다.</li>
  		<li>고객이 동의한 개인정보처리방침에 따라 고객의 소리 민원 처리를 위해 작성자의 개인정보를 활용할 수 있습니다.</li>
  		<li>답변글을 통해 상담이 진행되며, 기재 오류 및 계정문제가 발생한 경우에는 답변이 불가할 수 있습니다.</li>
  		<li>관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 
  			업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 
  			점 양지하여 주시기 바랍니다.</li>
  		<li>공정거래위원회에서 고시한 소비자분쟁해결기준에 의거 소비자 피해에 대한 교환/환불 처리 해드립니다.</li>
  	</ul>
  </div>	
  <div id="writeBtn" style="text-align: right;">
	<ul id="feed">
		<li>
			<input type="button" id="btnWrite" value="고객의 소리 등록하기" onclick="goRegister();"/>
		</li>
	</ul>
  </div>
  </form>
  </div>
 
  
</div>



<%--  ****** 매장 찾기 Modal ****** 
 <div class="modal fade" id="chainfind" role="dialog">
   <div class="modal-dialog">
   
     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
         <h4 class="modal-title">매장찾기</h4>
       </div>
       <div class="modal-body" style="height: 100%; width: 100%;">
         <div id="idFind">
         	<iframe style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath()%>/feedback/chainFind.sb">
         	</iframe>
         </div>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
       </div>
     </div>
     
   </div>
 </div> --%>



<jsp:include page="../footer.jsp" />