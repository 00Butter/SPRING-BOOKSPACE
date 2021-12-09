<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BookSpace Login</title>
<body>
	<script type="text/javascript">
		var msg = "${msgpop}";
		if (msg != "") {
			alert(msg);
		}
	</script>

	<br>
	<br>

	<div id="page-wrapper">

		<div class="container-fluid">
			<div class="row" style="margin-top: 5%">
				<div class="col-sm-4">
					<!-- 옆에빈공간 -->
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">회원 로그인</h3>
						</div>
						<div class="panel-body" align="center">
							<form method="post" action="/bookspace/login/loginForm"
								name="log">
								<input class="form-control" id="id" name="id" placeholder="아이디" /><br>
								<input type="password" class="form-control" name="pw" id="pw"
									placeholder="비밀번호" /> <br>
								<button type="button" class="btn btn-primary active"
									onclick="loginCheck()">로그인</button>
								<hr>
								<button type="button" class="btn btn-primary btn-sm active"
									id="find" data-toggle="modal" data-target="#idmodal">아이디
									찾기</button>
								<button type="button" class="btn btn-primary btn-sm active"
									id="find" data-toggle="modal" data-target="#pwmodal">비밀번호
									찾기</button>
							</form>
							<script type="text/javascript">
								function loginCheck() {
									// 아이디 비밀번호 널값 검사후 
									var id = $("#id").val();
									var pw = $("#pw").val();
									if (id == "") {
										alert("아이디를 입력해주세요.");
										return;
									} else if (pw == "") {
										alert("비밀번호를 입력해주세요.");
										return;
									}
									document.log.submit();

								}
								var msg = "${result}";
								if (msg != "") {
									alert(msg);
									location.href = "/bookspace";
								}
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- ======================================아이디 찾기============================================================================ --%>
	<div class="modal fade" id="idmodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">아이디 찾기</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="/bookspace/member/findId" id="idfr"
						name="idfr">
						<span style="color: #003399"><b>아이디 찾기</b></span> <br> <span
							style="font-size: small; color: #003399">이름과 생년월일을 입력하세요.</span>
						<br>

						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label class="radio-inline"> <input type="radio"
										name="logtype" checked="checked"
										onclick="if(this.checked){checkMem()}">개인
									</label> <label class="radio-inline"> <input type="radio"
										onclick="if(this.checked){checkPub()}" name="logtype">기업
									</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label for="usr">이름:</label> <input type="text"
										class="form-control" id="name" name="name">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label id="birthn" for="bir">생년월일:</label> <input type="text"
										maxlength="6" placeholder="000000" class="form-control"
										id="birth" name="birth"><br>

									<button type="button" class="btn btn-success" id="findid"
										onclick="fid()">아이디 찾기</button>

									<script type="text/javascript">
										function checkPub() {
											$("#birthn").html("사업자번호 : ");
											$("#birth").attr("placeholder",
													"사업자번호10자리");
											$("#birth").attr("name", "license");
											$("#birth").attr("maxlength", "10");
											$("#idfr").attr("action",
													"/bookspace/corp/findId");

										}
										function checkMem() {
											$("#birthn").html("생년월일:");
											$("#birth").attr("placeholder",
													"900909");
											$("#birth").attr("name", "birth");
											$("#birth").attr("maxlength", "6");
											$("#idfr").attr("action",
													"/bookspace/member/findId");
										}

										function fid() {
											var n = $("#name").val();
											var b = $("#birth").val();
											if (n == "") {
												alert("이름을 입력해 주세요.");
											} else if (b == "") {
												alert("생년월일을 입력해주세요.");
											} else {
												document.idfr.submit();
											}
										}
									</script>

								</div>
							</div>
						</div>

						<div class="modal-footer">
							&nbsp;&nbsp;
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<%-- ============================================비밀번호 찾기====================================================================== --%>
	<div class="modal fade" id="pwmodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">비밀번호 찾기</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="/bookspace/member/findPw" id="pwfr" name="pwfr">
						<span style="color: #003399"><b>비밀번호 찾기</b></span> <br> <span
							style="font-size: small; color: #003399"> 
							아이디, 생년월일(혹은 사업자번호), 전화번호를	입력하세요.</span> <br>

						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label class="radio-inline"> <input type="radio"
										onclick="if(this.checked){checkMM()}" checked="checked" name="optradio">개인
									</label> <label class="radio-inline"> <input type="radio"
										onclick="if(this.checked){checkPP()}" name="optradio">기업
									</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label for="usr">아이디:</label> <input type="text" maxlength="15"
										class="form-control" id="id1" name="id">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label id="bbi" for="usr">생년월일:</label> <input type="text" maxlength="6"
									   placeholder="000000" class="form-control" id="birth1"
										name="birth">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-xs-6">
									<label for="usr">전화번호:</label> <input type="text"
										maxlength="13" placeholder="000-0000-0000"
										class="form-control" id="phone" name="phone"><br>
									<button type="button" class="btn btn-success" id="findpw"
										onclick="fpw()">비밀번호 찾기</button>

									<script type="text/javascript">
										function checkPP() {
											$("#bbi").html("사업자번호 :");
											$("#birth1").attr("placeholder","사업자번호10자리");
										$("#birth1").attr("name", "license");
										$("#birth1").attr("maxlength", "10");
										$("#pwfr").attr("action","/bookspace/corp/findPw");
										}
										function checkMM() {
											$("#bbi").html("생년월일:");
											$("#birth1").attr("placeholder",
													"900909");
											$("#birth1").attr("name", "birth");
											$("#birth1").attr("maxlength", "6");
											$("#pwfr").attr("action",
													"/bookspace/member/findPw");
										}

										function fpw() {
											var i = $("#id1").val();
											var b = $("#birth1").val();
											var p = $("#phone").val();
											if (i == "") {
												alert("아이디를 입력해주세요.");
											} else if (b == "") {
												alert("생년월일을 입력해주세요.");
											} else if (p == "") {
												alert("전화번호를 입력해주세요.");
											} else {
												document.pwfr.submit();
											}
										}
									</script>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							&nbsp;&nbsp;
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%-- ===================================================스크립트 영역=============================================================== --%>

	<br>
</body>
</html>