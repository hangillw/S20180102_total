<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body {
	padding-top: 70px;
	padding-left: 250px;
}

.left {
	float: left;
}
</style>
</head>


<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="body">
		<div>
			<h2>관리자 QnA</h2>
		</div>
		<c:set var="num" value="${pg.total-pg.start+1}"/>
	</div>
</body>
</html>