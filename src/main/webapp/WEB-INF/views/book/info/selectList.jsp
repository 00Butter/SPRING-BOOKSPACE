<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	var rcv = "#${go}";

	$(document).ready(function() {
		if (rcv != "") {
			$(rcv).addClass("active");
			location.href = rcv;
		}
	});
</script>

<style>
h2 {
	margin: 20px 0 40px 0;
	letter-spacing: 10px;
	font-size: 30px;
	color: #0066cc;
	font-style: italic;
	text-align: center;
}
</style>
</head>
<body>
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<br> <br> <br>

		<h2>${name }</h2>
		<hr style="border: #ccebff 2px solid; margin-bottom: 50px;">
		<ul class="nav nav-pills" style="margin-bottom: 50px;">


			<c:forEach var="i" begin="0" end="${mlist.size()}" step="1">
				<li id="${mlist[i]}"><a href="/bookspace/book/${mlist[i]}">${mlist[i]}</a></li>
			</c:forEach>
		</ul>
		<hr style="margin-top: -30px;">
		<br>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div class="col-sm-12">
						<c:choose>
							<c:when test="${list.size()>0 }">
								<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
									<div class="col-sm-1"></div>
									<div class="col-sm-2" style="margin-bottom: 50px; height: 300px">
										<p align="center">
											<a href="/bookspace/book/stOne?num=${list[i].num }"> <img
												src="/bookspace/resources/book/${list[i].bookname}/${list[i].img}"
												width="120px;" height="140px;">
											</a>
										</p>
										<p></p>
										<p
											style="font-weight: bold; text-align: center; color: black;">${list[i].bookname }</p>
										<p style="color: black; text-align: center;">${list[i].writer }</p>
										<p style="color: black; text-align: center;">${list[i].price }원</p>
										<p style="color: red; text-align: center;">
											<c:forEach var="i" begin="1" end="${list[i].totalstar}"
												step="1"> 
												★
											</c:forEach>
										</p>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h2>검색 결과가 없습니다.</h2>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>

	</div>
	<div class="col-sm-1"></div>


	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
</body>
</html>
