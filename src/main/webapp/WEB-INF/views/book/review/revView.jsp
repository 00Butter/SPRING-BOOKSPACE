<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div style="margin-left: 10px;">
		<h3 style="font-weight: bold; color: #0066cc;"># 작성된 리뷰</h3>
	</div>
	
	<form method="post" name="frm">
		<table class="table" border="1" style="font-size: small; margin-top: 5px; border-color: #e6f0fa;">
			<tr>
				<td style="background-color: #e6f0fa;" align="right" width="13%"><b>책이름&nbsp;</b></td>
				<td><input type="text" name="bookname"
					value="${ rDto.bookname }" readonly="readonly"
					style="font-weight: bold; border: none;"/></td>
			</tr>
			<tr>
				<td style="background-color: #e6f0fa;" align="right"><b>별점&nbsp;</b></td>
				<td>
					<c:if test="${ rDto.star == 5 }">
						<font style="color: #ff0000; font-size: medium;">★★★★★</font>
					</c:if>
					<c:if test="${ rDto.star == 4 }">
						<font style="color: #ff0000; font-size: medium;">★★★★</font>
					</c:if>
					<c:if test="${ rDto.star == 3 }">
						<font style="color: #ff0000; font-size: medium;">★★★</font>
					</c:if>
					<c:if test="${ rDto.star == 2 }">
						<font style="color: #ff0000; font-size: medium;">★★</font>
					</c:if>
					<c:if test="${ rDto.star == 1 }">
						<font style="color: #ff0000; font-size: medium;">★</font>
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="background-color: #e6f0fa;" align="right" height="200px"><b>리뷰&nbsp;</b></td>
				<td>
					<font style="font-weight: bold;">${ rDto.review }</font>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>