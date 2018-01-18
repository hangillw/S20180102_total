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
	
	#gImg {
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
<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">
	<table>
			<center>
				<h2>가이드 정보</h2>
			</center>
			<tr>
				<td rowspan="5"><img alt="프로필 사진" id="gImg" src="${pageContext.request.contextPath}/images/${gDto.gimg }"> </td>
				<td>닉네임</td><td>${mbDto.nickName}</td>
			</tr>
			<tr>
				<td>전화번호</td><td>${gDto.gtel}</td>
			</tr>
			<tr>
				<td>카카오 계정 ID</td><td>${gDto.kakaoId}</td>
			</tr>
			<tr>
				<td>은행 계좌</td><td>${gDto.gaccount}</td>
			</tr>
			<tr>
				<td>가이드 등급</td><td>${gDto.ggrade }</td>
			</tr>	
		</table>
		<h2>가이드 소개</h2>
		<p>${gDto.ginfo }</p>
				
		<tr><td colspan="2"><a href="guide_detail.do">나의 가이드 페이지로</a>
		<a href="upGuideForm.do">프로필 수정</a>
		<a href="delGuideForm.do">가이드 탈퇴</a></td>
	</table>	
</section>
</body>
</html>