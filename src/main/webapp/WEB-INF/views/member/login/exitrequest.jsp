<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>exit</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<br>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<br> <br> <br>
					<div style="margin-left: 3%">
						<b> <span style="font-size: large; color: black;">회원탈퇴</span>&nbsp;
							| &nbsp;탈퇴신청
						</b>
						<hr style="border-width: medium; border-color: black;">
						<span style="font-size: small;"> 비밀번호 입력 후, 탈퇴 신청을 하시면 탈퇴
							절차가 완료됩니다.</span><br> <br>
							
						<form name="erfr" action="/bookspace/member/delete" method="post">
							<div class="col-sm-8">
								<div class="form-group">
									<input type="hidden" name="id" value="${dto.id }" /> 
									<input	type="hidden" name="pw" value="${dto.pw }"> 
									<label	for="pwd">PASSWORD:</label> 
									<input type="password" class="form-control" name="pwd">
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-primary"
										onclick="exitgo()">탈퇴 신청</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var pub="${publog}";
var msg="${msgpop}";
if(msg!=""){
	alert(msg);
	location.href="/bookspace/home";
}

function exitgo() {
	var a = "${dto.pw}";
	if (document.erfr.pwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		return;
	} else if(document.erfr.pwd.value != a) {
		alert("비밀번호가 맞지않습니다. 다시 확인해주세요.");
		return;
	} else if(document.erfr.pwd.value == a){
		if(pub!=""){
			document.erfr.action="/bookspace/corp/exitre";
			document.erfr.submit();
		}else{
			document.erfr.submit();
		}
	}
}
</script>
</html>