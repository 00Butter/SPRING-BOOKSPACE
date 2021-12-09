<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>핸드폰 결제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>

<script type="text/javascript">
	var check = false;
	var msg = "${ msg }";
	if (msg != "") {
		alert(msg);
		self.close();
	}
</script>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid"
			style="height: 150px; background-color: #0066cc; border-color: #0066cc;">
			<table style="width: 100%; margin-top: 7px;">
				<tr>
					<td colspan="2" align="left"><img class="img-thumbnail"
						style="background-color: #0066cc; border-color: #0066cc;"
						src="/bookspace/resources/img/bookspace.png" width="180px;"
						height="100px;" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr height="38px;">
					<td style="text-align: left; color: white;"><font face="맑은 고딕">결제
							수단</font></td>
					<td style="text-align: right; color: white;"><input
						type="text"
						style="border: none; background-color: #0066cc; text-align: right; color: white;"
						value="핸드폰 결제" readonly="readonly" /></td>
				</tr>
				<tr height="30px;">
					<td style="text-align: left; color: white;"><font face="맑은 고딕">결제금액</font></td>
					<td
						style="text-align: right; color: white; font-weight: bold; font-size: large;">${mDto.num}원</td>
				</tr>
			</table>
		</div>
	</nav>

	<div class="container" style="margin-top: 10px;">
		<!-- Trigger the modal with a button -->
		<div class="checkbox">
			<label style="font-size: small;"> <input type="checkbox"
				id="check1">개인정보 수집 및 이용에 대한 안내
				<button type="button" class="btn btn-link btn-sm"
					data-toggle="modal" data-target="#myModal1">약관보기</button>
			</label>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal1" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<h4>개인정보 수집 및 이용에 대한 안내</h4>
						<span> 결제서비스와 관련하여 본인으로부터 취득한 개인정보는 「정보통신망 이용촉진 및 정보보호 등에
							관한 법률」 및 「신용정보의 이용 및 보호에 관한 법률」에 따라 본인의 동의를 얻어 다음의 목적을 위해 수집 및
							이용합니다. </span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Trigger the modal with a button -->
		<div class="checkbox">
			<label style="font-size: small;"> <input type="checkbox"
				id="check2">개인정보 제3자 제공동의 (이동통신사)
				<button type="button" class="btn btn-link btn-sm"
					data-toggle="modal" data-target="#myModal2">약관보기</button>
			</label>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<h4>개인정보 제 3자 제공 동의(이동통신사)</h4>
						<span> 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」이 관련 규정을
							준수하여 휴대폰결제를 이용하는 고객으로부터 수집한 개인정보를 아래와 같이 제3자에게 제공 합니다. </span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" align="center">
		<div class="well well-sm"
			style="background-color: white; border-color: #99ebff; border-width: medium; margin-top: 10px;">
			<table
				style="margin-top: 5px; margin-bottom: 7px; text-align: center;">
				<tr>
					<td><label class="radio-inline"> <input type="radio"
							name="optradio" value="skt">SKT
					</label> <label class="radio-inline"> <input type="radio"
							name="optradio" value="kt">KT
					</label> <label class="radio-inline"> <input type="radio"
							name="optradio" value="lg">LG U+
					</label> <label class="radio-inline"> <input type="radio"
							name="optradio" value="helMo">헬로 모바일
					</label></td>
				</tr>
			</table>
			<table style="font-size: small;">
				<tr height="60px;">
					<td>휴대폰 번호&nbsp;</td>
					<td><input type="text" maxlength="13" name="phoneNumber"
						class="form-control input-md" placeholder="ex)010-1234-1234"
						width="180px;" /></td>
					<td>
						<div style="margin-left: 3px;">
							<button type="button" class="btn btn-default btn-sm"
								onclick="codeNum('${mDto.phone}')">인증번호받기</button>
						</div>
					</td>
				</tr>
				<tr height="45px;">
					<td>인증번호&nbsp;&nbsp;</td>
					<td colspan="2"><input type="text" maxlength="4" name="number"
						class="form-control input-md" /></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<br>
	<div style="text-align: center;">
		<button type="button" class="btn btn-md"
			style="width: 150px; background-color: black; color: white;"
			onclick="window.self.close();">취소</button>
		<button type="button" class="btn btn-md"
			style="width: 150px; background-color: #0066cc; color: white;"
			onclick="cashOk('${mDto.num}', '${mDto.cash}')">결제하기</button>
	</div>

	<br>
	<br>
	<br>
	<footer class="container-fluid text-center"
		style="height: 65px; background-color: #0066cc; border-color: #0066cc;">
	</footer>

	<script type="text/javascript">
		var random = Math.floor(Math.random() * (9999 - 1001)) + 1000;

		function codeNum(phone) {
			var check1 = document.getElementById("check1").checked;
			var check2 = document.getElementById("check2").checked;
			var ch = $("input[name=optradio]:radio:checked").length;
			var regphone = /^010-?\d{4}-?\d{4}$/;
			var pp = $("input[name=phoneNumber]").val();
			if (!regphone.test(pp)) {
				alert("핸드폰번호를 정확히입력해주세요");
				return;
			}
			if (check1 == true && check2 == true) {
				if (ch == 0) {
					alert("통신사를 선택해주세요.");
				} else {
					if (($("input[name=phoneNumber]").val()) == "") {
						alert("핸드폰 번호를 입력해주세요.");
					} else if (phone != ($("input[name=phoneNumber]").val())) {
						alert("핸드폰 번호가 일치하지 않습니다.\n저장된 핸드폰 번호 : " + phone);
					} else {
						check = true;
						alert("인증 번호 : " + random);
					}
				}
			} else {
				alert("약관 동의가 필요합니다.");
			}

		}
		function cashOk(plus, cash) {
			var codeNumCh = $("input[name=number]").val();

			if (check == false) {
				alert("인증이 필요합니다.");
			} else if (codeNumCh == "") {
				alert("인증번호를 입력해주세요.");
			} else if (codeNumCh != random) {
				alert("인증번호를 다시 확인해주세요.");
			} else {
				location.href = "/bookspace/pay/cardPhone?plus=" + plus
						+ "&cash=" + cash;
			}
		}
	</script>

</body>
</html>