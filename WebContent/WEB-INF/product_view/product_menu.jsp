<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp" />

<style type="text/css">

	/* 전체 */
	#container {
	    width: 1100px;
	    margin: 0 auto;
	    /* border: solid 1px orange; */
	}
	
	/* 타이틀 */
	div.title {
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    height: 91px;
	    font-size: 15px;
	    /* border: solid 1px red; */
	}
	
	/* 타이틀_하위목록 */
	div.title > nav {
		display: flex;
		align-items: flex-end;
	}
	
	div.title > nav > ul {   
		/* border: solid 1px cyan; */
		right: 120px;
		top: 40px;
		list-style-type: none;   
		text-decoration: none;
	}
   
	div.title > nav > ul > li {   
		display: inline-block;
		top: 50px;
		/* border: solid 1px blue; */
	}
	
	div.title > nav > ul > li > a {
		text-decoration: none;
		color: #666666;
	}  
	
	div > label, button.category, .zoom img, .view_list {
	    cursor: pointer;
	}
	
	/* 분류보기 */
	section.product_group {
	    clear: both;
	    position: relative;
	    padding: 30px 30px;
	    border-radius: 10px;
	    border: solid 1px #ccc;
	}
	
	hr {
		border: none;
		height: 1px;
		background-color: #ccc;
	}
	
	div.group_sub_title {
	    /* border: solid 1px yellow; */
	    margin-bottom: 30px;
	}
	
	button.category {
	    width: 200px;
	    height: 35px;
	    margin: 20px 8px 0 0;
	    border-style: none;
	    border-radius: 5px;
	    border: none;
	    outline: none;
	    cursor: pointer;
	}
	
	.button_on {
	    color: #ffffff;
	    background-color: #006633;
	}
	
	button.category:hover, button.view_list:hover, div.li>a:hover, div.title>nav>ul>li>a:hover {
	    text-decoration: underline;
	}
	
	div.grid_container {
	    display: grid;
	    grid-row-gap: 50px;
	    grid-template-columns: 25% 25% 25% 25%;
	    margin-bottom: 50px;
	    padding: 10px;
	    border: 1px solid green;
	}
	    
	/* 메뉴 리스트 */
	button.view_list{
	    /* background-color: #ffffff;
	    color: #666666; */
	    margin: 30px 10px 10px 0px;
	    border: solid 1px #ccc;
	}
	
	.button_on_list {
		color: #ffffff;
	    background-color: #666666;
	}
	
	/* *** 마우스 올리면 사진 확대되는 효과 *** */
	.zoom {
	    width: 260px;
	    height: 270px;
	    overflow: hidden; /* div 박스 사이즈를 넘어간 값은 숨긴다*/
	}
	
	.zoom img {
	    /* cursor: pointer; */
	    -webkit-transform:scale(1);
	    -moz-transform:scale(1);
	    -ms-transform:scale(1); 
	    -o-transform:scale(1);  
	    transform:scale(1);
	    -webkit-transition:.8s;
	    -moz-transition:.8s;
	    -ms-transition:.8s;
	    -o-transition:.8s;
	    transition:.8s;
	} 
	
	.zoom:hover img {
	    -webkit-transform:scale(1.5);
	    -moz-transform:scale(1.1);
	    -ms-transform:scale(1.1);   
	    -o-transform:scale(1.1);
	    transform:scale(1.1);
	} 
	
	/* 영양정보 테이블 */
	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	th {
		padding: 17px 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
	    font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	}
	
	/* 수정해야 됨*/
	
	div.sub_title {
		padding: 20px;
	    background: #f4f4f2;
	    margin-bottom: 10px;
	    border-radius: 3px;
	    overflow: hidden;
	    font-size: 20pt;
	    font-weight: bold;
	}
	
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
    
