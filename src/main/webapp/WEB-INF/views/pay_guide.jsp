<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- //<%@ include file="setting.jsp" %> --%>
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
<script type="text/javascript">
		$(function(){
			$("button").click(function(){
				var gNo = ${gno};
				var gServNo = $('#gServNo').val() == "" ? null : $('#gServNo').val();
				var startSearch = $('#start').val() == "" ? null : $('#start').val();
				var endSearch = $('#end').val() == "" ? null : $('#end').val();
				console.log(gNo);
				console.log(gServNo);
				console.log(startSearch);
				console.log(endSearch);
				if(startSearch != null && endSearch != null && gServNo != null){
					console.log("all");
					$.ajax({
			            type : 'POST',
			            url  : '<%=context%>/rest/downExcel.do',
			            data : { gNo : gNo, gServNo : gServNo, startSearch : startSearch, endSearch : endSearch },
						success : function(data) {
							console.log("sucess");
						}
					});
				}else if(startSearch != null && endSearch != null){
					console.log("date");
					$.ajax({
			            type : 'POST',
			            url  : '<%=context%>/rest/downExcel.do',
			            data : { gNo : gNo, startSearch : startSearch, endSearch : endSearch },
						success : function(data) {
							console.log("sucess");
						}
					});
				}else if(gServNo != null){
					console.log("gServNo");
					$.ajax({
			            type : 'POST',
			            url  : '<%=context%>/rest/downExcel.do',
			            data : { gNo : gNo, gServNo : gServNo },
						success : function(data) {
							console.log("sucess");
						}
					});
				}else{
					console.log("else");
					$.ajax({
			            type : 'POST',
			            url  : '<%=context%>/rest/downExcel.do',
			            data : { gNo : gNo },
						success : function(data) {
							console.log("sucess");
						}
					});
				}
			});
		});
</script>
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">
 <h1>매출통계보기 및 조건별 매출검색</h1>
 <form action="pay_guide.do">
 <input type="hidden" name="gno" value="${gno }">
 서비스 번호 검색 <input type="search" id="gServNo" name="gservNo">
 </form>
 <form action="pay_guide.do">
 <input type="hidden" name="gno" value="${gno }">
 기간별 검색  시작일 : <input type="date" id="start" name="startSearch" required="required"> ~ 종료일 : <input type="date" id="end" name="endSearch" required="required">
	<input type="submit" value="검색">
</form>
<button>EXCEL출력</button>
<h2>기간별 매출 통계</h2>
<table id="payg">
	<tr>
	
	<th>서비스명</th><th>매출일</th><th>총예약건수</th><th>총 결제금액</th><th>적립금(수수료제외금액)</th>
	</tr>
	<c:forEach var="payG" items="${payGlist }">
			<tr>
				<td>${payG.gservNo }</td>
				<td>${payG.gservTitle }</td>
				<td>${payG.tourDate }</td>
				<td>${payG.reMemSize }</td>
				<td>${payG.reMemSize * payG.gservPrice}</td>
				<td>${payG.reMemSize * payG.gservPrice /100 * 70}</td>
			</tr>
		</c:forEach>
</table>
<form action="pay_guideForm.do">
	<input type="hidden" name="gno" value="${gno }">
	<input type="submit" value="정산">
</form>
</section>
</body>
</html>