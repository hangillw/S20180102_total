<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "js/jquery.js"></script>
<style type="text/css">
	.bar {
			width: 250px;
			height:100%;
			background-color: #232323;
			box-sizing: border-box;
			display: inline-block;
			position: absolute;
			left:0;
			top:70px;
			
		}
		
		li {
			list-style: none;
		}
		
		.tap1 {
			text-decoration: none;
			color:white;
		}

</style>
<script type="text/javascript">
function funLoad(){
    var Cheight = $(window).height();
    $('.bar').css({'height':Cheight+'px'});
}
window.onload = funLoad;
window.onresize = funLoad;
</script>
</head>
<body>
<div class="bar">
	<ul >
		<li><a href="mb_List.do" class="tap1">회원관리</a></li>
		<li><a href="gd_manager.do" class="tap1">가이드관리</a></li>
		<li><a href="service_manager.do" class="tap1">상품 관리</a></li>
		<li><a href="review_manager.do" class="tap1">후기 관리</a></li>			
		<li><a href="noticeList.do" class="tap1">공지사항 관리</a></li>
		<li><a href="QA_manager.do" class="tap1">문의사항</a></li>
	</ul>
</div>
</body>
</html>