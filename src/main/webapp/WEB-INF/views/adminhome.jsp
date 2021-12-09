<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>bookspace</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<spring:url var="httpRequest_js" value="/resources/files_js/httpRequest.js"/>
<spring:url var="min_js" value="/resources/files_js/jquery-3.1.1.min.js"/>
<script src="${httpRequest_js }"></script>
<script src="${min_js }"></script>
    <!-- jQuery -->
    <script src="/resources/files_js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/files_js/bootstrap.min.js"></script>
    <script src="/resources/files_js/plugins/morris/raphael.min.js"></script>
    <script src="/resources/files_js/plugins/morris/morris.min.js"></script>
    <script src="/resources/files_js/plugins/morris/morris-data.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/bookspace/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/bookspace/resources/css/sb-admin.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="/bookspace/resources/css/plugins/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/bookspace/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<c:if test="${syslog==null}">
<script type="text/javascript">
alert("로그인후 접근가능합니다.");
location.href="/bookspace/home";
</script>
</c:if>
<script type="text/javascript">
var msg="${msgpop}";
if(msg!=""){
	alert(msg);
}
</script>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/bookspace/admin/home"><span
					class="glyphicon glyphicon-cog"> BookSpaceSystemAdmin</span></a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">				
				<li class="dropdown" style="margin-right: 40px">
					<!-- 사람드롭메뉴 --> <a href="" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i><b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${adminlog!=null }">
								<li><a href="#"><i class="fa fa-fw fa-user"></i>
										Profile</a></li>
								<li><a href="#"><i class="fa fa-fw fa-gear"></i> 탈퇴</a></li>
								<li class="divider"></li>
								<li><a  onclick="logout()"><i class="fa fa-fw fa-power-off"></i>
										Log Out </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/bookspace/admin/nofind"><i class="fa fa-fw fa-user"></i> no.찾기</a>
								</li>
								<li class="divider"></li>
								<li><a href="#myModal" data-toggle="modal"
									data-target="#myModal"><i class="fa fa-fw fa-power-off"></i>
										Log In </a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>

			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
				<c:if test="${adminlog!=null }">
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo1"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;
							Book <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo1" class="collapse">
							<li><a href="/bookspace/admin/book/allList">전체 도서 목록</a></li>
							<li><a href="/bookspace/admin/book/confirmList">도서 등록 요청</a>
							</li>
							<li><a href="/bookspace/admin/book/deleteList">도서 삭제 요청</a>
							</li>
						</ul></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo2"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;
							Member <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo2" class="collapse">
							<li><a href="/bookspace/admin/member/selectList">전체 회원
									목록</a></li>
							<li><a href="/bookspace/admin/member/selectChart">회원 가입
									통계</a></li>
						</ul></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo3"><i class="fa fa-fw fa-bar-chart-o"></i>&nbsp;&nbsp;
							Publisher <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo3" class="collapse">
							<li><a href="/bookspace/admin/pub/list">전체 업체 목록</a></li>
							<li><a href="/bookspace/admin/pub/pay">업체별 수익내역</a></li>
							<li><a href="/bookspace/admin/pub/delete">계약 해제 요청</a></li>
						</ul></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo4"><i class="	glyphicon glyphicon-usd"></i>&nbsp;&nbsp;
							Account <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo4" class="collapse">
							<li><a href="/bookspace/admin/account/all">전체 매출</a></li>
							<li><a href="/bookspace/admin/visitor">방문자 통계</a></li>
							<li><a href="/bookspace/admin/chart/all">장르별 선호도</a></li>
						</ul></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo5"><i class="fa fa-fw fa-edit"></i>&nbsp;&nbsp;
							Board <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo5" class="collapse">
							<li><a href="/bookspace/admin/board/member">회원 게시판</a></li>
							<li><a href="/bookspace/admin/board/complain">신고 내역</a></li>
							<li><a href="/bookspace/admin/board/pubmsg">업체 게시판</a></li>
						</ul></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo6"><i class="glyphicon glyphicon-wrench"></i>&nbsp;&nbsp;
							adminSetting <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo6" class="collapse">
							<li><a href="/bookspace/admin/setting/notice">공지사항 등록</a></li>
							<li><a href="/bookspace/admin/setting/insert">관리자 등록</a></li>
							<li><a href="/bookspace/admin/setting/list">관리자 목록</a></li>
						</ul></li>
						</c:if>
					<li><a href="/bookspace"><i
							class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp; 웹사이트로돌아가기</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">

							[ ${veiwTitle!=null ? veiwTitle:"관리자 페이지"} ]<small>북스페이스 관리페이지</small>
						</h1>
					</div>
				</div>
				<c:choose>
					<c:when test="${mainview!=null }">

						<jsp:include page="${mainview }"></jsp:include>

					</c:when>
					<c:otherwise>


					</c:otherwise>
				</c:choose>

			</div>

		</div>
		<div class="row">
			<div class="col-lg-8">

				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>							
							<form action="/bookspace/admin/log" method="post">
							<div class="modal-body">
								<jsp:include page="admin/adminlog.jsp"/>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div></form>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>



	<script type="text/javascript">
	$(document).ready(function(){
		var logid=${adminlog};
		if(logid!=""&&logid!=null){
			$(".side-nav").addClass("disabled");
		}
	});
	
	function logout(){
		if(confirm("로그아웃하시겠습니까?")){
			location.href="/bookspace/admin/logout";
		}
	}

	
function adminSet(){
	var url="/bookspace/admin/insertForm";
	var popname="사용자 등록";
	var x=self.innerWidth/2;
	var y=self.innerHeigh/2;
	var size="width=300,height=250,left="+x+", top="+y;
	window.open(url,popname,size);
}


</script>
</body>
</html>
