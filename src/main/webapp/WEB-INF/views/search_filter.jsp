<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE>
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
		margin-top:100px;
	}
	.tour {
		padding-left: 300px;
	}
</style>
<script type="text/javascript">

// --------------------------------------------------------------------------  Ordering  : 정렬 
	$(document).ready(function(){
		var order = '${order}';
		$("#selectBox").val(order).attr("selected", "selected");
	});   

	function ordering(value) {
		// Ordering 경로 설정
		var s = location.href;
		s = s.replace('http://localhost:8181/s20180102/','');
		s = s.replace('&order=gservCreDate','');
		s = s.replace('&order=likeIt','');
		s = s.replace('&order=gservPrice','');
		s = s.replace('&order=rvCnt','');
		s = s + "&order="+value;
		// Ordering 실행
		location.href= s;                	
	}
	

// --------------------------------------------------------------------------  좋아요 FUNCTION
	function delLikeIt(gservNo) {
		// 경로 설정
		s = 'delLikeItPro.do?keyword=${keyword}&order=${order}&call=2&currentPage=${currentPage}&gservNo='+gservNo;
		location.href= s;        
	}
	
	function inLikeIt(gservNo) {
		// 경로 설정
		s = 'inLikeItPro.do?keyword=${keyword}&order=${order}&call=2&currentPage=${currentPage}&gservNo='+gservNo;
		location.href= s;        
	}
	

</script>
</head>
<body>
	<img class ="cityImg" alt="여행이미지" src="${pageContext.request.contextPath}/images/2">
<jsp:include page="filterBar.jsp"></jsp:include>
<div class="tour">
		<!-- ORDER -->
		<select id="selectBox" onchange="ordering(this.value)">
			  <option value="gservCreDate">신상품순</option>
			  <option value="likeIt">인기순</option>
			  <option value="gservPrice">가격순</option>
			  <option value="rvCnt">후기순</option>
		</select>
		<!-- 상품 리스트 -->

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
		<a href="search_filter.do?currentPage=${pg.startPage-pg.pageBlock}&${keyword}&order=${order}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="search_filter.do?currentPage=${i}&${keyword}&order=${order}"">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="search_filter.do?currentPage=${pg.startPage+pg.pageBlock}&${keyword}&order=${order}"">[다음]</a>
	</c:if>
</div>

</body>
</html>