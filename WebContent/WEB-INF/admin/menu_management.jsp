<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="head.jsp" %>  
<script type="text/javascript" src="/StarbucksWeb/js/menu_management.js"></script>

<article align="center">
	<h3>메뉴 목록<span> (</span><span id="num_of_items"></span>개)</h3>
	<table align="center" class="admin_table">
		<tr>
			<td id="option_td">
				<select name="category" onchange="getMenuList(1)">
				    <option value="drink" selected>음료</option>
				    <option value="food">푸드</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="menu_content_td">번호</td>
<!-- 			<td class="menu_content_td">종류</td> -->
			<td class="menu_content_td">카테고리</td>
			<td class="menu_content_td">이름</td>
			<td class="menu_content_td">설명</td>
			<td class="menu_content_td">가격</td>
		</tr>
 		<tbody id="drink_tbody">
		
		</tbody>
<%-- 		<c:forEach var="pvo" items="${productList}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${pvo.parentTable }</td>
				<td>${pvo.categoryName}</td>
				<td>${pvo.name }</td>
				<td>${pvo.description}</td>
				<td>${pvo.price }</td>
			</tr>
		</c:forEach> --%>
	</table>
 	<div id="paging_container" align="center">
		${pageBar}
	</div>
</article>
<%@ include file="tail.jsp" %>  
<script type="text/javascript" src="/StarbucksWeb/js/member_management.js"></script>

