<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>카드 결제</title>
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
	var msg = "${ msg }";
	if(msg != ""){
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
						value="카드 결제" readonly="readonly" /></td>
				</tr>
				<tr height="30px;">
					<td style="text-align: left; color: white;"><font face="맑은 고딕">결제금액</font></td>
					<td
						style="text-align: right; color: white; font-weight: bold; font-size: large;">${ mDto.num }원</td>
				</tr>
			</table>
		</div>
	</nav>

	<div class="container" align="center" style="margin-top: 7px;">
		<div class="well well-sm"
			style="background-color: white; border-color: #99ebff; border-width: medium; margin-top: 10px;">
			<table style="font-size: small;">
				<tr height="50px;">
					<td style="text-align: right;">카드번호</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" maxlength="4" name="cardNumber1"
						size="4" /> &nbsp;-&nbsp; <input type="password" maxlength="4"
						name="cardNumber2" size="4" /> &nbsp;-&nbsp; <input
						type="password" maxlength="4" name="cardNumber3" size="4" />
						&nbsp;-&nbsp; <input type="text" maxlength="4" name="cardNumber4"
						size="4" /></td>
				</tr>
				<tr height="50px;">
					<td style="text-align: right;">생년월일</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" maxlength="6" name="birth"
						placeholder=" 6자리 입력 ex)160101" /></td>
				</tr>
				<tr height="50px;">
					<td>카드비밀번호</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="password" maxlength="2" name="cardPW"
						size="2" /> **</td>
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
			onclick="javascript:cashCard('${mDto.birth}', '${mDto.name}', '${mDto.num}', '${mDto.cash}')">결제하기</button>
<!-- 			mDto.name이 comp이고, mDto.num이 price -->
	</div>

	<br>
	<br>
	<footer class="container-fluid text-center"
		style="height: 70px; background-color: #0066cc; border-color: #0066cc;">
		<font style="font-weight: bold; font-size: 17px;">${ mDto.name }</font>
	</footer>

	<script type="text/javascript">
		function cashCard(chBirth, comp, price, cash) {
			var regcardNum = /^[0-9]{4,4}$/g;
			var regbirth = /^[0-9]{6,6}$/g;
			var regcardPW = /^[0-9]{2,2}$/g;

			if (!regcardNum.test($("input[name=cardNumber1]").val())
					&& !regcardNum.test($("input[name=cardNumber2]").val())
					&& !regcardNum.test($("input[name=cardNumber3]").val())
					&& !regcardNum.test($("input[name=cardNumber4]").val())) {
				alert("카드번호를 다시 확인해주세요.");
				return;
			} else if (!regbirth.test($("input[name=birth]").val())) {
				alert("생년월일 앞 6자리 입력");
				return;
			} else if (chBirth != ($("input[name=birth]").val())) {
				alert("생년월일이 일치하지 않습니다.");
			} else if (!regcardPW.test($("input[name=cardPW]").val())) {
				alert("카드 비밀번호를 다시 확인해주세요.");
				return;
			}else{
				location.href = "/bookspace/pay/cardCash?plus=" + price + "&cash=" + cash;
			}
			
		}
	</script>

</body>
</html>
