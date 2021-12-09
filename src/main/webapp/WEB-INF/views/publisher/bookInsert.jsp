<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상품등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>상품등록페이지</h2>
		<table class="table">
			<thead>
				<tr>
					<th colspan="3">상품등록페이지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookname">책 이름</label>
						</div>
					</td>
							<td><input type="text" class="form-control" name="bookname"></td>
						
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="writername">작가 이름</label>
						</div>
					</td>
					<td><input type="text" class="form-control" name="writername"></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookprice">장 르</label>
						</div>
					</td>
					<td>
					
						 <div class="col-xs-6">
						 <label for="maintype">주 항목</label>
								<select class="form-control" id="maintype">
									<option></option>
									<option>잡지</option>
									<option>수필</option>
									<option>만화</option>
									<option>자기개발서</option>
								</select>
							</div>
							<div class="col-xs-6">
							<label for="maintype">보조 항목</label>
							<select class="form-control" id="subtype">
									<option></option>
									<option>잡지</option>
									<option>수필</option>
									<option>만화</option>
									<option>자기개발서</option>
								</select>
							</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookprice">가 격(원가)</label>
						</div>
					</td>
					<td><input type="text" class="form-control" name="bookprice">
					<p class="help-block">판매가 : 원가 /6*10 비율=6:4</p>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookprice">책 이미지 등록</label>
						</div>
					</td>
					<td><input type="file" name="upfile"></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn btn-default btn-lg" value="등록하기"></td>
					<td><input type="button" class="btn btn-default btn-lg" value="취소하기"></td>
				</tr>
			</tbody>
		</table>
	</div>
	

</body>
</html>
