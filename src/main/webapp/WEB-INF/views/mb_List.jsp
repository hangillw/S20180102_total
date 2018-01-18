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
	<h2>회원 목록</h2>
</center>	

	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<table>
		<tr>
			
			<th>아이디</th>
			<th>닉네임</th>
			<th>비밀번호</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>이름</th>
			<th>회원가입일</th>
			<th>포인트</th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td><a href="mb_info.do?memberId=${list.memberId}">${list.memberId }</a></td>
				<td>${list.nickName}</td>
				<td>${list.pw }</td>
				<td>${list.tel }</td>
				<td>${list.addr }</td>
				<td>${list.mname }</td>
				<td>${list.regidate }</td>
				<td>${list.mpoint }</td>
				<td>${list.authority }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="mb_List.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="mb_List.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="mb_List.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	
</section>
</body>
</html>