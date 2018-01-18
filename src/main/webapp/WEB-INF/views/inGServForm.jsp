<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../../js/jquery.js"></script> -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	function selchange(){
	    $('#areaSelect2').find('option').each(function(){
	        $(this).remove();
	    });
	    $('#areaSelect2').append("<option value=''>SELECT</option>");
	    var itemCode = $('#areaSelect').val();
		console.log(itemCode);
	    if(itemCode !=''){
	        	
	        $.ajax({
	            type : 'POST',
	            url  : '<%=context%>/rest/selArea.do',
	            data : {itemCode : itemCode},
	            dataType: 'json',
	            success:function(data){
	                if(data==null){
	                    data = 0;
	                }
	                for(var i = 0; i < data.length; i++){
	                    $('#areaSelect2').append("<option value='"+data[i]['itemCode']+"'>"+data[i]['itemName']+"</option>");
	                }
	            }
	        });
	       
	    }
	}
	function chk(){
		 $('input').required;
	}
	

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b24a9183b89e5f123d2fb212ebf6e317&libraries=services"></script>
</head>
<body>
<div class="container">
<h2>상품 등록</h2>
<form action="inGServPro.do" method="post" enctype="multipart/form-data">
	<c:set var="gs" value="${gsDto}"></c:set>
		<h3>상품명</h3>
		<input type="text" name="gservTitle" value="" required="required">
		<input type="hidden" name="gno" value="${gs.gno }">
		<input type="hidden" name="gservNo" value="${gs.gservNo }">
		<h3>가이드지역</h3>
		<select name="gservAreaG" id="areaSelect" onchange="selchange()" required="required">
			<option value="01">지역</option>
			<option value="01">서울</option>
			<option value="02">부산</option>
			<option value="03">인천</option>
			<option value="04">대구</option>
			<option value="05">대전</option>
			<option value="06">광주</option>
			<option value="07">울산</option>
			<option value="08">강원</option>
			<option value="09">경기</option>
			<option value="10">충북</option>
			<option value="11">충남</option>
			<option value="12">경남</option>
			<option value="13">경북</option>
			<option value="14">전북</option>
			<option value="15">전남</option>
			<option value="16">제주</option>
		</select>
		<select name="gservArea" id="areaSelect2" required="required">
			<option value="${gs.gservArea}">SELECT</option>
		</select>
		<br>
		서비스 개시일
		<input title="서비스개시일" type="date" name="gservSDate" value="" required="required">
		서비스 종료일
		<input title="서비스종료일" type="date" name="gservEDate" value="" required="required">
		<h2>서비스 가능 요일</h2>
		<input type="checkbox" name="days" value="1" id="D1">일요일
		<input type="checkbox" name="days" value="2" id="D2">월요일
		<input type="checkbox" name="days" value="3" id="D3">화요일
		<input type="checkbox" name="days" value="4" id="D4">수요일
		<input type="checkbox" name="days" value="5" id="D5">목요일
		<input type="checkbox" name="days" value="6" id="D6">금요일
		<input type="checkbox" name="days" value="7" id="D7">토요일
		
		<h3>픽업 지역</h3>
		
		
		<h3>상품 소개</h3>
		<textarea name="gservIntro" rows="10" cols="120" required="required"></textarea>
		<input type="hidden" name="gservOrder" value="0">
		<h2>가이드 내용</h2>
		<!-- 지도 -->
	  	<div id="map" style="width:500px;height:400px;"></div>
        <input type="text" value="" id="keyword" size="15" placeholder="장소검색"> 
        <input type="button" value="검색하기" onclick="searchPlaces()">
