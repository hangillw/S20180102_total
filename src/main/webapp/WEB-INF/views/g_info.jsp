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
	<center>
	<h2>가이드 정보</h2>
</center>	

	
	<table>
		<tr>
			
			<th>가이드아이디</th>
			<th>가이드번호</th>
			<th>가이드사진</th>
			<th>전화번호</th>
			<th>카카오ID</th>
			<th>가이드info</th>
			<th>가이드가입일</th>
			<th>계좌정보</th>
			<th>가이드 등급</th>
			<th>총매출</th>
		</tr>
	
			<tr>
				<td>${g_dto.memberId }</td>
				<td>${g_dto.gNo}</td>
				<td>${g_dto.gImg }</td>
				<td>${g_dto.gTel }</td>
				<td>${g_dto.kakaoId }</td>
				<td>${g_dto.gInfo }</td>
				<td>${g_dto.gCredate }</td>
				<td>${g_dto.gAccount }</td>
				<td>${g_dto.gGrade }</td>
				<td>${g_dto.totalCost }</td>
			</tr>
			<tr><td colspan="2"><input type="button" value="목록" 
			onclick="location.href='gd_manager.do'">
		<input type="button" value="수정" 
			onclick="location.href='.do?memberId=${list.memberId}'">
		<input type="button" value="삭제" 
			onclick="location.href='g_delete.do?memberId=${list.memberId}'"></td></tr>
</table>
</section>
</body>
</html>