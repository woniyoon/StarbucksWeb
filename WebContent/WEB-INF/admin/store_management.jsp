<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="head.jsp" %>  

<article>
	<h3>매장 목록</h3>
	<table align="center" class="admin_table" id="member_table">
		<tr>
<!-- 			<td class="" id="member_seq">전체선택<input type="checkbox" name="store"/></td> -->
			<td class="category" id="">매출순위</td>
			<td class="category" id="store_name">지점명</td>
			<td class="category" id="email">주소</td>
			<td class="category" id="email"><button>매출액</button></td>
		</tr>
	</table>
</article>
<%@ include file="tail.jsp" %>  