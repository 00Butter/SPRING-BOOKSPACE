<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3 align="left"><b>
<span style="color: rgb(255, 94, 0);">*</span>회원 가입</b></h3>
	<hr>
 <div id="page-wrapper">

            <div class="container-fluid">
<div class="row">
<div class="col-sm-2">
</div>
<div class="col-sm-8">
		<h2>약관 동의</h2>
		<p>
			<strong>북스페이스 서비스 제공을 위해서 필수적으로 동의해 주셔야 합니다.</strong>
		<div class="panel-group" id="accordion"><br>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">북스페이스 이용약관 *필수</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">< 이용약관 v2.6 ><br>
제1장 총 칙<br>
제1조 [목 적]<br>
본 약관은 북스페이스 주식회사(이하 “회사”라 합니다)가 운영하는 북스페이스(www.bookspace.com)을 통하여 제공하는 상품 및 디지털콘텐츠 서비스
(이하 “서비스”라 합니다)의 이용과 관련하여 이용자의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2">북스페이스 개인정보처리방침 *필수</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
1. 일반/외국인 회원가입<br>
1) 목적<br>
서비스 제공에 관한 계약 이행<br>
서비스 제공에 따른 요금정산<br>
회원관리<br>
신규 서비스 개발<br>
마케팅에의 활용<br>
2) 항목<br>
이름, 아이디, 비밀번호, 이메일 주소, 생년, 성별<br>
3) 보유기간<br>
회원탈퇴시까지 (단. 관계 법령에 따라 일부 정보는 보관됩니다.)<br>
2. 기존 회원 중 샵 주문 고객<br>
1) 목적<br>
재화의 배송, 원활한 고객상담<br>
2) 항목<br>
주소, 유선전화번호, 휴대전화번호, 이메일 주소<br>
3) 보유기간<br>
회원탈퇴시까지 (단. 관계 법령에 따라 일부 정보는 보관됩니다.)<br>
					</div>
				</div>
			</div>
		</div>
	<div></div>	
	<input id="ch" type="checkbox">모두 동의<br>
	<button type="button" onclick="agree()" class="btn btn-primary"
		style="width: 200px" >동의</button><br>
		<hr>
</div></div>
	</div></div>
	
<script type="text/javascript">
function agree(){
	var check=document.getElementById("ch").checked;
	if(check!=""){
		location.href="/bookspace/login/choiceJoin";
	}
}
</script>

</body>
</html>