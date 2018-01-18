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
	<h2>회원 정보</h2>
</center>	

	
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

			<tr>
				<td>${memberDto.memberId }</td>
				<td>${memberDto.nickName}</td>
				<td>${memberDto.pw }</td>
				<td>${memberDto.tel }</td>
				<td>${memberDto.addr }</td>
				<td>${memberDto.mname }</td>
				<td>${memberDto.regidate }</td>
				<td>${memberDto.mpoint }</td>
			
			</tr>
			
			<tr><td colspan="2"><input type="button" value="목록" 
			onclick="location.href='mb_List.do'">
		<%-- <input type="button" value="수정" 
			onclick="location.href='updateForm.do?memberId=${list.memberId}'"> --%>
		<input type="button" value="삭제" 
			onclick="location.href='delMemberForm.do'"></td></tr>
</table>
	
	
</section>
</body>
</html>