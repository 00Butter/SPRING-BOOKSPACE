<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<style>
h2 {
	margin: 20px 0 40px 0;
	letter-spacing: 10px;
	font-size: 30px;
	color: #000;
	font-style: italic;
	margin-top: 80px;
	margin-bottom: 20px;
	margin-left: 40px;
}

footer {
	margin-top: 250px;
}

@media screen and (max-width: 767px) {
	#well {
		display: none;
	}
}
</style>
</head>
<body>

	<div class="container-fluid1 text-center">
		<div class="row content">
			<h2 style="font-weight: bold; color: #000; text-align: left;">검색
				결과</h2>
			<hr style="border: #ccebff 2px solid;">
			<div class="panel">
				<div class="col-sm-12 ">
					<div class="row" style="margin-bottom: 0px;">
						<div class="col-sm-2"></div>
						<div class="col-sm-7">
							<div class="col-sm-12" style="margin-bottom: -120px;">
								<c:choose>
									<c:when test="${list.size() != 0 }">
										<c:forEach varStatus="k" var="each" items="${list }">
											<div class="col-sm-3">
												<div class="panel panel-primary">
													<div class="panel-heading">${each.bookname }</div>
													<div class="panel-body">
														<a href="/bookspace/book/stOne?num=${each.num }">
														<img src="/bookspace/resources/book/${each.bookname }/${each.img }"
															class="img-responsive"
															style="width: 100%; height: 220px;" alt="Image"></a>
													</div>
													<div class="panel-footer">
														<p>${each.maintype}/${each.subtype}</p>
														<p>${each.price}원</p>
														<p>
															<c:forEach var="i" begin="1" end="${each.totalstar}"
																step="1">
												                    ★
											          </c:forEach>
														</p>
													</div>
												</div>
											</div>
											<c:if test="${(k.index % 4) == 0 && (k.index != 0) }">
												<br>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<h1 style="margin-top: 200px; color: #0066cc;">검색 결과가
											없습니다.</h1>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-sm-1"></div>
						<div id="well" class="col-sm-1"
							style="margin-top: -180px; width: 200px">
							<div class="well">
								<div class="pricing_header">
									<h4
										style="font-weight: bold; color: #000; margin-bottom: 15px;">TopSeller</h4>
									<div class="space">
										<a href="/bookspace/book/stOne?num=${best[0].num }"> <img
											src="/bookspace/resources/book/${best[0].bookname }/${best[0].img}"
											width="50%" height="50%" />
										</a>
										<p
											style="margin-top: 15px; font-weight: bold; font-size: 20px; letter-spacing: 4px;">${best[0].bookname }</p>
										<p>${best[0].maintype }/${best[0].subtype }</p>
										<p>${best[0].price }원</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-1"></div>
					</div>

				</div>


			</div>
		</div>
	</div>


	<script type="text/javascript">
		initMoving(document.getElementById("well"), 10, 200, 400);

		function initMoving(target, xleft, ytop) {
			if (!target)
				return false;

			var obj = target;
			obj.initLeft = xleft;//절대좌표x
			obj.initTop = ytop;//절대좌표y
			obj.bottomLimit = 700;

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
	<!-- http://sbsincheon.com/#top -->
</body>
</html>