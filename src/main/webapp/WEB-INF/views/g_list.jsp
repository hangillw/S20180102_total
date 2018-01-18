<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
		padding-left:250px;
	}
</style>
</head>
<body>
<jsp:include page="managerBar.jsp"></jsp:include>
<section class="body">
	<center>
	<h2>가이드 목록</h2>
	</center>	

	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<table>
		<tr>
			<th>아이디</th>
			<th>가이드번호</th>
			<th>가이드 전화번호</th>
			<th>카카오ID</th>
			<th>가이드생성일자</th>
			<th>등급</th>
			<th>총매출</th>
		</tr>
		<c:forEach var="list" items="${g_list }">
			<tr>
				<td><a href="g_info.do?memberId=${list.memberId}">${list.memberId }</a></td>
				<td>${list.gno}</td>
				<td>${list.gtel }</td>
				<td>${list.kakaoId }</td>
				<td>${list.gcredate }</td>
				<td>${list.ggrade }</td>
				<td>${list.totalCost }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="gd_manager.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="gd_manager.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="gd_manager.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	
</section>
</body>
</html>