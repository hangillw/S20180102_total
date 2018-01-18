<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입 kkk</title>

<!-- <script type="text/javascript">

	function pop() {
		window.open("popup.do","EventFrame","width=430,height=360,toolbar=no");
	}

</script> -->



</head>
<body>
  
   <c:if test="${msg!=null}">${msg}</c:if>
	<form action="joinMember.do" method="get">
		<table width="100%">
			<tr>
				<td colspan="3" class="center-text">
					<h3 class="desktop-only">회원가입 kkk</h3>
					<p></p>
				</td>
			</tr>
			<tr>
				<td colspan="3"><label for="memberId">아이디 *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class="" id="memberId" name="memberId"
					type="email" value="" required="required" placeholder="email" /></td>
			</tr>

			<tr>
				<td colspan="3"><label for="nickName" class="col2">닉네임
						*</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class="" id="nickName" name="nickName"
					type="text" required="required" placeholder="nickName" /></td>
			</tr>
			<tr>
				<td colspan="3"><label for="pw" class="col2">비밀번호 *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class="" id="pw" name="pw"
					type="password" placeholder="password" required="required" /></td>
			</tr>

			<tr>
				<td colspan="3"><label for="pw2" class="col2">비밀번호 확인 *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class="" id="pw2" name="pw2"
					type="password" placeholder="password" required="required" /></td>
			</tr>

			<tr>
				<td colspan="3"><label for="tel">전화번호 *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class=""  name="tel" type="text"
					value="" placeholder="PhoneNumber" required="required" /></td>
			</tr>

			<tr>
				<td colspan="3"><label for="tel">이름  *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class=""  name="mname" type="text"
					value="" placeholder="mName" required="required" /></td>
			</tr>




			<tr class="first">
				<td colspan="3"><label for="addr" class="col2">*주소</label></td>
			</tr>
			<tr>
				<td colspan="3"><select class="register" id="addr" name="addr"><option
							selected="selected" value="">간단주소</option>
						<option value="0">서울</option>
						<option value="0">경기도</option>
						<option value="0">강원도</option>
						<option value="0">충청도</option>
						<option value="0">전라도</option>
						<option value="0">경상도</option>
						<option value="0">거제도</option>
						<option value="0">제주도</option>
						<option value="0">독도</option>
						<option value="0">북미</option>
						<option value="0">유럽</option>
						<option value="0">아시아</option>
				</select></td>
			</tr>
			
			<tr>
				<td colspan="3"><label for="mimg">사진  *</label></td>
			</tr>
			<tr>
				<td colspan="3"><input class=""  name="mimg" type="text"
					value="" placeholder="mImg" required="required" /></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"> <input
					type="button" class="" value="취소" name="" onclick=""></td>
			</tr>
		</table>
	</form>
</body>
</html>