<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.inner {
		clear: both;
	}

	.mainImage {
		width:1903px;
		height:400px;
		margin-top: 100px;
	}
	
</style>
</head>
<body>
	<img class="mainImage" src="${pageContext.request.contextPath}/items/1.jpg" alt="여행이미지">
<div class="mainPage" style="clear: both">
<div class="container">
	<dl class="inner">
		<dt>
			<h3>오늘의
			<br>
			 추천 여행지!</h3>
			 <div class="more_tour">
			 	<a class="" href="">더보기</a>
			 </div>
		</dt>
		<dd>
			<ol class="lst_tour">
				<li class="left">
					<a class="" href="">
						<img src="" alt="상품 이미지">
					</a>
					<span class="author">
						<a href="author_detail.do">
							<img alt="프로필사진" src="">
						</a><br>
						<strong>
							<a href="">닉네임</a>
						</strong>
					</span>
					<p>
						<strong><a class="call_tour" href="">상품제목</a></strong><br>
						카테고리분류명
					</p>
					<div class="option">
						<div class="time left"><a href="">소요시간</a></div>
						<div class="like left">좋아요수</div>
						<div class="remainMember left">남은 인원</div>
					</div>
				</li>
				
				<li class="left">
					<a class="" href="">
						<img src="" alt="상품 이미지">
					</a>
					<span class="authour">
						<a href="">
							<img alt="프로필사진" src="">
						</a><br>
						<strong>
							<a href="">닉네임</a>
						</strong>
					</span>
					<p>
						<strong><a class="call_tour" href="">상품제목</a></strong><br>
						카테고리분류명
					</p>
					<div class="option">
						<div class="time left"><a href="">소요시간</a></div>
						<div class="like left">좋아요수</div>
						<div class="remainMember left">남은 인원</div>
					</div>
				</li>
				
				<li class="left">
					<a class="" href="">
						<img src="" alt="상품 이미지">
					</a>
					<span class="authour">
						<a href="">
							<img alt="프로필사진" src="">
						</a><br>
						<strong>
							<a href="">닉네임</a>
						</strong>
					</span>
					<p>
						<strong><a class="call_tour" href="">상품제목</a></strong><br>
						카테고리분류명
					</p>
					<div class="option">
						<div class="time left"><a href="">소요시간</a></div>
						<div class="like left">좋아요수</div>
						<div class="remainMember left">남은 인원</div>
					</div>
				</li>
					<li class="left">
					<a class="" href="">
						<img src="" alt="상품 이미지">
					</a>
					<span class="authour">
						<a href="">
							<img alt="프로필사진" src="">
						</a><br>
						<strong>
							<a href="">닉네임</a>
						</strong>
					</span>
					<p>
						<strong><a class="call_tour" href="">상품제목</a></strong><br>
						카테고리분류명
					</p>
					<div class="option">
						<div class="time left"><a href="">소요시간</a></div>
						<div class="like left">좋아요수</div>
						<div class="remainMember left">남은 인원</div>
					</div>
				</li>
				
			</ol>
		</dd>
	</dl>
</div>






<div style="clear: both">
<br>
<br>
<br>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
