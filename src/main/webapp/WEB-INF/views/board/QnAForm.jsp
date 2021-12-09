<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	var msg = "${msgpp}";
	if (msg != "") {
		alert(msg);
		self.close();
	}
</script>
<body>
	<div class="row" style="margin: 2%">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<b> <span style="color: rgb(255, 94, 0);">*</span>문의
						</b>
					</h3>
				</div>
				<div class="panel-body">
					<b><span style="font-size: large;">1:1 친절상담</span></b>
					<hr style="border-width: 8px; border-color: #3399ff">
					<span style="color: #bfbfbf; font-size: small;">운영시간:평일17시/토요일12시까지
						(운영시간 이후 및 공휴일 문의는 다음 운영 시간에 신속하게 답변 드리겠습니다.)</span> <br>

					<form name="QnAfr">
						<table class="table" style="font-size: small;">
							<tr>
								<td style="background-color: #e6f0fa;" align="right" width="20%"><b>ID
										&nbsp;</b></td>
								<td><b>${login} 님</b> <input type="hidden" name="id"
									value="${login}"></td>
							</tr>
							<tr>
								<td style="background-color: #e6f0fa;" align="right"><b>제목&nbsp;</b></td>
								<td><input type="text" name="title" id="title" /></td>
							</tr>
							<tr>
								<td style="background-color: #e6f0fa;" align="right"
									height="150px"><b>내용&nbsp;</b></td>
								<td><textarea class="form-control" rows="10" cols="70"
										name="content" style="resize: none; wrap: hard;"
										maxlength="100" id="contents"></textarea><br> &nbsp;*문의
									내용을 상세히 기재해 주시면 정확한 답변에 도움이 됩니다.<br> &nbsp;*주민등록번호를 포함한
									고객님의 소중한 개인정보는 사이트에 노출되지는 않으나 꼭 필요한 경우가 아닌 경우 기재를 삼가 해 주시길
									바랍니다.</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="button" class="btn btn-info"
										onclick="javascript:QnAGo()">등록</button>
								</td>

							</tr>
						</table>
					</form>
					<br>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function QnAGo() {
			var id = "${login}"
			var t = document.getElementById("title").value;
			var c = document.getElementById("contents").value;
			$.post("/bookspace/board/one", {
				"id" : id,
				"title" : t,
				"contents" : c
			}, function(data) {
				if (data != "") {
					alert("답변 확인은 개인메뉴 -> 1:1 문의 창에서 확인하실 수 있습니다.");
					self.close(); 
				} else {
					alert("실패");
					self.close();
				}
			});
		}
	</script>
</body>
</html>