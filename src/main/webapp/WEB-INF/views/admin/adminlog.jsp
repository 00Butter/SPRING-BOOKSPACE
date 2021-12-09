<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div class="row" >
	<div class="col-lg-1">
	</div>
	<div class="col-lg-10">
			<p>시리얼 넘버를 부여받은 관리자만 접근 가능합니다.</p>
			<form name="adminlog" method="post">
				<div class="form-group">
					<label for="usr">시리얼 넘버 :</label> <input type="text"
						class="form-control" name="no">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-block"
						onclick="javascript:logGo()">
						Check <span class="glyphicon glyphicon-ok"></span>
					</button>
				</div>
			</form>
		</div></div>
	




	<script type="text/javascript">
function logGo() {
	var no=document.adminlog.no.value;
	if(no==""){
		alert("입력해주세요");
	}else{
		document.adminlog.action="/bookspace/admin/log";
		document.adminlog.submit();
	}
}

</script>

</body>
</html>

