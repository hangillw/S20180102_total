<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Follow Me:나의 즐거운 여행 파트너</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script type="text/javascript" src = "js/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 
<style type="text/css">
/* 기본 셋팅 */
body {
	margin: 0;
	padding: 0px;
}
ul, p {
	margin: 0;
}
li {
	list-style: none;
}
.hearderFrm {
	margin:0px;
}
/* 헤더 */
.header_top {
	margin-left:-15px;
	padding-left:30px;
	width: 100%;
	height: 50px;
	position:fixed;
	top:0;
	background-color: #FFFFFF;
	z-index: 1;
}

.navbar-header {
	width: 100%;
	height: 50px;
	position: absolute;
	margin-top: 50px;
	background-color: rgb(61,183,204);
}

.logoArea {
	float:left;
	padding-top:10px;
}

.loginArea {
	float:right;	
}


.searchArea{
	float:right;
}

.category {
	float:left;
	margin-left: 50px;
}
.left {
	float:left;
}
.categoryList{
	margin: 0px;
	width:100%;
	height: 400px;
	background-color : #ffffff; 
	opacity : 0.9;
	position: absolute;
	top:100px; 
	left:0px;
	border-bottom: 1px solid gray;
	display: none; 
}

#user_bar {
	display:none;
	background-color: #ffffff;
	padding: 10px 30px 10px 30px;
	border : 1px solid gray;
	position: absolute;
	left:auto;	
	right:auto;
	border-radius: 5px;
}

/* 검색 관련 css */
.search {
	border-radius: 3px;
	width: 260px;
	height: 30px;
	padding: 0px 20px 0px 20px;
	outline: none;
	border: none;
	font-size: 13px;
	
}
form {
	margin:0;
}
.btn {
	height: 30px;
}

/* 이미지 사이즈 조정 */
#logo {
	width: 150px;
	height: 30px;
}
#user {
	width:50px;
	height:45px;
	margin-top:2.5px;
}
#loginLogo {
	width: 40px;
	height: 40px;
	border-radius: 20px;
	border: 1px solid gray;
	margin-top: 5px;
}
#srch_img{
	margin-bottom: -10px;
	margin-top:10px;
	margin-right:30px;
	width: 43px;
	height:35px;
}
/* 로그인 팝업 css */


