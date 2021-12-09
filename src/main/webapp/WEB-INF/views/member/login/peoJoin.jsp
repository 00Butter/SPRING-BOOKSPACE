<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<script>
	
</script>
<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<br>
					<div class="page-header">
						<h2>개인 회원</h2>
					</div>
					<form name="peoform" method="post" action="?">
						<div class="col-sm-8">
							<div class="row">
								<div class="form-group">
									<div class="col-xs-8">
										<label for="usr">ID :</label> <input type="text"
											class="form-control" name="id" id="id"
											placeholder="영문 대소문자 6~15자 입력하세요.">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-2" style="padding-top: 20px">
										<input type="button" class="btn btn-success btn-sm"
											value="중복확인" id="idck" />
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" name="pw" id="pw"
									placeholder="영문+숫자+특수문자 8~15자리" onkeyup="javascript:pwpt()">
								<p id="pwmsg1"></p>
							</div>
							<div class="form-group">
								<label for="pwd">Password 확인:</label> <input type="password"
									class="form-control" name="pwCheck" id="pwCheck"
									onkeyup="javascript:pwck()">
								<p id="pwmsg2"></p>
							</div>
							<div class="form-group">
								<label for="usr">성명:</label> <input type="text"
									class="form-control" name="name">
							</div>
							<div class="form-group">
								<label for="usr">생년월일:</label> <input type="text"
									class="form-control" name="birth" placeholder="생년월일 앞 6자리">
							</div>
							<div class="form-group">
								<label for="usr">연락처:</label> <input type="text"
									class="form-control" name="phone" placeholder="-포함">
							</div>

							<div class="form-group">
								<label for="usr">성별:</label> <select class="form-control"
									id="sel1" name="gender">
									<option value="gen">성별</option>
									<option value="man">남</option>
									<%-- 값 가져오면 m, w로 나와서 man, woman으로 바꿨어요 --%>
									<option value="woman">여</option>
								</select>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary"
									onclick="javascript:joingo()">가입</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">
	// 각종 패턴확인.널값확인후 전달.
	var ok = false;
	$("#idck").click(function() {
		var idReg = /^[A-Za-z]{6,15}$/g;
		if (!idReg.test($("#id").val())) {
			alert("영문 대소문자 6~15자 입력하세요.");
			return;
		}
		$.post("/bookspace/login/idck", {
			"id" : $("#id").val()
		}, function(res) {
			if (res == "") {
				if (confirm("아이디는 사용가능합니다. 사용하시겠습니까?")) {
					ok = true;
					$("#id").attr("readonly", "readonly");

				}
			} else {
				alert("이미 등록된 아이디입니다.");
			}
		});
	});

	function pwpt() {
		var pw = document.getElementById("pw").value;
		var pwreg = /^((?=.*\d)(?=.*[a-z]).{8,15})$/g;
		if (pwreg.test(pw)) {
			document.getElementById("pwmsg1").innerHTML = "안전한 암호입니다.";
			document.getElementById("pwmsg1").style.color = "green";
		} else {
			document.getElementById("pwmsg1").innerHTML = "형식에 맞춰주세요.";
			document.getElementById("pwmsg1").style.color = "red";
		}
	}

	function pwck() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		if (pw == pwCheck) {
			document.getElementById("pwmsg2").innerHTML = "비밀번호가 일치합니다.";
			document.getElementById("pwmsg2").style.color = "green";
		} else {
			document.getElementById("pwmsg2").innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("pwmsg2").style.color = "red";
		}
	}

	function joingo() {

		var regname = /^[가-힣]{2,}$/;
		var regphone = /^010-?\d{4}-?\d{4}$/;
		var regbirth = /^[0-9]{6,6}$/g;
		var pwreg = /^((?=.*\d)(?=.*[a-z]).{8,15})$/g;

		if (document.peoform.id.value == "") {
			alert("아이디를 입력하세요.");
			return;
		} else if (document.peoform.pw.value == "") {
			alert("비밀번호를 입력하세요.");
			return;
		} else if (document.peoform.name.value == "") {
			alert("이름을 입력하세요.");
			return;
		} else if (document.peoform.birth.value == "") {
			alert("생년월일을 입력하세요.");
			return;
		} else if (document.peoform.phone.value == "") {
			alert("연락처를 입력하세요.");
			return;
		} else if (document.peoform.gender.value == "gen") {
			alert("성별을 선택하세요.");
			return;
		} else if (document.peoform.pw.value != document.peoform.pwCheck.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		} else if (!regname.test($("input[name=name]").val())) {
			alert("성명을 한글로만 적고, 2자이상 적어주세요.");
			return;
		} else if (!regbirth.test($("input[name=birth]").val())) {
			alert("생년월일 앞 6자리 입력");
			return;
		} else if (!pwreg.test($("input[name=pw]").val())) {
			alert("영문+숫자+특수문자 8~15자리");
		} else if (!regphone.test($("input[name=phone]").val())) {
			alert("연락처 : -를 포함한 숫자만 입력하세요.");
			return;
		} else if (!ok) {
			alert("아이디 중복확인해주세요.");
			return;
		} else {

			document.peoform.submit();
		}
	}
</script>
</html>