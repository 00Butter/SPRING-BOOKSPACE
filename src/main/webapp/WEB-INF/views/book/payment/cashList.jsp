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
				<font style="font-size: xx-large; font-weight: bold;"># 충전 내역</font>
			</h3>
			<br><br>
			
			<c:choose>
				<c:when test="${ !listc.isEmpty() }">
					<table class="table" style="width: 100%;">
						<thead>
							<tr>
								<th style="width: 8%">#</th>
								<th style="width: 28%; text-align: center;">충전금액</th>
								<th style="text-align: center; width: 45%">결제수단</th>
								<th style="width: 18%; text-align: center;">충전날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach begin="${page.start}" step="1" end="${page.end}" var="each" items="${ listc }" varStatus="num">		<!-- 수정 -->
							<tr>
								<td style="width: 8%">${ num.index + 1 }</td>
								<td style="width: 28%; text-align: center;">${ each.price }원</td>
								<td style="text-align: center; width: 45%">${ each.cashType }</td>
								<td style="width: 18%; text-align: center;">${ each.cashDate }</td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>		<!-- 수정 -->
							<tr>
								<td colspan="4" align="center">
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
					<h4 style="background-color: white;"><font style="color: black; font-size: 35px;">충전내역이 없습니다.</font></h4>
				</c:otherwise>
			</c:choose>
				
			</div>
				
		</div>
	</div>
	<br><br><br>

</body>
</html>