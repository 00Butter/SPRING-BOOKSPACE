<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="spring.mvc.bookspace.dto.page.PageDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
	var a = null;
	var rcv = "${official}";

	$(document).ready(function() {
		if (rcv == "fd") {
			location.href = "#section2";
		}
	});
</script>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			active : true
		});

	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#menu ul li").click(function() {
			$(".l").removeClass("active");
			$(this).addClass("active");
		});

	});

	//      $("li").click(function() {
	//         $(this).addClass("active");
	//      });
</script>
<style>

/* Set height of the grid so .sidenav can be 100% (adjust if needed) */

/* Set gray background color and 100% height */
.sidenav {
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
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
	margin-bottom: 20px;
	text-align: center;
}

#1 active {
	background-color: blue;
}
</style>
<script type="text/javascript">
	function search() {

		var abc = document.frm;
		abc.method = "post";
		abc.action = "/bookspace/search";
		abc.submit(); // 소가로 있어야함

	}
</script>
</head>
<body id="myPage">
	<h2
		style="font-weight: bold; color: #000; text-align: left; margin-top: 80px;">고객
		센터</h2>
	<hr style="border: #ccebff 2px solid;">
	<div class="Cservice">
		<div class="row content">
			<div class="col-sm-2 ">
				<div class="collapse navbar-collapse" id="menu">
					<ul class="nav nav-pills nav-stacked">
						<li class="l" style="font-size: 18px;"><a href="#section1">bookSpace란</a></li>
						<li class="l" style="font-size: 18px;"><a href="#section2">공지사항</a></li>
						<li class="l" style="font-size: 18px;"><a href="#section3">자주
								묻는 질문</a></li>
						<li class="l" style="font-size: 18px;"><a href="#section4">1:1
								문의</a></li>
					</ul>
					<br>
				</div>
			</div>
			<div class="panel" class="col-sm-10">

				<div class="col-sm-1"></div>

				<div class="col-sm-8">

					<div id="section1" class="container-fluid"
						style="margin-top: -50px;">
						<div class="row">
							<h2></h2>
							<img src="/bookspace/resources/img/bookspace1.png" width=100%;
								height=100%; />
							<h2 style="text-align: center; margin-top: 14px;">" 우주처럼 광활한
								지식 "</h2>
							<p style="text-align: center; margin-top: 20px;">
								e-mail 이 그냥 mail 이 되었듯,<br> e-book 이 그냥 book 이 될 세상을 위하여.<br>
								<br> 책의 경계를 허물고 변화를 넘어<br> 삶의 혁신을 만드는 이름<br> <br>
								미래를 이끌어가는 기업 <br> ' 북스페이스 '
							</p>
						</div>
					</div>

					<!-- Container (Services Section) -->
					<div id="section2" class="container-fluid text-center">
						<div class="row">
							<div class="col-lg-12">
								<h2 style="margin-top: 200px; margin-left: 20px;">공지사항</h2>
								<hr>
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<td style="font-weight: bold; font-size: 120%;">num</td>
												<td style="font-weight: bold; font-size: 120%;">title</td>
												<td style="font-weight: bold; font-size: 120%;">date</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach varStatus="t" var="each" items="${list}">
												<tr>
													<td>${each.num}</td>
													<%--<td><a onclick="inner('${t.index}')" class="wow">${each.title}</a></td> --%>
													<td><a
														href="javascript:inner('${each.title}','${each.content}')"
														class="wow">${each.title}</a></td>
													<td>${each.savedate}</td>   
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3" align="center">
													<ul class="pager" id="num">
														<c:choose>
															<c:when
																test="${pDto.nowPage == pDto.showPageNumberBegin}">
																<li class="previous"><a
																	href="/bookspace/cshome?nowPage=${pDto.nowPage}">Previous</a></li>
															</c:when>
															<c:otherwise>
																<li class="previous"><a
																	href="/bookspace/cshome?nowPage=${pDto.nowPage-1}">Previous</a></li>
															</c:otherwise>
														</c:choose>
														<c:forEach var="i" begin="${pDto.showPageNumberBegin }"
															end="${pDto.showPageNumberEnd }" step="1">
															<li class="numli" id="1"><a
																href="/bookspace/cshome?nowPage=${i}">${i}</a></li>
														</c:forEach>

														<c:choose>
															<c:when test="${pDto.nowPage == pDto.showPageNumberEnd}">
																<li class="next"><a
																	href="/bookspace/cshome?nowPage=${pDto.nowPage }">Next</a></li>
															</c:when>
															<c:otherwise>
																<li class="next"><a
																	href="/bookspace/cshome?nowPage=${pDto.nowPage+1}">Next</a></li>
															</c:otherwise>

														</c:choose>
													</ul>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>

					</div>

					<!-- Container (Portfolio Section) -->
					<div id="section3" class="container-fluid text-center bg-grey">
						<h2 style="margin-top: 200px;">자주 묻는 질문</h2>
						<hr>
						<div id="accordion">
							<h3
								style="background: #fff; color: #000; margin-bottom: 10px; font-size: 20px; text-align: left; font-style: normal;">
								아이디(ID), 비밀번호를 잊어버렸어요. 어떻게 확인하나요?</h3>
							<div>
								<p>
									홈페이지에서 로그인버튼을 눌러 [아이디 찾기, 비밀번호 찾기] 메뉴 이용하면 확인이 가능합니다. <br>아이디,
									비밀번호 찾기 시 정상적으로 진행이 되지 않는다면 회원가입을 하지 않으셨거나 등록된 정보가 다른 경우일 수
									있습니다.<br> 가입정보가 확인되지 않으나 이전에 이용 기록이 있는 경우, 고객센터로 문의하여 주시기
									바랍니다.
								</p>
							</div>
							<h3
								style="background: #fff; color: #000; margin-bottom: 10px; font-size: 20px; text-align: left; font-style: normal;">
								회원정보 변경은 어떻게 하나요?</h3>
							<div>
								<p>
									서점 홈페이지에서 로그인 후 [내 정보 > 정보변경] 메뉴를 통해서 비밀번호, 이메일 주소 등의 변경이
									가능합니다.<br> 또한, 회원가입 중 오타가 입력되었거나 개명을 하신 경우 고객센터로 1:1문의로
									문의주시기 바랍니다. <br>다만, 고객님의 아이디는 회원가입시 회원님께서 직접 등록하는 정보로 회원가입
									후에는 아이디 변경이 불가합니다.
								</p>
							</div>
							<h3
								style="background: #fff; color: #000; margin-bottom: 10px; font-size: 20px; text-align: left; font-style: normal;">
								구입한 책을 환불하고 싶어요.</h3>
							<div>
								<p>
									N결제 취소 및 환불은 다운로드 또는 스트리밍으로 이용하지 않는 경우에만 가능합니다.<br> 책을
									다운받지 않았거나 스트리밍으로 이용하지 않았다면,결제일로부터 7일 이내에 [내 정보 > 내 구매 내역]에서 <br>구매하신
									도서를 결제 취소하고 환불 받으실 수 있습니다.
								</p>
							</div>
							<h3
								style="background: #fff; color: #000; margin-bottom: 10px; font-size: 20px; text-align: left; font-style: normal;">
								종이책으로 배송이 되나요?</h3>
							<div>
								<p>
									현재 리디북스에서 판매되고 있는 전자책은 종이책과 달리 무형의 콘텐츠이기 때문에 별도로 종이책 배송은 되지
									않습니다. <br>전자책으로 구매하여 PC뷰어를 통해서 도서 이용이 가능하며, 고객님의 아이디로 구매한
									도서는 <br> 탈퇴 전까지 다운로드 횟수에 제한 없이 지속적으로 이용이 가능합니다
								</p>
							</div>
							<h3
								style="background: #fff; color: #000; margin-bottom: 10px; font-size: 20px; text-align: left; font-style: normal;">
								캐시란 무엇인가요?</h3>
							<div>
								<p>
									캐시란 리디북스에서 제공하는 도서구매 및 대여, 자유이용권 구매에 이용하실 수 있는 충전식 결제수단으로 캐시
									1원은 현금 1원과 동일한 가치를 지닙니다.<br> 캐시는 [내 정보 > 캐시충전 ] 에서 충전하실 수
									있습니다. 캐시 충전은 신용카드, 휴대폰 소액결제 등으로 가능합니다.
								</p>
							</div>
						</div>
					</div>

					<!-- Container (Pricing Section) -->
					<div id="section4" class="container-fluid">
						<div class="text-center">
							<h2 style="margin-top: 120px;">1:1 문의</h2>

						</div>
						<div class="row slideanim">
							<div class="panel panel-default text-center">
								<hr style="border-width: 8px; border-color: #3399ff">

								<b><span style="font-size: large;">1:1 친절상담</span></b><br>
								<span style="color: #bfbfbf; font-size: small;">운영시간:평일17시/토요일12시까지
									(운영시간 이후 및 공휴일 문의는 다음 운영 시간에 신속하게 답변 드리겠습니다.)</span><br> <br>
								<form name="bb">
									<table class="table" style="font-size: small;">
										<tr>
											<td style="background-color: #e6f0fa;" align="right"
												width="13%"><b>아이디&nbsp;</b></td>
											<td align="left"><input type="text" id="id" name="id"
												style="width: 30%;" value="${login}" readonly="readonly" /></td>
										</tr>
										<tr>
											<td style="background-color: #e6f0fa;" align="right"><b>제목&nbsp;</b></td>
											<td><input type="text" id="jm" name="title"
												style="width: 100%;" /></td>
										</tr>
										<tr>
											<td style="background-color: #e6f0fa;" align="right"
												height="200px"><b>내용&nbsp;</b></td>
											<td><textarea class="form-control" rows="10" cols="70"
													id="ny" name="contents" style="resize: none; wrap: hard;"
													maxlength="100"></textarea><br></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<button type="button" onclick="sendMsg()"
													class="btn btn-info">등록</button>
											</td>
										</tr>
									</table>
								</form>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

