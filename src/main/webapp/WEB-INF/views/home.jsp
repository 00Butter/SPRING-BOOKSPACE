<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Welcome to Bookspace</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="author" content="Jake Rocheleau">
<link rel="shortcut icon"
	href="http://static.tmimgcdn.com/img/favicon.ico">
<link rel="icon" href="http://static.tmimgcdn.com/img/favicon.ico">


<style>
body {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
}

.container-fluid h2 {
	text-align: left;
	letter-spacing: 10px;
	font-size: 30px;
	color: #0066cc;
	margin-bottom: 15px;
	font-style: italic;
	margin-left: 20px;
}

.container-best h3 {
	margin: 20px 0 40px 0;
	letter-spacing: 10px;
	font-size: 30px;
	color: #fff;
	background-color: #0066cc;
	font-style: italic;
	margin-bottom: 0px;
}

.container {
	padding: 80px 120px;
}

.container-best {
	margin-bottom: 20px;
	margin-top: 35px;
}

.container-best h3 {
	margin-bottom: 0px;
}

@media ( max-width : 400px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
	.nav navbar-nav li {
		width: 40%;
	}
}

.modal-header, h4, .close {
	background-color: #333;
	color: #fff !important;
	text-align: center;
	font-size: 30px;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}

.nav-tabs li a {
	color: #777;
}

.navbar {
	color: #fff;
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #0066cc;
	border: 0;
	font-size: 13px !important;
	letter-spacing: 4px;
	opacity: 0.9;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #0066cc !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle, .open .dropdown-toggle:hover, .open .dropdown-toggle:focus
	{
	color: #0066cc;
	background-color: #000000 !important;
}

.dropdown-menu li {
	width: 200px;
}

.dropdown-menu li a {
	display: block;
}

.dropdown-menu li a {
	color: #000 !important;
	font-weight: bold;
	font-size: 18px;
}

.dropdown-menu li a:hover {
	background-color: blue !important;
}

footer {
	background-color: #2d2d30;
	color: #f5f5f5;
	padding: 32px;
}

footer a {
	color: #f5f5f5;
}

.form-control {
	border-radius: 0;
}

textarea {
	resize: none;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #ccccb3;
}

.carousel-indicators li {
	border-color: #fff;
}

.carousel-indicators li.active {
	background-color: #ccccb3;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 120px 0;
}

.item span {
	font-style: normal;
}

.item-active {
	margin-bottom: 35px;
}

footer {
	padding: 0 40px 90px 20px;
	margin: 0 auto;
	border-top: 1px solid #e8e8ec;
	clear: both;
	height: 150px;
}

footer ul li {
	vertical-align: top;
	letter-spacing: -1px
}

footer ul.info li.link {
	float: left;
	margin-top: 38px;
	color: #79797f;
	font-size: 11px
}

footer ul.info li.link a:hover {
	text-decoration: none
}

footer ul.info li.flogo {
	float: left;
	margin-top: 0px;
	color: #79797f;
	font-size: 0px
}

footer ul.info li.flogo {
	float: right;
	margin-top: 30px;
}

#myCarousel {
	margin-bottom: 40px;
}

