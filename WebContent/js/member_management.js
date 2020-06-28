$(document).ready(function(){
  
	// 처음 회원목록은 member_seq 기준으로 가져옴
	orderMembers("member_seq");
	
	
	// 클래스명이 category인 요소들의 id값을 이용하여 필터링 키워드 전달
	$(".category").on("click", (event)=>{
		var keyword = event.target.id;
	
		orderMembers(keyword);
	});
	
});

function orderMembers(filter_condition){
	
	$.ajax({
		url: "/StarbucksWeb/admin/memberManagement.sb",
		method: "POST",
		data: {"filter_condition": filter_condition},
		dataType: "json",
		success: function(json){			
			var html = "";
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
			});
			
			$("#member_tb").html(html);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});

	
}