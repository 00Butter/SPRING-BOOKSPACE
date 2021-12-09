<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script>
	//TOP버튼  
	$(document).ready(function() {
		var speed = 1000; // 스크롤되는 속도
		$("#top_move").css("cursor", "pointer").click(function() {
			$('body, html').animate({
				scrollTop : 0
			}, speed);
		});

		$(window).scroll(function() { //탑 메뉴 보이고 사라지게 하기
			if ($(this).scrollTop() > 200) {
				$('.move').fadeIn();
			} else {
				$('.move').fadeOut();
			}
		});

	});
</script>

<style>
.top {
	z-index: 999;
	display: none;
	bottom: 20px;
}
</style>

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: auto;
	margin: auto;
}
</style>

</head>
<body>
	<h3
		style="font-style: italic; font-size: 30px; margin-top: 70px; margin-left: 20px; color: #0066cc; letter-spacing: 10px">
		상세보기</h3>
	<hr>
	<br>
	<div class="col-sm-12" style="border-bottom-color: #0066cc;">
		<div class="container-fluid" style="width: 100%;">
			<div class="row">
				<div class="col-sm-2"></div>



				<!-- img 크기 수정 -->
				<div class="col-sm-3" align="center">
					<img src="/bookspace/resources/book/${dto.bookname}/${dto.img }"
						class="img-thumbnail" alt="Cinque Terre"
						style="width: 240px; height: 320px;" align="middle">
				</div>
				<div class="col-sm-7 " style="text-align: left;">
					<font face="굴림체" size="40px" color="black"><b>${dto.bookname }</b></font><br>
					<br> <font face="굴림체" color="black">${dto.publisher }</font>
					&nbsp;

					<c:choose>
						<c:when test="${login != null }">
							<button type="button" class="btn btn-link btn-sm" name="quespub"
								data-toggle="modal" data-target="#claim2">
								<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;문의하기
							</button>
						</c:when>
						<c:otherwise> 

							<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp; 문의하기 
	
						</c:otherwise>
					</c:choose>

					<br> <font face="굴림체" color="gray">저자 : ${dto.writer }</font><br>
					<font face="굴림체" color="black">가격 : ${dto.price }원</font>
					<p style="color: red">
						<c:forEach var="i" begin="1" end="${dto.totalstar}" step="1"> 
												★ 
											</c:forEach>
					</p>
					<br> <br>
					<button type="button" class="btn btn-default btn-sm" name="cart"
						id="cart"
						onclick="gocart('${dto.num }','${dto.bookname }','${dto.publisher }','${dto.price }','${dto.img}')">
						<span class="glyphicon glyphicon-shopping-cart"></span> 장바구니 담기
					</button>
					<button type="button" class="btn btn-default btn-sm" name="buy"
						onclick="buyGo('${dto.bookname}')">
						<span class="glyphicon glyphicon-usd"></span>구매하기
					</button>
					<button type="button" class="btn btn-default btn-sm"
						data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-book"></span>&nbsp;미리보기
					</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header" style="height: 80px;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">

									<div id="myCarousel" class="carousel slide"
										data-ride="carousel">
										<!-- Indicators -->
										<ol class="carousel-indicators">
											<li data-target="#myCarousel" data-slide-to="0"
												class="active"></li>
											<li data-target="#myCarousel" data-slide-to="1"></li>
											<li data-target="#myCarousel" data-slide-to="2"></li>
											<li data-target="#myCarousel" data-slide-to="3"></li>
										</ol>

										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<img src="/bookspace/resources/book/${dto.bookname}/${imgname[0]}" width="460"
													height="345">
											</div>
											<div class="item">
												<img src="/bookspace/resources/book/${dto.bookname}/${imgname[1]}" width="460"
													height="345">
											</div>

											<div class="item">
												<img src="/bookspace/resources/book/${dto.bookname}/${imgname[2]}" width="460"
													height="345">
											</div>

											<div class="item">
												<img src="/bookspace/resources/book/${dto.bookname}/${imgname[3]}" width="460"
													height="345">
											</div>
										</div>

										<!-- Left and right controls -->
										<a class="left carousel-control" href="#myCarousel"
											role="button" data-slide="prev"> <span
											class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="right carousel-control" href="#myCarousel"
											role="button" data-slide="next"> <span
											class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="col-sm-12" style="margin-top: 40px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="col-sm-12">
				<font size="6" face="굴림체" color="#7094db"
					style="font-style: italic;">책 소개</font>
				<hr style="border: gray 1px solid;">
				<div id="demo1" class="collapse">
					<div class="media">
						<div class="media-body">
							<p>${dto.story }</p>
						</div>
					</div>
				</div>

				<div align="center">
					<button type="button"
						style="color: white; background-color: #0066cc; border: 0px;"
						id="btnto" class="btn btn-success" data-toggle="collapse"
						data-target="#demo1">
						<span class="glyphicon glyphicon-collapse-down"></span> 줄거리 보기
					</button>
				</div>
			</div>

			<div class="col-sm-12" style="margin-top: 50px;">

				<font size="6" face="굴림체" color="#7094db"
					style="font-style: italic;">목 차</font>
				<hr style="border: gray 1px solid;">
				<div id="demo" class="collapse">
					목차
					<p>
						<c:forEach var="each" items="${clist }">
							${each}<br>
						</c:forEach>
					</p>
				</div>

				<div align="center">
					<button
						style="color: white; background-color: #0066cc; border: 0px;"
						data-toggle="collapse" data-target="#demo">
						<span class="glyphicon glyphicon-collapse-down"></span> 목차 보기
					</button> 
				</div>
			</div>



			<div class="col-sm-12" style="margin-top: 100px;">
				<div>
					<font size="6" face="굴림체" color="#7094db"
						style="font-style: italic;">리 뷰</font>
					<hr style="border: gray 1px solid;">

				</div>
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead
							style="text-align: center; background-color: #0066cc; color: #fff;">
							<tr>
								<td>별점</td>
								<td>추천수</td>
								<td>아이디</td>
								<td colspan="4" width="40%">내 용</td>
								<td>추천</td>
								<td>신고</td>
								<td>등록날짜</td>

							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${!rlist.isEmpty()}">
									<c:forEach var="each" items="${rlist }">
										<tr>
											<td
												style="height: 20%; text-align: center; vertical-align: middle;">★
												x ${each.star }</td>
											<td
												style="height: 20%; text-align: center; vertical-align: middle;">${each.recommend }</td>
											<td
												style="height: 20%; text-align: center; vertical-align: middle;">${each.id }</td>
											<td colspan="4"
												style="height: 20%; vertical-align: middle; word-wrap: break-word; word-break: keep-all;">${each.review }</td>
											<td
												style="height: 20%; text-align: center; vertical-align: middle;"><a
												href="javascript:updateRev('${each.num}','recommend','추천')"><span
													class="glyphicon glyphicon-thumbs-up"
													style="color: blue; font-size: 20px;"></span></a></td>
											<td
												style="height: 20%; text-align: center; vertical-align: middle;">
												<a onclick="javascript:updateRev('${each.num}','complain','신고')">
													<span class="glyphicon glyphicon-exclamation-sign"
													style="color: red; font-size: 25px;"></span>
											</a>
											</td>
											<td
												style="height: 110px; text-align: center; vertical-align: middle;">${each.reviewDate }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="10">
											<h3 style="text-align: center;">등록된 리뷰가 없습니다. 책 구매후 리뷰를
												작성해 주세요.</h3>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<hr>
				<div>
					<ul class="pager" id="num">
						<c:if test="${pDto.nowPage>1 }">
							<li class="previous"><a
								href="/bookspace/cshome?nowPage=${pDto.nowPage-1}">Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${pDto.showPageNumberBegin }"
							end="${pDto.showPageNumberEnd }" step="1">
							<li class="numli" id="1"><a
								href="/bookspace/cshome?nowPage=${i}">${i}</a></li>
						</c:forEach>

						<c:if test="${pDto.nowPage < endPage}">
							<li class="next"><a
								href="/bookspace/cshome?nowPage=${pDto.nowPage+1}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="move" align="center" style="margin-bottom: 40px;">
				<button type="button" class="btn btn-link btn-sm"
					style="width: 70px; height: 30px; border-color: #0066cc;">
					<span class="glyphicon glyphicon-arrow-up" id="top_move">top</span>
				</button>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>