.logo-small {
	color: #0099cc;
	font-size: 120px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.gnb_total_wrap ul {
	display: inline-block;
}

.menu li {
	color: #000000;
	font-size: 20px;
}

.menu li ul {
	color: #000000;
}

ul.menu li a {
	display: block;
	font-weight: bold;
	text-decoration: none;
}

ul.menu li a:hover {
	background-color: #004e7b;
}

.img {
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">

	function search() {

		var a = document.getElementById("s").value;
		if (a == "" || a == null) {
			alert("검색어를 입력해주세요");
			return;
		} else {
			var abc = document.frm;
			abc.method = "post";
			abc.action = "/bookspace/book/search";
			abc.submit();
		}
	}

	function pop() {
		var url = "/bookspace/puAskForm";
		var popname = "pop01"; // 변수 이름 name 사용 불가(예약어)
		var size = "width=630	, height= 400;";
		window.open(url, popname, size);
	}

</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50" style="width: 100%; height: 100%">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<script type="text/javascript">
				$(function() {
					$("ul.sub").hide(); // 그전껄  숨겨라
					$("ul.menu li").hover(function() { // li에 올리면
						$("ul:not(:animated)", this).slideDown("fast");//빠르게 다운
					}, function() {
						$("ul", this).slideUp("fast"); // 빠르게 업
					});
				});
			</script>


			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li
						style="color: white; font-weight: bold; font-size: 20px; margin-top: 0px;"><a
						href="/bookspace/">bookspace</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">전체보기 </a>
						<ul class="dropdown-menu">
							<div id="container">
								<ul class="menu">
									<li><a href="/bookspace/book/novel">소설</a>
										<ul class="sub">
											<li><a href="/bookspace/book/추리">추리</a></li>
											<li><a href="/bookspace/book/로맨스">로맨스</a></li>
											<li><a href="/bookspace/book/판타지">판타지</a></li>
											<li><a href="/bookspace/book/역사">역사</a></li>
											<li><a href="/bookspace/book/고전">고전</a></li>
										</ul></li>
									<li><a href="/bookspace/book/cartoon">만화</a>
										<ul class="sub">
											<li><a href="/bookspace/book/순정">순정</a></li>
											<li><a href="/bookspace/book/무협">무협</a></li>
											<li><a href="/bookspace/book/판타지＆SF">판타지＆SF</a></li>
											<li><a href="/bookspace/book/성인만화">성인만화</a></li>
											<li><a href="/bookspace/book/액션＆스포츠">액션＆스포츠</a></li>
											<li><a href="/bookspace/book/코믹">코믹</a></li>
											<li><a href="/bookspace/book/공포">공포</a></li>
										</ul></li>
									<li><a href="/bookspace/book/magazine">잡지</a>
										<ul class="sub">
											<li><a href="/bookspace/book/경영">경영</a></li>
											<li><a href="/bookspace/book/교양">교양</a></li>
											<li><a href="/bookspace/book/패션뷰티">패션뷰티</a></li>
											<li><a href="/bookspace/book/취미">취미</a></li>
											<li><a href="/bookspace/book/성인">성인</a></li>
										</ul></li>
									<li><a href="/bookspace/book/selfcon">자기계발</a>
										<ul class="sub">
											<li><a href="/bookspace/book/성공">성공</a></li>
											<li><a href="/bookspace/book/리더십">리더십</a></li>
											<li><a href="/bookspace/book/창업">창업</a></li>
											<li><a href="/bookspace/book/인간관계">인간관계</a></li>
										</ul></li>
									<li><a href="/bookspace/book/travel">여행</a>
										<ul class="sub">
											<li><a href="/bookspace/book/국내">국내</a></li>
											<li><a href="/bookspace/book/해외">해외</a></li>
										</ul></li>
									<li><a href="/bookspace/book/lang">외국어</a>
										<ul class="sub">
											<li><a href="/bookspace/book/영어">영어</a></li>
											<li><a href="/bookspace/book/중국어">중국어</a></li>
											<li><a href="/bookspace/book/일본어">일본어</a></li>
											<li><a href="/bookspace/book/그 외">그 외</a></li>
										</ul></li>
									<li><a href="/bookspace/book/religion">종교</a>
										<ul class="sub">
											<li><a href="/bookspace/book/불교">불교</a></li>
											<li><a href="/bookspace/book/가톨릭">가톨릭</a></li>
											<li><a href="/bookspace/book/기독교">기독교</a></li>
											<li><a href="/bookspace/book/기타">기타</a></li>
										</ul></li>
								</ul>
							</div>
						</ul></li>
					<c:if test="${active2 != null ? 'active2' : '' }" />
					<c:if test="${active3 != null ? 'active3' : '' }" />
					<c:if test="${active4 != null ? 'active4' : '' }" />

					<li class="${active2}"><a href="/bookspace/book/novel">소 설</a></li>
					<li class="${active3}"><a href="/bookspace/book/cartoon">만
							화</a></li>
					<li class="${active4}"><a href="/bookspace/book/magazine">잡
							지</a></li>
					<c:choose>
						<c:when test="${login != null }">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">${login }님<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<div>
										<ul class="menu2">
											<li><a onclick="logoutgo()">로그아웃</a>
											<li class="divider"></li>
											<li><a href="/bookspace/member/update">내 정보</a></li>
											<li><a href="/bookspace/pay/cart">장바구니</a></li>
											<li><a href="/bookspace/member/mybook">내 책장</a></li>
											<li><a href="/bookspace/pay/cashList">충전 내역</a></li>
											<li><a href="/bookspace/pay/buyList">구매 내역</a></li>
											<li><a href="/bookspace/review/reviewList">내 리뷰</a></li>
											<li><a href="/bookspace/board/QnAList">내 문의보기</a></li>
											<li><a onclick="popupgo('/bookspace/pay/cash')">캐시
													충전</a></li>
											<li><a href="/bookspace/member/exitguide/">회원 탈퇴</a></li>
										</ul>
									</div>
								</ul></li>
						</c:when>
						<c:when test="${publog != null }">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">${publog}님<span
									class="caret"></span></a>
								<ul class="dropdown-menu">

									<ul class="menu2">
										<li><a onclick="logoutgo()">로그아웃</a>
										<li class="divider"></li>
										<li><a href="/bookspace/corp/myinfo">출판사정보</a></li>
										<li><a href="/bookspace/book/insert">도서등록</a></li>
										<li><a href="/bookspace/book/corpList">도서목록</a></li>
										<li><a href="/bookspace/corp/qnaList">문의게시판</a></li>
										<li><a href="/bookspace/corp/account">월매출현황</a></li>
										<li><a href="/bookspace/board/msgList">쪽지함</a></li>
										<li class="divider"></li>
										<li><a href="/bookspace/member/exitguide/">계약철회</a></li>
									</ul>

								</ul></li>
						</c:when>
						<c:when test="${syslog != null }">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">${syslog }님<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<div>
										<ul class="menu2">
											<li><a onclick="logoutgo()">로그아웃</a>
											<li class="divider"></li>
											<li><a href="/bookspace/admin/home">관리자페이지</a></li>
										</ul>
									</div>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">로그인 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/bookspace/login/loginForm">로그인</a></li>
									<li><a href="/bookspace/login/clause">회원가입</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>

					<li><a class="dropdown-toggle" data-toggle="dropdown"><span
							class="glyphicon glyphicon-search" href="#"></span></a>
						<ul class="dropdown-menu" style="width: 250px">
							<form name="frm" class="navbar-form navbar-right" role="search">
								<div class="form-group input-group">
									<input type="text" class="form-control" name="text" id="s"
										placeholder="Search.."> <span class="input-group-btn">
										<button onclick="search()" class="btn btn-default"
											type="button">
											<span id="aa" class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</form>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="m">
		<c:choose>
			<c:when test="${main != null}">
				<jsp:include page="${main }"></jsp:include>
			</c:when>
			<c:otherwise>
			<script type="text/javascript">
			$(document).ready(function() {

			    var target = "${popup}"; 
			    if (target == "") {
			       var path = "/bookspace/pop";
			       var name = "popup";
			       var size = "width=300px, height=400px, left = 100, top = 30";
			       window.open(path, name, size);
			    } 
			 });
			</script>
				<div>
					<!-- Wrapper for slides -->
					<div class="item-active" style="margin-top: 50px;">
						<img src="/bookspace/resources/img/galaxy4.jpg"
							class="img-responsive" alt="New York" width="100%" height="250">
					</div>

					<h5 style="text-align: center; font-style: italic;">" 좋은 책을 읽는
						것은 과거의 가장 뛰어난 사람들과 대화를 나누는 것과같다. "</h5>
					<h6 style="text-align: center">(-R. 데카르트-)</h6>
					<div class="container-best bg-5 text-center" style="width: 100%;">
						<h3 style="margin-bottom: 35px">Best Seller</h3>
						<div class="row">
							<div class="col-sm-1"></div>

							<c:forEach var="i" begin="0" end="4" step="1">
								<div class="col-sm-2">
									<a href="/bookspace/book/stOne?num=${best[i].num }"><img
										class="img" src="/bookspace/resources/book/${best[i].bookname }/${best[i].img }"
										alt="Image" style="width: 150px; height: 200px;"></a>
									<p style="font-size: 18px; color: #000;">${best[i].bookname }</p>
									<p>${best[i].maintype}/${best[i].subtype }</p>
									<p>${best[i].price}원</p>
								</div>
							</c:forEach>
							<div class="col-sm-1"></div>
						</div>
					</div>

					<div id="myCarousel" class="carousel slide text-center"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" >
							<div class="item active">
								<a style="cursor: auto;"> 
								<img src="/bookspace/resources/img/design.png" width="100%">
								</a>
							</div>
							<div class="item">
								<a style="cursor: auto;"> <img
									src="/bookspace/resources/img/sony.png" width="100%">
								</a>
							</div>
							<div class="item">
								<a style="cursor: auto;"> <img
									src="/bookspace/resources/img/iphone.png" width="100%">
								</a>
							</div>
						</div>


						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>


					<div class="container-fluid bg-3 text-center">
						<h2>신 간 도 서</h2>
						<hr style="border: #ccebff 2px solid;">
						<div class="row">
							<div class="col-sm-1"></div>

							<c:forEach var="i" begin="0" end="4" step="1">
								<div class="col-sm-2">
									<a href="/bookspace/book/stOne?num=${newB[i].num }"><img
										class="img" src="/bookspace/resources/book/${newB[i].bookname }/${newB[i].img }"
										alt="Image" style="width: 150px; height: 200px;"></a>
									<p style="font-size: 18px; color: #000;">${newB[i].bookname }</p>
									<p>${newB[i].maintype}/${newB[i].subtype }</p>
									<p>${newB[i].price}원</p>
								</div>
							</c:forEach>

							<div class="col-sm-1"></div>

						</div>
					</div>

					<div class="container-fluid bg-3 text-center"
						style="margin-top: 60px">
						<h2>인기 잡지</h2>
						<hr style="border: #ccebff 2px solid;">
						<div class="row">
							<div class="col-sm-1"></div>
							<c:forEach var="i" begin="0" end="4" step="1">
								<div class="col-sm-2">
									<a href="/bookspace/book/stOne?num=${magz[i].num }"><img
										class="img" src="/bookspace/resources/book/${magz[i].bookname }/${magz[i].img }"
										alt="Image" style="width: 150px; height: 200px;"></a>
									<p style="font-size: 18px; color: #000;">${magz[i].bookname }</p>
									<p>${magz[i].maintype}/${magz[i].subtype }</p>
									<p>${magz[i].price}원</p>
								</div>
							</c:forEach>
							<div class="col-sm-1"></div>
						</div>
					</div>

					<div class="container-fluid bg-3 text-center"
						style="margin-top: 60px">
						<h2>인기 만화</h2>
						<hr style="border: #ccebff 2px solid;">
						<div class="row">
							<div class="col-sm-1"></div>
							<c:forEach var="i" begin="0" end="4" step="1">
								<div class="col-sm-2">
									<a href="/bookspace/book/stOne?num=${cartoon[i].num }"><img
										class="img"
										src="/bookspace/resources/book/${cartoon[i].bookname }/${cartoon[i].img }"
										alt="Image" style="width: 150px; height: 200px;"></a>
									<p style="font-size: 18px; color: #000;">${cartoon[i].bookname }</p>
									<p>${cartoon[i].maintype}/${cartoon[i].subtype }</p>
									<p>${cartoon[i].price}원</p>
								</div>
							</c:forEach>
							<div class="col-sm-1"></div>
						</div>
					</div>

					<div class="container-fluid4 text-center" style="margin-top: 5%">
						<h2
							style="text-align: center; background-color: #0099cc; color: #fff; font-style: italic; letter-spacing: 10px;">SERVICES</h2>
						<br>
						<div class="row">
							<div class="col-sm-4">
								<c:choose>
									<c:when test="${login != null }">
										<a onclick="popupgo('/bookspace/pay/cash')"> <span
											class="glyphicon glyphicon-off logo-small"></span>
											<h4>캐시 충전</h4></a>
									</c:when>
									<c:otherwise>
										<a onclick="popupno()"> <span
											class="glyphicon glyphicon-off logo-small"></span>
											<h4>캐시 충전</h4></a>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="col-sm-4">
									<a href="/bookspace/star"> <span
										class=" glyphicon glyphicon-star logo-small"></span>
										<h4>회원등급 및 혜택</h4>
									</a>
								</div>
								<div class="col-sm-4">
									<a href="/bookspace/cshome"> <span
										class="glyphicon glyphicon-lock logo-small"></span>
										<h4>고객 센터</h4>
									</a>
								</div>
							
						</div>
					</div>

				</div>
			</c:otherwise>


		</c:choose>
	</div>
	<footer>
		<ul class="info">
			<li class="link">
				<p>
					<a href="" target="_blank">회사소개</a> <span>|</span> <a href="">이용약관</a>
					<span>|</span> <span>|</span> <a href=""><strong>개인정보처리방침</strong></a>
					<span>|</span> <a href="">운영정책</a>
				</p>
				<p class="addr">
					(주) 북스페이스 대표이사 김영은 <span>|</span> 서울특별시 <em>대식</em>로 <em>39-8</em>
					(은솔동, <em>예린</em>센터) <span>|</span> 사업자등록번호 <em>201-81-64417</em> <span>|</span>
					<a
						href="javascript:void(window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2018164417', '_bizinfo', 'width=750, height=700, scrollbars=no'));"><strong>사업자정보확인</strong></a><br />
					통신판매업 신고 제<em>2015-</em>서울 강남<em>-0003</em>호 <span>|</span> 전화 <em>1588-7701</em>
					<span>|</span> 팩스 <em>0502-258-8390</em> <span>|</span>
				</p>
			</li>
			<li class="flogo"><a href="/bookspace/"><img
					src="/bookspace/resources/img/logo.png" alt="북스페이스" align="right"
					width="30%" height=30%></a></li>

		</ul>
	</footer>



	<script type="text/javascript">
		$(function() {
			$('a[href="#"]').on('click', function(e) {
				e.preventDefault();
			});

			$('#menu > li').on('mouseover', function(e) {
				$(this).find("ul:first").show();
				$(this).find('> a').addClass('active');
			}).on('mouseout', function(e) {
				$(this).find("ul:first").hide();
				$(this).find('> a').removeClass('active');
			});

			$('#menu li li').on('mouseover', function(e) {
				if ($(this).has('ul').length) {
					$(this).parent().addClass('expanded');
				}
				$('ul:first', this).parent().find('> a').addClass('active');
				$('ul:first', this).show();
			}).on('mouseout', function(e) {
				$(this).parent().removeClass('expanded');
				$('ul:first', this).parent().find('> a').removeClass('active');
				$('ul:first', this).hide();
			});
		});
	</script>



</body>
<script type="text/javascript">
	function popupgo(path) {
		var path = path;
		var name = "bookSpace";
		var size = "width=410px, height=442px";
		window.open(path, name, size);
	}
	function popupno() {
		alert("회원로그인이 필요합니다.");
	}
	
	function logoutgo(){
		if(confirm("로그아웃하시겠습니까?")){
			location.href="/bookspace/login/logout";
		}
	}
	
	
	
</script>
<script>
 
</script>
</html>


