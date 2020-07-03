var deducted_points = 0;
var price_to_pay = 0;
var my_points = 0;

$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);

    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());
    
    
    // 처음 들어오면 전체 선택 및 가격 업데이트!    
    var checkboxes = $(":checkbox");
    checkboxes.prop("checked", true);
    update_price();
    
    
    // 전체선택 버튼 선택에 따른 변화
    $("#selectAll").bind("change", function(){
    	var is_all_checked = $(this).prop("checked");
    	
    	$(".item_checkbox").each(function(){
    		$(this).prop("checked", is_all_checked);
    	});
    });
    
    
    // 체크박스가 선택될 때마다 변경되는 총액을 업데이트
    $("input[type=checkbox]").bind("change", function(){
    	var is_all_checked = true;
    	
    	$(".item_checkbox").each(function(){
    		if(!$(this).prop("checked")) {
    			$("#selectAll").prop("checked", false);
    			is_all_checked = false;
    			
    			return;
    		}
    	});
    	
    	if(is_all_checked) {
    		$("#selectAll").prop("checked", true);
    	}

    	update_price();
    	
    });
    
    // 자동으로 포인트를 불러와서 저장
    check_points();
    
});

function update_price(){
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
	price_to_pay = sum;
	
	$("#my_point").prop("value", my_points);
	$("#point_to_use").prop("value", 0);
	$("input#price_to_pay").prop("value", sum);

}

function check_points(){
	$.ajax({
		url: "/StarbucksWeb/order/getPoints.sb",
		dataType: "json",
		success: function(json){			
			console.log(json);
			my_points = json.point;
			$("#my_point").prop("value", json.point);
			$("#point_to_use").prop("max", json.point);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});
}


function apply_points(){
	var points_to_use = Number($("#point_to_use").prop("value"));
	console.log("사용 포인트 " + points_to_use);
	console.log("총 금액 " + Number(price_to_pay));
	console.log(price_to_pay - points_to_use);
	
	$("#my_point").prop("value", my_points - points_to_use);
	$("#final_price").prop("textContent", price_to_pay - points_to_use);
	$("#price_to_pay").prop("value", price_to_pay - points_to_use);
}


function removeItem(){
	
}

function goToPay(){
	
//	$("#payment_form").attr("action", "/paymentPage.sb");
//	$("#payment_form").method = "POST";
	pop_up_window = "payment";

	var price_per_item = [];
	var product_id = [];
	var item_seq = [];

	// 숨겨져있는 input의 값들을 sessionStorage에 전달 -> paymentGateway.jsp에 전달
	$("tr.items").each(function(index, item){
		price_per_item[index] = $("#price_per_item"+index).prop("value");
		product_id[index] = $("#product_id"+index).prop("value");
		item_seq[index] = $("#item_seq"+index).prop("value");
	});

	var price_to_pay = $("input#price_to_pay").prop("value");
	console.log(price_to_pay);
	console.log();
	var deducted_point = $("#point_to_use").prop("value");
	var store_id = $("#store_id").prop("value");
	
	console.log(price_to_pay);

	sessionStorage.setItem("price_to_pay", price_to_pay);
	sessionStorage.setItem("price_per_item", price_per_item);
	sessionStorage.setItem("store_id", store_id);
	sessionStorage.setItem("deducted_point", deducted_point);
	sessionStorage.setItem("product_id", product_id);
	sessionStorage.setItem("item_seq", item_seq);

	// slip_no값을 난수로 만들어서 파라미터로 전송
	var slipNo = Math.random().toString(36).substr(2,11);

	// 팝업창으로 결제페이지 띄움
	window.open("/StarbucksWeb/paymentPage.sb?slipNo="+slipNo, pop_up_window, "toolbar=no, location=no, width=745, height=705");

}




