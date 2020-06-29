<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<style type="text/css">

	/* 전체 */
	#menu_container {
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
		
	/* 버튼에 마우스 올리면 손가락 모양+밑줄없애기 */
	 a, .category, .zoom img {
		text-decoration: none;
	    cursor: pointer;
	}
	
	/* 버튼에 마우스 올리면 밑줄 */
	.category:hover, a.view_list:hover, .title>nav>ul>li>a:hover {
		text-decoration: underline;
	}
	
	/* 카테고리 버튼 */
	#category_btn_container {
		display: flex;
		flex-direction: row;
		height: 80px;
		align-items: center;
	}
	
	/* 버튼 클릭 안됐을 때 */
 	.button_off {
 		display: flex;
	    width: 200px;
	    height: 35px;
 	    margin: 0 8px 0 0;
 	    border: 1px solid grey
	    border-radius: 5px;
	    align-items: center;
  		justify-content: center;
	    text-align: center;
		background-color: #f4f4f1;
   		color: #222;
	}
	
 	/* 버튼 클릭 됐을 때 */
	.button_on {
		display: flex;
	    width: 200px;
	    height: 35px;
 	    margin: 0 8px 0 0;
	    border-radius: 3px;
	    align-items: center;
  		justify-content: center;
	    text-align: center;
		background-color: #006633;
    	color: #fff;	
	} 
	
	/* 작은버튼 클릭 안됐을 때 */
	.button_off_mini {
	    display: inline-block;
	    height: 26px;
	    margin: 30px 10px 10px 0px;
   	    padding: 0 10px;
	    line-height: 26px;
	    font-size: 12px;
	    border-radius: 3px;
	    border: 1px solid #ddd;
	    background-color: #fff;
	    color: #666;
	}
	
	/* 작은버튼 클릭 됐을 때 */
	.button_on_mini {
	    display: inline-block;
	    height: 26px;
	    margin: 30px 10px 10px 0px;
   	    padding: 0 10px;
	    line-height: 26px;
	    font-size: 12px;
	    border-radius: 3px;
	    border: 1px solid #ddd;
	    background-color: #666;
	    color: #fff;
	}
	

	
	div.grid_container {
	    display: grid;
	    grid-row-gap: 50px;
	    grid-template-columns: 25% 25% 25% 25%;
	    margin-bottom: 50px;
	    padding: 10px;
	}
	    
	/* 메뉴 리스트 */
	a.button_on_list {
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

$(window).ready(function(){
  
	// 음료 카테고리 버튼 눌렀을 때
    $("#coffee_category_btn").click(function(){
    	
    	// 큰버튼 색깔 바꾸기
    	$("#category_btn_container > a").removeClass();
        $(this).addClass("button_on");
        $("#food_category_btn").addClass("button_off");
        
		$("#coffee").show();
		$("#food").hide();
		$(".coffee_category").show();
		$(".food_category").hide();
		
		// 음료 카테고리 내 작은 버튼 눌렀을 때
		$("#category_btn_container_mini").click(function(event){
			
			// 작은버튼 색깔 바꾸기
 	    	$("#category_btn_container_mini > a").removeClass();
	 		$("#view_photo_btn").addClass("button_on_mini");
			$("#view_nutrition_btn").addClass("button_off_mini"); 
			
			var $target = $(event.target);
			if ($target.prop("id")=="view_photo_btn"){
				$("#grid_coffee_list").show();
				$("#coffee_table").hide();	
			} else {
				$("#coffee_table").show();
				$("#grid_coffee_list").hide();	
			}
		});
    }); 
    $("#coffee_category_btn").trigger("click");
    
    $("#view_photo_btn").click(function(){
    	$("#grid_coffee_list").show();
		$("#coffee_table").hide();	
    });
    
    $("#view_photo_btn").trigger("click");
    
    /////////////////////////////////////////////////////////////////////////////////////
    
    
 	// 푸드 카테고리 버튼 눌렀을 때
    $("#food_category_btn").click(function(){
    	
    	// 큰버튼 색깔 바꾸기
		$("#category_btn_container > a").removeClass();
	    $(this).addClass("button_on");
	    $("#coffee_category_btn").addClass("button_off");

		$("#food").show();
		$("#coffee").hide();
		$(".food_category").show();
		$(".coffee_category").hide();
		
		// 푸드 카테고리 내 작은 버튼 눌렀을 때
		$("#category_btn_container_mini").click(function(event){

			// 작은버튼 색깔 바꾸기
 	    	$("#category_btn_container_mini > a").removeClass();
	 		$("#view_photo_btn").addClass("button_on_mini");
			$("#view_nutrition_btn").addClass("button_off_mini"); 
				
			var $target = $(event.target);
			if ($target.prop("id")=="view_photo_btn"){
				$("#grid_food_list").show();
				$("#food_table").hide();	
				console.log("푸드 사진보기");
			} else {
				$("#food_table").show();
				$("#grid_food_list").hide();	
				console.log("푸드 영양정보");
			}
		});
    }); 
    
    $("#view_photo_btn").click(function(){
    	$("#grid_food_list").show();
		$("#food_table").hide();	
    });
    
    $("#view_photo_btn").trigger("click");
    
  
    // 분류보기 음료 체크박스(전체 선택/해제)      
    $("input:checkbox[name=coffee_select]").click(function(){
        var isCoffeeAllBtn = $(this).prop("id") == "coffee_all";   // 현재 체크된 박스가 전체선택인지 확인하고 그 값을 저장
        
        if(isCoffeeAllBtn) { // 지금 선택된 체크박스 == 전체선택
	        var isBtnOn = $(this).prop("checked");
	        $("input:checkbox[name=coffee_select]").each(function(){
	            this.checked = false;
	        });
	            
	       if(isBtnOn) { // 전체선택됐다면  
	            $(this).prop("checked", true); // 그런데 name이 coffee_select인 체크박스에 전체선택도 포함되있으므로 한 번 더 참으로 바꿔줌 체크박스 체크해라!      
	            $("div#grid_coffee_list").children().children().show(); // 전체선택됐으면 내용 보여줘
	            $(".nutrition_list").hide();
	        } else {
	            $("div#grid_coffee_list").children().children().hide(); // 전체선택 안됐으면 내용 숨겨줘
	        }
	            
        } else { // 지금 선택된 체크박스가 전체선택이 아니다. 개별 선택이다.
	        if($("input:checkbox[id=coffee_all]").prop("checked")) {
	            $("input:checkbox[id=coffee_all]").prop("checked", false);
	        }
	        $("div.grid_container").children().hide();
	        $("input:checkbox[name=coffee_select]").each(function(){
	        	if($(this).prop("checked")) { // 개별 체크를 했다면
	        		$("div#"+this.id).show();
	        	} else {
	        		$("div#"+this.id).hide();
	        	}
	        })
        }    
    });
    
    // 분류보기 푸드 체크박스(전체 선택/해제)      
    $("input:checkbox[name=food_select]").click(function(){
        var isFoodAllBtn = $(this).prop("id") == "food_all";   // 현재 체크된 박스가 전체선택인지 확인하고 그 값을 저장
        
        if(isFoodAllBtn) { // 지금 선택된 체크박스 == 전체선택
	        var isBtnOn = $(this).prop("checked");
	        $("input:checkbox[name=food_select]").each(function(){
	            this.checked = false;
	        });
	            
	        if(isBtnOn) { // 전체선택됐다면  
	            $(this).prop("checked", true); // 그런데 name이 coffee_select인 체크박스에 전체선택도 포함되있으므로 한 번 더 참으로 바꿔줌 체크박스 체크해라!      
	            $("div#grid_food_list").children().children().show(); // 전체선택됐으면 내용 보여줘
	            $(".nutrition_list").hide();
	        } else {
	            $("div#grid_food_list").children().children().hide(); // 전체선택 안됐으면 내용 숨겨줘
	        }
	            
        } else { // 지금 선택된 체크박스가 전체선택이 아니다. 개별 선택이다.
	        if($("input:checkbox[id=food_all]").prop("checked")) {
	            $("input:checkbox[id=food_all]").prop("checked", false);
	        }
	        $("div.grid_container").children().hide();
	        $("input:checkbox[name=food_select]").each(function(){
	        	if($(this).prop("checked")) { // 개별 체크를 했다면
	        		$("div#"+this.id).show();
	        	} else {
	        		$("div#"+this.id).hide();
	        	}
	        })
        }    
    });
}); // ----- end of $(document).ready(function(){} -----

</script>

</head>

<div id="menu_container">

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
        <div class="group_sub_title"><b>분류보기</b></div>
        <hr>
        <div>
        <div id="category_btn_container">
	        <a href="#" class="button_on" id="coffee_category_btn" role="button" title="카테고리별 음료 선택">음료</a>
	        <a href="#" class="button_off" id="food_category_btn" role="button" title="카테고리별 푸드 선택">푸드</a>
        </div>
        <div class="product_select coffee_category">
            <input id="coffee_all" name="coffee_select" type="checkbox" checked required><label for="coffee_all">전체상품보기</label>
            <input id="d_cb" name="coffee_select" type="checkbox"><label for="d_cb">콜드 브루 커피</label>
            <input id="d_br" name="coffee_select" type="checkbox"><label for="d_br">브루드 커피</label>
            <input id="d_es" name="coffee_select" type="checkbox"><label for="d_es">에스프레소</label>
            <input id="d_fp" name="coffee_select" type="checkbox"><label for="d_fp">프라푸치노</label>
            <input id="d_bl" name="coffee_select" type="checkbox"><label for="d_bl">블렌디드</label>
            <input id="d_te" name="coffee_select" type="checkbox"><label for="d_te">티(티바나)</label>
            <input id="d_nc" name="coffee_select" type="checkbox"><label for="d_nc">기타 제조 음료</label>
        </div>
        <div class="product_select food_category">
            <input id="food_all" name="food_select" type="checkbox" checked><label for="food_all">전체상품보기</label>
            <input id="f_bk" name="food_select" type="checkbox"><label for="f_bk">베이커리</label>
            <input id="f_ca" name="food_select" type="checkbox"><label for="f_ca">케이크</label>
            <input id="f_ss" name="food_select" type="checkbox"><label for="f_ss">샌드위치 &amp; 샐러드</label>
            <input id="f_wf" name="food_select" type="checkbox"><label for="f_wf">따뜻한 푸드</label>
            <input id="f_fy" name="food_select" type="checkbox"><label for="f_fy">과일 &amp; 요거트</label>               
        </div>
        </div>
    </section>
    
    <!-- 메뉴 리스트 -->
    <section class="product_menulist">
        <div class="product_view">
        
  			<div id="category_btn_container_mini">
		        <a href="#" class="button_on_mini" id="view_photo_btn" role="button">사진으로 보기</a>
		        <a href="#" class="button_off_mini" id="view_nutrition_btn" role="button">영양정보로 보기</a>
	        </div>
	        
	        <div id="coffee">
	            <div class="view_photo_drink" id="grid_coffee_list">
	            	<c:if test="${not empty productList}">
	            		<div class="grid_container">
		            		<c:forEach var="prod" items="${productList}" varStatus="status">
		            			<c:if test="${prod.parentTable eq 'drink'}">
		    						<div id="${prod.categoryID}" align='center'><div class='zoom'><a href='/StarbucksWeb/product/detail.sb?productId=${prod.productId}'><img width='260px' height='270px' src="/StarbucksWeb/images/products/${prod.img} " /></a></div>${prod.name}</div>	    				            			
		            			</c:if>
		            		</c:forEach>
	            		</div>
	            	</c:if>
	            </div>
	            <div class="nutrition_list view_nutrition_drink" id="coffee_table">
	                <section>
		            <table>
<%--          	        <c:if test="${not empty nutritionList}"> --%>
		            	<c:if test="${not empty productList}">
			                <thead>
			                    <tr>
			                        <th>메뉴</th>
				                    <th>칼로리(Kcal)</th>
				                    <th>당류(g)</th>
				                    <th>단백질(g)</th>
				                    <th>나트륨(mg)</th>
				                    <th>포화지방(g)</th>
			                    </tr>
			                </thead>
		                
		                	<c:forEach var="prod" items="${productList}" varStatus="status">
		                	 	<c:if test="${prod.parentTable eq 'drink'}">
					                <tbody>
					                    <tr>
						                    <td>${prod.name}</td>
						                    <td>${prod.nutrition.kcal}</td>
						                    <td>${prod.nutrition.sugar}</td>
						                    <td>${prod.nutrition.protein}</td>
						                    <td>${prod.nutrition.sodium}</td>
						                    <td>${prod.nutrition.cholesterol}</td>
					                    </tr>
					                </tbody>
					            </c:if>
				            </c:forEach>
				                
		                </c:if>
		            </table>
		            </section>
		        </div> 	
         </div>
         <!-- coffee end -->
        
         <div id="food">
	            <div class="view_photo_food" id="grid_food_list">
	           		<c:if test="${not empty productList}">
	            		<div class="grid_container">
		            		<c:forEach var="prod" items="${productList}" varStatus="status">
		            			<c:if test="${prod.parentTable eq 'food'}">
	    							<div id="${prod.categoryID}" align='center'><div class='zoom'><a href='/StarbucksWeb/product/detail.sb?productId=${prod.productId}'><img width='260px' height='270px' src="/StarbucksWeb/images/products/${prod.img}" /></a></div>${prod.name}</div>	    		
		            			</c:if>
		            		</c:forEach>
	            		</div>
	            	</c:if>
	            </div>
	            <div class="nutrition_list view_nutrition_food" id="food_table">
	                <section>
			            <table>
	<%--          	        <c:if test="${not empty nutritionList}"> --%>
			            	<c:if test="${not empty productList}">
				                <thead>
				                    <tr>
				                        <th>메뉴</th>
					                    <th>칼로리(Kcal)</th>
					                    <th>당류(g)</th>
					                    <th>단백질(g)</th>
					                    <th>나트륨(mg)</th>
					                    <th>포화지방(g)</th>
				                    </tr>
				                </thead>
			                
			                	<c:forEach var="prod" items="${productList}" varStatus="status">
			                	 	<c:if test="${prod.parentTable eq 'food'}">
						                <tbody>
						                    <tr>
							                    <td>${prod.name}</td>
							                    <td>${prod.nutrition.kcal}</td>
							                    <td>${prod.nutrition.sugar}</td>
							                    <td>${prod.nutrition.protein}</td>
							                    <td>${prod.nutrition.sodium}</td>
							                    <td>${prod.nutrition.cholesterol}</td>
						                    </tr>
						                </tbody>
						            </c:if>
					            </c:forEach>
					                
			                </c:if>
		            	</table>
		            
	        		</section>
		        </div>
	    	</div>
	    	<!-- coffee end -->
        </div>
    </section>
</div>   

<jsp:include page="../footer.jsp" />