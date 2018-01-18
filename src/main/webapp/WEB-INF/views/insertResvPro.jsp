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
	<h1>[ ${tcDto.gservTitle } ] 예약 정보 </h1>
	<table>
		<tr><td><img src="${tcDto.imgSrc }" alt="상품이미지"></td></tr>
		<tr><td>상품명</td></tr>
		<tr><td>${tcDto.gservTitle }</td></tr>
		<tr><td>${tcDto.nickName }</td></tr>
	</table>
	<table>
		<tr>
			<td>예약자 EMAIL(ID)</td>
			<td>${resvDto.memberId }</td>
		</tr>
		<tr>
			<td>예약 번호</td>
			<td>${resvDto.payCode }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${tcDto.gservTitle }</td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td>${resvDto.reMemSize }</td>
		</tr>
		<tr>
			<td>투어예정일</td>
			<td>${resvDto.tourDate }</td>
		</tr>
		<tr>
			<td>총 가격</td>
			<td><fmt:formatNumber value = "${tcDto.gservPrice*resvDto.reMemSize }" type="currency" currencySymbol="\\"/></td>
		</tr>
		<tr>
			<td>확정여부</td>
			<td>${resvDto.confirm }</td>
		</tr>
	</table>
	<div>
			<input type="button" value="결제하기" onclick="location.href='selPayForm.do?payCode=${resvDto.payCode }'">
			<input type="button" value="MyPage" onclick="location.href='reservation_member.do'">
			<input type="button" value="HOME" onclick="location.href='main.do'">
	</div>
</form>
</body>
</html>