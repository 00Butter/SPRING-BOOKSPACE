<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">상세 보기</h3>
		</div>
	</div>

	<div style="margin-left: 2%">

	<table class="table-responsive" border="1"
		style="font-size: small; border-color: white;">
		<tr>
			<td height="40px"><b>제목</b></td>
			<td><textarea rows="1" cols="50" name="title" readonly="readonly">${dto.title }</textarea></td>
		</tr>
		<tr>
			<td height="40px"><b>내용</b></td>
			<td><textarea rows="10" cols="50" name="content" readonly="readonly">${dto.content }</textarea></td>
		</tr>
	</table>
	<div align="center">
	<button type="button" class="btn btn-primary btn-sm" onclick="closee()">닫기</button></div>
	<br><br>


</div>

<script type="text/javascript">
function closee() {
	self.close();
}
</script>

</body>
</html>