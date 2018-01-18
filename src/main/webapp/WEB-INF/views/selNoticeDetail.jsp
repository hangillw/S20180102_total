<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>

	<section class="body">
	<h2>공지사항</h2>
	<table>
		<tr>
			<th>게시물번호</th>
			<td>${list.noticeNo}</td>
			<th>공지제목</th>
			<td>${list.ntitle}</td>
			<th>공지내용</th>
			<td>${list.ncontent}</td>
			<th>공지등록일</th>
			<td>${list.ncredate}</td>
		</tr>
	</table>
</body>
</html>