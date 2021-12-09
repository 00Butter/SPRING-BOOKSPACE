<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div class="col-lg-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 공지글 등록
					</h3>
				</div>
				<div class="panel-body">
					<div class="col-lg-6">
						<form name="frm">
							<div class="form-group">
								<select class="form-control">
									<option>종류선택</option>
									<option>공지글</option>
									<option>자주묻는질문</option>
								</select>
							</div>
							<div class="form-group">
								<label for="usr">글 제목 :</label> <input type="text"
									class="form-control" id="title" name="title">
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" id="content"
									name="content"></textarea>
							</div>
							<hr>
							<button type="button" class="btn btn-default" value="등록"
								onclick="insert()">전송</button> 
						</form>  
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
 

	function insert() {  
		$.post("/bookspace/board/insertOffi", {  
			"title" : $("#title").val(), 
			"content" : $("#content").val()
		}, function(data) {
			if (data != "0") {
				alert("공지가 등록되었습니다.");
				location.href="/bookspace/admin/home"
			} else {
				alert("실패");
				self.close();
			}
		});
	}
	
</script>
</html>