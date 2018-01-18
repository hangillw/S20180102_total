<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
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
<!-- <script type="text/javascript" src="../../js/jquery.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	
		$("select").change(function(){
			var lock = $(this).val();
			alert("ajax발동전");
			$.ajax({
	            type : 'POST',
	            url  : '<%=context%>/rest/upLock.do',
				data : { lock : lock },
				success : function(data) {
					console.log(data);
				}
			});
			alert("ajax발동후");
		});
</script>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
<section class="body">
	<h2>상품 목록</h2>
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<form action="service_manager.do">
	가이드/상품 번호<input type="search" name="searchServ" placeholder="검색" title="검색할 가이드,상품번호를 입력하세요"> 
	</form>
	<table>
		<tr>
			<th>번호</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>서비스시작일</th>
			<th>서비스종료일</th>
			<th>수정일자</th>
			<th>노출여부</th>
		</tr>
		<c:forEach var="gserv" items="${list }">
			<tr>
				<td>${num }</td>
				<td>${gserv.gservNo }</td>
				<td>${gserv.gservTitle}</td>
				<td>${gserv.gservPrice }</td>
				<td>${gserv.gservSDate }</td>
				<td>${gserv.gservEDate}</td>
				<td>${gserv.gservFixDate }</td>
				<td>
					<select name="gservLock" id="gservLock">
						<option value="${gserv.gservNo }Y">Y</option>
						<option value="${gserv.gservNo }N">N</option>
					</select>
				</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="service_manager.do?currentPage=${pg.startPage-pg.pageBlock}&searchServ=${searchServ}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="service_manager.do?currentPage=${i}&searchServ=${searchServ}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="service_manager.do?currentPage=${pg.startPage+pg.pageBlock}&searchServ=${searchServ}">[다음]</a>
	</c:if>
</section>
</body>

</html>