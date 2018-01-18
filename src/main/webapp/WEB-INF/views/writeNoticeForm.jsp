<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 입력</h2>
	<form action="writeNoticePro.do" method="post" name="frm">
		<table>
			<tr>
				<th>(공지게시물번호)</th>
				<td><input type="number" name="noticeNo" required="required"
					maxlength="4" value="${noticeno }"></td>
			</tr>
			<tr>
				<th>공지제목</th>
				<td><input type="text" name="ntitle" required="required">
				</td>
			</tr>
			<tr>
				<th>공지내용</th>
				<td><textarea name = "ncontent" cols="40" rows="10" placeholder="내용..."></textarea> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>