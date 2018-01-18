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
		box-sizing: border-box;
		display: inline-block;
		float: left;
		
		/* position: fixed; */
		
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
/* function funLoad(){
    var Cheight = $(window).height();
    $('.bar').css({'height':Cheight+'px'});
}
window.onload = funLoad;
window.onresize = funLoad; */
</script>
</head>
<body>
<div class="bar">
		<form action="search_filter.do" class="hearderFrm">
					<table>
						<tr>
							<td>지역</td>
						</tr>
						<tr>
							<td><a id="areaCode" href="search_filter.do?areaCode=01">서울</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0101">종로구</a></td>
							<td><a href="search_filter.do?areaCode=0102">중구</a></td>
							<td><a href="search_filter.do?areaCode=0103">용산구</a></td>
							<td><a href="search_filter.do?areaCode=0104">성동구</a></td>
						<tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0105">광진구</a></td>
							<td><a href="search_filter.do?areaCode=0106">동대문구</a></td>
							<td><a href="search_filter.do?areaCode=0107">중랑구</a></td>
							<td><a href="search_filter.do?areaCode=0108">성북구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0109">강북구</a></td>
							<td><a href="search_filter.do?areaCode=0110">도봉구</a></td>
							<td><a href="search_filter.do?areaCode=0111">노원구</a></td>
							<td><a href="search_filter.do?areaCode=0112">은편구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0113">서대문구</a></td>
							<td><a href="search_filter.do?areaCode=0114">마포구</a></td>
							<td><a href="search_filter.do?areaCode=0115">양천구</a></td>
							<td><a href="search_filter.do?areaCode=0116">강서구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0117">구로구</a></td>
							<td><a href="search_filter.do?areaCode=0118">금천구</a></td>
							<td><a href="search_filter.do?areaCode=0119">영등포구</a></td>
							<td><a href="search_filter.do?areaCode=0120">동작구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0121">관악구</a></td>
							<td><a href="search_filter.do?areaCode=0122">서초구</a></td>
							<td><a href="search_filter.do?areaCode=0123">강남구</a></td>
							<td><a href="search_filter.do?areaCode=0124">송파구</a></td>
						<tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0125">강동구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=02">부산</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0201">중구</a></td>
							<td><a href="search_filter.do?areaCode=0202">서구</a></td>
							<td><a href="search_filter.do?areaCode=0203">동구</a></td>
							<td><a href="search_filter.do?areaCode=0204">영도구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0205">부산진구</a></td>
							<td><a href="search_filter.do?areaCode=0206">동래구</a></td>
							<td><a href="search_filter.do?areaCode=0207">남구</a></td>
							<td><a href="search_filter.do?areaCode=0208">북구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0209">강서구</a></td>
							<td><a href="search_filter.do?areaCode=0210">해운대구</a></td>
							<td><a href="search_filter.do?areaCode=0211">사하구</a></td>
							<td><a href="search_filter.do?areaCode=0212">금정구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0213">연제구</a></td>
							<td><a href="search_filter.do?areaCode=0214">수영구</a></td>
							<td><a href="search_filter.do?areaCode=0215">사상구</a></td>
							<td><a href="search_filter.do?areaCode=0216">기장군</a></td>
						</tr>
						
						
						<tr>
							<td><a href="search_filter.do?areaCode=03">인천</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0301">중구</a></td>
							<td><a href="search_filter.do?areaCode=0302">동구</a></td>
							<td><a href="search_filter.do?areaCode=0303">남구</a></td>
							<td><a href="search_filter.do?areaCode=0304">연수구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0305">남동구</a></td>
							<td><a href="search_filter.do?areaCode=0306">부평구</a></td>
							<td><a href="search_filter.do?areaCode=0307">계양구</a></td>
							<td><a href="search_filter.do?areaCode=0308">서구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0309">강화군</a></td>
							<td><a href="search_filter.do?areaCode=0310">옹진군</a></td>
						</tr>
						
						<tr>
							<td><a href="search_filter.do?areaCode=04">대구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0401">중구</a></td>
							<td><a href="search_filter.do?areaCode=0402">동구</a></td>
							<td><a href="search_filter.do?areaCode=0403">서구</a></td>
							<td><a href="search_filter.do?areaCode=0404">남구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0405">북구</a></td>
							<td><a href="search_filter.do?areaCode=0406">수성구</a></td>
							<td><a href="search_filter.do?areaCode=0407">달서구</a></td>
							<td><a href="search_filter.do?areaCode=0408">달성군</a></td>
						</tr>
						
						<tr>
							<td><a href="search_filter.do?areaCode=05">대전</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0501">동구</a></td>
							<td><a href="search_filter.do?areaCode=0502">중구</a></td>
							<td><a href="search_filter.do?areaCode=0503">서구</a></td>
							<td><a href="search_filter.do?areaCode=0504">유성구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0505">대덕구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=06">광주</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0601">동구</a></td>
							<td><a href="search_filter.do?areaCode=0602">서구</a></td>
							<td><a href="search_filter.do?areaCode=0603">남구</a></td>
							<td><a href="search_filter.do?areaCode=0604">북구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0605">광산구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=07">울산</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0701">중구</a></td>
							<td><a href="search_filter.do?areaCode=0702">남구</a></td>
							<td><a href="search_filter.do?areaCode=0703">동구</a></td>
							<td><a href="search_filter.do?areaCode=0704">북구</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0705">울주군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=08">강원도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0801">춘천시</a></td>
							<td><a href="search_filter.do?areaCode=0802">원주시</a></td>
							<td><a href="search_filter.do?areaCode=0803">강릉시</a></td>
							<td><a href="search_filter.do?areaCode=0804">동해시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0805">태백시</a></td>
							<td><a href="search_filter.do?areaCode=0806">속초시</a></td>
							<td><a href="search_filter.do?areaCode=0807">삼척시</a></td>
							<td><a href="search_filter.do?areaCode=0808">홍천군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0809">횡성군</a></td>
							<td><a href="search_filter.do?areaCode=0810">영월군</a></td>
							<td><a href="search_filter.do?areaCode=0811">평창군</a></td>
							<td><a href="search_filter.do?areaCode=0812">정선군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0813">철원군</a></td>
							<td><a href="search_filter.do?areaCode=0814">화천군</a></td>
							<td><a href="search_filter.do?areaCode=0815">양구군</a></td>
							<td><a href="search_filter.do?areaCode=0816">인제군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0817">고성군</a></td>
							<td><a href="search_filter.do?areaCode=0818">양양군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=09">경기도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0901">수원시</a></td>
							<td><a href="search_filter.do?areaCode=0902">성남시</a></td>
							<td><a href="search_filter.do?areaCode=0903">의정부시</a></td>
							<td><a href="search_filter.do?areaCode=0904">안양시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0905">부천시</a></td>
							<td><a href="search_filter.do?areaCode=0906">광명시</a></td>
							<td><a href="search_filter.do?areaCode=0907">평택시</a></td>
							<td><a href="search_filter.do?areaCode=0908">동두천시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0909">안산시</a></td>
							<td><a href="search_filter.do?areaCode=0910">고양시</a></td>
							<td><a href="search_filter.do?areaCode=0911">과천시</a></td>
							<td><a href="search_filter.do?areaCode=0912">구리시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0913">남양주시</a></td>
							<td><a href="search_filter.do?areaCode=0914">오산시</a></td>
							<td><a href="search_filter.do?areaCode=0915">시흥시</a></td>
							<td><a href="search_filter.do?areaCode=0916">군포시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0917">의왕시</a></td>
							<td><a href="search_filter.do?areaCode=0918">화남시</a></td>
							<td><a href="search_filter.do?areaCode=0919">용인시</a></td>
							<td><a href="search_filter.do?areaCode=0920">파주시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0921">이천시</a></td>
							<td><a href="search_filter.do?areaCode=0922">안성시</a></td>
							<td><a href="search_filter.do?areaCode=0923">김포시</a></td>
							<td><a href="search_filter.do?areaCode=0924">화성시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0925">광주시</a></td>
							<td><a href="search_filter.do?areaCode=0926">양주시</a></td>
							<td><a href="search_filter.do?areaCode=0927">포천시</a></td>
							<td><a href="search_filter.do?areaCode=0928">여주시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=0929">연천군</a></td>
							<td><a href="search_filter.do?areaCode=0930">가평군</a></td>
							<td><a href="search_filter.do?areaCode=0931">양평군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=10">충청남도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1001">천안시</a></td>
							<td><a href="search_filter.do?areaCode=1002">공주시</a></td>
							<td><a href="search_filter.do?areaCode=1003">보령시</a></td>
							<td><a href="search_filter.do?areaCode=1004">아산시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1005">서산시</a></td>
							<td><a href="search_filter.do?areaCode=1006">논산시</a></td>
							<td><a href="search_filter.do?areaCode=1007">계룡시</a></td>
							<td><a href="search_filter.do?areaCode=1008">당진시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1009">금산군</a></td>
							<td><a href="search_filter.do?areaCode=1010">부여군</a></td>
							<td><a href="search_filter.do?areaCode=1011">서천군</a></td>
							<td><a href="search_filter.do?areaCode=1012">청양군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1013">홍성군</a></td>
							<td><a href="search_filter.do?areaCode=1014">예산군</a></td>
							<td><a href="search_filter.do?areaCode=1015">태안군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=16">충청북도</a></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=11">경상북도</a></td>
						</tr>
											<tr>
							<td><a href="search_filter.do?areaCode=1101">포항시</a></td>
							<td><a href="search_filter.do?areaCode=1102">경주시</a></td>
							<td><a href="search_filter.do?areaCode=1103">김천시</a></td>
							<td><a href="search_filter.do?areaCode=1104">안동시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1105">구미시</a></td>
							<td><a href="search_filter.do?areaCode=1106">영주시</a></td>
							<td><a href="search_filter.do?areaCode=1107">영천시</a></td>
							<td><a href="search_filter.do?areaCode=1108">상주시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1109">문경시</a></td>
							<td><a href="search_filter.do?areaCode=1110">경산시</a></td>
							<td><a href="search_filter.do?areaCode=1111">군위군</a></td>
							<td><a href="search_filter.do?areaCode=1112">의성군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1113">청송군</a></td>
							<td><a href="search_filter.do?areaCode=1114">양양군</a></td>
							<td><a href="search_filter.do?areaCode=1115">영덕군</a></td>
							<td><a href="search_filter.do?areaCode=1116">청도군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1117">고령군</a></td>
							<td><a href="search_filter.do?areaCode=1118">성주군</a></td>
							<td><a href="search_filter.do?areaCode=1119">칠곡군</a></td>
							<td><a href="search_filter.do?areaCode=1120">예천군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1121">봉화군</a></td>
							<td><a href="search_filter.do?areaCode=1122">울진군</a></td>
							<td><a href="search_filter.do?areaCode=1123">울릉군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=12">경상남도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1201">창원시</a></td>
							<td><a href="search_filter.do?areaCode=1202">김해시</a></td>
							<td><a href="search_filter.do?areaCode=1203">진주시</a></td>
							<td><a href="search_filter.do?areaCode=1204">양산시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1205">거제시</a></td>
							<td><a href="search_filter.do?areaCode=1206">통영시</a></td>
							<td><a href="search_filter.do?areaCode=1207">사천시</a></td>
							<td><a href="search_filter.do?areaCode=1208">밀양시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1209">함안시</a></td>
							<td><a href="search_filter.do?areaCode=1210">거창군</a></td>
							<td><a href="search_filter.do?areaCode=1211">창녕군</a></td>
							<td><a href="search_filter.do?areaCode=1212">고성군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1213">하동군</a></td>
							<td><a href="search_filter.do?areaCode=1214">합천군</a></td>
							<td><a href="search_filter.do?areaCode=1215">남해군</a></td>
							<td><a href="search_filter.do?areaCode=1216">함양군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1217">산청군</a></td>
							<td><a href="search_filter.do?areaCode=1218">의령군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=13">전라북도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1301">전주시</a></td>
							<td><a href="search_filter.do?areaCode=1302">익산시</a></td>
							<td><a href="search_filter.do?areaCode=1303">군산시</a></td>
							<td><a href="search_filter.do?areaCode=1304">정읍시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1305">김제시</a></td>
							<td><a href="search_filter.do?areaCode=1306">남원시</a></td>
							<td><a href="search_filter.do?areaCode=1307">완주군</a></td>
							<td><a href="search_filter.do?areaCode=1308">고창군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1309">부안군</a></td>
							<td><a href="search_filter.do?areaCode=1310">임실군</a></td>
							<td><a href="search_filter.do?areaCode=1311">순창군</a></td>
							<td><a href="search_filter.do?areaCode=1312">진안군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1313">무주군</a></td>
							<td><a href="search_filter.do?areaCode=1314">장수군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=14">전라남도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1401">목포시</a></td>
							<td><a href="search_filter.do?areaCode=1402">여수시</a></td>
							<td><a href="search_filter.do?areaCode=1403">순천시</a></td>
							<td><a href="search_filter.do?areaCode=1404">나주시</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1405">광양시</a></td>
							<td><a href="search_filter.do?areaCode=1406">담양군</a></td>
							<td><a href="search_filter.do?areaCode=1407">곡성군</a></td>
							<td><a href="search_filter.do?areaCode=1408">구례군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1409">고흥군</a></td>
							<td><a href="search_filter.do?areaCode=1410">보흥군</a></td>
							<td><a href="search_filter.do?areaCode=1411">화순군</a></td>
							<td><a href="search_filter.do?areaCode=1412">장흥군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1413">강진군</a></td>
							<td><a href="search_filter.do?areaCode=1414">해남군</a></td>
							<td><a href="search_filter.do?areaCode=1415">영암군</a></td>
							<td><a href="search_filter.do?areaCode=1416">무안군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1417">함평군</a></td>
							<td><a href="search_filter.do?areaCode=1418">영광군</a></td>
							<td><a href="search_filter.do?areaCode=1419">장성군</a></td>
							<td><a href="search_filter.do?areaCode=1420">완도군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1321">진도군</a></td>
							<td><a href="search_filter.do?areaCode=1322">신안군</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=15">제주도</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?areaCode=1501">제주시</a></td>
							<td><a href="search_filter.do?areaCode=1502">서귀포시</a></td>
						</tr>
						<tr>
							<td>테마</td>
						</tr>
						<tr>
							<td><a href="search_filter.do?gservSub=명소">명소</a></td>
							<td><a href="search_filter.do?gservSub=이색투어">이색투어</a></td>
							<td><a href="search_filter.do?gservSub=문화">문화</a></td>
							<td><a href="search_filter.do?gservSub=자연">자연</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?gservSub=액티비티">스포츠/액티비티</a></td>
							<td><a href="search_filter.do?gservSub=야경">야경</a></td>
							<td><a href="search_filter.do?gservSub=쇼핑">쇼핑</a></td>
							<td><a href="search_filter.do?gservSub=힐링">힐링</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?gservSub=체험">체험</a></td>
							<td><a href="search_filter.do?gservSub=축제">축제</a></td>
							<td><a href="search_filter.do?gservSub=가족">가족여행</a></td>
							<td><a href="search_filter.do?gservSub=단체">단체여행</a></td>
						</tr>
						<tr>
							<td><a href="search_filter.do?gservSub=바다">바다</a></td>
							<td><a href="search_filter.do?gservSub=산">산</a></td>
							<td><a href="search_filter.do?gservSub=기차">기차</a></td>

						</tr>
		</table>
	</form>
</div>
</body>
</html>