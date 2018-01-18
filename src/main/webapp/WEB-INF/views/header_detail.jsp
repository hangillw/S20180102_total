<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

<script type="text/javascript" src = "js/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
 <style type="text/css">

/* 레이아웃 css */
body {
	margin: 0px;
}

.header{
	display: inline-block;
	width:100%;
	height:70px;
	background-color: lightgray;
}

li {
	list-style: none;
}

.list_left {
	float:left;
}
</style>
</head>
<body>
<div class="header">
			<div class="left">
				<ul>
					<li class="list_left">
						<img src="" alt="logo이미지"
							 onclick='location.href="main.do"'>	
					</li>
					<li class="list_left">
						<c:if test="${chkPage !=null }">
							${chkPage }
						</c:if>
					</li>
				</ul>
			</div>
</div>
</body>
</html>