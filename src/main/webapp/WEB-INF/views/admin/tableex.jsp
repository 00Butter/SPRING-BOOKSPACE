<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var msg = "${msgpp}";
	if (msg != "") {
		alert(msg);
		location.href="/bookspace/admin/home";
	}
</script>
<c:if test="${page!=null}">
	<c:set target="${dto}" property="nowPage" value="${page}"></c:set>
</c:if>
<body>
	<c:if test="${search != null}">
		<div class="row">
			<form action="/bookspace/admin/search" method="post">
				<div class="col-lg-6">
					<input type="hidden" name="searchtype" class="form-control"
						name="search" size="50" value="${searchtype }"> <input
						type="text" class="form-control" name="search" size="50"
						placeholder="${search}">
				</div>

				<button type="submit" class="btn">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
		</div>
	</c:if>

	<div class="row">
		<div class="col-lg-12">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<c:choose>
								<c:when test="${dto != null}">
									<c:forEach var="i" items="${dto.thead}">
										<th width="${i=='도서명' ? '40%':'10%' || i=='no.' ? '5%':'10%'}">${i}</th>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<th width="20%">출판사</th>
									<th width="50%">책이름</th>
									<th align="right"></th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${dto.list.size() > 0}">
								<c:forEach var="i" begin="${dto.start}" end="${dto.end}"
									step="1">
									<tr>
										<c:if test="${dto.tbody[i]!=null }">
											<c:forEach var="td" items="${dto.tbody[i]}" varStatus="count">
												<td>${td}</td>
											</c:forEach>
											<td><c:if test="${dto.infoPath[i]!=null}">
													<button type="button" class="btn btn-info btn-sm"
														onclick="javascript:goInfo('${dto.infoPath[i]}')">상세정보</button>&nbsp;
    		</c:if> <c:choose>
													<c:when test="${bt!=null }">
														<button type="button" class="btn btn-${dto.type} btn-sm"
															onclick="javascript:goInfo('${dto.secPath[i]}')">${dto.btname}</button>
													</c:when>
													<c:otherwise>
														<a href="${dto.secPath[i]}">
															<button type="button" class="btn btn-${dto.type} btn-sm">${dto.btname}</button>
														</a>
													</c:otherwise>
												</c:choose></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3">확인되는 데이터가 존재하지않습니다.</td>
								</tr>

							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="${dto.thead.size()}" align="center">
								<ul class="pager">
									<c:choose>
										<c:when test="${dto.tbody!=null }">
											<c:if test="${dto.nowPage!= 1 }">
												<li class="previous"><a href="?page=${dto.nowPage-1}">Previous</a></li>
											</c:if>
											<c:forEach begin="${dto.showStart}" var="page" step="1"
												end="${dto.showEnd}">
												<li><a href="?page=${page}">${page}</a></li>
											</c:forEach>
											<c:if test="${dto.nowPage<dto.endPage}">
												<li class="next"><a href="?page=${dto.nowPage+1}">Next</a></li>
											</c:if>
										</c:when>

									</c:choose>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var hei="${height}";
		function goInfo(path) {
			var url = path;
			var popname = "상세정보";
			var x = self.innerWidth / 2;
			var y = self.innerHeigh / 2;
			if(hei==""||hei=="null"){
				hei=600;
			}
			var size = "width=500,height="+hei+",left=" + x + ", top=" + y;
			window.open(url, popname, size);
		}
	</script>
</body>
</html>