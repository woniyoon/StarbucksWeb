<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="head.jsp" %>  

<article>
	<table>
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>연락처</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>나이</td>
			<td>포인트</td>
			<td>가입일자</td>
			<td>탈퇴유무</td>
		</tr>
		<c:forEach var="mem" items="${memberList}" varStatus="status">
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
		</c:forEach>
	</table>
</article>
<%@ include file="tail.jsp" %>  

