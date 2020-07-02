$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);

    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());
    
    
    // 처음 들어오면 전체 선택 및 가격 업데이트!    
    var checkboxes = $(":checkbox");
    checkboxes.prop("checked", true);
    updatePrice();
    
    
    // 전체선택 버튼 선택에 따른 변화
    $("#selectAll").bind("change", function(){
    	var isAllChecked = $(this).prop("checked");
    	
    	$(".item_checkbox").each(function(){
    		$(this).prop("checked", isAllChecked);
    	});
    });
    
    
    // 체크박스가 선택될 때마다 변경되는 총액을 업데이트
    $("input[type=checkbox]").bind("change", function(){
    	var isAllChecked = true;
    	
    	$(".item_checkbox").each(function(){
    		if(!$(this).prop("checked")) {
    			$("#selectAll").prop("checked", false);
    			isAllChecked = false;
    			
    			return;
    		}
    	});
    	
    	if(isAllChecked) {
    		$("#selectAll").prop("checked", true);
    	}

    	updatePrice();
    	
    });
    
});

function updatePrice(){
	console.log("가격변동!");
	var sum = 0;
	$(".item_checkbox").each(function(index, item){
		var cart_seq = item.id;
		
		if($(this).prop("checked")) {
			
			var item_price = Number($("#price"+cart_seq).prop("textContent"));
			console.log($("#price"+cart_seq).prop("text"));
			sum += item_price;
		}
	});
	
	$("#final_price").prop("textContent", sum);
	console.log(sum);
}

function checkPoints(){
	
}



function removeItem(){
	
}






