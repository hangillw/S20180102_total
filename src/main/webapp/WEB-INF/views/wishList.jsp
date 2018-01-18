<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
		padding-left:250px;
		margin: auto;
	}
	form {
		margin:0;
	}
	a {
		text-decoration: none;
	}
	
	.left {
		float: left;
	}
	
	#heart {
		width:24px;
		height: 20px;
	}
	
	#itemPic {
		width: 300px;
		height:170px;

	}
	#gimg {
		width: 70px;
		height: 70px;
		border-radius: 40px;
		border: 3px solid white;
		margin-top: 130px;
		margin-left:112px;
		position: absolute;
		top: 0;
		left:0;
		z-index: 150;
	}
	reset * {
		margin: 0;
		padding: 0;
	}
	.wishBox {
		float:left;
		width: 300px;
		height: 430px;
		margin-right: 50px;
		position: relative;
	}
	.heart {
		position: absolute;
		top: 0;
		left:0;
		z-index: 200;
	}
	.itemPic {
		position: absolute;
		top: 0;
		left:0;
		z-index: 100;
	}

	
</style>
<script type="text/javascript">
	function chk() {
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		} else {return false;}	
	}	
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<section class="body">
<div class="container">
		총 ${wishList.size() }개<br>
		<h2>나의 위시리스트</h2>
	<div style='clear: both'>
			<c:if test="${pg.startPage > pg.pageBlock }">
				<a href="wishList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<a href="wishList.do?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<a href="wishList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
			</c:if>
	</div>
</div>
	<div class="container" style="margin-top: 30px">
			<ul class="lst_tour">
				<c:forEach var="list" items="${wishList }">
					<li>
						<!-- wishCard DIV -->
						<div class="wishBox">
							<!-- 좋아요 하트 -->
							<div class="heart">
								<c:if test="${list.heart>0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/redHeart.png" alt="빨강하트" id='heart' onclick="location.href='delLikeItPro.do?gservNo=${list.gservNo}&call=1'">						
								</c:if>
								<c:if test="${list.heart==0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/whiteHeart.png" alt="하양하트" id='heart' onclick="location.href='inLikeItPro.do?gservNo=${list.gservNo}&call=1'">						
								</c:if>						
							</div>
							<!-- 상품 사진 -->
							<div class="itemPic">
								<a class="" href="tour_detail.do?gservNo=${list.gservNo }">
									<img id="itemPic" src="${list.imgSrc }" onerror="this.src='${pageContext.request.contextPath}/items/itemPic1.png'">
								</a>						
							</div>
							<!-- 가이드 프로필 사진 -->
							<div class="author">
								<a href="author_detail.do">
									<img id="gimg" alt="프로필사진" onerror="this.src='${pageContext.request.contextPath}/items/login.png'" src="${pageContext.request.contextPath}/images/${list.gimg }">
								</a><br>
							</div>
							<div style="margin-top:150px; position: absolute;">
									<strong >
										<a href="" >${list.nickName }</a>
									</strong>
								<p>
									<strong><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></strong><br>
									${list.gservSub }
								</p>
								<p>
									<fmt:formatNumber value="${list.gservPrice }" type="currency" currencySymbol="￦"/>/인<br>
								</p>
								<div class="option">
									<div class="left"><a href="">${list.gservLeadTime }</a></div>
									<div class="left">${list.likeIt }</div>
									<div class="left">${list.remainSize }</div>
								</div>
								<br>
								<input type="button" value="예약하기" onclick="location.href='tour_detail.do?gservNo=${list.gservNo }'">
							 
							  <form class="left" action="delWishList.do" onsubmit="return chk()">
							  	<input type="hidden" name="gservNo" value="${list.gservNo }">						  
								<input type="submit" style="margin:0" value="위시리스트 삭제">
							  </form>
								<br>
									<a href="search_Keyword.do?keyword=${list.gservArea }">>> ${list.gservArea }의 다른 상품</a>
							
								</div> 
							</div>
						</li>
				</c:forEach>
			</ul>
	</div>


</section>
</body>
</html>