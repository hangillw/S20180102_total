<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
		box-sizing: border-box;
	}
	.cityImg {
		width: 100%;
		height: 550px;
	}
	.tour {
		padding-left: 300px;
	}
	#guideTitle{
		padding-top: 100px;
	}
</style>
</head>
<body>
<p>
<div id="guideTitle">
<h2>${tcDto[0].nickName } 가이드의 페이지</h2>
<img alt="가이드사진" src="${gDto.gimg }">
<pre>${gDto.ginfo}</pre>
</div>


<c:forEach var="list" items="${tcDto }">
		<hr>
			<li>
							<a href="tour_detail.do?gservNo=${list.gservNo }">
								<img src="${list.imgSrc }" alt="상품 이미지">
							</a>
							<span class="author">
								<a href="author_detail.do?gno=${list.gno }">
									<img alt="프로필사진" src="${list.gimg }">
								</a>
							<br>
							<strong>
								<a href="">${list.nickName }</a>
							</strong>
							</span>
							<c:if test="${list.heart>0 }">
								<img src="" alt="빨강하트" id='heart' onclick='delLikeIt(${list.gservNo})'>						
							</c:if>
							<c:if test="${list.heart==0 }">
								<img src="" alt="하양하트" id='heart' onclick='inLikeIt(${list.gservNo})'>						
							</c:if>
							<p>
								<strong><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></strong><br>
							</p>
							<p>
								<fmt:formatNumber value = "${list.gservPrice }" type="currency" currencySymbol="\\"/>/인<br>
							</p>
							<p>
								${list.servTag }<br>
								${list.gservArea }<br>
								소요시간 : ${list.gservLeadTime }<br>
								좋아요 : ${list.likeIt }<br>
								남은 인원 : ${list.remainSize }
							</p>
			</li>
		</c:forEach>
		<div style="clear: both"></div>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="search_Keyword.do?currentPage=${pg.startPage-pg.pageBlock}&keyword=${keyword}&order=${order}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="search_Keyword.do?currentPage=${i}&keyword=${keyword}&order=${order}"">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="search_Keyword.do?currentPage=${pg.startPage+pg.pageBlock}&keyword=${keyword}&order=${order}"">[다음]</a>
	</c:if>
</div>	
</body>
</html>