/* /* 태욱 인기 검색어 css*/
.searchKey {border:2px solid #d81f25; padding:0 5px; height:20px; overflow:hidden; background:#fff; width:100px; font-family:Gulim; font-size:12px;}
.searchKey ul,
.searchKey li {margin:0; padding:0; list-style:none;}
.searchKey li a {display:block; height:20px; line-height:20px; color:#555; text-decoration:none;}
.searchKey li span {padding:2px 5px; background:#d81f25; color:#fff; font-weight:bold; margin-right:3px;}
 */

</style>

<script type="text/javascript">
	function toggleUser() {
		$('#user_bar').toggle();
	};

	function openCategory() {
		$('.categoryList').toggle();
		/* if($('.category1').css("color")=="rgb(159, 34, 34)"){
			$('.category1').css("color","#FFA7A7");
		} else {
			$('.category1').css("color","#9F2222");
		} */
	};
	
	
	function closeCategory(){
	   $('.categoryList').hide();
	};
	
	$(function(){
		
		
		
		
	});
	
	/* function patterChk() {
		var pattern = /([^가-힣\x20])/i; 
		//var fld = "가나다라마사"; 
		var fld = $('input[name=keyword]').val();
		if (pattern.test(fld)) { 
		    alert("한글이 아닙니다. (자음, 모음만 있는 한글은 처리하지 않습니다.)"); 
		    return false;
		} 
	} */
</script>

</head>
<body>
						
<!-- 로그인 팝업창 -->
	<div class="modal fade" id="plogin" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">닫기</button>
				</div>
				<div class="modal-body">
						<h1 class="modal-title">follow me</h1>
						<form action="logIn.do"  method="post" name=frm onsubmit="return chk()"  >	
								<b><mark>환영합니다.</mark></b>
								<hr style="color: grey; border-style: dotted">
								<table>
									<tr>
										<td> <input type="email" id="memberId" name="memberId" size="20"  
											 maxlength="20" autofocus required="required" placeholder="이메일"></td>
									</tr>
									<tr>
										<td> <input type="password" id="pw" name="pw" 
											size="20"  maxlength="20" required="required" placeholder="비밀번호"></td>
									</tr>
									<tr>
										<td>
											<hr style="color: gray; border-style: dotted">
										</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="rememberId" name="rememberId">로그인 정보기억</td>
									</tr>
									<tr>
										<td><input type="submit" value="로그인"  ></td>
									</tr>
									<tr>
										<td>원하는 소셜계정으로 로그인</td>
									</tr>
									<tr>
										<td><a href="http://www.facebook.com" target="_blank"><img
												src="${pageContext.request.contextPath}/items/face_img.png" alt="페이스북이미지"></a> <a
											href="http://www.google.com" target='_blank'><img
												src="${pageContext.request.contextPath}/items/google_img.png" alt="구글이미지"></a></td>
									</tr>
									<tr>
										<td>
											<a href="pswFindForm.do">
												<p text-align="light">비밀번호를 잊으셨어요?</p>
											</a>
										</td>
									</tr>
									<tr>
										<td>
											not a member?<a href="joinForm.do">Sign Up</a>
										</td>
									</tr>
								</table>
									</form>
								</div>
								<div class="modal-footer">		
								</div>	
						     </div>
					      </div>
				       </div>
<!-- 헤더 -->
	<div class="header_top">
			<!-- 로고 영역 -->
			<div class="logoArea">
				<img id="logo" src="${pageContext.request.contextPath}/items/logo2.JPG" alt="logo이미지"
					 onclick='location.href="main.do"'>	 
			</div>
			<div class="container">
			<!-- 로그인 영역 -->
			<div class="loginArea">
						<!-- 로그아웃 상태 -->
						<c:if test="${loginChk == null || loginChk == 0}">	
							<!-- <a href="logInForm.do">로그인</a>	 -->		
							<a data-toggle="modal" data-target="#plogin" role="button"> 
								<img id="user" src="${pageContext.request.contextPath}/items/user.png">
							</a>
						</c:if>							
						<!-- 로그인 상태 -->
						<c:if test="${loginChk == 1 }">
							<img class= "right" onclick="toggleUser()" id= "loginLogo" src="${pageContext.request.contextPath}/images/${mbDto.mimg}" onerror="this.src='${pageContext.request.contextPath}/items/login.png'">
							<!-- 관리자 아님 -->
							<c:if test="${managerChk!=1}">
									<ul id="user_bar">
										<li>${mbDto.nickName }</li>
											<c:if test="${guideChk ==1 }">
												<li>가이드</li>
											</c:if>
											<c:if test="${managerChk!=1 && guideChk!=1 }">
												<li>회원</li>
											</c:if>
										<hr>
										<li><a href="user_info.do">프로필 관리[회원]</a></li>
										<li><a href="wishList.do">위시리스트</a></li>
										<li><a href="reservation_member.do">나의 여행</a></li>
										<li>P : ${mbDto.mpoint }</li>
										<hr>
										<!-- 가이드가 아닐 때 -->
										<c:if test="${guideChk == null || guideChk == 0 }">
											<li>가이드 등록하기</li>
										</c:if>
										
										<!-- 가이드 일 때 -->
										<c:if test="${guideChk == 1 }">
											<li><a href="profile_guide.do?gno=${gDto.gno }">프로필 관리[가이드]</a></li>							
											<li><a href="inGServForm.do?gno=${gDto.gno }">가이딩 : 상품 등록</a></li>							
											<li><a href="service_guide.do?gno=${gDto.gno }">나의 가이딩</a></li>							
										</c:if>
										<li><a href="logout.do">로그아웃</a></li>
									</ul>
							</c:if>
							<!-- 관리자 계정임 -->
							<c:if test="${manageChk==1 }">
								<ul id="user_bar">
										<li><a href="mb_List.do">회원 관리</a></li>
										<li><a href="gd_manager.do">가이드 관리</a></li>
										<li><a href="service_manager.do">상품 관리</a></li>
										<li><a href="review_manager.do">후기 관리</a></li>
										<li><a href="notice_manager.do">공지사항 관리</a></li>
										<li><a href="QA_manager.do">문의사항 관리</a></li>
								</ul>
							</c:if>
						</c:if>
				</div>
				<!-- 검색영역 -->	
					<div class="searchArea">
						<!-- <form action="search_Keyword.do" onsubmit="return patterChk()"> -->
						<form action="search_Keyword.do">
							<input type="text" class="search" name="keyword" placeholder="검색하세용"></input> 
							<input type="image" id="srch_img" name="submit" src="${pageContext.request.contextPath}/items/search.png" value="" />
						</form>	
					</div>
			
			</div>
		</div>

	<div class="navbar-header" id ="category">
		<div class="container">
			<ul style="margin-top: 10px">
				<li class="category1 left" onclick="openCategory()">CATEGORY</li>
				<li class="category" onclick="location.href='notice.do'">NOTICE</li>
				<li class="category" onclick="location.href='QA.do'">Q&A</li>
				<li class="category" onclick="location.href='aboutUs.do'">ABOUT US</li>
			</ul>
			<ul style="margin-top: 10px">
				<li style="float:right;">인기검색어<div id="searchKey"><ul id="ticker">
					
				</ul>
				</div></li>
			</ul>
		</div>
	</div>
		
		

	<form action="search_filter.do" class="hearderFrm">
		<input type="hidden" id="leadTime" name="gServLeadTime"/>

		<div class="categoryList">
			<div class ="list container">
				<div style="display:inline-block; padding: 150px 10px 20px 10px; border-left:1px solid lightgray; border-right:1px solid lightgray; text-align: center;">지역
				</div>			
				<div style="display: inline-block;">	
					<ul>
						<li><input type = "radio" name = "areaCode" value ="01">서울</li>
						<li><input type = "radio" name = "areaCode" value ="02">부산</li>
						<li><input type = "radio" name = "areaCode" value ="03">인천</li>
						<li><input type = "radio" name = "areaCode" value ="04">대구</li>
						<li><input type = "radio" name = "areaCode" value ="05">대전</li>
						<li><input type = "radio" name = "areaCode" value ="06">광주</li>
						<li><input type = "radio" name = "areaCode" value ="07">울산</li>
						<li><input type = "radio" name = "areaCode" value ="15">제주도</li>
					</ul>
				</div>
				<div style="display: inline-block;">
					<ul><br>
						<li><div style="margin: 20px 0 5px 0;"></div></li>			
						<li><input type = "radio" name = "areaCode" value ="08">강원도</li>
						<li><input type = "radio" name = "areaCode" value ="09">경기도</li>
						<li><input type = "radio" name = "areaCode" value ="10">충청남도</li>
						<li><input type = "radio" name = "areaCode" value ="16">충청북도</li>
						<li><input type = "radio" name = "areaCode" value ="12">경상남도</li>
						<li><input type = "radio" name = "areaCode" value ="11">경상북도</li>
						<li><input type = "radio" name = "areaCode" value ="14">전라남도</li>
						<li><input type = "radio" name = "areaCode" value ="13">전라북도</li>
					</ul>
				</div>
				<div style="display:inline-block; margin-left: 50px; padding: 150px 10px 20px 10px; border-left:1px solid lightgray; border-right:1px solid lightgray; text-align: center;">테마별
				</div>		
				<div style="display: inline-block;">
					<ul>
						<li><input type = "checkbox" name = "gServSub" value="명소"> 명소</li>
						<li><input type = "checkbox" name = "gServSub" value="음식"> 음식</li>
						<li><input type = "checkbox" name = "gServSub" value="이색"> 이색투어</li>
						<li><input type = "checkbox" name = "gServSub" value="문화"> 문화</li>
						<li><input type = "checkbox" name = "gServSub" value="자연"> 자연</li>
						<li><input type = "checkbox" name = "gServSub" value="액티비티"> 스포츠/액티비티</li>
						<li><input type = "checkbox" name = "gServSub" value="야경"> 야경</li>
						<li><input type = "checkbox" name = "gServSub" value="쇼핑"> 쇼핑</li>
						
					</ul>
				</div>
				<div style="display: inline-block;">
					<ul>	
						<li><input type = "checkbox" name = "gServSub" value="힐링"> 힐링</li>	
						<li><input type = "checkbox" name = "gServSub" value="체험"> 체험</li>
						<li><input type = "checkbox" name = "gServSub" value="축제"> 축제</li>
						<li><input type = "checkbox" name = "gServSub" value="가족"> 가족여행</li>
						<li><input type = "checkbox" name = "gServSub" value="단체"> 단체여행</li>
						<li><input type = "checkbox" name = "gServSub" value="바다"> 바다</li>
						<li><input type = "checkbox" name = "gServSub" value="산"> 산</li>
						<li><input type = "checkbox" name = "gServSub" value="기차"> 기차</li>
					</ul>
				</div>
				<div style="display: inline-block;">
					<ul>
						<li><div style=" width: 70px; background-color: #005766; color: white; margin: 20px 0 5px 0; text-align: center; border-radius: 5px">요일별</div></li>			
						<li><input type = "checkbox" name = "gServDay" value="D1">월</li>
						<li><input type = "checkbox" name = "gServDay" value="D2">화</li>
						<li><input type = "checkbox" name = "gServDay" value="D3">수</li>
						<li><input type = "checkbox" name = "gServDay" value="D4">목</li>
						<li><input type = "checkbox" name = "gServDay" value="D5">금</li>
						<li><input type = "checkbox" name = "gServDay" value="D6">토</li>
						<li><input type = "checkbox" name = "gServDay" value="D7">일</li>
					</ul>
				</div>
			</div>
		<div style="clear: both; text-align: center" >
			<input type ="submit" value="검색하기">
			<input type ="button" onclick="closeCategory()" value="닫기">
		</div>
		</div>

	</form>
</body>
</html>