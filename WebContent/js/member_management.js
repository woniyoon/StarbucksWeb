var filter_condition = "member_seq";
var current_page = 1;

$(document).ready(function(){
  
//	// 처음 회원목록은 member_seq 기준으로 가져오고, 페이지는 1
//	orderMembers();
	
	// 클래스명이 category인 요소들의 id값을 이용하여 필터링 키워드 전달
	$(".category").on("click", (event)=>{
		var keyword = event.target.id;
//		filter_condition = keyword;
//		orderMembers();
		alert(keyword);
		window.location.href = "memberManagement.sb?currentShowPageNo="+1+"&filterCondition="+keyword;
	});
	
});

function orderMembers(){
	console.log("filter_condition : " + filter_condition);
	console.log("current_page : " + current_page);
	
	$.ajax({
		url: "/StarbucksWeb/admin/memberManagement.sb?filterCondition="+filter_condition+"&currentPage="+current_page,		
		method: "POST",
//		data: {"filter_condition": filter_condition,
//				"current_page": current_page},
		dataType: "json",
		success: function(json){			
			var html = "";
			var page_bar = "";
			console.log(json);
			$.each(json, function(index, item) {
				console.log(item);
				var isMember = item.status == 1 ? "<td>회원</td>" : "<td>탈퇴</td>";
				
			    html += "<tr> " +
			    			"<td>"+item.member_seq+"</td> " +
			    			"<td>"+item.userid+"</td>" +
			    			"<td>"+item.name+"</td>" +
			    			"<td>"+item.email+"</td>" +
			    			"<td>"+item.hp+"</td>" +
			    			"<td>"+item.gender+"</td>" +
			    			"<td>"+item.birthdate+"</td>" +
			    			"<td>"+item.age+"</td>" +
			    			"<td>"+item.point+"</td>" +
			    			"<td>"+item.registerday+"</td>" +
			    			isMember +			    			
			    		"</tr>";
			    
			    if (page_bar == "") {
			    	page_bar = item.pageBar;
			    }
			});
			
			$("#member_tb").html(html);
			$("#paging_container").html(page_bar);
			
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});

	
}