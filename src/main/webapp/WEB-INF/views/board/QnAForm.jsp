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
						<b> <span style="color: rgb(255, 94, 0);">*</span>����
						</b>
					</h3>
				</div>
				<div class="panel-body">
					<b><span style="font-size: large;">1:1 ģ�����</span></b>
					<hr style="border-width: 8px; border-color: #3399ff">
					<span style="color: #bfbfbf; font-size: small;">��ð�:����17��/�����12�ñ���
						(��ð� ���� �� ������ ���Ǵ� ���� � �ð��� �ż��ϰ� �亯 �帮�ڽ��ϴ�.)</span> <br>

					<form name="QnAfr">
						<table class="table" style="font-size: small;">
							<tr>
								<td style="background-color: #e6f0fa;" align="right" width="20%"><b>ID
										&nbsp;</b></td>
								<td><b>${login} ��</b> <input type="hidden" name="id"
									value="${login}"></td>
							</tr>
							<tr>
								<td style="background-color: #e6f0fa;" align="right"><b>����&nbsp;</b></td>
								<td><input type="text" name="title" id="title" /></td>
							</tr>
							<tr>
								<td style="background-color: #e6f0fa;" align="right"
									height="150px"><b>����&nbsp;</b></td>
								<td><textarea class="form-control" rows="10" cols="70"
										name="content" style="resize: none; wrap: hard;"
										maxlength="100" id="contents"></textarea><br> &nbsp;*����
									������ ���� ������ �ֽø� ��Ȯ�� �亯�� ������ �˴ϴ�.<br> &nbsp;*�ֹε�Ϲ�ȣ�� ������
									������ ������ ���������� ����Ʈ�� ��������� ������ �� �ʿ��� ��찡 �ƴ� ��� ���縦 �ﰡ �� �ֽñ�
									�ٶ��ϴ�.</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="button" class="btn btn-info"
										onclick="javascript:QnAGo()">���</button>
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
					alert("�亯 Ȯ���� ���θ޴� -> 1:1 ���� â���� Ȯ���Ͻ� �� �ֽ��ϴ�.");
					self.close(); 
				} else {
					alert("����");
					self.close();
				}
			});
		}
	</script>
</body>
</html>