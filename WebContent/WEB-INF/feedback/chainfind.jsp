<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">

.sto_find_head {
    height: 56px;
    background: #8c8279;
    position: relative;
}

.sto_find_head p.tit {
    font-size: 16px;
    color: #fff;
    padding: 20px 0 0 30px;
}

.sto_find_head p.close {
    position: absolute;
    right: 20px;
    top: 17px;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.sto_find_head p.close a {
    transition: transform 1s;
    width: 22px;
    height: 22px;
    display: block;
}

a {
    margin: 0;
    padding: 0;
    font-size: 100%;
    text-decoration: none;
    vertical-align: baseline;
    color: #666;
    background: transparent;
    cursor: pointer;
}

img {
    vertical-align: top;
    max-width: 100%;
}

.sto_find_cont {
    padding: 30px;
    background: #fff;
}

div {
    display: block;
}

dl.sto_find_tab {
    position: relative;
    width: 420px;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

dl.sto_find_tab > dt {
    margin-bottom: 20px;
}

dt {
    display: block;
}

dl.sto_find_tab > dt a.on {
    color: #fff;
    background: #006633;
}

dl.sto_find_tab > dt a {
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #444;
    display: block;
    font-size: 12px;
    height: 26px;
    line-height: 26px;
    text-align: center;
    width: 95px;
}

dd {
    display: block;
    margin-inline-start: 40px;
}

dl.sto_find_tab > dd div.doro_wrap {
    padding: 13px 20px;
    background: #f4f4f2;
    border-radius: 3px;
    margin-bottom: 20px;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

div.doro_wrap ul li {
    margin-bottom: 10px;
    width: 100%;
}

nav ul, li {
    list-style: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}


div.doro_wrap ul li:after {
    content: "";
    display: block;
    clear: both;
}

div.doro_wrap label.lab {
    width: 62px;
}

div.doro_wrap label {
    font-size: 12px;
    color: #222;
    float: left;
    height: 28px;
    line-height: 28px;
}

label {
    cursor: default;
}

.sto_find_pop div.select_box01 {
    background: #fff url(../img/coffee/select_arrow.png) no-repeat 94% center;
    width: 315px;
}

.sto_find_pop div.select_box {
    float: left;
    height: 26px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

div.select_box01 {
    width: 82px;
    background: #ffffff url(../img/coffee/select_arrow.png) no-repeat 64px center;
}

div.select_box {
    background: url(../img/coffee/select_arrow.png) 98% center no-repeat #fff;
    height: 28px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

div.select_box {
    height: 28px;
    border: 1px solid #ddd;
    border-radius: 3px;
    position: relative;
}

.sto_find_pop div.select_box span.value {
    display: block;
    margin: 0 10px 0 10px;
    text-align: left;
    height: 26px;
    line-height: 26px;
    text-indent: 4px;
    font-size: 12px;
    color: #666;
    font-family: "nbg";
    overflow: hidden;
}

.sto_find_pop div.select_box01 select, .sto_find_pop div.select_box02 select {
    width: 100%;
}

.sto_find_pop div.select_box select {
    padding: 0 10px 0 10px;
    position: absolute;
    left: 0;
    top: 0px;
    height: 26px;
    text-align: left;
    line-height: 26px;
    font-size: 12px;
    color: #666;
    border: 0;
    background: #fff;
    font-family: "nbg";
    filter: alpha(opacity=0);
    opacity: 0;
    z-index: 20;
}

div.doro_wrap ul li {
    margin-bottom: 10px;
    width: 100%;
}

div.doro_wrap label.lab {
    width: 62px;
}

div.doro_wrap label {
    font-size: 12px;
    color: #222;
    float: left;
    height: 28px;
    line-height: 28px;
}

.sto_find_pop div.select_box01 {
    background: #fff url(../img/coffee/select_arrow.png) no-repeat 94% center;
    width: 315px;
}

.sto_find_pop div.select_box {
    float: left;
    height: 26px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.sto_find_pop div.select_box span.value {
    display: block;
    margin: 0 10px 0 10px;
    text-align: left;
    height: 26px;
    line-height: 26px;
    text-indent: 4px;
    font-size: 12px;
    color: #666;
    font-family: "nbg";
    overflow: hidden;
}

.sto_find_pop div.select_box01 select, .sto_find_pop div.select_box02 select {
    width: 100%;
}

.sto_find_pop div.select_box select {
    padding: 0 10px 0 10px;
    position: absolute;
    left: 0;
    top: 0px;
    height: 26px;
    text-align: left;
    line-height: 26px;
    font-size: 12px;
    color: #666;
    border: 0;
    background: #fff;
    font-family: "nbg";
    filter: alpha(opacity=0);
    opacity: 0;
    z-index: 20;
}

option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}





</style>

</head>
<body>

	<div class="sto_find_pop" style="top: 150px; display: block;">
								
								<div class="sto_find_cont">
									<dl class="sto_find_tab">
										<dt class="dt1"><a href="javascript:void(0)" class="on">주소로 찾기</a></dt><dt class="dt2"><a href="javascript:void(0)">매장명으로 찾기</a></dt>
										<dd class="on" style="display: block;">
											<div class="doro_wrap">
												<ul>
													<li>
														<label class="lab" for="find_sigu">시/도</label>
														<div class="select_box select_box01">
															<span class="value">시/도</span>
															<select id="store_sido" name="store_sido" onchange="$voc.gunList(this.value)">
																<option onchange="$voc.gunList(this.value)" value="" selected="selected">시/도</option>
																<option value="01">서울</option><option value="02">광주</option><option value="03">대구</option><option value="04">대전</option><option value="05">부산</option><option value="06">울산</option><option value="07">인천</option><option value="08">경기</option><option value="09">강원</option><option value="10">경남</option><option value="11">경북</option><option value="12">전남</option><option value="13">전북</option><option value="14">충남</option><option value="15">충북</option><option value="16">제주</option><option value="17">세종</option>
															</select>
														</div>
													</li>
													<li>
														<label class="lab" for="gugun">시/군/구</label>
														<div class="select_box select_box01">
															<span class="value" id="guNm">구/군</span>
															<select id="gugun" name="store_gugun" onchange="$voc.storeList(this.value, this.id)">
																<option selected="selected">구/군</option>
															</select>
														</div>
													</li>
												</ul>
											</div>
											<strong class="result_with resultNm">지역을 선택해주세요.</strong>
											<!-- 검색결과 있는 경우 -->
											<!-- <p class="have_result_with select_with" style="display:none;">아래 목록에서 해당하는 도로명을 선택하세요.<br>다른 매장명으로 검색을 하려면 다시 입력한 후 검색버튼을 눌러주세요.</p> -->
											<div class="have_result_list select_list mCustomScrollbar _mCS_1 mCS_no_scrollbar" style="display: none; height: auto;"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
												<ul id="storeList">
													<li></li>
												</ul>
											</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 33px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 33px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
											<!-- 검색결과 있는 경우 end -->
											<!-- 검색결과 없는 경우 -->
											<p class="no_result_with no_select_with" style="display:none;">해당 지역으로 검색한 결과가 없습니다.<br>다른 지역으로 검색하려면 다시 선택 해 주세요.</p>
											<!-- 검색결과 없는 경우 end -->
											<div class="btn_stopop_close_wrap">
												<a href="javascript:void(0);" id="btnCloseStore">닫기</a>
											</div>
										</dd>
										
										<dd style="display: none;">
											<div class="doro_wrap">
												<ul>
													<li class="last">
														<label class="lab" for="find_gm_name">매장명</label>
														<input class="bar2" type="text" name="find_gm_name2" id="find_gm_name2">
														<p class="btn_search" style="display: block;"><a href="javascript:void(0);" id="searchNm" onclick="$voc.storeList('', this.id)">검색</a></p>
													</li>
												</ul>
											</div>
											<strong class="result_with searchNm">매장명을 입력해주세요.</strong>
											<!-- 검색결과 있는 경우 -->
											<p class="have_result_with search_with" style="display:none;">아래 목록에서 해당하는 도로명을 선택하세요.<br>다른 매장명으로 검색을 하려면 다시 입력한 후 검색버튼을 눌러주세요.</p>
											<div class="have_result_list search_list mCustomScrollbar _mCS_2 mCS_no_scrollbar" style="display: none; height: auto;"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
												<ul id="searchStoreList">
													<li></li>
												</ul>
											</div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 33px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 33px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
											<!-- 검색결과 있는 경우 end -->
											<!-- 검색결과 없는 경우 -->
											<p class="no_result_with search_no_with" style="display:none;">해당 매장으로 검색한 결과가 없습니다.<br>다른 매장명으로 검색을 하려면 다시 입력한 후 검색버튼을 눌러주세요.</p>
											<!-- 검색결과 없는 경우 end -->
											<div class="btn_stopop_close_wrap">
												<a href="javascript:void(0);" id="btnCloseStore">닫기</a>
											</div>
										</dd>
									</dl>
								</div>
							</div>


</body>
</html>