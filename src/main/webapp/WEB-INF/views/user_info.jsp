<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
		padding-left:250px;
	}
	
	#mimg {
		width: 80px;
		height: 80px;
		border-radius: 40px;
	}
</style>
<script type="text/javascript">

/* 	function changPw() {
		document.userInfo.action="changPwForm.do";
		document.userInfo.method="post";
		document.userInfo.submit();
	} */

</script>
<script type="text/javascript">

	$(document).ready(function check() {
		$("#btnUpdate").click(function check() {
			//수정확인버튼
			document.form.action="";
		})
	})
</script>


</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<section class="body">
	<table>
			<center>
				<h2>개인 정보</h2>
			</center>
			<tr>
				<td rowspan="7"><img alt="프로필 사진" id="mimg" src="${pageContext.request.contextPath}/images/${memberDto.mimg }"> </td>
				<td>아이디</td><td>${memberDto.memberId}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="button" name="" value="비밀번호변경" onclick="location.href='changePwForm.do?memberId=${memberDto.memberId}'"></td>
			</tr>
			<tr>
				<td>닉네임</td><td>${memberDto.nickName}</td>
			</tr>
			<tr>
				<td>전화번호</td><td>${memberDto.tel}</td>
			</tr>
			<tr>
				<td>주소</td><td>${memberDto.addr}</td>
			</tr>
			<tr>
				<td>이름</td><td>${memberDto.mname}</td>
			</tr>
			<tr>
				<td>포인트</td><td>${memberDto.mpoint }</td>
			</tr>				
			<tr><td colspan="2"><a href="main.do">HOME</a>
			<a href="updateForm.do?memberId=${memberDto.memberId}">수정</a>
			<a href="delMemberForm.do">회원탈퇴</a></td>
</table>

	
		
	
</section>
</body>
</html>