var arr_coffee_list=[
    {type:"product_coldbrew", name:"나이트로 바닐라 크림", filename:"/StarbucksWeb/images/bobae/1-1.jpg"},
    {type:"product_coldbrew", name:"초콜릿 블랙 콜드 브루", filename:"/StarbucksWeb/images/bobae/1-2.jpg"},
    {type:"product_brewed", name:"아이스 커피", filename:"/StarbucksWeb/images/bobae/1-3.jpg"},
    {type:"product_brewed", name:"오늘의 커피", filename:"/StarbucksWeb/images/bobae/1-4.jpg"},
    {type:"product_brewed", name:"오늘의 커피", filename:"/StarbucksWeb/images/bobae/1-4.jpg"},
    {type:"product_brewed", name:"오늘의 커피", filename:"/StarbucksWeb/images/bobae/1-4.jpg"},
    {type:"product_brewed", name:"오늘의 커피", filename:"/StarbucksWeb/images/bobae/1-4.jpg"}];
    var arr_food_list=[
    {type:"product_bakery", name:"녹차 머핀", filename:"/StarbucksWeb/images/bobae/2-1.jpg"},
    {type:"product_bakery", name:"다크 초콜릿 칩 머핀", filename:"/StarbucksWeb/images/bobae/2-2.jpg"},
    {type:"product_cake", name:"서머 베리 요거트 케이크", filename:"/StarbucksWeb/images/bobae/2-3.jpg"},
    {type:"product_cake", name:"7 레이어 가나슈 케이크", filename:"/StarbucksWeb/images/bobae/2-4.jpg"},
    {type:"product_cake", name:"7 레이어 가나슈 케이크", filename:"/StarbucksWeb/images/bobae/2-4.jpg"}];

var drink_category = ["product_coldbrew","product_brewed"];
var foods_category = ["product_bakery","product_cake"];





