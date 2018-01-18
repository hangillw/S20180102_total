<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
		padding-left:250px;
	}
	
	#mimg {
		width: 80px;
		height: 80px;
		border-radius: 40px;
	}
</style>

<script type="text/javascript">
 	function winop2() {
 		left1=(screen.width-300)/2;
        top1=(screen.height-600)/2;
		window.open("jusoPopup.jsp","pop","left="+left1+",top="+top1+", width=570, height=420, scrollbars=no, resizable=yes");
	}
 	
 	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd,
 			rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm,
 			buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			$('#roadFullAddr').val(roadFullAddr);
 	}
 
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<section class="body">

<form action="user_update.do" method="post" enctype="multipart/form-data">
	<center>
		<h2>프로필관리</h2>
		<table>
			<tr>
				<td rowspan="6"><img alt="현재 사진" id="mimg" src="${pageContext.request.contextPath}/images/${memberDto.mimg }"></td>
				<td><input type="file" name="memberImage"></td>
			</tr>
			<tr>
				<th>아이디 : </th>
				<td><input type="text" name="memberId" value="${memberDto.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>닉네임 : </th>
				<td><input type="text" name="nickName" value="${memberDto.nickName}" required="required" ></td>
			</tr>
			
			<tr>
				<th>이름 : </th>
				<td><input type="text" name="mname" value="${memberDto.mname}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>전화번호 : </th>
				<td><input type="text" name="tel"  value="${memberDto.tel}"></td>
			</tr>
			<tr>
				<th>주소 : </th>
				<td><input type="text" name="addr" id="roadFullAddr" value="${memberDto.addr}" readonly="readonly" id="txtNewPostNo" onkeydown="if(event.keyCode==13){return false;}">
				</td>
				<td><a href="#" ><img src="https://pics.auction.co.kr/myauction/button/btn_post02.gif" alt="우편번호찾기" class="vm" onclick="winop2()"></a></td> 
			</tr>			
		</table>
		<input type="submit" value="회원정보수정"> 
	</center>
</form>
</section>
</body>
</html>