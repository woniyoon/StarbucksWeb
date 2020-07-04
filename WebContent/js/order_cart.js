
//
//var size_dictionary = { 1: "톨", 2: "그란데", 3: "벤티" };
//var num_to_size = { 1: "tall", 2: "grande", 3: "venti" };
var size_dictionary = { tall: 1, grande: 2, venti: 3 };
var dictionary = {"size=tall": "톨 사이즈", "size=grande": "그란데 사이즈", "size=venti": "벤티 사이즈",
				  "default_syrup=less": "시럽 적게", "default_syrup=regular": "시럽 보통", "default_syrup=extra": "시럽 많이",
				  "shot=0":"샷 없음","shot=1":"샷 1개","shot=2":"샷 2개","shot=3":"샷 3개","shot=4":"샷 4개","shot=5":"샷 5개",
				  "warming=warm":"워밍옵션 : 따뜻하게 데움", "warming=none":"워밍옵션 : 데우지 않음",
				  "syrup=none":"시럽 : 없음", "syrup=vanilla":"시럽 : 바닐라시럽","syrup=hazelnut":"시럽 : 헤이즐넛시럽","syrup=caramel":"시럽 : 카라멜시럽",
				  "base=less":"베이스음료 : 적게", "base=regular":"베이스음료: 보통","base=extra":"베이스음료: 많이",
				  "ice=less":"얼음 : 적음","ice=regular":"얼음 : 보통","ice=extra":"얼음 : 많이",};


// size=grande&shot=0&default_syrup=regular&base=regular&ice=regular
var price_list = {};

$(document).ready(function(){
	
    // 커스텀 가격표를 가져옴
    $.ajax({
		url: "/StarbucksWeb/order/sumExtraCustom.sb",
		dataType: "json",
		success: function(json){			
			console.log(json);
			price_list = json;
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
	});
  
      
    $("div.card_text li > :nth-child(2n)").bind("change", (event)=>{
    	var selected_item = event.target;
		var value = selected_item.value;
		var name = selected_item.name;
    	var cart_item_id = event.currentTarget.parentNode.parentNode.id;  
    	
    	
    	if(name == "syrup") {
    		var price = 0;
    		if(value == "vanilla" || value == "hazelnut" || value == "caramel"){
    			price = Number(price_list["syrup"]);    	
    		} else {
    			price = 0;
    		}
    		$("span#extra_syrup").prop("text", price);
			console.log("시럽 아이템의 이름 :  " + selected_item.name);
		} else if(name == "size") {
			$("span#extra_size").prop("text", (Number(price_list["size"]) * (size_dictionary[value]-1)));
			console.log("사이즈 아이템의 이름 :  " + selected_item.name);

		} else if(selected_item.name == "shot") {

			if(value == 5) {
		        snackBar("에스프레소 샷은 최대 5개 입니다!");
		    }
			
			$("span#extra_shot").prop("text", (Number(value) - Number(selected_item.min)) * Number(price_list["shot"]));
		} else {
			console.log("해당사항 없음");
			return false;
		}
    	
		getSum(cart_item_id);
		
	});

});

function getSum(cart_item_id){
	var sum = 0;

	$("ul#" +cart_item_id +" span").each((index, item)=>{
		console.log(item.id + " : " + item.text);
		
		if(Number(item.text) > 0){
			sum+= Number(item.text);    
			console.log(Number(item.text));
		}
	});
		
	var original_price = Number($("input#original_price"+cart_item_id).prop("value"));
	$("span#price"+cart_item_id).text(sum + original_price);

}


function update_custom(){
	
	$(".order_form").each((index, item)=>{
		var queryString = $("form#"+item.id).serialize();
		var custom = "";
		var custom_arr = queryString.split("&");
		
		for(var i=0; i<custom_arr.length; i++) {
			var comma = i <custom_arr.length-1 ? ", " : " ";
			var option = dictionary[custom_arr[i]] != null ? dictionary[custom_arr[i]] : "없음";
			
			custom += option + comma;
		}
		
//		$("#custom_option"+item.id).prop("value", custom);
		console.log(custom);
		
		var final_price = $("#price"+item.id).text();
		
		console.log($("#price"+item.id).text());
		console.log($("#price"+item.id));
		// 커스텀 내역 저장
		$("#form_checkout").css("display", "none").append("<input id='"+item.id+"' name='custom' type='text' value='"+custom+"' />");
		// 쇼핑카트 시퀀스 저장
		$("#form_checkout").css("display", "none").append("<input name='cart_seq' type='text' value='"+item.id+"' />");
		// 최종가격 저장
		$("#form_checkout").css("display", "none").append("<input id='final_price"+item.id+"' name='final_price' type='text' value='"+final_price+"' />");
		
	});
	
}


function remove_item(index, item_seq){
	var deletedItemName = $("#name"+index).prop("value");
    
	$.ajax({
		url: "/StarbucksWeb/order/deleteCartItem.sb",
		data: {"itemSeq": item_seq, "itemName" : deletedItemName},
		dataType: "json",
		success: function(json){			

			if(json.result != 0) {
				$("#card"+index).hide();				
			}
			
			snackBar(json.msg);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
		
	});
	
}

function checkout(){
	update_custom();
	
	var form = document.form_checkout;
	form.action = "/StarbucksWeb/order/storeLocation.sb";
	form.method = "POST";
	form.submit();
}


function snackBar(msg) {
    $("#snackbar").html(msg);

    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}