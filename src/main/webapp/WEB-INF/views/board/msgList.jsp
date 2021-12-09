<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-top: 5%;">
	<div class="row" >
	<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h1 class="page-header">관리자 커뮤니티</h1>
			<ol class="breadcrumb">
				<li class="active"><button type="button" onclick="msgForm()" class="btn btn-default">
          <span class="glyphicon glyphicon-envelope" ></span> 쪽지보내기
        </button></li>
			</ol>
		</div>
	</div>
	<div class="row" align="center">
		<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
						<th>버튼</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach begin="${page.start}" step="1" end="${page.end}" items="${list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td>${dto.title}</td>
						<td>${dto.regdate}</td>
						<td>
						 <button type="button" onclick="msgInfo(${dto.num})" class="btn btn-success btn-sm">
       						   <span class="glyphicon glyphicon-search"></span>
      						  </button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
						<tr>
							<td colspan="4" align="center">
								<ul class="pager" id="num">
								<c:if test="${page.nowPage !=null && page.nowPage>3 }">
									<li class="previous"><a href="#">Previous</a></li>
								</c:if>
								<c:forEach begin="${page.showStart }" var="i" end="${page.showEnd }" step="1">
									<li class="numli" id="1"><a href="?page=${i}">${i}</a></li>
	
								</c:forEach>
								<c:if test="${page.nowPage !=null && page.nowPage<page.endPage}">
									<li class="next"><a href="#">Next</a></li>
								</c:if>
									
								</ul>
							</td>
						</tr>
					</tfoot>
			</table><br><br><hr>
		</div></div>
	</div>

</div>
<script type="text/javascript">
function msgForm() {
	var path="/bookspace/board/msgForm";
	var name="문의하기";
	var size="width=400px, height=320px";
	window.open(path,name,size);
}

function msgInfo(pagenum) {
	var url="/bookspace/board/msginfo?num="+pagenum;
	var name="쪽지내용"
	var size="width=400px, height=400px";
	window.open(url,name,size);
}
</script>
</body>
</html>