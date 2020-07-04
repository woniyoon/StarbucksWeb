
$(document).ready(function(){
	getDrinkList(1);
	
	
});

function getDrinkList(current_page){
	$.ajax({
		url: "/StarbucksWeb/admin/drinkList.sb?currentPage="+current_page,		
		method: "POST",
		dataType: "json",
		success: function(json){			
			var html = "";
			var page_bar = "";
			
									
			$.each(json, function(index, item) {
				console.log(item);
				
			    html += "<tr> " +
			    			"<td>"+(index+1)+"</td> " +
			    			"<td>"+item.parentTable+"</td>" +
			    			"<td>"+item.categoryName+"</td>" +
			    			"<td>"+item.name+"</td>" +
			    			"<td>"+item.description+"</td>" +
			    			"<td>"+item.price+"</td>" +
			    		"</tr>";
			    
			    page_bar = item.pageBar;
			    
			});
			
			$("#drink_tbody").html(html);
			$("#paging_container").html(page_bar);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});
}