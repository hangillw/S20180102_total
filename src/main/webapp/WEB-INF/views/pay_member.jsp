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
<jsp:include page="memberBar.jsp"></jsp:include>
<section class="body">
<h2>나의 결제 내역</h2>

<table>
		
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>투어일자</th>
			<th>결제금액</th>
			<th>주문상태</th>
		</tr>
		<c:if test="${total > 0 }">
			<c:forEach var="list" items="${payList}">
				<tr>
					<td>${list.payCode }</td>
					<td><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></td>
					<td>${list.tourDate }</td>
					<td><fmt:formatNumber value = "${list.amount }" type="currency" currencySymbol="￦"/></td>
					<td>결제완료(${list.pay_method })</td>
				</tr>
				<c:set var="startNum" value="${startNum -1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${total ==0 }">
			<tr>
				<td colspan=6>결제한 상품이 없습니다 :-)</td>
			</tr>
		</c:if>
	</table>

<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="pay_member.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="pay_member.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="pay_member.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if> 

</section>
</body>
</html>