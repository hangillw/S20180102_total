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
<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">
	<h2>정산</h2>
	<form action="pay_guidePro.do">
	<input type="hidden" name="gno" value="${gDto.gno }">
	<input type="hidden" name="totalCost" value="${gDto.totalCost }">
	정산 가능 금액 : ${gDto.totalCost }<input type="number" name="cost" min="1000" max="${gDto.totalCost }"><p>
	연락처 : <input type="text" value="${gDto.gtel }"><p>
	계좌번호 : <input type="text" value="${gDto.gaccount }"><p>
	<input type="submit" value="확인">
	</form>
</section>
</body>
</html>