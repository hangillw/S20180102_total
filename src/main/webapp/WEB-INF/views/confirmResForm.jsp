<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.confirm!=null){
		var r = confirm("정말 결정하시겠습니까?");
		if (r == true) {
		    return true;
		} else {
		    return false;
		}
		}else{
			alert("확정여부를 선택하세요");
			return false;
		}
	}

</script>
</head>
<body>
	<form action="confirmResPro.do" name="frm" onsubmit="return chk()">
		<h2>예약 확정/취소</h2>
		Y를 누를경우 예약 확정 N을 선택할 경우 예약이 취소됩니다.
		결정 후 변경할 수 없으니 신중하게 하시기 바랍니다.<br>
		<input type="hidden" name="gservNo" value="${gservNo}"> 
		<input type="hidden" name="tourDate" value="${tourDate}"> 
		Y<input type="radio" name="confirm" value="Y">
		N<input type="radio" name="confirm" value="N">
		<br><input type="submit" value="결정">
	</form>

</body>
</html>