<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
</head>
<body>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2">
<!-- 				규격 맞추기 위해서 남겨둠 -->
			</div>
			<div class="col-sm-8 text-left" style="margin-top: 70px;">
				
			<h3 style="background-color: white; color: #0066cc; font-style: normal; letter-spacing: normal;">
				<font style="font-size: xx-large; font-weight: bold;"># 구매내역</font>
			</h3>
			<br><br>
			
			<c:choose>
				<c:when test="${ !listc.isEmpty() }">
					<table class="table" style="width: 100%; size: auto;">
						<thead>
							<tr>
								<th style="width: 6%">#</th>
								<th style="text-align: center;" width="50%">상품명</th>
								<th style="text-align: center;" width="19%">출판사</th>
								<th style="text-align: center;" width="12%">가격</th>
								<th style="text-align: center;" width="13%">구매날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach begin="${page.start}" step="1" end="${page.end}" var="each" items="${ listc }" varStatus="num">
							<tr>
								<td style="text-align: left;" width="6%">${ num.index + 1 }</td>
								<td width="50%">
									<div class="media">
										<div class="media-left">
											<a href="/bookspace/book/goBook?bookname=${ each.bookname }">
												<img src="/bookspace/resources/book/${each.bookname }/${ each.img }"
													class="media-object" style="width: 60px; height: 80px;">
											</a>
										</div>
										<div class="media-body">
											<p style="text-align: center;">
												<a href="/bookspace/book/goBook?bookname=${ each.bookname }">${ each.bookname }</a>
											</p>
										</div>
									</div>
								</td>
								<td style="text-align: center;">${ each.publisher }</td>
								<td style="text-align: center;" width="12%">${ each.price }</td>
								<td style="text-align: center;" width="13%">${ each.buyDate }</td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>      <!-- 수정 -->
                     <tr>
                        <td colspan="5" align="center">
                           <ul class="pager" id="num">
                           <c:if test="${page.nowPage != null && page.nowPage == page.endPage && page.endPage != 1}">
                              <li class="previous">
                                 <a href="?page=${ page.nowPage - 1 }">Previous</a>
                              </li>
                           </c:if>
                           <c:if test="${page.nowPage != null && page.nowPage == 1}">
                              <li class="previous">
                                 <a href="#">Previous</a>
                              </li>
                           </c:if>
                           <c:forEach begin="${ page.showStart }" var="i" end="${ page.showEnd }" step="1">
                              <li class="numli" id="1"><a href="?page=${i}">${i}</a></li>
                           </c:forEach>
                           <c:if test="${page.nowPage != null && page.nowPage < page.endPage}">
                              <li class="next">
                                 <a href="?page=${ page.nowPage + 1 }">Next</a>
                              </li>
                           </c:if>
                           <c:if test="${page.nowPage != null && page.nowPage == page.endPage}">
                              <li class="next">
                                 <a href="#">Next</a>
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
	<br><br><br>

</body>
</html>