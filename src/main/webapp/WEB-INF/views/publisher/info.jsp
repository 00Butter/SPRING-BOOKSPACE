<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${syslog!=null }">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</c:if>
</head>
<script type="text/javascript">
var msg="${msgpop}";
if(msg!=""){
	alert(msg);
	location.href="/bookspace/home";
}
var adminlog="${syslog}";
$(document).ready(function(){
if(adminlog!=""){
	$("#pww").attr("disabled","disabled");	
}
	$(option).val("${dto.bank}").attr("selected","selected");
})
</script>
<body>
	<div class="row">
		<div class="${syslog!=null?'col-sm-1':'col-sm-2' }"></div>
		<div class="col-sm-8" style="${syslog!=null?'margin: 2%':'margin: 5%'}">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">업체 정보</h2>
				</div>
				<div class="panel-body">
					<form action="/bookspace/corp/update" method="post" name="updatefr">
						<div class="col-sm-8">
							<div class="form-group">
								<label for="usr">업체명:</label> <input type="text"
									class="form-control" id="usr" value="${dto.name}" name="name" readonly="readonly">
							</div>
							<input type="hidden" name="num" value="${dto.num }">
							<div class="row">
								<div class="form-group">
									<div class="col-xs-8">
										<label for="usr">사업자번호:</label> <input type="text" size="5"
											class="form-control" id="usr" value="${dto.license }" name="license"
											readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<div class="col-xs-8">
										<label for="usr">ID :</label> <input type="text"
											class="form-control" readonly="readonly" name="id" value="${dto.id}">
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="pwd">Password:</label>
								<input type="hidden" id="pw" name="pw" value="${dto.pw}">
								<button type="button" class="btn btn-warning" id="pww"
									data-toggle="modal" data-target="#pwmodal" >비밀번호변경</button>
									<p id="pp"></p>
							</div>
							<div class="form-group">
								<label for="usr">담당자이름:</label> <input type="text"
									class="form-control" name="employee" value="${dto.employee}">
							</div>
							<div class="form-group">
								<label for="usr">연락처:</label> <input type="text"
									class="form-control" name="phone" value="${dto.phone}">
							</div>
							<div class="form-group">
								<label for="usr">주소:</label> <input type="text"
									class="form-control" name="address" value="${dto.address}">
							</div>
							<div class="form-group">
							<label for="usr">은행 : ${dto.bank}</label>
								<input type="hidden" name="bank" value="${dto.bank }">
								<select class="form-control" id="sel1" name="newbank">
									<option value="00">은행명</option>
									<option value="국민">국민</option>
									<option value="신한">신한</option>
									<option value="농협">농협</option>
									<option value="하나">하나</option>
								</select>
							</div>
							<div class="form-group">
								<label for="usr">계좌:</label> <input type="text"
									class="form-control" name="banknum" value="${dto.banknum}">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" onclick="updateGo()">수정</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			</div></div>

	<div class="modal fade" id="pwmodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">비밀번호변경</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="usr">현재비밀번호:</label> <input type="password"
								class="form-control" id="nowpw" name="nowpw">
						</div>
					</div></div>
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="usr">변경비밀번호:</label><input type="password"
								class="form-control" id="pwch" onkeyup="checkPattern()">
						</div><div class="col-xs-4">
						<p id="com"></p>
						</div>
					</div></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" id="change" disabled="disabled" onclick="pwchange()">변경</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function checkPattern() {
		var pwreg = /^((?=.*\d)(?=.*[a-z]).{8,15})$/g;
		if(pwreg.test($("#pwch").val())){
			document.getElementById("com").innerHTML="사용가능한 비밀번호입니다.";
			document.getElementById("com").style.color = "green";
			$("#change").removeAttr("disabled");
		}else{

			$("#change").attr("disabled","disabled");
			document.getElementById("com").innerHTML="영문대소문자,특수문자, 숫자 포함 8자이상 15자이하로 입력해주세요";
			document.getElementById("com").style.color = "red";
		}
	}
	
	function pwchange() {
		var pw=	$("#pw").val();
		var subpw=$("#nowpw").val();
		if(pw==subpw){
			$("#pw").val($("#pwch").val());
			$("#pp").html("변경을 누르셔야 적용됩니다.");
			$("#change").attr("data-dismiss","modal");
		}else{
			alert("현재비밀번호가일치하지않습니다.")
		}	
	}
	
	function updateGo() {
		var frm=document.updatefr;
		if(frm.id.value!="" && frm.employee.value!="" && frm.phone.value !="" && frm.address.value!="" && frm.banknum.value!=""){
			if(frm.newbank.value!="00"){
				frm.bank.value=frm.newbank.value;
			}
			frm.submit();
		}else{
			alert("입력안된 내용을 확인해주세요");
		}
	}
	</script>
</body>
</html>