</body>


<script type="text/javascript">
	initMoving(document.getElementById("menu"), 10, 20, 200);

	function initMoving(target, xleft, ytop) {
		if (!target)
			return false;

		var obj = target;
		obj.initLeft = xleft;//절대좌표x
		obj.initTop = ytop;//절대좌표y
		obj.bottomLimit = 2000;

		obj.style.position = "relative";
		obj.top = obj.initTop;
		obj.left = obj.initLeft;

		if (typeof (window.pageYOffset) == "number") {
			obj.getTop = function() {
				return window.pageYOffset;
			}
		} else if (typeof (document.documentElement.scrollTop) == "number") {
			obj.getTop = function() {
				return document.documentElement.scrollTop;
			}
		} else {
			obj.getTop = function() {
				return 0;
			}
		}

		if (self.innerHeight) {
			obj.getHeight = function() {
				return self.innerHeight;
			}
		} else if (document.documentElement.clientHeight) {
			obj.getHeight = function() {
				return document.documentElement.clientHeight;
			}
		} else {
			obj.getHeight = function() {
				return 500;
			}
		}

		obj.move = setInterval(function() {
			if (obj.initTop > 0) {
				pos = obj.getTop() + obj.initTop;
			} else {
				pos = obj.getTop() + obj.getHeight() + obj.initTop;
				//pos = obj.getTop() + obj.getHeight() / 2 - 15;
			}

			if (pos > obj.bottomLimit)
				pos = obj.bottomLimit;
			if (pos < obj.topLimit)
				pos = obj.topLimit;

			interval = obj.top - pos;
			obj.top = obj.top - interval / 3;
			obj.style.top = obj.top + "px";
		}, 30);
	}
</script>

<script type="text/javascript">
	var log = "${login}";
	var pub = "${publog}";

	function sendMsg() {
		var a = document.getElementById("jm").value;
		var b = document.getElementById("ny").value;
		

		if (pub != "") {
			alert("출판사는 1:1 문의를  할 수 없습니다.")
			return;
		}
		if (log == "") {
			alert("로그인을 해주세요");
			return;
		} else {
			if (a == "" || b == "") {
				alert("정보를 모두 입력해주세요");
			} else {
				var id = document.bb.id.value;
				$.post("/bookspace/board/one", {
					"id" : id, 
					"title" : a,
					"contents" : b
				}, function(data) {
					if (data != "") {
						alert("답변 확인은 개인메뉴 -> 1:1 문의 창에서 확인하실 수 있습니다.");
						location.href = "/bookspace/cshome";
					} else {
						alert("실패");
						self.close();
					}
				});
			}
		}
	}

	function inner(data1, data2) {
		var path = "/bookspace/board/pop?title="+data1+"&content="+data2;
		var name = "bookSpace"; 
		var size = "width=450px, height=650px";
		window.open(path, name, size);
	} 
</script>




</html>
