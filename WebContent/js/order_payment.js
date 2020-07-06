var deducted_points = 0;
var price_to_pay = 0;
var my_points = 0;
// slip_no값을 난수로 생성
var slipNo = Math.random().toString(36).substr(2,11);

$(document).ready(function(){

    // 로딩바 숨기기 
    $("#overlay").hide();
    
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


// 체크박스 선택에 따라 최종가격 변경
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


// 보유 포인트 확인
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

// 사용 포인트 적용
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


// 아임포트 결제 페이지로 이동
function goToPay(){
	
	pop_up_window = "payment";

	var price_to_pay = $("input#price_to_pay").prop("value");
	
	console.log(price_to_pay);

	sessionStorage.setItem("price_to_pay", price_to_pay);
//	sessionStorage.setItem("price_per_item", price_per_item);
//	sessionStorage.setItem("store_id", store_id);
//	sessionStorage.setItem("deducted_point", deducted_point);
//	sessionStorage.setItem("product_id", product_id);
//	sessionStorage.setItem("item_seq", item_seq);

	
	// 팝업창으로 결제페이지 띄움 & 최종 결제금액과 난수로 생성된 slipNo를 파라미터로 전송
	window.open("/StarbucksWeb/paymentPage.sb?amount="+price_to_pay+"&slipNo="+slipNo, pop_up_window, "toolbar=no, location=no, width=820, height=600");

}

// 결제 성공후 DB에 업데이트
function update_database(){	
	$("#overlay").show();	
	
	var price_per_item = [];
	var product_id = [];
	var item_seq = [];

	// 숨겨져있는 input의 값들을 sessionStorage에 전달 -> paymentGateway.jsp에 전달
	var index = 0;
	$(".item_checkbox").each(function(){
		if($(this).prop("checked")) {
			price_per_item[index] = $("#price_per_item"+index).prop("value");
			product_id[index] = $("#product_id"+index).prop("value");
			item_seq[index] = $("#item_seq"+index).prop("value");
			
			index++;
		}
	});
	
	
	var price_paid = $("input#price_to_pay").prop("value");
	var deducted_point = $("#point_to_use").prop("value");
	var store_id = $("#store_id").prop("value");
	
	
	console.log("store_id" + store_id);
	console.log("price_per_item" + price_per_item);
	console.log("product_id" + product_id);
	console.log("item_seq" + item_seq);
	console.log("price_paid" + price_paid);
	console.log("deducted_point" + deducted_point);
	console.log("slipno" +slipNo);
	
	$.ajax({
		url: "/StarbucksWeb/order/updatePurchase.sb",
		dataType: "json",
		data: {
			"storeId": store_id,
			"pricePerItems": price_per_item.toString(),
			"productIds": product_id.toString(),
			"itemSeqArr": item_seq.toString(),
			"pricePaid": price_paid,
			"deductedPoint": deducted_point,
			"slipNo": slipNo,
		},
		success: function(json){	
			setTimeout(function(){
				$("#overlay").hide();
			}, 3000);

			console.log(json);
			
			if(json.isUpdated) {
				location.href="/StarbucksWeb/order/confirmed.sb";
			} else {
				alert("결제가 실패했습니다. \n 관리자에게 문의해주세요.");
			}
			
		},
		error: function(request, status, error){
			$("#overlay").hide();
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});
}





