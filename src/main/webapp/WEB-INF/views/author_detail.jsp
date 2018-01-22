<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	.rImg {
		width: 70px;
		height: 70px;
		border-radius: 0.5em;
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
		<div style="clear: both">
		</div>
		<c:if test="${fn:length(tcDto) >= 5}">
			<a href="search_Keyword.do?keyword=${tcDto[0].nickName}">[더보기]</a>
		</c:if>
		
		<c:forEach var="list" items="${revDto }">
			<hr>
			<li>
				<form action="inCmtPro.do">
				<table>
					
					<tr>
						<input type="hidden" name="gservNo" value="${list.gservNo }">
						<input type="hidden" name="rgroup" value="${list.rgroup }"> 
						<input type="hidden" name="nickName" value="${list.nickName }"> 
						<%-- <input type="hidden" name="rn" value="${list.rn }">  --%>
						<td rowspan=3><img class ="rImg" src="${pageContext.request.contextPath}/images/${list.rimg }" onerror="this.src='${pageContext.request.contextPath}/items/review_alt.png'"></td>
						<td colspan=4>${list.rtitle }</td>
						<td>DATE ${list.rcredate }</td>
					</tr>
					<tr>
						<td  rowspan=2, colspan=4>${list.rcontent }</td>
						<td>STAR <c:forEach var="i" begin="1" end="${list.rstar }">★</c:forEach> </td>
					</tr>
					<tr>
						<td>BY ${list.nickName }</td>
					</tr>
					<%-- <c:forEach var="revList" items="${revList }">
						<tr>
							<td rowspan=2>┗</td>
							<td rowspan=2, colspan=3>${revList.rcontent }</td>
							<td>DATE ${revList.rcredate }</td>
							<c:if test="${revDto.memberId==revList.memberId }">
								<td rowspan=2><input type="button" value="X" onclick="location.href='delCmtPro.do?gservNo=${revDto.gservNo}&rstep=${revList.rstep}&rn=${list.rn }'"></td>
							</c:if>
						</tr>
						<tr>
							<td>BY ${revList.nickName }</td>
						</tr>
					</c:forEach>
						<tr>
							<td>┗</td>
							<td colspan=4><textarea name="rcontent" cols="80"></textarea></td>
							<td><input type="submit" value="comment"></td>
						</tr> --%>
				</table>					
			</form>
				
			</li>
		</c:forEach>
		
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="author_detail.do?currentPage=${pg.startPage-pg.pageBlock}&gno=${gDto.gno}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="author_detail.do?currentPage=${i}&gno=${gDto.gno}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="author_detail.do?currentPage=${pg.startPage+pg.pageBlock}&gno=${gDto.gno}">[다음]</a>
	</c:if>
</body>
</html>