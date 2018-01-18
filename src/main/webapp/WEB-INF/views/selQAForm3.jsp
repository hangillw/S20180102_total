<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- ajax쓰려고 가져옴 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src ="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
<!-- ajax 경로 설정 -->
/* $(document).ready(function(){
	//
	$(".lili>a").click(function(){
		$(this).next("ul").toggleClass("hide");
	});
}); */
		
	$(function(){
		var check = 0;
		
		$('input').on('click',function (e){

			var myId = $('#myID').val();
			console.log("myId = "+myId);
			
			//$(this).hide();
			
			check = check + 1; //check가 홀수일때는 append / 짝수일때는 delete
			
			var id=e.target.getAttribute('id');
			if((id != '')&&(id != null)) {console.log(id);}
			//여기까지: id 받아오기 완료
			var data = id;
			console.log("qaNumber는 "+data);
			/* var divId = "escape"; //저장
			var divId2 = "escape"; //삭제시 사용
			var trId = '#'+id+'addRow'; 
			var id2=id+'id';
			var id='#'+id2;
			console.log("id는 "+id);
			var qaContent = $(id).val();
			console.log("qaContent는 "+qaContent); */
			
			//hide를 해보자
			var liid = "#"+data+"lili";
			$(liid).toggle(); //liid로 시작하는 아이디 모두 hide
			//현실과 타협 >> 좀있다 고치기
			$(liid+"1").toggle();
			$(liid+"2").toggle(); 
			$(liid+"3").toggle(); 
			$(liid+"4").toggle(); 
			$(liid+"5").toggle(); 
			$(liid+"6").toggle(); 
			
			<%-- var i = 1;
			<%for(int i=1;i<10;i++){%>
			$(liid+"1").toggle();
			<% }%> --%>
			
			//이제 버튼은 비활성화
			//$('input').attr('disabled', 'disabled');

			//받아온 qaNumber와 qaContent로 ajax
			
						});
	});
</script>

<style type="text/css">
.body {
	padding-top: 70px;
	padding-left: 250px;
}

.left {
	float: left;
}
</style>
</head>
<body>

	<jsp:include page="memberBar.jsp"></jsp:include>
	<section class="body">
	<div>
		<h2>문의사항</h2>
	</div>
	<c:set var="num" value="${pg.total-pg.start+1}" />
	<form action="selqaPro.do">
		<select name="qAreply">
			<!-- 전체일 경우, 아무것도 설정 안하는 것이랑 동일하게 하기위해 null로 지정 -->
			<option value="a" selected="selected">전체 보기</option>
			<option value="y">답변완료</option>
			<option value="n">답변미완료</option>
		</select> <input type="submit" value="필터적용">
	</form>

	<table>
		<%-- <tr>
			<td colspan="5">qAreply는 ${qAreply}</td>
		</tr> --%>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>작성일</th>
		</tr>

		<c:forEach var="qa" items="${qaList}">
			<c:set var="userID" value="${ID}"/> 
			<c:set var="userID2" value="${qa.memberId}"/>
			<c:set var="qaNumber" value="${qa.qaNumber}"/>
			<c:if test="${qa.qaStep==0}"><c:if test="${userID eq userID2}"> 
			
				<tr>
				<td>${num}  문의번호:${qa.qaNumber}<input type="hidden" id="myID" value="${ID}"></td>
				<td>${qa.gservTitle}</td>
				<%-- <td><a href="selqaPro2.do?qaTitle=${qa.gServTitle}">${qa.gServTitle}</a></td> --%>
				<td><input type="hidden" class="qaContents"
					id="${qa.qaNumber}id" value="${qa.qaContent}"> <!-- 이 버튼을 누르면, 해당 객체의 아이디를 알아냄 >> ${qa.qaNumber}를 가져갈 수 있음 -->
					<input type="button" id="${qa.qaNumber}" value="${qa.qaTitle}">${qa.qaStep}
				</td>
				<td>${qa.qaComplete}</td>
				<td>${qa.qaCredate}</td>
			</tr>
			<tr><td></td><td id="${qa.qaNumber}lili" colspan="2" style="display:none">${qa.memberId}가 작성 [내용] ${qa.qaContent}</td><td></td><td></td></tr>
			<c:set var="num" value="${num-1}" />
			<!-- 높은숫자부터 차례로 낮아짐 -->			
			
			</c:if></c:if> 
			<%-- <tbody id="${qa.qaNumber}addRow" style="position: relative;"></tbody> --%>
			<c:forEach var="qa_rpy" items="${qaList_rpy}">
			<c:set var="userID2_rpy" value="${qa_rpy.memberId}"/>
			<c:set var="qaNumber_rpy" value="${qa_rpy.qaNumber}"/>
			<c:if test="${qaNumber_rpy eq qaNumber}">
			<tr><td></td>
			<td id="${qa.qaNumber}lili${qa_rpy.qaStep}" style="display:none" colspan="2">  [답변] ${qa_rpy.qaContent}</td>
			<td></td><td></td></tr>
			</c:if>
			</c:forEach>
			
			
			<%-- <c:if test="${qa.qaStep!=0}"> <!-- 그리고 보내는 사람 ID = 로그인한 사람 ID--> 
			<tr><td></td>
			<td id="${qa.qaNumber}lili${qa.qaStep}" style="display:none" colspan="2">  [답변] ${qa.qaContent}</td>
			<td colspan="2"> <ul><li class="lili" id="${qa.qaNumber}lili${qa.qaStep}" style="display:none"><ul class="hide"><li>[답변] ${qa.qaContent}</li>
			<li>[qaStep : ${qa.qaStep}]</li>
			</ul></li></ul></td>
			<td></td><td></td></tr>
			</c:if> --%>
			 

		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a
			href="selqaPro.do?currentPage=${pg.startPage-pg.pageBlock }&qAreply=${qAreply}">[이전]</a>
	</c:if> <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage }">
		<a href="selqaPro.do?currentPage=${i}&qAreply=${qAreply}">[${i }]</a>
	</c:forEach> <c:if test="${pg.endPage < pg.totalPage }">
		<a href="selqaPro.do?currentPage=${pg.startPage+pg.pageBlock}&qAreply=${qAreply}">[다음]</a>
	</c:if> </section>

</body>
</html>