<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html lang="en">
<head>
<title>exit</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<br>
	<div id="page-wrapper">

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<br> <br> <br>
					<div style="margin-left: 3%">
						<b><span style="font-size: large; color: black;">회원탈퇴</span>&nbsp;
							| &nbsp;탈퇴안내</b>
						<hr style="border-width: medium; border-color: black;">
						<br>
						<c:choose>
						<c:when test="${publog != null}">
						<div class="form-group">
							1. 등록한 모든 저작물은 더이상 거래하실수 없으며 해당페이지에서 전부 삭제됩니다.<br>
							2. 당일까지의 수익이 계산되어 월말에 지불됩니다.<Br>
							3. 계약철회요청은 관리자의 승인후 완료됩니다.<Br>
							4. 북스페이스의 모든 서비스를 더이상 이용하실 수 없습니다.<br>
							</div>
							<hr style="border-width: medium; border-color: black;">
						<div class="form-group" align="center">
							<a href="/bookspace/corp/exitrequest"> <input type="button"
								class="btn btn-md btn-info" value="확인" /></a>&nbsp;&nbsp; <a
								href="/bookspace/"> 
								<input type="button"
								class="btn btn-md btn-info" value="취소" /></a>
						</div>
						</c:when>
						<c:otherwise>
						<div class="form-group">
							
							1. 서비스 이용기록과 보유한 캐시 잔액은 모두 삭제됩니다.<br>
							2. 구매내역, 충전내역, 리뷰 페이지의 개인기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
							3. 보유한 캐시는 환불이 불가합니다.<br>
							4. 보너스 캐시 또한 환불 대상이 아닙니다.
						</div>
						
						<hr style="border-width: medium; border-color: black;">
						<div class="form-group" align="center">
							<a href="/bookspace/member/exitrequest"> <input type="button"
								class="btn btn-md btn-info" value="확인" /></a>&nbsp;&nbsp; <a
								href="/bookspace/"> 
								<input type="button"
								class="btn btn-md btn-info" value="취소" /></a>
						</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
	<br>
	<br>

</body>
</html>