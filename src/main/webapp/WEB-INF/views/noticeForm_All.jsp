<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.inner {
	clear: both;
} 
.mainPage {
	padding-top: 100px;
}
</style>
</head>

<body>

<div class="container mainPage">
	<div>
		<h2>공지사항</h2>
		<%-- <h5>total = ${pg.total}  start = ${pg.start}</h5> --%>
	</div>
	<c:set var="num" value="${pg.total-pg.start+1}"/> 
		<table border="1">
						
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${num}</td>
					<td><a href="noticeDetail.do?noticeNo=${notice.noticeNo}">${notice.ntitle}</a></td>
					<td>${notice.nreadCount}</td>
					<td>${notice.ncredate}</td>
				</tr>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
		</table>
	
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a
			href="notice.do?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
	</c:if> <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage }">
		<a href="notice.do?currentPage=${i}">[${i }]</a>
	</c:forEach> <c:if test="${pg.endPage < pg.totalPage }">
		<a href="notice.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	
	
</div>
<div style="clear: both">
<br>
<br>
<br>
</div>	

	 <jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>