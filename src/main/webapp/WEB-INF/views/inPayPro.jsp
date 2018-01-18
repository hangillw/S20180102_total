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
	}	
</style>
</head>
<body>
	<h1>결제가 완료되었습니다.</h1>
	
	<table>
	<caption>결제 정보</caption>
		<tr>
			<td>결제자 EMAIL(ID)</td>
			<td>${pDto.memberId }</td>
		</tr>
		<tr>
			<td>결제 코드</td>
			<td>${pDto.payCode }</td>
		</tr>
		<c:if test="${approvNum !=null }">
			<tr>		
				<td>카드 승인 코드</td>
				<td>${approvNum }</td>
			</tr>
		</c:if>
		<tr>
			<td>결제 금액</td>
			<td><fmt:formatNumber value = "${pDto.amount }" type="currency" currencySymbol="\\"/></td>
		</tr>
		<tr>
			<td>결제 방법</td>
			<td>${pDto.pay_method }</td>
		</tr>
	</table>
	<div>
			<input type="button" value="결제내역" onclick="location.href='pay_member.do'">
			<input type="button" value="HOME" onclick="location.href='main.do'">
	</div>
</body>
</html>