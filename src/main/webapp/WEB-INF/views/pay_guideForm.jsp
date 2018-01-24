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
<script type="text/javascript">
	$(function(){
		$('#gbank').val('${gDto.gbank}').prop("selected", true);
	});
</script>
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">
	<h2>정산</h2>
	<form action="pay_guidePro.do">
	<input type="hidden" name="gno" value="${gDto.gno }">
	<input type="hidden" name="totalCost" value="${gDto.totalCost }">
	정산 가능 금액 : ${gDto.totalCost }<input type="number" name="cost" min="1000" max="${gDto.totalCost }"><p>
	연락처 : <input type="text" value="${gDto.gtel }"><p>
	은행 : 
	<select name="gbank" id="gbank">
	<option value="" selected="selected">은행선택</option>
	<option value="국민">국민은행</option>
	<option value="신한">신한은행</option>
	<option value="새마을금고">새마을금고</option>
	<option value="하나">하나은행</option>
	<option value="농협">농협은행</option>
	<option value="우체국">우체국은행</option>
	<option value="KDB">KDB기업은행</option>
	<option value="우리">우리은행</option>
	<option value="신협">신협은행</option>
	<option value="카카오">카카오뱅크</option>
	</select><p>
	<%-- <span id="gbank">${gDto.gbank }</span><p> --%>
	계좌번호 : <input type="text" value="${gDto.gaccount }"><p>
	<input type="submit" value="확인">
	</form>
</section>
</body>
</html>