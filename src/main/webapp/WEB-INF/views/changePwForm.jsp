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

		if (frm.npw.value != frm.npw2.value) {
			alert("암호가 다릅니다");
			frm.pw.focus();
			return false;
		}
		return true;

	}
</script>

</head>
<body>
	<jsp:include page="memberBar.jsp"></jsp:include>
	<section class="body">
           <p> Password 수정시 전달  Message : ${message} <p>
	
		<form action="changePasswd.do" name="frm" onsubmit="return chk()" method="post">
			 <input type="hidden" value="${memberId}" name="memberId">
			<h2>비밀번호 변경</h2>
			
			<table>

				<tr>

					<td>▶ID : ${memberId }</td>
				</tr>

				<tr>

					<td>▶현재 비밀번호 : <input type="password" name="pw"
						placeholder="password" required="required">
						</td>
				</tr>

				<tr>

					<td>▶새 비밀번호 : <input type="password" name="npw"
						placeholder=" new password " required="required">
						<br>*비밀번호는 6~14자 영문/숫자/특수문자를 혼합하여 사용하실수 있습니다.</td>
				</tr>

				<tr>

					<td>▶변경 비밀번호 확인 : <input type="password" name="npw2"
						placeholder=" confirm new password " required="required"><br>
						ㆍ변경하실 비밀번호를 다시한번 입력해 주세요.</td>
							
				</tr>

				<tr>

					<td><input type="submit" value="비밀번호변경"></td>
					<td><input type="reset" value="다시"></td>
				</tr>

			</table>
		</form>
	</section>
</body>

</html>