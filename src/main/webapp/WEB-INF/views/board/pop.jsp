<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>


	<div>
		<div align="left" style="color: #0066cc">
			<br>
			<p style="color: #000; text-align: center; font-size: 20px;">${title }</p>
		</div>
		<hr>
		<div align="left" style="color: #000;">
			<h3>내용</h3>
			<p> 
				<c:forEach var="each" items="${con }">${each }<br>
				</c:forEach>
			</p>

		</div>

		<div align="center">
			<button type="button"
				style="background-color: #fff; color: #000; border-color: #fff; margin-top: 20px; width: 100px; height :50px;"
				onclick="cancel()">Close</button>
		</div>
	</div>
 

	<script type="text/javascript">
		function cancel() {
			self.close();
		}
	</script>

</body>
</html>