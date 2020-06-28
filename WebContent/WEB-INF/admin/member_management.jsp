<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="head.jsp" %>  

<article>
	<table id="member_table">
		<tr>
			<td class="category" id="member_seq">회원번호</td>
			<td class="category" id="userid">아이디</td>
			<td class="category" id="name">이름</td>
			<td class="category" id="email">이메일</td>
			<td class="category" id="hp2">연락처</td>
			<td class="category" id="gender">성별</td>
			<td class="category" id="birthYYYY">생년월일</td>
			<td class="category" id="birthYYYY">나이</td>
			<td class="category" id="point">포인트</td>
			<td class="category" id="register_day">가입일자</td>
			<td class="category" id="status">탈퇴유무</td>
		</tr>
		<tbody id="member_tb">
		
		</tbody>
<%-- 		<c:forEach var="mem" items="${memberList}" varStatus="status">
			<tr>
				<td>${mem.member_seq }</td>
				<td>${mem.userid }</td>
				<td>${mem.name }</td>
				<td>${mem.email }</td>
				<td>${mem.hp1}-${mem.hp2}-${mem.hp3}</td>
				<td>${mem.gender }</td>
				<td>${mem.birthyyyy}/${mem.birthmm}/${mem.birthdd}</td>
				<td>30</td>
				<td>${mem.point }</td>
				<td>${mem.registerday }</td>
				<c:choose>
					<c:when test="${mem.status } == 1">
						<td>회원</td>				
					</c:when>
					<c:otherwise>
						<td>탈퇴</td>				
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach> --%>
	</table>
</article>
<%@ include file="tail.jsp" %>  
<script type="text/javascript" src="/StarbucksWeb/js/member_management.js"></script>