</body>

<div id="claim2" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<h3
					style="margin-top: -20px; color: #0066cc; background-color: #fff;">
					출판사 문의하기</h3>
				<hr>
				<h3>${dto.bookname }</h3>
				<div class="container2">
					<form name="claim">
						<table border="1" style="font-size: small;">
							<tr style="height: 40px;">
								<td bgcolor="#0066cc" align="center" style="color: #fff"><b>제목&nbsp;</b></td>
								<td><input type="text" id="title"
									style="width: 100%; height: 100%; border: 0px;" name="title" /></td>
							</tr>
							<tr>
								<td bgcolor="#0066cc" align="center" style="color: #fff"><b>문의내용</b></td>
								<td><textarea rows="8" cols="60" style="border-color: #fff"
										name="textarea" id="text"></textarea></td>
							</tr>
						</table>
					</form>
				</div>
				<div align="center" style="margin-top: 20px;">
					<button type="button" onclick="claimGo()" class="btn btn-default"
						data-dismiss="modal">등록</button>
				</div>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var log = "${login}";
	function gocart(num, bn, pub, pri, img) {
		if (log == "") {
			alert("로그인 후 이용해 주세요");
		} else {
			$.post("/bookspace/pay/cartCh", {
				"bookname" : bn,
				"id" : log
			}, function(data) {
				if (data != 0) {
					alert("이미 장바구니에 있는 상품입니다.");
				} else {

					$.post("/bookspace/pay/inBag", {
						"id" : log,
						"bookname" : bn,
						"pub" : pub,
						"price" : pri,
						"img" : img
					}, function(data) {
						if (data != 0) {
							alert("장바구니에 담았습니다.");

						} else {
							alert("실패");
						}
					});

				}
			});
		}
	}

	function buyGo(data1) {

		if (log == "") {
			alert("로그인 후 이용해 주세요");
		} else {
			$.post("/bookspace/pay/cartCh",{
				"bookname" : data1,
				"id" : log
			},function(data){
				if(data=="0"){
					if(confirm("구입하시겠습니까?"))
					location.href = "/bookspace/pay/directBuy?bookname=" + data1;
				}else{
					alert("이미 장바구니에 있거나 구입한 항목 입니다.");
				}
			});
			
		}
	}

	function claimGo() {

		var log = "${login}";

		$.post("/bookspace/board/claim", {
			"title" : $("#title").val(),
			"textarea" : $("#text").val(),
			"bookname" : "${dto.bookname}",
			"pub" : "${dto.publisher}",
			"id" : "${login}"

		}, function(data) {
			if (data != 0) {
				alert("소중한 문의 등록감사합니다.");

			} else {
				alert("실패");
				self.close();
			}
		});
	}

	function updateRev(num, path, name) {
		var book = num;
		var url = path;
		$.post("/bookspace/review/" + url, {
			"num" : book
		}, function(result) {
			if (result != "" && result != "0") {
				alert(name+"등록");
			} else {
				alert(name+"실패");
			}
		});
	}
</script>
</html>

