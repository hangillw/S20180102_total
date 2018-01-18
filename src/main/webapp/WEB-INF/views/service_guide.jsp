<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
		padding-left: 250px;
	}
</style>
</head>

<body>

<jsp:include page="guideBar.jsp"></jsp:include>
	<section class="body">
		<h2>상품 목록</h2>
		<a href="inGServForm.do?gno=${list[0].gno}">등록</a>
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<table>
			<tr>
			    <th>번호</th>
			    <th>상품번호</th>
			    <th>상품명</th>
			    <th>가격</th>
				<th>서비스시작일</th>
				<th>서비스종료일</th>
				<th>수정일자</th>
				<th>노출여부</th>
			</tr>
			<c:forEach var="gServ" items="${list }">
				<tr><td>${num }</td><td>${gServ.gservNo }</td>
					<td><a href="selGServForm.do?gservNo=${gServ.gservNo}">${gServ.gservTitle}</a></td>
					<td>${gServ.gservPrice }</td>
					<td>${gServ.gservSDate }</td>
					<td>${gServ.gservEDate}</td>
					<td>${gServ.gservFixDate }</td>
					<td>${gServ.gservLock}</td>
				</tr>
				<c:set var="num" value="${num - 1 }"></c:set>
			</c:forEach>
		</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="service_guide.do?currentPage=${pg.startPage-pg.pageBlock}&gno=${list[0].gno}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="service_guide.do?currentPage=${i}&gno=${list[0].gno}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="service_guide.do?currentPage=${pg.startPage+pg.pageBlock}&gno=${list[0].gno}">[다음]</a>
	</c:if>
	</section>
</body>
</html>