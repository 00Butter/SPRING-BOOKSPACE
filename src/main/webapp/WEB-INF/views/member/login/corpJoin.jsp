<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="peoJoin" class="form" role="form" align="center">
		<h3 align="left" style="margin-left: 30px; margin-top: 60px"><b>
		<span style="color: rgb(255, 94, 0);">
		*</span>회원 가입</b></h3>
		<hr>
		<h5>기업 회원</h5>
		<div align="center">
			<br> <input type="text" name="id" class="form-control input-lg"	placeholder="ID" style="width: 270px"/> <br>
			<input type="password" name="password" class="form-control input-lg" placeholder="패스워드" style="width: 270px"/> <br>
			<input type="password" name="confirm_password" class="form-control input-lg" placeholder="패스워드 재입력"
			style="width: 270px"/> 
			비번 검사 해쥬<br><br>
			<input type="text" name="name" class="form-control input-lg" placeholder="상호명" style="width: 270px"/>
			<br> <input type="birth" name="birth" class="form-control input-lg" placeholder="개업 년월일 (앞 6자리 입력)"
			style="width: 270px"/> <br>
			<input type="phoneNumber" name="phoneNumber" class="form-control input-lg" placeholder="사업장 전화번호 (- 제외)"
			style="width: 270px"/> <br>
		</div>
		<br>
	</form>

	<div class="container">
		<a href="/bookspace/login/joinComp"><button type="button" class="btn btn-primary">회원가입</button></a>
		<button type="reset" class="btn btn-primary">재입력</button>
	</div>

</body>
</html>