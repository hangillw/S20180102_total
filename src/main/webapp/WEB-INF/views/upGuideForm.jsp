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
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">	
	<h3 style="text-align: center;">가이드 프로필 수정</h3>
	<form action="upGuidePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="${gDto.memberId }">
				<table class="table" style="text-align: center;">
						<tbody>
							<tr>
								<td rowspan="5"><img alt="현재 사진" id="gImg" src="${pageContext.request.contextPath}/images/${gDto.gimg }"></td>
								<td><input type="file" name="guideImg" value="사진 수정"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="tel" name="gtel" value="${gDto.gtel }"></td>
							</tr>
							<tr>
								<td>카카오 아이디</td>
								<td><input type="text" name="kakaoId" value="${gDto.kakaoId }">
							</td>
							<tr>
								<td>개인 홈페이지</td>
								<td><input type="text" name="gpage" value="${gDto.gpage }"></td>
							</tr>
							<tr>
							<td>정산 계좌</td>
							<td><input type="text" name="gaccount" value="${gDto.gaccount }" onclick=""></td>
							</tr>										
						</tbody>
					</table>
		<br>
		<h4>가이드 소개</h4>
		<textarea rows="10" cols="120" name="ginfo">${gDto.ginfo }</textarea><br>
		<input type="submit" value="가이드정보수정" class="btn btn-info"> 		
		<input type="button" value="취소" onclick="location.href='profile_guide.do?gno=${gDto.gno}'">
	</form>
	

<%--  <%@ include file="footer.jsp"%> --%>
</section>
</body>
</html>