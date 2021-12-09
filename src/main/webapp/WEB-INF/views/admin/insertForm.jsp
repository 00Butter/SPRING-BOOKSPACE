<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<script type="text/javascript">
window.onload=function(){
	var msg="${msg}";
	if(msg!=""){
		alert(msg);
	}
}
</script>
<body>
	<div class="row">
		<div class="col-lg-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 관리자 등록
					</h3>
				</div>
				<div class="panel-body">
					<div class="col-lg-6">
					<form action="/bookspace/admin/join" method="post" name="insert">
						<div class="form-group">
							<label for="usr">Name :</label> 
							<input type="text" name="name"
								class="form-control" id="name">
						</div >
						<div class="form-group">
							<label for="pwd">Phone :</label> <input type="text" name="phone"
								class="form-control" id="phone" placeholder="01012341234(-)제외">
						</div>
						<hr>
						<input type="button" class="btn btn-default" onclick="javascript:insertgo()" value="등록">
					</form>
					</div>					
				</div>

			</div>
		</div>
	</div>
<script type="text/javascript">


function insertgo(){
	
	var regname=/^[가-힣]{1,}$/;
	var regphone=/^010-?\d{4}-?\d{4}$/;
	var name=document.insert.name.value;
	var phone=document.insert.phone.value;
	if(name.match(regname)){
		var phn=regphone.test(phone);
		if(phone.match(regphone)){
			document.insert.submit();
		}else{
			alert("제대로입력해주세요");;
		}
	}else{
		alert("제대로입력해주세요");;
}}

</script>
</body>
</html>