$(document).ready(function(){

	var selected = "view_photo";

    // 커피 & 이미지 html 추가해주기
    var html = "";
    for(var n=0; n<drink_category.length; n++) {
		$("div.view_photo_drink").append("<div class='sub_title' id='sub_title_"+drink_category[n]+"'>"+ drink_category[n] + "</div>");  // 음료 카테고리를 보여주는 div 	
		$("div.view_photo_drink").append("<div class='grid_container' id='grid_"+drink_category[n]+"'>");									// 이미지들을 담을 grid 컨테이너 div
	    for(var i=0; i<arr_coffee_list.length; i++){
	    	if(arr_coffee_list[i].type == drink_category[n]) {
		        html += "<div id='"+arr_coffee_list[i].type+"' align='center'><div class='zoom'><img width='260px' heigh='270px' src='" + arr_coffee_list[i].filename +"'/></div>" + arr_coffee_list[i].name +"</div>";	    		
	    	}
	    }   
	    $("div#grid_"+drink_category[n]).append(html);
	    html = "";
	    $("div.view_photo_drink").append("</div>")
    }

    html = "";
    for(var n=0; n<foods_category.length; n++){
    	$("div.view_photo_food").append("<div class='sub_title' id='sub_title_"+foods_category[n]+"'>"+ foods_category[n] + "</div>");  // 음식 카테고리를 보여주는 div 	
		$("div.view_photo_food").append("<div class='grid_container' id='grid_"+foods_category[n]+"'>");									// 이미지들을 담을 grid 컨테이너 div
		for(var i=0; i<arr_food_list.length; i++){
	    	if(arr_food_list[i].type == foods_category[n]) {
		        html += "<div id='"+arr_food_list[i].type+"' align='center'><div class='zoom'><img width='260px' heigh='270px' src='" + arr_food_list[i].filename +"'/></div>" + arr_food_list[i].name +"</div>";	    		
	    	}
	    }  
		$("div#grid_"+foods_category[n]).append(html);
	    html = "";
	    $("div.view_photo_food").append("</div>")
	    $("div#grid_food_list").hide();
    } 

    
    
        
    
    // 처음 음료카테고리 버튼은 켜져있어야 함.
    $("button#coffee_category_btn").toggleClass("button_on");
    $("button#coffee_category_btn").prop("disabled", true);   // 어떤 버튼이 켜져있어야 하는지 알기 위해 눌러진 버튼에 disabled(비활성화)
    $("div.food_category").css('display', "none");   // 푸드 메뉴를 숨김

    
    // 카테고리 버튼이 클릭됐을 때 이벤트 
    $("button.category").click(function(event){   // 분류보기 탭을 클릭했을 때
        var $target = $(event.target);
        
        // 현재 선택된 분류보기 버튼이 클릭되었따면, 활성화시키고 초록색으로 바꾸자
        if(!$target.prop("disabled")) { 
            $target.toggleClass("button_on");
            
            $("button.category").prop("disabled", false);
            $("button.category").toggleClass("button_on")
            $target.prop("disabled", true);
            $target.toggleClass("button_on");
            // console.log("지금 누른 버튼은 활성화되있음");
            console.log("활성화된 아이디:"+$target.prop("id"));
        }

        
       
        // 미니카테고리 '사진으로보기', '영양정보로 보기' 클릭
        var selected_mini_category ="";
        $("button.view_list").each(function(){
            if(this.disabled) { // 미니카테고리 버튼이 활성화 상태라면
                selected_mini_category = this.id.substring(0, this.id.length - 4); //.btn 잘라버리고 앞의 글자만 데리고오겠다~ view_photo / view_nutrition
                console.log("미니카테고리 뭘로 체크되어있어? : "+selected_mini_category); // view_photo / view_nutrition
                return;
            }
        });
        
        $("div.product_view > div > div").each(function(){
            $(this).hide();   // grid_coffee_list / coffee_table / grid_food_list / food_table
            console.log("this가 뭐야:"+$(this).prop("id"));
        });
        
        if($target.prop("id") == "coffee_category_btn") { // 커피 버튼을 누르면
            $("div.food_category").css('display', "none"); // 음식 체크박스 숨기고
            $("div.coffee_category").css('display', "");    // 커피 체크박스 보여주기
            /* $("div#coffee > div."+selected_mini_category+"_drink").show();
            console.log($("으으으잉? div#coffee > div."+selected_mini_category).prop("id")); */
        } else { 	// 푸드 버튼을 누르면
            $("div.coffee_category").css('display', "none"); // 커피 체크박스 숨기고
            $("div.food_category").css('display', ""); // 음식 체크박스 보여줘
            /* $("div#food > div."+selected_mini_category+"_food").show();      
            console.log($("으잉? div#food > div."+selected_mini_category).prop("id")); */
        }
    });
 
    
    // 분류보기 음료 체크박스(전체 선택/해제)      
    $("input:checkbox[name=coffee_select]").click(function(){
        var isCoffeeAllBtn = $(this).prop("id") == "coffee_all";   // 현재 체크된 박스가 전체선택인지 확인하고 그 값을 저장
        
        if(isCoffeeAllBtn) { // 지금 선택된 체크박스 == 전체선택
	        var isBtnOn = $(this).prop("checked");
	        $("input:checkbox[name=coffee_select]").each(function(){
	            this.checked = false;
	        });
	            
	        if(isBtnOn) {   
	            $(this).prop("checked", true); // 그런데 name이 coffee_select인 체크박스에 전체선택도 포함되있으므로 한 번 더 참으로 바꿔줌         
	            $("div#grid_coffee_list").children().show() // 전체선택됐으면 내용 보여줘
	            $(".nutrition_list").hide()
	        } else {
	            $("div#grid_coffee_list").children().hide() // 전체선택 안됐으면 내용 숨겨줘
	        }
	            
        } else { // 지금 선택된 체크박스가 전체선택이 아니다. 개별 선택이다.
	        if($("input:checkbox[id=coffee_all]").prop("checked")) {
	            $("input:checkbox[id=coffee_all]").prop("checked", false);
	            $("div#grid_coffee_list").children().hide();
	        }
	        var filter_condition = $(this).prop("id");
	        //console.log("지금은 "+filter_condition+"체크박스가 선택됨 ");
	        console.log(selected + " 버튼 활성화된 상태로"); // view_photo / view_nutrition
	        if($(this).prop("checked")) { // 체크를 했다면
	        	//$("div#coffee").children().hide();
	        	console.log(this);
	            //$("div."+selected).show();
	            console.log(filter_condition+"체크함!");
	            $("div#sub_title_"+filter_condition).show();
	            $("div#grid_"+filter_condition).show();
	            console.log("아 내용 좀 보여줘"+filter_condition); 
	        } else {
	            console.log(filter_condition+"체크풀어버림 ");
	            $("div#sub_title_"+filter_condition).hide();
	            $("div#grid_"+filter_condition).hide();
	            console.log("아 내용 좀 숨겨줘"+filter_condition); 
	            
	        }
        }    
    });
        
    
    // 분류보기 음식 체크박스(전체 선택/해제)      
    $("input:checkbox[name=food_select]").click(function(){
        var isFoodAllBtn = $(this).prop("id") == "food_all";   // 현재 체크된 박스가 전체선택인지 확인하고 그 값을 저장
        
        if(isFoodAllBtn) { // 지금 선택된 체크박스 == 전체선택
	        var isBtnOn = $(this).prop("checked");
	        $("input:checkbox[name=food_select]").each(function(){
	            this.checked = false;
        	});
	        
	        if(isBtnOn) {   
	            $(this).prop("checked", true); // 그런데 name이 coffee_select인 체크박스에 전체선택도 포함되있으므로 한 번 더 참으로 바꿔줌         
	            $("div#grid_food_list").children().show()
	            $(".nutrition_list").hide()
	        } else {
	            $("div#grid_food_list").children().hide()
	        } 
        } else { // 지금 선택된 체크박스가 전체선택이 아니다.
	        if($("input:checkbox[id=food_all]").prop("checked")) {
	            $("input:checkbox[id=food_all]").prop("checked", false);
	            $("div#grid_food_list").children().hide();
	        }
	        var filter_condition = $(this).prop("id");
	        //console.log("지금은 "+filter_condition+"체크박스가 선택됨 ");
	        console.log(selected + " 버튼 활성화된 상태로"); // view_photo / view_nutrition
	        if($(this).prop("checked")) {
	        	//$("div#coffee").children().hide();
                console.log(this);
                //$("div."+selected).show();
                console.log(filter_condition+"체크함!");
                $("div#sub_title_"+filter_condition).show();
                $("div#grid_"+filter_condition).show();
                console.log("아 내용 좀 보여줘"+filter_condition);           
	        } else {
	        	console.log(filter_condition+"체크풀어버림 ");
	            $("div#sub_title_"+filter_condition).hide();
	            $("div#grid_"+filter_condition).hide();
	            console.log("아 내용 좀 숨겨줘"+filter_condition); 
	        }
        }    
    });


    
    // 처음 사진으로보기 카테고리 버튼은 켜져있어야 함.
    $("button#view_photo_btn").toggleClass("button_on_list");
    $("button#view_photo_btn").prop("disabled", true);   // 어떤 버튼이 켜져있어야 하는지 알기 위해 눌러진 버튼에 disabled(비활성화)
    $("div.nutrition_list").css('display', "none");   //  영양정보를 숨김

    // 작은 카테고리 버튼이 클릭됐을 때 이벤트 
    $("button.view_list").click(function(event){   // 작은카테고리 버튼을 클릭하면
        var $miniCategory = $(event.target);
        var selectedCategory = "";
        $(".category").each(function(){ // 큰 카테고리(분류보기)가 뭐야
	        //console.log(this);
	        if(this.disabled) {
	            selectedCategory = this.id;
	            //console.log("selectedCategory 가 뭐야 ?"+selectedCategory); // coffee_category_btn / food_category_btn
	            return;
	        }   
        });
        
        $miniCategory.prop("disabled", true); 
        $miniCategory.toggleClass("button_on_list"); 

        var miniCategory_id = $miniCategory.prop("id");
        var div_to_show = miniCategory_id.substring(0, miniCategory_id.length - 4);
        
        selected = div_to_show;
		//console.log("selected에 넣은 값 : " + div_to_show); // view_photo / view_nutrition
        
        if($miniCategory.prop("id") == "view_photo_btn") {
	        $("#view_nutrition_btn").prop("disabled", false);
	        $("#view_nutrition_btn").toggleClass("button_on_list");
	        console.log("사진으로보기 클릭");
        } else {
	        $("#view_photo_btn").prop("disabled", false);
	        $("#view_photo_btn").toggleClass("button_on_list");   
	        console.log("영양정보로보기 클릭");
        }
        
        $(".product_view > div > div").each(function(){
	        $(this).hide();   
	        //console.log($(this));
        }); 
        
        if(selectedCategory == "coffee_category_btn") { // 클릭한 작은 버튼이 커피버튼을 누르고 있다면
        	$("div#grid_view_container").css("display", "inline-block");
        	$("div#coffee > div." + div_to_show+"_drink").show();   
        	console.log("div_to_show 커피버튼의 작은버튼은 : "+div_to_show);
        } else {  // 클릭한 작은 버튼이 푸드버튼을 누르고 있다면
        	$("div#food > div." + div_to_show+"_food").show();   
        	console.log("div_to_show 음식버튼의 작은버튼은 : "+div_to_show);
        }
    }); 
}); // ----- end of $(document).ready(function(){} -----

