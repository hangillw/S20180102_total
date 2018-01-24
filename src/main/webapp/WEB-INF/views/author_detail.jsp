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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div class="modal fade" id="rimg" role="dialog" style="display: none;" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">닫기</button>
				</div>
				<div class="modal-body">
				
							<div class="container" style="width: 100%;">
									  <div id="myCarousel" class="carousel slide" data-ride="carousel">
									    <!-- Indicators -->
									    <ol class="carousel-indicators">
									    </ol>
									
									    <!-- Wrapper for slides -->
									    <div class="carousel-inner">
									    </div>
									
									    <!-- Left and right controls -->
									    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
									      <span class="glyphicon glyphicon-chevron-left"></span>
									      <span class="sr-only">Previous</span>
									    </a>
									    <a class="right carousel-control" href="#myCarousel" data-slide="next">
									      <span class="glyphicon glyphicon-chevron-right"></span>
									      <span class="sr-only">Next</span>
									    </a>
									  </div>
									</div>
		
						</div>
						<div class="modal-footer">		
					</div>	
				</div>
			 </div>
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
						<h3><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></h3>
					</tr>
					
					<tr>
						<input type="hidden" name="gservNo" value="${list.gservNo }">
						<input type="hidden" name="rgroup" value="${list.rgroup }"> 
						<input type="hidden" name="nickName" value="${list.nickName }"> 
						<%-- <input type="hidden" name="rn" value="${list.rn }">  --%>
						<td rowspan=3>
						<a data-toggle="modal" data-target="#rimg" role="button"> 
								<img class ="rImg" name="${list.rimg }" src="${pageContext.request.contextPath}/images/${list.rimg }" onerror="this.src='${pageContext.request.contextPath}/items/review_alt.png'"></td>
						</a>
						
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
<script type="text/javascript">
	$(function(){
		$('.rImg').click(function(){
			$('.carousel-inner').empty();
			$('.carousel-indicators').empty();
			var rimg = this.name;
			<c:forEach var="i" begin="0" end="${fn:length(rImgList)}">
				var imgList = "${rImgList[i][0]}";
								
				if(rimg == imgList){
					<c:forEach var="j" begin="1" end="${fn:length(rImgList[i])}">
						<c:if test="${j==1}">
						$('.carousel-indicators').append("<li data-target='#myCarousel' data-slide-to='${j}-1' class='active'></li>");
						$('.carousel-inner').append("<div class='item active'><img src='${pageContext.request.contextPath}/images/${rImgList[i][j-1]}'/></div>");
						</c:if>
						<c:if test="${j!=1}">
						$('.carousel-indicators').append("<li data-target='#myCarousel' data-slide-to='${j}-1'></li>");
						$('.carousel-inner').append("<div class='item'><img src='${pageContext.request.contextPath}/images/${rImgList[i][j-1]}'/></div>");
						</c:if>
					</c:forEach>
				}
			</c:forEach>
		});
	});
</script>
</html>