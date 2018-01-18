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
	
	.rImg {
		width: 70px;
		height: 70px;
		border-radius: 0.5em;
	}
</style>
<script type="text/javascript">
/* 	$(document).ready(function(){
		var time = new Date().getTime();
		var src = $(".rImg").attr("src") + "?time="+ time;
		$(".rImg").attr('src',src);
	});   */ 
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>

<section class="body">
<h2>나의 후기 관리</h2>

<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
<table>
	<tr><th>주문번호</th>
		<th>상품명</th>
		<th>투어일자</th>
		<th colspan=3>후기</th>
	</tr>
	<c:if test="${total > 0 }">
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.payCode }</td>
				<td><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></td>
				<td>${list.tourDate }</td>
					<c:if test="${list.rvNum >0 }">
						<c:if test="${list.openReview > 0 }">
							<td><input type="button" value="후기닫기" onclick="location.href='review_member.do?currentPage=${currentPage }'"></td>
						</c:if>
						<c:if test="${list.openReview == 0 }">
							<td><input type="button" value="후기보기" onclick="location.href='getReviewPro.do?gservNo=${list.gservNo}&rn=${list.rn }'"></td>
						</c:if>
						<td><input type="button" value="후기수정" onclick="location.href='upReviewForm.do?gservNo=${list.gservNo}'"></td>
						<td><input type="button" value="후기삭제" onclick="location.href='delReviewPro.do?gservNo=${list.gservNo}'"></td>
					</c:if>
					<c:if test="${list.rvNum == 0 }">
						<td>
						  <input type="button" value="후기작성" onclick="location.href='inReviewForm.do?payCode=${list.payCode}'">
						</td>
					</c:if>
				</tr>
			<form action="inCmtPro.do">
				<input type="hidden" name="gservNo" value="${revDto.gservNo }">
				<input type="hidden" name="rgroup" value="${revDto.rgroup }"> 
				<input type="hidden" name="nickName" value="${revDto.nickName }"> 
				<input type="hidden" name="rn" value="${list.rn }"> 
				<c:if test="${list.openReview > 0}">
					<tr>
						<td rowspan=3><img class ="rImg" src="${pageContext.request.contextPath}/images/${revDto.rimg }" onerror="this.src='${pageContext.request.contextPath}/items/review_alt.png'"></td>
						<td colspan=4>${revDto.rtitle }</td>
						<td>DATE ${revDto.rcredate }</td>
						
					</tr>
					<tr>
						<td  rowspan=2, colspan=4>${revDto.rcontent }</td>
						<td>STAR <c:forEach var="i" begin="1" end="${revDto.rstar }">★</c:forEach> </td>
					</tr>
					<tr>
						<td>BY ${revDto.nickName }</td>
					</tr>
					<c:forEach var="revList" items="${revList }">
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
						</tr>					
				</c:if>
			</form>
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
	<a href="review_member.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="review_member.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="review_member.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>

</section>
</body>
</html>