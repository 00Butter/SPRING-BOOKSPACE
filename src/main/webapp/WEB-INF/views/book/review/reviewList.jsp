<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
</head>
<body>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2">
				<!--             규격 맞추기 위해서 남겨둠 -->
			</div>
			<div class="col-sm-8 text-left" style="margin-top: 70px;">
				<h3
					style="background-color: white; color: #0066cc; font-style: normal; letter-spacing: normal;">
					<font style="font-size: xx-large; font-weight: bold;"># 내 리뷰</font>
				</h3>
				<br> <br>

				<c:choose>
					<c:when test="${ !listc.isEmpty() }">
						<table class="table">
							<tbody>
								<c:forEach begin="${page.start}" step="1" end="${page.end}"
									var="each" items="${ listc }" varStatus="num">
									<tr>
										<td style="text-align: left; vertical-align: middle;"
											width="5%">${ num.index + 1 }</td>
										<td width="40%">
											<div class="media">
												<div class="media-left">
													<a
														href="/bookspace/book/goBook?bookname=${ each.bookname }">
														<img
														src="/bookspace/resources/book/${each.bookname }/${ each.img }"
														class="media-object" style="width: 60px">
													</a>
												</div>
												<div class="media-body"
													style="vertical-align: middle; text-align: center;">
													<font style="font-weight: bold; font-size: 15px;"> <a
														href="/bookspace/book/goBook?bookname=${ each.bookname }">${ each.bookname }</a></font>
												</div>
											</div>
										</td>
										<td style="text-align: center; vertical-align: middle;"
											width="14%">${ each.reviewDate }</td>
										<td style="text-align: center; vertical-align: middle;"
											width="8%"><c:if test="${ each.review != '-' }">
												<button type="button" class="btn btn-info btn-sm"
													onclick="view(${each.num})">리뷰 보기</button>
											</c:if> <c:if test="${ each.review == '-' }">
												<button type="button" class="btn btn-info btn-sm"
													onclick="javascript:popupOpen(${each.num});">리뷰 작성</button>
											</c:if></td>
										<td style="text-align: center; vertical-align: middle;"
											width="8%"><c:if test="${ each.review != '-' }">
												<button type="button" class="btn btn-info btn-sm"
													onclick="javascript:reviewDelet(${each.num})">리뷰
													삭제</button>
											</c:if> <c:if test="${ each.review == '-' }">
												<button type="button" class="btn btn-info btn-sm disabled">리뷰
													삭제</button>
											</c:if></td>
										<td style="text-align: center; vertical-align: middle;"
											width="12%"><span class="glyphicon glyphicon-thumbs-up"
											style="color: #0066cc; font-size: 15px;"></span> &nbsp; ${ each.recommend }</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<!-- 수정 -->
								<tr>
									<td colspan="6" align="center">
										<ul class="pager" id="num">
											<c:if
												test="${page.nowPage >1}">
												<li class="previous"><a
													href="?page=${ page.nowPage - 1 }">Previous</a></li>
											</c:if>
											<c:forEach begin="${ page.showStart }" var="i"	end="${ page.showEnd }" step="1">
												<li class="numli" id="1"><a href="?page=${i}">${i}</a></li>
											</c:forEach>
											<c:if
												test="${page.nowPage < page.endPage}">
												<li class="next"><a href="?page=${ page.nowPage + 1 }">Next</a>
												</li>
											</c:if>
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</c:when>
					<c:otherwise>
						<h4 style="background-color: white;">
							<font style="color: black; font-size: 35px;">구매내역이 없습니다.</font>
						</h4>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<script type="text/javascript">
      function popupOpen(num) {
         var popUrl = "/bookspace/review/review?num=" + num;
         var popOption = "width=530, height=430, resizable=no, scrollbars=no, status=no;";
         window.open(popUrl, "", popOption);
      }
      function view(num){
         var popUrl = "/bookspace/review/revView?num=" + num;
         var popOption = "width=530, height=380, resizable=no, scrollbars=no, status=no;";
         window.open(popUrl, "", popOption);
      }
      function reviewDelet(num) {
         deleteCh = confirm("리뷰를 정말 삭제하시겠습니까?");

         if (deleteCh) {
            location.href = "/bookspace/review/revDelete?num=" + num;
         } else {
            return;
         }
      }
   </script>

</body>
</html>