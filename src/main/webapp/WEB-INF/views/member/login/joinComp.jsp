<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var msg = "${joinmsg}";
	if (msg != "") {
		alert(msg);
	}
</script>
<body>

	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
			<h3 align="left" style="margin-top: 10%">
				<b> <span style="color: rgb(255, 94, 0);">*</span>회원 가입
				</b>
			</h3>
			<hr>

			<div class="container">

				<div class="panel panel-default">
					<div class="panel-body">
						<br> <b><h4>
								BookSpace <span style="color: orange;">회원가입이 완료</span>되었습니다.
							</h4> <br> 등록하신 정보는 로그인 후 <span style="color: orange;">마이페이지
								> 회원정보 수정</span> 메뉴에서 변경할 수 있습니다.<br> <span style="color: white;">.</span></b>
					</div>
				</div>

				<div align="center">
					<a href="/bookspace/"><button type="button"
							class="btn btn-primary btn-lg active">메인페이지로 이동</button></a> <a
						href="/bookspace/login/loginForm"><button type="button"
							class="btn btn-primary btn-lg active">로그인</button></a>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>
