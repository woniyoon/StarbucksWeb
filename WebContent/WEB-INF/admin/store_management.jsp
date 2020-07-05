<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="head.jsp" %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
/* 	
	div#pageBar {
		text-align: center;
		
	} */

</style>

<article align="center">
	<br/>
	<h3>매장 목록</h3>
	<table align="center" class="admin_table" id="member_table">
		<tr>
<!-- 			<td class="" id="member_seq">전체선택<input type="checkbox" name="store"/></td> -->
			
			<%-- <th class="category" id="ranking">매출순위</th>
			<th class="category" id="store_sequence">매장시퀀스</th> --%>
			<th class="category" id="store_name">매장명</th>
			<th class="category" id="address">주소</th>
			<th class="category" id="url">URL</th>
			<th class="category" id="latitude">위도</th>
			<th class="category" id="longitude">경도</th>
			<th class="category" id="totalSales">매출액</th>
		</tr>
		

		<c:forEach var="store" items="${storeList}">
			<tr>
				<%--
				<td class="storeInfo" >매출순위</td>
				<td class="storeInfo" >${store.store_sequence}</td> --%>	
				<td class="storeInfo" >${store.store_name}</td>
				<td class="storeInfo" >${store.address}</td>
				<td class="storeInfo" >${store.url}</td>
				<td class="storeInfo" >${store.latitude}</td>
				<td class="storeInfo" >${store.longitude}</td>
				<td class="storeInfo">
				<fmt:formatNumber value="${store.income}" pattern="#,###" />
				</td>
				
			</tr>
		</c:forEach>	
			
	</table>
	
	</br></br>
		<div class="pagination" id="pageBar" align="center">
			${pageBar}
		</div>
	</br></br>
</article>
<%@ include file="tail.jsp" %>  