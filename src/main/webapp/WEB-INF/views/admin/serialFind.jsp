<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="row" style="margin: 2%">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">시리얼넘버찾기</h3>
				</div>
				<div class="panel-body">

					<div class="form-group">
						<label>이름</label> 
						<input class="form-control" name="name" id="name"
							placeholder="Enter text">
					</div>
						<div class="form-group">
						<label>핸드폰번호</label> 
						<input class="form-control" name="phone" id="ph"
							placeholder="010-0000-0000">
					</div>
					<button type="submit" class="btn btn-default btn_submit">인증하기</button>
					<a href="/bookspace/admin/home"><button class="btn btn-default">닫기</button></a>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(".btn_submit").click(function(){
	$.post("/bookspace/admin/serialfind",{
		"name" : $("#name").val(),
		"phone" : $("#ph").val()
	},function(data){
		
		if(data!=""){
		var random= Math.floor(Math.random()*(9999-1001))+1000;
		alert("본인확인인증번호를 정확하게 입력해주세요");
		if(prompt("인증번호4자리\n"+random)==random){
			alert($("#name").val()+"님의 시리얼번호:\n"+data);
		}else{
			alert("잘못입력하였습니다.");	
		}		}else{
			alert("일치하는 정보가없습니다.");
		}
	});
});


</script>

</body>
</html>