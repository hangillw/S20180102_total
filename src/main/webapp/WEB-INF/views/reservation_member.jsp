<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html>
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
<script type="text/javascript">
	function chk() {
		if(confirm("정말 예약을 삭제하시겠습니까?")){
			return true;
		}
		else {return false;}	
	}
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>

<section class="body">
<h2>나의 예약 현황</h2>

<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
<table>
	<tr><th>주문번호</th>
		<th>예약상품</th>
		<th>예약인원</th>
		<th>예약일자</th>
		<th>투어일자</th>
		<th>총가격</th>
		<th>확정여부</th>
		<th>결제</th>
		<th>예약수정</th>
		<th>예약취소</th>
	</tr>
	<c:if test="${total > 0 }">
		<c:forEach var="list" items="${list }">
			<form action="delResvPro.do" onsubmit="return chk()">
			<input type="hidden" name="payCode" value='<c:out value="${list.payCode }"/>'>
				<tr>
					<td>${list.payCode }</td>
					<td><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></td>
					<td>${list.reMemSize }</td>
					<td>${list.reservDate }</td>
					<td>${list.tourDate }</td>
					<td><fmt:formatNumber value = "${list.amount }" type="currency" currencySymbol="￦"/></td>
					<td>${list.confirm }</td>
					<td><input type="button" value="결제" onclick="location.href='inPayForm.do?payCode=${list.payCode}'"></td>
					<td><input type="button" value="예약수정" onclick="location.href='upResvForm.do?payCode=${list.payCode}'"></td>
					<td>
							<input type="submit" value="예약취소">
					</td>
					</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
			</form>
		</c:forEach>
	</c:if>
	<c:if test="${total ==0 }">
			<tr>
				<td colspan=6>예약한 상품이 없습니다 :-)</td>
			</tr>
		</c:if>
</table>

<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="reservation_member.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="reservation_member.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="reservation_member.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>

</section>
</body>
</html>