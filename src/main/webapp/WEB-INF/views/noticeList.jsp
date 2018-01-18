<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header_detail.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body {
	padding-top: 70px;
	padding-left: 250px;
}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>

	<section class="body">
		<h2>공지사항</h2>
		<a href="writeNoticeForm.do">입력</a>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<table>
			<tr>
				<th>게시물번호</th>
				<th>공지제목</th>
				<th>공지조회수</th>
				<th>공지등록일</th>
			</tr>
			<c:if test="${total > 0 }">
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.noticeNo }</td>
						<td><a href="selNoticeDetail.do?noticeNo=${list.noticeNo}">${list.ntitle }</a></td>
						<td>${list.nreadCount }</td>
						<td>${list.ncredate }</td>
					</tr>
					<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${total ==0 }">
				<tr>
					<td colspan=6>작성할 후기가 없습니다 :-)</td>
				</tr>
			</c:if>
		</table>

		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="noticeList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
			<a href="noticeList.do?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage }">
			<a href="noticeList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
		</c:if>

	</section>
</body>
</html>