<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="head.jsp" %>  

<article>
	<h3>회원 목록</h3>
	<table class="admin_table" id="member_table">
		<tr>
			<td class="category" id="member_seq">회원번호 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="userid">아이디 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="name">이름 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="email">이메일 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="hp2">연락처 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="gender">성별 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="birthYYYY">생년월일 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="birthYYYY">나이 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="point">포인트 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="register_day">가입일자 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
			<td class="category" id="status">탈퇴유무 <img src="<%= ctxPath%>/images/common/filter_arrow.png" style="height: 1rem;"></td>
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

