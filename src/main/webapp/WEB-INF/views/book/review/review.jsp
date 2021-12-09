<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		opener.location.href = "/bookspace/review/reviewList";
		self.close();
	}
</script>

<body>

	<div style="margin-left: 10px;">
		<h3 style="font-weight: bold; color: #0066cc;"># 리뷰 작성</h3>
	</div>
	
	<form method="post" name="frm">
		<table class="table" style="font-size: small; margin-top: 5px;">
			<tr>
				<td style="background-color: #e6f0fa;" align="right" width="13%"><b>책이름&nbsp;</b></td>
				<td><input type="text" name="bookname"
					value="${ rDto.bookname }" readonly="readonly"
					style="font-weight: bold; border: none;"/></td>
			</tr>
			<tr>
				<td style="background-color: #e6f0fa;" align="right"><b>별점&nbsp;</b></td>
				<td>
					<select id="star"
						style="color: #ff0000; font-size: medium;">
							<option id="5" value="5">★★★★★</option>
							<option id="4" value="4">★★★★</option>
							<option id="3" value="3">★★★</option>
							<option id="2" value="2">★★</option>
							<option id="1" value="1">★</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="background-color: #e6f0fa;" align="right" height="200px"><b>내용&nbsp;</b></td>
				<td>
					<textarea class="form-control" rows="10" cols="70"
                  style="resize: none; wrap: hard;" maxlength="100" name="review" placeholder="100자 이내 작성"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit" class="btn btn-info" onclick="rvClose(${rDto.num})">등록</button>
				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
      function rvClose(num) {
         var star0 = document.getElementById("star").value;
         var star = document.frm;
         star.method = "post";
         star.action = "/bookspace/review/review?star=" + star0 + "&num=" + num;
         star.submit();
      }
   </script>

</body>