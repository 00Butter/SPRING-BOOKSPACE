<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="col-sm-12">
		<div class="container">
			<div class="col-sm-12">
				<button type="button" class="btn btn-link btn-lg"
					onclick="javascript:allwait()">
					<font color="black">전체 보기</font>
				</button>
				<button type="button" class="btn btn-link btn-lg"
					onclick="javascript:inputwait()">
					<span class="label label-warning">등록 대기중</span>
				</button>
				<button type="button" class="btn btn-link btn-lg"
					onclick="javascript:delwait()">
					<span class="label label-danger">삭제 대기중</span>
				</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th><font face="굴림체" size="6"></font>책 제목</th>
						<th><font face="굴림체" size="6"></font>출판사</th>
						<th><font face="굴림체" size="6"></font>가격</th>
						<th><font face="굴림체" size="6"></font>작가이름</th>
						<th><font face="굴림체" size="6"></font>상태</th>
						<th></th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${dto!=null && dto.size()>0}">
						<tbody>
							<c:forEach begin="${page.start}" step="1" end="${page.end}"
								var="each" items="${dto}">
								<tr>
									<td><img src="/bookspace/resources/book/${each.bookname}/${each.img}"
										class="img-thumbnail" alt="Cinque Terre" width="75"
										height="100"></td>
									<td>${each.bookname}</td>
									<td>${each.publisher}</td>
									<td>${each.price}</td>
									<td>${each.writer}</td>
									<td><c:choose>
											<c:when test="${all!=null}">
												<span class="label label-default">등록완료</span>
											</c:when>
											<c:otherwise>
												<c:if test="${each.state eq '등록' }">
													<span class="label label-warning">등록 대기중</span>
												</c:if>
												<c:if test="${each.state eq '삭제' }">
													<span class="label label-danger">삭제 대기중</span>
												</c:if>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${all!=null}">
												<a href="/bookspace/book/detailAll?num=${each.num}">
											<button type="button" class="btn btn-default"
												name="detailView">상세보기</button></a>
											</c:when>
											<c:otherwise>
												<c:if test="${each.state eq '등록' }">
													<a href="/bookspace/book/detail?num=${each.num}">
											<button type="button" class="btn btn-default"
												name="detailView">상세보기</button></a>
												</c:if>
												<c:if test="${each.state eq '삭제' }">
													<a href="/bookspace/book/detail?num=${each.num}">
											<button type="button" class="btn btn-default"
												name="detailView">상세보기</button></a>
												</c:if>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" align="center">
									<ul class="pager" id="num">
										<c:if test="${page.nowPage !=null && page.nowPage>3 }">
											<li class="previous"><a href="?page=${page.nowPage-1 }">Previous</a></li>
										</c:if>
										<c:forEach begin="${page.showStart }" var="i"
											end="${page.showEnd }" step="1">
											<li class="numli" id="1"><a href="?page=${i}">${i}</a></li>

										</c:forEach>
										<c:if
											test="${page.nowPage !=null && page.nowPage<page.endPage}">
											<li class="next"><a href="?page=${page.nowPage+1 }">Next</a></li>
										</c:if>

									</ul>
								</td>
							</tr>
						</tfoot>
					</c:when>
					<c:otherwise>
						<tbody>
						<tr>
							<td colspan="7">등록된 내역이 없습니다.</td>
						</tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		function inputwait() {
			location.href = "/bookspace/book/corpList?data=등록";
		}
		function delwait() {
			location.href = "/bookspace/book/corpList?data=삭제";
		}
		function allwait() {
			location.href = "/bookspace/book/corpList";
		}
	</script>
</body>
</html>
