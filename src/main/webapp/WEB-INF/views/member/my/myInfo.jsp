<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	<script type="text/javascript">
	
	var msg="${fail}";
	if(msg!=""){
		alert(msg);
		self.close();
	}
	</script>
<body>
<form action="/bookspace/admin/cashplus" method="post" name="cashfr">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin: 2%">
			<div class="panel panel-default">
		
				<div class="panel-heading">
					<h2 class="panel-title">회원 정보</h2>
				
				</div>
				<div class="panel-body">
						<div class="col-sm-8">
							<div class="form-group">
								<label for="usr">ID :</label> <input type="text"
									class="form-control" id="usr" value="${dto.id}" name="id" readonly="readonly">
							</div>
							<div class="row">
								<div class="form-group">
									<div class="col-xs-8">
										<label for="usr">PW :</label> <input type="password" size="5"
											class="form-control" id="usr" value="${dto.pw }"
											readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<div class="col-xs-8">
										<label for="usr">NAME :</label> <input type="text"
											class="form-control" name="name" value="${dto.name}" readonly="readonly">
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="pwd">Birth :</label>
								<input type="text"	class="form-control" name="birth" value="${dto.birth}" readonly="readonly">
						
							</div>
							<div class="form-group">
								<label for="usr">GENDER :</label> <input type="text"
									class="form-control" name="employee" value="${dto.gender}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">PHONE :</label> <input type="text"
									class="form-control" name="phone" value="${dto.phone}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">Grade :</label> <input type="text"
									class="form-control" name="grade" value="${dto.grade}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">가입일 :</label> <input type="text"
									class="form-control" name="joindate" value="${dto.joindate}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">신고건수 :</label> <input type="text"
									class="form-control" name="complain" value="${dto.complain}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">캐쉬  : ${dto.cash}</label> <input type="hidden"
									class="form-control" name="cash" value="${dto.cash}" readonly="readonly">
								<button type="button" class="btn btn-warning" id="pww"
									data-toggle="modal" data-target="#pwmodal" >보너스캐쉬 지급</button>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" onclick="clos()">수정</button>
							</div>
						</div>
				
				</div>
			</div>
<script type="text/javascript">
	function bonusCash(cash) {
		if (cash != "") {
			document.cashfr.cash.value =cash;
			document.cashfr.submit();
		}
	}
</script>
			</div></div>

	<div class="modal fade" id="pwmodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">보너스 캐쉬 지급</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="usr">캐쉬 금액 :</label> <input type="text"
								class="form-control" id="pluscash" name="pluscash">
						</div>
					</div></div>

					<div class="modal-footer">
						<a href="javascript:bonusCash()">
							<button type="button" class="btn btn-success" id="cc"
								onclick="cashgogo()" data-dismiss="modal">지급</button>
						</a> &nbsp;&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<script type="text/javascript">
							function cashgogo() {
								var cash = document.cashfr.pluscash.value;
								bonusCash(cash);

							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div></form>
</body>

</html>