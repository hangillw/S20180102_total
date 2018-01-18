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
	<ul>
		<li><a href="user_info.do" class="tap1">프로필관리</a></li>
		<li><a href="wishList.do" class="tap1">위시리스트</a></li>
		<li><a href="reservation_member.do" class="tap1">나의여행</a><ol>
			<li><a href="reservation_member.do" class="tap1">예약 현황</a></li>
			<li><a href="pay_member.do" class="tap1">결제내역</a></li>
			<li><a href="review_member.do" class="tap1">후기관리</a></li></ol></li>
		<li><a href="selQAPro.do" class="tap1">문의사항</a></li>
	</ul>
</div>
</body>
</html>