<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script type="text/javascript">
var msg="${result}";
if(msg!=""){
	alert(msg);
	location.href="/bookspace/home";
}
</script>

<body>
	<br>
	<div id="page-wrapper">

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">

					<div style="background: white;">
						<h3 align="left"
							style="background: white; color: #0066cc; margin-top: 60px">
							<b> <span class="glyphicon glyphicon-user"
								style="color: #0066cc;"></span> 회원정보 수정
							</b>
						</h3>
					</div>
					<br>
					<form name="updateform" action="/bookspace/member/update" method="post">
						<%-- updateComp를 updateform으로 바꿈 --%>
						<div class="col-sm-8">
							<div class="form-group">
								<label for="usr">아이디:</label> <input type="text"
									class="form-control" value="${dto.id}" readonly="readonly" name="id" id="id">
							</div>
							<div class="form-group">
								<label for="usr">비밀번호:</label>
								<input type="hidden" id="pw" name="pw" value="${dto.pw}">
									<button type="button" class="form-control" id="pww"
									data-toggle="modal" data-target="#pwmodal">비밀번호 변경</button>
									
							</div> 
							<div class="form-group">
								<label for="usr">성명:</label> <input type="text" name="name" id="id"
									class="form-control" readonly="readonly" value="${dto.name }">
							</div>
							<div class="form-group">
								<label for="usr">생년월일:</label> <input type="text" name="birth" id="birth"
									class="form-control" value="${dto.birth }" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">연락처:</label> <input type="text" name="phone"
									class="form-control" value="${dto.phone }" id="phone">
							</div>
							<div class="form-group">
								<label for="usr">성별:</label> <input type="text" id="gender"
									class="form-control" value="${dto.gender }" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">등급:</label> <input type="text" id="grade	"
									class="form-control" value="${dto.grade }" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">보유 캐시 :</label> <input type="text" id="grade	"
									class="form-control" value="${dto.cash } 원" readonly="readonly">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary"
									onclick="javascript:updateComp()">수정완료</button>
							</div>
						</div>
					</form>
				</div> 
			</div>
		</div>
		
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
							<label for="usr">현재비밀번호:</label>
							<input type="password" class="form-control" id="nowpw" name="nowpw">
						</div>
					</div></div>
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="usr">변경비밀번호:</label>
							<input type="password" class="form-control" id="pwch" onkeyup="checkPattern()">
						</div><div class="col-xs-4">
						<p id="com"></p>
						</div>
					</div></div>
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="usr">변경비밀번호 확인:</label>
							<input type="password" class="form-control" id="pwrech" onkeyup="checkPattern2()">
						</div><div class="col-xs-4">
						<p id="com2"></p>
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
	</div>
</body>

<script type="text/javascript">
	// 각종 패턴확인.널값확인후 전달.
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
	
	function checkPattern2() {
		var pw = document.getElementById("pwch").value;
		var pwCheck = document.getElementById("pwrech").value;
		if (pw == pwCheck) {
			document.getElementById("com2").innerHTML = "비밀번호가 일치합니다.";
			document.getElementById("com2").style.color = "green";
		} else {
			document.getElementById("com2").innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("com2").style.color = "red";
		}
	}
	
	function pwchange() {
		var pw=	$("#pw").val();//사용자비번
		var subpw=$("#nowpw").val();//내가쓴 현재비번
		if(pw==subpw){
			$("#pw").val($("#pwch").val());//내가쓴 변경비번
			$("#change").attr("data-dismiss","modal");//패스워드 변경 버튼
		}else{
			alert("현재비밀번호가일치하지않습니다.")
		}	
	}
	
	function updateComp() {
		
		var frm=document.updateform;
		if(frm.phone.value !=""){
			frm.submit();
		}else{
			alert("입력안된 내용을 확인해주세요");
		}

	}

</script>
</html>

