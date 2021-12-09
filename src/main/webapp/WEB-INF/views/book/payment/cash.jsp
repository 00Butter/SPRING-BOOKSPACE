<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
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

#selP, #infoPhone {
	display: none;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#card").click(function() {
			$("#selP").hide();
			$("#infoPhone").hide();
			$("#selC").show();
			$("#cardList").show();
		});
		$("#phone").click(function() {
			$("#selC").hide();
			$("#cardList").hide();
			$("#selP").show();
			$("#infoPhone").show();
		});
	});
</script>

</head>
<body>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-4">
<!-- 				규격 맞추기 위해서 남겨둠 -->
			</div>
			<div class="col-sm-4 text-left">

				<h3 style="font-weight: bold; color: #0066cc;">bookspace 캐쉬충전</h3>
				<br>
				
				<table class="table table-bordered" style="text-align: left;">
					<tr>
						<td style="background-color: #e6f0fa;">
							<div style="margin-top: 6px; font-weight: bold; color: #666666;">보유캐쉬</div>
						</td>
						<td>
							<div style="margin-top: 6px;">${ mDto.cash }원</div>
						</td>
					</tr>
					<tr>
						<td style="background-color: #e6f0fa;">
							<div style="margin-top: 6px; font-weight: bold; color: #666666;">충전금액</div>
						</td>
						<td><select id="cashSel" onchange="myFunction()"
							style="margin-top: 5px; margin-left: 5px; width: 150px; height: 25px;">
								<option value="1000">1,000</option>
								<option value="3000">3,000</option>
								<option value="5000">5,000</option>
								<option value="10000">10,000</option>
								<option value="20000">20,000</option>
								<option value="50000">50,000</option>
						</select></td>
					</tr>
					<tr>
						<td style="background-color: #e6f0fa;">
							<div style="margin-top: 5px; font-weight: bold; color: #666666;">결제수단</div>
						</td>
						<td>
							<div style="margin-top: 3px;">
								<label class="radio-inline">
									<input type="radio" name="optradio" id="card" value="card" checked="checked">신용카드
								</label>
								<label class="radio-inline">
									<input type="radio" name="optradio" id="phone" value="phone">핸드폰 결제
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td style="background-color: #e6f0fa; border-bottom-color: #e6f0fa; width: 20%;">
							<div id="selC" style="margin-top: 2px; font-weight: bold; color: #666666;">
								카드사 선택
							</div>
							<div id="selP" style="margin-top: 2px; font-weight: bold; color: #666666;">
								핸드폰 결제 안내
							</div>
						</td>
						<td>
							<div id="cardList">
								<select id="cardSel" onchange="myFunction()"
									style="margin-top: 3px; margin-left: 5px;">
									<option value="select">카드사 선택</option>
									<option value="롯데카드">롯데카드</option>
									<option value="신한카드">신한카드</option>
									<option value="국민카드">국민카드</option>
									<option value="삼성카드">삼성카드</option>
									<option value="씨티카드">씨티카드</option>
									<option value="우리카드">우리카드</option>
									<option value="NH카드">NH카드</option>
									<option value="현대카드">현대카드</option>
									<option value="하나카드(외환카드)">하나카드(외환카드)</option>
								</select>
							</div>
							<div id="infoPhone" style="font-size: 11px; width: 100%;">
								* 휴대폰 결제를 사용할수 없는 경우 안내<br>
								미성년자 명의의 휴대폰 (단, KT와 LGU+는 가입자가 성인인 경우 가능<br>
								사업자 폰, 미납상태인 폰, 정액요금제 가입폰, 외국인 폰<br>
								LGU+의 경우 번호이동 및 신규 가입한 경우 가입일로부터 60일 간 월 한도 5만원<br>
								* 휴대폰 결제시 현금영수증 발급 안내<br>
								휴대폰 요금을 현금으로 납부하는 경우에만 해당 이동통신사에서 발급 가능<br>
							</div>
						</td>
					</tr>
				</table>

				<div align="center">
					<button type="button" class="btn btn-lg btn-info"
						onclick="javascript:popupgo()">결제하기</button>
				</div>

				<br> <br> <br>
			</div>

			<div class="col-sm-2">
<!-- 				규격 맞추기 위해서 남겨둠 -->
			</div>

		</div>
	</div>

	<footer class="container-fluid text-center"
		style="height: 50px; background-color: #0066cc; border-color: #0066cc;">

	</footer>

</body>

<script type="text/javascript">
	function popupgo() {
		var data = document.getElementById("card").checked;
		var price = document.getElementById("cashSel").value;

		if (data == true) {
			var cardSel = document.getElementById("cardSel").value;
			
			if(cardSel == "select"){
				alert("카드사를 선택해주세요.");
				return;
			}else{
				var path = "/bookspace/pay/card?comp=" + cardSel + "&price=" + price;
				var size = "width=430px height=540px";
			}
		} else {
			var path = "/bookspace/pay/phone?price=" + price;
			var size = "width=430px, height=630px";
		}

		var popUrl = path;
		var name = "cash";
		var size = size;
		window.open(popUrl, name, size);
		
		window.self.close();
	}
</script>

</html>