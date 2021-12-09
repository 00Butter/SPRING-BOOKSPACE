<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	var abc = "";

	var msg = "${msg}"

	if (msg != "") {

		alert(msg);
	}
</script>

<style>
footer {
	margin-top: 50px;
}

.sidenav {
	height: 100%;
}

@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

h2 {
	letter-spacing: 10px;
	font-size: 30px;
	color: #000;
	font-style: italic;
	margin-top: 80px;
	margin-bottom: 40px;
	text-align: center;
}
</style>

</head>
<body id="myPage">

	<div class="col-sm-12">
		<h2 style="margin-top: 10%; margin-left: 20px;">출판사 문의글</h2>
		<hr>
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th
								style="font-weight: bold; font-size: 120%; text-align: center;">번호</th>
							<th
								style="font-weight: bold; font-size: 120%; text-align: center;">책
								이름</th>
							<th
								style="font-weight: bold; font-size: 120%; text-align: center;">아이디</th>
							<th
								style="font-weight: bold; font-size: 120%; text-align: center;"
								colspan="2">제목</th>
							<th
								style="font-weight: bold; font-size: 120%; text-align: center;">등록
								날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="t" var="each" items="${list}">
							<tr>
								<td style="text-align: center;">${each.num}</td>
								<td style="text-align: center;">${each.bookname }</td>
								<td style="text-align: center;">${each.id }
								<td colspan="2" style="text-align: center;"><a
									onclick="inner('${each.title}','${each.content}','${each.bookname}', '${each.receive }','${each.id}','${each.num }')"
									class="wow">${each.title}</a></td>
								<td style="text-align: center;">${each.regdate}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" align="center">
								<ul class="pager" id="num">
									<c:choose>
										<c:when test="${pDto.nowPage == pDto.showPageNumberBegin}">
											<li class="previous"><a href="">Previous</a></li>
										</c:when>
										<c:otherwise>
											<li class="previous"><a
												href="/bookspace/corp/qnaList?nowPage=${pDto.nowPage-1}">Previous</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="i" begin="${pDto.showPageNumberBegin }"
										end="${pDto.showPageNumberEnd }" step="1">
										<li class="numli" id="1"><a
											href="/bookspace/corp/qnaList?nowPage=${i}">${i}</a></li>
									</c:forEach>

									<c:choose>
										<c:when test="${pDto.nowPage == pDto.showPageNumberEnd}">
											<li class="next"><a href="">Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="next"><a
												href="/bookspace/corp/qnaList?nowPage=${pDto.nowPage+1}">Next</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>

<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
		<div class="modal-header" style="margin-top: -20px;  height:60px; color: #0066cc; background-color: #fff;">
				
					<h3	style="margin-top: -20px; color: #0066cc; background-color: #fff;">
					문의 글</h3>
		</div>
			<div class="modal-body" style="margin: 5%">
				<div class="container2">
					<form name="frm" id="idid" method="post" action="/bookspace/board/reply">
						<input type="hidden" name="id" value="${pubname}" /> <input
							type="hidden" name="pub" id="pub" /> <input type="hidden"
							name="num" id="num1" />   
							<input type="hidden" value="" id="receive" name="receive">
						<table border="1" style="font-size: small;">
							<tr>
								<td bgcolor="#0066cc" align="center" style="color: #fff"><b>제목&nbsp;</b></td>
								<td>&nbsp;<input type="text" id="ttt" readonly="readonly"
									style="font-weight: bold;" /></td>
							</tr>
							<tr>
								<td bgcolor="#0066cc" align="center" height="230px"
									style="color: #fff"><b>문의내용</b></td>
								<td style="margin-top: 20px;">&nbsp;<input type="text"
									placeholder="도서명" id="bookname" readonly="readonly"
									style="font-weight: bold;" name="bookname" /> <br> <br>
									&nbsp;<textarea rows="6" cols="50" id="texta"
										readonly="readonly"></textarea><br>

								</td>
							</tr>
						</table>
						<h3 style="color: #0066cc; background-color: #fff;">▶답글</h3>

						<table border="1" style="font-size: small; margin-top: 20px;">
							<tr>
								<td bgcolor="#0066cc" align="center" style="color: #fff"><b>제목&nbsp;</b></td>
								<td>&nbsp;<input type="text" id="tt" name="title" /></td>
							</tr>
							<tr>
								<td bgcolor="#0066cc" align="center" height="190px"
									style="color: #fff"><b>답글 내용</b></td>
								<td>&nbsp;<textarea rows="5" cols="50" id="tete" name="textarea"></textarea><br>
								</td>
							</tr>
						</table>
						<br>
						<div align="center" style="margin-bottom: 30px;">
							<button type="button" class="btn btn-primary active"
								onclick="reply()">등록</button>
								<script type="text/javascript">
								function reply() {
									var title=document.getElementById("tt").value;
									var area=document.getElementById("tete").value;
									if(title!="" && area !=""){
										document.getElementById("idid").submit();
									}else{
										alert("내용입력해주세요");
									}
								}
								</script>

						</div>
					</form>
				</div>
			</div>


		</div>
	</div>
</div>

<script type="text/javascript">
	function inner(ti, con, bn, publisher,id, num1) {
		var tt = document.getElementById("ttt");
		var cont = document.getElementById("texta");
		var bookname = document.getElementById("bookname");
		$("#receive").val(id);
		$("#pub").val(publisher); 
		$("#num1").val(num1);   
		tt.value = ti; 
		bookname.value = bn;
		cont.innerHTML = con;

		$(".wow").attr("data-toggle", "modal");
		$(".wow").attr("href", "#myModal");
		$(".wow").attr("data-target", "#myModal");
	
	}
</script>
</html>