<!-- 		<input type="text" name="pickUpLoc" id="pickUpLoc" value="" required="required">
 -->		
		<table id="TblAttach">
			<tr>
				<th>#</th>
				<th>행선지소개</th>
				<th>이미지 등록</th>
				<th>경로등록</th>
			</tr>
			<% int num = 1; %>
				<tr>
					<td><%=num%><input type="hidden" name="gservOrder" value="<%=num%>"></td>
					<td><input type="text" name="gservIntro" value="" required="required"></td>
					<td><input type="file" name="imgfile" required="required"></td>
					<td><input type="button" name="addServ" onclick="addItem()" value="+"><input type="button" name="fixServ" value="X" onclick="delItem()"></td>
				</tr>
		</table>
		<h2>상품유형</h2>
		<input type="radio" name="gservSub" value="1001">명소
		<input type="radio" name="gservSub" value="1002">음식
		<input type="radio" name="gservSub" value="1003">이색투어
		<input type="radio" name="gservSub" value="1004">문화<br>
		<input type="radio" name="gservSub" value="1005">자연
		<input type="radio" name="gservSub" value="1006">액티비티
		<input type="radio" name="gservSub" value="1007">야경
		<input type="radio" name="gservSub" value="1008">쇼핑<br>
		<input type="radio" name="gservSub" value="1009">힐링
		<input type="radio" name="gservSub" value="1010">체험
		<input type="radio" name="gservSub" value="1011">축제
		<input type="radio" name="gservSub" value="2001">가족여행<br>
		<input type="radio" name="gservSub" value="2002">단체여행
		<input type="radio" name="gservSub" value="3001">바다
		<input type="radio" name="gservSub" value="3002">산
		<input type="radio" name="gservSub" value="4001">기차
		<h2>가격</h2>
		<input type="text" name="gservPrice" placeholder="예) 10000">
		<h2>TAG</h2>
		<input type="text" name="servTag">
		<h2>최소인원</h2>
		<input type="number" name="memSizeMin"  placeholder="1" required="required">
		<h2>최대인원</h2>
		<input type="number" name="memSizeMax" placeholder="10" required="required">
		<h2>픽업시간</h2>
		<input type="time" name="pickUpTime">
		<h2>가능언어</h2>
		<input type="text" name="gservLang" placeholder="예 ) 한국어, 영어" >
		<h2>소요시간</h2>
		<input type="number" name="gservLeadTime" placeholder="예 ) 1.5(=1시간 30분)">
		<h3>가격포함사항</h3>
		<input type="text" name="pinclude">
		<h3>가격불포함사항</h3>
		<input type="text" name="notPInclude" >
		<h3>주의사항</h3>
		<textarea rows="" cols="" name="caution" required="required"></textarea>
		<h3>노출여부</h3>
		<select name="gservLock">
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
		
		<input type="submit" onclick="chk()"  id="submit" value="수정"><input type="reset" value="취소">
	</form>
</div>

</body>
<script type="text/javascript">
<%num++; %>
var num = <%=num%>;
function addItem() {
      var lo_table = document.getElementById("TblAttach");
      var row_index = lo_table.rows.length;      // 테이블(TR) row 개수
      newTr = lo_table.insertRow(row_index);
      newTr.idName = row_index;
 	  
      newTd=newTr.insertCell(0);
      newTd.innerHTML= "<td>"+num+"<input type='hidden' name='gservOrder' value="+num+"></td>";
      num++;
      newTd=newTr.insertCell(1);
      newTd.innerHTML= '<td><input type="text" name="gservIntro" value=""></td>';
      
      newTd=newTr.insertCell(2);
      newTd.innerHTML= '<td><input type="file" name="imgfile"></td>';
      newTd=newTr.insertCell(3);
      newTd.innerHTML= '<td><input type="button" name="addServ" onclick="addItem()" value="+"><input type="button" name="fixServ" value="X" onclick="delItem()"></td>';
}
function delItem(){
	  num--;
      var lo_table = document.getElementById("TblAttach");
      var row_index = lo_table.rows.length-1;      // 테이블(TR) row 개수
 
      if(row_index > 0) lo_table.deleteRow(row_index);    
}

</script>
<script type="text/javascript">
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(37.55647223169107,126.94521202876426),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(37.55647223169107,126.94521202876426); 
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();
			
			// 키워드로 장소를 검색합니다
			searchPlaces();
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

			    var keyword = document.getElementById('keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        return false;
			    }

			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB);
			    return false;
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);

			        // 페이지 번호를 표출합니다
			        //displayPagination(pagination);

			    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

			        alert('검색 결과가 존재하지 않습니다.');
			        return;

			    } else if (status === daum.maps.services.Status.ERROR) {

			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;

			    }
			}
			
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {

			    var bounds = new daum.maps.LatLngBounds()
			    
			    // 지도에 표시되고 있는 마커를 제거합니다
			    //marker.setMap(null);
			    
			    for ( var i=0; i<places.length; i++ ) {

			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);
			            
			            

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
			    }

			    
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	
				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;
	
				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng);
	
				var message = latlng.getLat() + ',';
				message += latlng.getLng();
	
				var resultDiv = document.getElementById('pickUpLoc');
				resultDiv.value = message;
	
			});
	</script>
</html>