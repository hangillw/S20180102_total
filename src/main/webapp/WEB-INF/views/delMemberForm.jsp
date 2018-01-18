<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 처리결과</title>
<style type="text/css">
.body {
	padding-top: 70px;
	padding-left: 250px;
}
</style>

<script type="text/javascript">
	function chk() {
		
		if(frm.pw.value != '${mbDto.pw}') {
			alert("비밀번호를 잘못입력하셨습니다.")
			frm.pw.focus();
			return false;
		}

		if (frm.pw.value != frm.pw2.value) {
			alert("암호가 다릅니다");
			frm.pw.focus();
			return false;
		}

		if($("input:checkbox[id='noticeAgree']").is(":checked") == false) {
			alert("안내 사항을 확인하여 주십시오.")
			return false;
		}
		
		return true;

	}
</script>

</head>
<body>
	<jsp:include page="memberBar.jsp"></jsp:include>
	<section class="body">
		<form action="delMemberPro.do" name="frm" onsubmit="return chk()" method="post">	
			<input type="hidden" name="memberId" value="${mbDto.memberId }">
			<h2>탈퇴 안내</h2>
			<h5>회원탈퇴를 신청하기 전에 안내 사항을 확인해주세요.</h5>
				<p>
					<h4>√ 사용하고 계신 아이디(${mbDto.memberId })는 탈퇴할 경우 복구가 불가능 합니다.</h4>
				</p>
				<p>
					<h4>√ 탈퇴 후 회원정보 및 예약/결제 기록은 모두 삭제됩니다.</h4>
				</p>
				<p>
					<h4>√ 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그래도 남아 있습니다.</h4>
					<h5>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.<br>
					탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
					</h5>
				</p>
				<p>
					<input type="checkbox" id="noticeAgree" value="agree">안내 사항을 모두 확인하였으며, 이에 동의합니다.
				</p>

				▶ 비밀번호 : <input type="password" name="pw" required="required" placeholder="password "><br>
				▶ 비밀번호 확인 : <input type="password" name="pw2"
						placeholder=" confirm password" required="required"><br>
						
				<input type="submit" value="계정 삭제">
				<input type="button" value="취소" onclick="location.href='user_info.do'">
				
		</form>
	</section>
</body>

</html>