</script>

</head>

<div id="container">

    <!-- 타이틀 -->
    <div class="title">
        <h1>음료/푸드</h1>
        <nav>
            <ul>
                <li><a href="#"><img src="/StarbucksWeb/images/bobae/home.jpg" alt="홈으로"/></a></li>
                <li>></li>
                <li><a href="#">MENU</a></li>
                <li>></li>
                <li><a href="#">음료</a></li>
            </ul>
        </nav>  
    </div>
    
    <!-- 음료/푸드 분류보기 -->
    <section class="product_group"> 
        <div class="group_sub_title">분류보기</div>
        <hr>
        <div class="product_category_set">
        <button class="category" id="coffee_category_btn" title="카테고리별 음료 선택">음료</button>
        <button class="category" id="food_category_btn" title="카테고리별 푸드 선택">푸드</button>
        <div class="product_select coffee_category">
            <input id="coffee_all" name="coffee_select" type="checkbox" checked><label for="coffee_all">전체상품보기</label>
            <input id="product_coldbrew" name="coffee_select" type="checkbox"><label for="product_coldbrew">콜드 브루 커피</label>
            <input id="product_brewed" name="coffee_select" type="checkbox"><label for="product_brewed">브루드 커피</label>
            <input id="product_espresso" name="coffee_select" type="checkbox"><label for="product_espresso">에스프레소</label>
            <input id="product_frappuccino" name="coffee_select" type="checkbox"><label for="product_frappuccino">프라푸치노</label>
            <input id="product_blended" name="coffee_select" type="checkbox"><label for="product_blended">블렌디드</label>
            <input id="product_fizzo" name="coffee_select" type="checkbox"><label for="product_fizzo">스타벅스 피지오</label>
            <input id="product_tea" name="coffee_select" type="checkbox"><label for="product_tea">티(티바나)</label>
            <input id="product_etc" name="coffee_select" type="checkbox"><label for="product_etc">기타 제조 음료</label>
            <input id="product_juice" name="coffee_select" type="checkbox"><label for="product_juice">스타벅스 주스(병음료)</label>                           
        </div>
        <div class="product_select food_category">
            <input id="food_all" name="food_select" type="checkbox" checked><label for="food_all">전체상품보기</label>
            <input id="product_bakery" name="food_select" type="checkbox"><label for="product_bakery">베이커리</label>
            <input id="product_cake" name="food_select" type="checkbox"><label for="product_cake">케이크</label>
            <input id="product_sandwitch" name="food_select" type="checkbox"><label for="product_sandwitch">샌드위치 &amp; 샐러드</label>
            <input id="product_warm" name="food_select" type="checkbox"><label for="product_warm">따뜻한 푸드</label>
            <input id="product_fruit" name="food_select" type="checkbox"><label for="product_fruit">과일 &amp; 요거트</label>               
        </div>
        </div>
    </section>
    
    <!-- 메뉴 리스트 -->
    <section class="product_menulist">
        <div class="product_view">
	        <button class="view_list" id="view_photo_btn">사진으로 보기</button>
	        <button class="view_list" id="view_nutrition_btn">영양정보로 보기</button>
	        
	        <div id="coffee">
	            <div class="view_photo_drink" id="grid_coffee_list"></div>
	            <div class="nutrition_list view_nutrition_drink" id="coffee_table">커피영양정보
	                <section>
		            <table>
		                <thead>
		                    <tr>
		                        <th>메뉴</th>
			                    <th>칼로리(Kcal)</th>
			                    <th>당류(g)</th>
			                    <th>단백질(g)</th>
			                    <th>나트륨(mg)</th>
			                    <th>포화지방(g)</th>
			                    <th>카페인(mg)</th>
		                    </tr>
		                </thead>
		                
		                <tbody>
		                    <tr>
			                    <td>아메리카노</td>
			                    <td>435</td>
			                    <td>37</td>
			                    <td>12</td>
			                    <td>114</td>
			                    <td>16</td>
			                    <td>15</td>
		                    </tr>
		                    <tr>
			                    <td>커피 어쩌거</td>
			                    <td>435</td>
			                    <td>37</td>
			                    <td>12</td>
			                    <td>114</td>
			                    <td>16</td>
			                    <td>15</td>
		                    </tr>
		                </tbody>
		            </table>
		            </section>
		        </div>
			</div>
			
	        <div id="food">
	            <div class="view_photo_food" id="grid_food_list"></div>
	            <div class="nutrition_list view_nutrition_food" id="food_table">푸드영양정보
	                <section>
			            <table>
			                <thead>
			                    <tr>
			                        <th>메뉴</th>
				                    <th>칼로리(Kcal)</th>
				                    <th>당류(g)</th>
				                    <th>단백질(g)</th>
				                    <th>나트륨(mg)</th>
				                    <th>포화지방(g)</th>
				                    <th>카페인(mg)</th>
			                    </tr>
			                </thead>
			                
			                <tbody>
			                    <tr>
				                    <td>케이크 어쩌거</td>
				                    <td>435</td>
				                    <td>37</td>
				                    <td>12</td>
				                    <td>114</td>
				                    <td>16</td>
				                    <td>15</td>
			                    </tr>
			                    <tr>
				                    <td>빵 어쩌거</td>
				                    <td>435</td>
				                    <td>37</td>
				                    <td>12</td>
				                    <td>114</td>
				                    <td>16</td>
				                    <td>15</td>
			                    </tr>
			                </tbody>
			            </table>
	        		</section>
		        </div>
	    	</div>
        </div>
    </section>
</div>   

<jsp:include page="../footer.jsp" />