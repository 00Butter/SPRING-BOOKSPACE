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
					style="background-color: white; color: #0066cc; font-style: normal; letter-spacing: normal; font-weight: bold;">
					<font style="font-size: xx-large;"># 장바구니</font>
				</h3>
				<br>
				<br>

				<div>
					<c:choose>
						<c:when test="${ !listc.isEmpty() }">
							<table class="table" style="text-align: center; width: 100%;">
								<thead>
									<tr>
										<th style="text-align: center;">상품명</th>
										<th style="text-align: center;" width="20%">가격</th>
										<th style="text-align: center;" width="5%">구매</th>
										<th style="text-align: center;" width="5%">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="each" items="${ listc }">
										<tr>
											<td>
												<div class="media">
													<div class="media-left">
														<a
															href="/bookspace/book/goBook?bookname=${ each.bookname }">
															<img
															src="/bookspace/resources/book/${ each.bookname }/${ each.img }"
															class="media-object" style="width: 60px; height: 80px;">
														</a>
													</div>
													<div class="media-body">
														<p style="text-align: center;">
															<a
																href="/bookspace/book/goBook?bookname=${ each.bookname }">${ each.bookname }</a>
														</p>
													</div>
												</div>
											</td>
											<td width="20%">${ each.price }</td>
											<td width="5%">
												<button type="button" class="btn btn-info btn-sm"
													onclick="paymentOne(${each.num})">구매</button>
											</td>
											<td width="5%">
												<button type="button" class="btn btn-info btn-sm"
													onclick="deleteOne(${each.num})">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>

							<table style="text-align: center; width: 100%;">
								<tbody>
									<tr>
										<th>
											<div style="width: 100%;">
												<div class="row">
													<c:set var="sum" value="0" />
													<c:set var="goods" value="0" />
													<c:forEach var="each" items="${ listc }" varStatus="tot">
														<c:set var="totG" value="${ goods=tot.index+1 }" />
														<c:set var="totP" value="${ sum=each.price+sum }" />
													</c:forEach>
													<div class="col-sm-6" style="background-color: #e6f0fa;">
														<h4
															style="text-align: center; font-weight: bold; background-color: #e6f0fa;">
															<font style="color: #528ec7; font-size: 22px;">총
																상품수</font>
														</h4>
														<h5
															style="text-align: center; font-weight: bold; font-size: large;">${ totG }권</h5>
													</div>
													<div class="col-sm-6" style="background-color: #d4e3f1;">
														<h4
															style="text-align: center; font-weight: bold; background-color: #d4e3f1;">
															<font style="color: #990000; font-size: 22px;">총
																결제금액</font>
														</h4>
														<h5 style="text-align: center; font-weight: bold;">
															<font style="color: #0000b3; font-size: large;">${ totP }원</font>
														</h5>
													</div>
												</div>
											</div>
										</th>
									</tr>
								</tbody>
							</table>
							<br>
							<br>

							<div align="center">
								<button type="button" class="btn btn-lg btn-default"
									onclick="deleteAll()">전체 삭제</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-lg btn-info"
									onclick="paymentAll()">전체 주문</button>
							</div>
						</c:when>
						<c:otherwise>
							<h4 style="background-color: white;">
								<font style="color: black; font-size: 35px;">장바구니가
									비어있습니다.</font>
							</h4>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

</body>

<script type="text/javascript">
   function paymentOne(num){
      location.href = "/bookspace/pay/paymentOne?num=" + num;
   }
   function deleteOne(num){
      location.href = "/bookspace/pay/deleteOne?num=" + num;
   }
   function paymentAll(){
      location.href = "/bookspace/pay/paymentAll";
   }
   function deleteAll(){
      location.href = "/bookspace/pay/deleteAll";
   }
</script>

</html>