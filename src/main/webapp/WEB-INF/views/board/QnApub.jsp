<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3 align="left"
		style="margin-top: 20px; margin-left: 20px; color: #0066cc; letter-spacing: 5px; font-style: italic;">
		<span style="color: white;"></span>���ǻ� ����
	</h3>
	<hr>

	<div class="container" align="left">
		<table border="1"
			style="font-size: small; border-left: 0px none; border-right: 0px none;">
			<tr>
				<td bgcolor="#0066cc" align="center" height="30px" width="60px;"
					style="color: #fff"><b>����&nbsp;</b></td>
				<td>&nbsp;<input type="text" id="title" /></td>
			</tr>
			<tr>
				<td bgcolor="#0066cc" align="center" height="230px"
					style="color: #fff"><b>���ǳ���</b></td>
				<td>&nbsp;<input type="text" placeholder="������" value="" /> <br>
					<br> &nbsp;<textarea rows="10" cols="70"></textarea><br>
					&nbsp;*���� ������ ���� ������ �ֽø� ��Ȯ�� �亯�� ������ �˴ϴ�.<br>
				</td>
			</tr>
		</table>
		<div align="center" style="margin-top: 10px;">
			<button type="button" class="btn btn-primary active btn-info"
				style="background-color: #0066cc; color: #fff; border-color: #0066cc;">�����ϱ�</button>
			&nbsp;&nbsp;
			<button onclick="cancel()" type="button"
				class="btn btn-primary active btn-info"
				style="background-color: #0066cc; color: #fff; border-color: #0066cc;">���</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	function cancel() {
		self.close();
	}
</script>
</html>