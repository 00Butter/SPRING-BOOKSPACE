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
		<span style="color: white;"></span>출판사 문의
	</h3>
	<hr>

	<div class="container" align="left">
		<table border="1"
			style="font-size: small; border-left: 0px none; border-right: 0px none;">
			<tr>
				<td bgcolor="#0066cc" align="center" height="30px" width="60px;"
					style="color: #fff"><b>제목&nbsp;</b></td>
				<td>&nbsp;<input type="text" id="title" /></td>
			</tr>
			<tr>
				<td bgcolor="#0066cc" align="center" height="230px"
					style="color: #fff"><b>문의내용</b></td>
				<td>&nbsp;<input type="text" placeholder="도서명" value="" /> <br>
					<br> &nbsp;<textarea rows="10" cols="70"></textarea><br>
					&nbsp;*문의 내용을 상세히 기재해 주시면 정확한 답변에 도움이 됩니다.<br>
				</td>
			</tr>
		</table>
		<div align="center" style="margin-top: 10px;">
			<button type="button" class="btn btn-primary active btn-info"
				style="background-color: #0066cc; color: #fff; border-color: #0066cc;">문의하기</button>
			&nbsp;&nbsp;
			<button onclick="cancel()" type="button"
				class="btn btn-primary active btn-info"
				style="background-color: #0066cc; color: #fff; border-color: #0066cc;">취소</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	function cancel() {
		self.close();
	}
</script>
</html>