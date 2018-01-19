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
	iframe {
			width: 0px;
			height: 0px;
			border: 0px
	}
</style>
<style type="text/css">
	.body {
		padding-top: 70px;
	}
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:10px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#777;}


</style>
<script type="text/javascript">
/* 오늘 날짜 가져오기  */
	$(document).ready(function(){	
		document.getElementById("theTime").valueAsDate = new Date();
	});   
/* 별점 스크립트  */
	$(document).ready(function(){
	 	$('input[name=rstar]').val(5);
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");		     
			 $('input[name=rstar]').val($(".on").size());
		     return false;                                                
		});
	});
 /* 이미지 가져오기 */
/*
	$(document).ready(function(){
		$("#rImg").on('change',function () {
			$("#frm").attr("action", "inRImg.do");   
			$("#frm").attr("target", "target");    // form 속성 바꾸기
			document.getElementById("frm").submit();
		})
	});
	function addFilePath(msg) {
		var time = new Date().getTime();
		$("#images").html(msg);
		$
		
		$("#frm").attr("action", "inReviewPro.do"); 
		$("#frm").removeAttr("target");           //  form 속성 다시 바꾸기 
	}*/
</script>
</head>
<body>

<form action="inReviewPro.do" id="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="memberId" value="${memberId }">
	<input type="hidden" name="gservNo" value="${rsvDto.gservNo }">	
	<input type="hidden" name="payCode" value="${rsvDto.payCode }">	
	<table>
		<caption>
		   [ ${rsvDto.gservTitle } ] 후기 등록
		</caption>
		<tr>
			<td>후기 제목 <input type="text" name = "rtitle" id = "rTitle" required="required"></td>
		</tr>
		<tr>
			<td>작성자 <input type="text" name="nickName" value="${nickName }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>작성일 <input type="date" id="theTime" disabled="disabled"></td>
		</tr>
	
		<tr>
			<td><p class="star_rating">
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				</p><input type="hidden" name="rstar"></td>
			<td>
				<input type="file" name="images" multiple="multiple" id="rimg">
			</td>
		
		</tr>
		<tr>
			<td>
				<textarea rows="15" name="rcontent" id = "rContent" cols="100"></textarea>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="후기 등록"></td>
		</tr>
	</table>
		
		<iframe name="target"></iframe>
</form>

</body>
</html>