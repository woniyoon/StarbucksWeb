$(document).ready(function(){
  
	orderMembers();
	
	$(".category").on("click", (event)=>{
		var keyword = event.target.id;
		
		orderMembers(keyword);
	});
	
});

function orderMembers(filter_condition = ""){
	
	$.ajax({
		url: "/StarbucksWeb/admin/memberManagement.sb",
		method: "POST",
		data: {"filter_condition": filter_condition},
		dataType: "json",
		success: function(json){			
			var html = "";
			$.each(json, function(index, item) {
				console.log(item);
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
			    		"</tr>";
			});
			
			$("#member_tb").html(html);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});

	
}