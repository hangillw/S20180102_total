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
	.body {
		padding-top: 100px;
	}
</style>
<script type="text/javascript">
	function chk() {
		if(confirm("예약하시겠습니까?")){
			return true;
		}
		else {return false;}	
	}
	
	function inWishList(VgservNo){
		alert("VgservNo->"+VgservNo); 
		$.ajax({
			url:"<%=context%>/inWishList.do",  
			data:{gservNo : VgservNo},
			dataType:'text',
			success:function(data){
				 $('#wishChk').text(data); 
			}
		});
	}

</script>
</head>
<body>
<section class="body">
<div class="container">
	<c:set var="gs" value="${gsDto}"></c:set>
		<h3>상품명</h3>
		<input type="text" name="gservTitle" value="${gs.gservTitle}">
		<h3>가이드지역</h3>
		<input type="text" name="gservArea" value="${gs.areaName}">
		
			<form action="inResvPro.do" method="post" onsubmit="return chk()">
				<input type="hidden" name="gservNo" value="${gs.gservNo }">
				<input type="hidden" name="gno" value="${gs.gno }">
					<h3>투어예정일</h3>
					<input type="date" name="tourDate" required="required">
					<h3>예약 인원</h3>
					<input type="number" name="reMemSize" required="required">
					<input type="submit" value="예약하기">
			</form>
		<c:if test="${wishCheck > 0 }">
			위시리스트에 등록된 상품입니다.
		</c:if>
		<c:if test="${wishCheck ==0 }">	
			<p id="wishChk">
				<input type="button" value="위시리스트 등록" onclick="inWishList(${gs.gservNo})">	
			</p>
		</c:if>
		<h3>가이드 경로</h3>
		<div id="gservGps"></div>
		<h3>상품 소개</h3>
		<c:set var="cDtoList" value="${cDtoList }"></c:set>
		 <p>${cDtoList[0].gservIntro }</p>
		<h2>가이드 내용</h2>
		<table id="TblAttach">
			<tr>
				<th>#</th>
				<th>행선지소개</th>
				<th>이미지 등록</th>
				<th>경로등록</th>
			</tr>
			<% int num = 1; %>
			<c:forEach var="cDto" items="${cDtoList }">
			<c:if test="${cDto.gservOrder!=0}">
				<tr>
					<td><%=num%></td>
					<% num++; %>
					<td><p>${cDto.gservIntro }<p>
					<td><p>${cDto.imgSrc }</p>
				</tr>
			</c:if>
			</c:forEach>
			<tr>
					<td><%=num%></td>
					<% num++; %>
					<td><input type="text" name="gservIntro" value=""></td>
					<td><input type="file" name="imgSrc" value=""></td>
					<td><input type="button" name="addServ" onclick="addItem()" value="추가"></td>
			</tr>
		</table>
		<h2>상품유형</h2>
		<p>${gs.subName }</p>
		<h2>TAG</h2>
		<p>${gs.servTag}</p>
		<h2>가용인원</h2>
		<p>최소 : ${gs.memSizeMin }, 최대 :${gs.memSizeMax } </p>
		
		<h2>픽업시간</h2>
		<p>${gs.pickUpTime }</p>
		<h2>가능언어</h2>
		<p>${gs.gservLang }</p>
		<h2>소요시간</h2>
		<p>${gs.gservLeadTime }</p>
		<h3>가격포함사항</h3>
		<p>${gs.pinclude}</p>
		<h3>가격불포함사항</h3>
		<p>${gs.notPInclude}</p>
		<h3>주의사항</h3>
		<p>${gs.caution}</p>

		
</div>		
</section>
	<script type="text/javascript">
	function addItem() {
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length;      // 테이블(TR) row 개수
	      newTr = lo_table.insertRow(row_index);
	      newTr.idName = row_index;
	 
	      newTd=newTr.insertCell(0);
	      newTd.innerHTML= row_index;
	 
	      newTd=newTr.insertCell(1);
	      newTd.align = "center";
	      newTd.innerHTML= "<input type=text name=gservIntro>";
	      
	      newTd=newTr.insertCell(2);
	      newTd.align = "center";
	      newTd.innerHTML= "<input type=file name=imgSrc>";
	      newTd=newTr.insertCell(3);
	      newTd.innerHTML= "<input type=button name=addServ onclick=addItem() value=추가>";
	}
	
	function delItem(){
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length-1;      // 테이블(TR) row 개수
	 
	      if(row_index > 0) lo_table.deleteRow(row_index);    
	}
	
	</script>
</body>
</html>