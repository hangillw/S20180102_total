<%@page import="oracle.java.s20180102.model.QADto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
<!-- ajax 경로 설정 -->
<%String context = request.getContextPath();%>
	
	// 답변달기 등록
	function inReply(id) {
		alert("버튼 누름");
		var id_rpy = id; //qaNumber
		var id_content = '#'+id_rpy+'inReply'; 
		var con = $(id_content).val(); //qacontent
		var id_memberId = '#'+id_rpy+'memberId'; 
		var mem = $(id_memberId).val(); //memberId -> receiverId로 저장
		var id_gservNo = '#'+id_rpy+'gservNo';
		var gservNo = $(id_gservNo).val(); //gServNo
		var id_receiver = '#'+id_rpy+'qaReceiver';
		var rec = $(id_receiver).val(); //문의를 받았던 receiver -> 답변 작성 memerber
		alert("qaNumber = "+id_rpy);
		var tbId = '#'+id_rpy+'addRow'; //tbody의 Id

		
		//qaDto에 넣을 변수들
		var send_qaNumber = id_rpy;
		var send_qacontent = con;
		var send_qareceiver = mem; 
		var send_gServNo = gservNo;
		var send_memberId = rec; 
		
		//되는지 잘 모르겠음..객체생성
		/* function qa(qaNumber,qacontent,qareceiver,qServNo,memberId){
			this.qaNumber = qaNumber;
			this.qacontent = qacontent;
			this.qareceiver = qareceiver;
			this.qServNo = qServNo;
			this.memberId = memberId;
		}
		var data = new qa(send_qaNumber,send_qacontent,send_qareceiver,send_gServNo,send_memberId);
		////////////////////////////////////////
		
		//array생성해서 보내자
		var qa = new Array();
		qa.push(send_qaNumber);
		qa.push(send_qacontent);
		qa.push(send_qareceiver);
		qa.push(send_gServNo);
		qa.push(send_memberId);
		/* qa[0] = send_qaNumber;
		qa[1] = send_qacontent;
		qa[2] = send_qareceiver; 
		qa[3] = send_gServNo;
		qa[4] = send_memberId; 
		
		//var data = qa;
		
		alert("data = "+data);
		alert("send_qaNumber = "+send_qaNumber);
		alert("send_qacontent = "+send_qacontent);
		alert("send_gServNo : "+send_gServNo);
		alert("send_memberId :"+send_memberId); 
	    var data = JSON.stringify(data1); */
		
		$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
		
		if(id_rpy!=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/writeqa_guide.do',
											data : {send_qaNumber : send_qaNumber, send_qacontent:send_qacontent,send_qareceiver:send_qareceiver,send_gServNo:send_gServNo,send_memberId:send_memberId},
											dataType : 'json',
											error : function() {
												console.log("error");
											},
											success : function(data) {
												if (data == null || data == '') {
													data = 0;
												}
													$(tbId).append( "<tr><td></td>"  
																			+ "<td>└ [답변] "
																			+ data['qaContent']
																			+ "</td>"
																			+ "<td></td><td>"
																			+ data['qaComplete']
																			+ "</td>" //미정
																			+ "<td>"
																			+ data['memberId']
																			+ "</td>"
																			+ data['qaCredate']+"</tr>");
													
											}
											
										});
		}
	}
	
	// hide&show 수행
	$(function() {
		var check = 0;

		$('input').on('click', function(e) {

			var id = e.target.getAttribute('id'); //id="${qa.qaNumber}"
			if ((id != '') && (id != null)) {
				console.log(id);
			}
			//여기까지: id 받아오기 완료

			/* if(id == "diff"){alert("diff");} */
			if (id != "diff") {
				var data = id;
				console.log("qaNumber는 " + data);

				//hide를 해보자
				var liid = "#" + data + "lili";
				var liid2 = "#" + data + "lilili";
				var liid3 = "#" + data + "lililili";
				var liid4 = "#" + data + "rpy";
				$(liid).toggle(); //liid로 시작하는 아이디 모두 hide
				//현실과 타협 >> 좀있다 고치기
				$(liid + "1").toggle();
				$(liid + "2").toggle();
				$(liid + "3").toggle();
				$(liid + "4").toggle();
				$(liid + "5").toggle();

				$(liid2 + "1").toggle();
				$(liid2 + "2").toggle();
				$(liid2 + "3").toggle();
				$(liid2 + "4").toggle();
				$(liid2 + "5").toggle();

				$(liid3 + "1").toggle();
				$(liid3 + "2").toggle();
				$(liid3 + "3").toggle();
				$(liid3 + "4").toggle();
				$(liid3 + "5").toggle();

				$(liid4).toggle();
			}
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
	<!-- 사용가능한 변수
	: pg, ID, gServList, qaGuideList -->

	<jsp:include page="guideBar.jsp"></jsp:include>
	<section class="body">
	<div>
		<h2>문의확인</h2>
	</div>
	<c:set var="num" value="${pg.total-pg.start+1}" />
	<form action="selGuideqaPro.do">
		<select name="qAreply">
			<!-- 전체일 경우, 아무것도 설정 안하는 것이랑 동일하게 하기위해 null로 지정 -->
			<option value="a" selected="selected">전체 보기</option>
			<option value="y">답변완료</option>
			<option value="n">답변미완료</option>
		</select> <select name="gServTitle">
			<option value="a">전체보기</option>
			<c:forEach var="gSTitle" items="${gServList}">
				<!-- 존재하는 gService 전부 호출 -->
				<option value="${gSTitle.gservTitle}">${gSTitle.gservTitle}</option>
			</c:forEach>
		</select> <input type="submit" value="필터적용">
	</form>

	<table>
		<%-- <tr>
			<td>qAreply는 ${qAreply}</td>
			<td>gServTitle는 ${gServTitle}</td>
		</tr> --%>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>


		<c:forEach var="qa" items="${qaGuideList}">
			<c:set var="userID" value="${ID}" />
			<c:set var="receiverID" value="${qa.qaReceiver}" />
			<c:set var="qaNumber" value="${qa.qaNumber}" />
			<!-- 로그인한 아이디=문의받는사람, qastep=0인 경우가 ★기본 문의★ -->
			<tr>
				<td><input type="hidden" id="${qa.qaNumber}qaReceiver" value="${qa.qaReceiver}">${num}</td>
				<td><input type="hidden" id="${qa.qaNumber}gservNo" value="${qa.gservNo}">${qa.gservTitle} </td>
				<td><input type="button" id="${qa.qaNumber}"
					value="${qa.qatitle}"></td>
				<td>${qa.qacomplete}</td>
				<td><input type="hidden" id="${qa.qaNumber}memberId" value="${qa.memberId}">${qa.memberId}</td>
				<td>${qa.qacredate}</td>
				
			</tr>
			<tr>
				<td></td>
				<td id="${qa.qaNumber}lili" colspan="3" style="display: none">
					[내용] ${qa.qaContent}</td>
				<td></td>
				<td></td>
			</tr>
			<c:set var="num" value="${num-1}" />
			<!-- 높은숫자부터 차례로 낮아짐 -->

			<!-- 해당 ★기본 문의★의 답변내용 -->
			<c:forEach var="qa_rpy" items="${qaGuideList_rpy}">
				<c:set var="userID2_rpy" value="${qa_rpy.memberId}" />
				<c:set var="qaNumber_rpy" value="${qa_rpy.qaNumber}" />
				<c:if test="${qaNumber_rpy eq qaNumber}">
					<tr>
						<td></td>
						<td id="${qa_rpy.qaNumber}lili${qa_rpy.qaStep}"
							style="display: none" colspan="3">└ [답변] ${qa_rpy.qaContent}</td>
						<td id="${qa_rpy.qaNumber}lilili${qa_rpy.qaStep}"
							style="display: none">${qa_rpy.memberId}</td>
						<td id="${qa_rpy.qaNumber}lililili${qa_rpy.qaStep}"
							style="display: none">${qa_rpy.qaCredate}</td>
					</tr>
				</c:if>
			</c:forEach>
			<tbody id="${qa.qaNumber}addRow" style="position: relative;"></tbody>
			<tr>
				<td></td>
				<td id="${qa.qaNumber}rpy" style="display: none" colspan="3">
				<input type="text" id="${qa.qaNumber}inReply"><input type="button" id="diff" onclick="inReply(${qa.qaNumber});" value="답변달기">
				</td>
			</tr>
		</c:forEach>

	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a
			href="selGuideqaPro.do?currentPage=${pg.startPage-pg.pageBlock }&qAreply=${qAreply}&gServTitle=${gservTitle}">[이전]</a>
	</c:if> <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage }">
		<a
			href="selGuideqaPro.do?currentPage=${i}&qAreply=${qAreply}&gservTitle=${gservTitle}">[${i }]</a>
	</c:forEach> <c:if test="${pg.endPage < pg.totalPage }">
		<a
			href="selGuideqaPro.do?currentPage=${pg.startPage+pg.pageBlock }&qAreply=${qAreply}&gServTitle=${gservTitle}">[다음]</a>
	</c:if> </section>
	</section>
</body>
</html>