
$(document).ready(function(){
	getMenuList(1);
	
});

function getMenuList(current_page){
	
	$.ajax({
		url: "/StarbucksWeb/admin/menuList.sb?currentPage="+current_page,		
		method: "POST",
		data: { category: $("select[name=category]").val() },
		dataType: "json",
		success: function(json){			
			var html = "";
			var page_bar = "";
			
			$.each(json, function(index, item) {
				console.log(item);
				
			    html += "<tr> " +
			    			"<td class='menu_content_td'>"+(index+1)+"</td> " +
//			    			"<td class='menu_content_td'>"+item.parentTable+"</td>" +
			    			"<td class='menu_content_td'>"+item.categoryID+"</td>" +
			    			"<td class='menu_content_td'>"+item.name+"</td>" +
			    			"<td class='menu_content_td'>"+item.description+"</td>" +
			    			"<td class='menu_content_td'>"+item.price+"</td>" +
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