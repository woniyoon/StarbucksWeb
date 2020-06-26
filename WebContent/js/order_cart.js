
//
//var size_dictionary = { 1: "톨", 2: "그란데", 3: "벤티" };
//var num_to_size = { 1: "tall", 2: "grande", 3: "venti" };
var size_dictionary = { tall: 1, grande: 2, venti: 3 };

var custom_fee = {
};

var price_list = {};

$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);
    console.log(current_state);
    
    // 현재 위치한 페이지에 해당하는 nav_menu 항목의 컬러만 변경
    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());


    
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

function remove_item(index){
//    var size = cart[index].size;
	var deletedItemName = $("#name"+index).prop("value");
    snackBar(deletedItemName + "이/가 삭제됐습니다!");
    
    $("#card"+index).hide();

    // $("#card"+index).hide();
    // $("div#" + index).remove();
    // show_items();
}



function snackBar(msg) {
    $("#snackbar").html(msg);

    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}