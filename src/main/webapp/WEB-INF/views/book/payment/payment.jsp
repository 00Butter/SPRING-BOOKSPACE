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
					<font style="font-size: xx-large; font-weight: bold;"># 결제
						정보</font>
				</h3>
				<br> <br>

				<c:choose>
					<c:when test="${ dto != null }">
						<h5 style="font-weight: bold;">▶상품 확인</h5>
						<div>
							<table class="table" style="text-align: center; width: 100%;">
								<thead>
									<tr>
										<th style="text-align: center;">상품명</th>
										<th style="text-align: center;" width="20%">출판사</th>
										<th style="text-align: center;" width="20%">가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="media">
												<div class="media-left">
													<img
														src="/bookspace/resources/book/${ dto.bookname }/${dto.img}"
														class="media-object" style="width: 60px">
												</div>
												<div class="media-body">
													<p style="text-align: center;">${ dto.bookname }</p>
												</div>
											</div>
										</td>
										<td width="20%">${ dto.publisher }</td>
										<td width="20%">${ dto.price }</td>
										<c:set var="totP" value="${ dto.price }" />
									</tr>
								</tbody>
							</table>

							<h5 style="font-weight: bold;">▶구매 확인</h5>
							<table style="text-align: center; width: 100%;">
								<tr>
									<th>
										<div style="width: 100%">
											<div class="row">
												<div class="col-sm-6" style="background-color: #e6f0fa;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #e6f0fa;">
														<font style="color: #528ec7; font-size: 22px;">총
															상품수</font>
													</h4>
													<h5
														style="text-align: center; font-weight: bold; font-size: large;">1권</h5>
												</div>
												<div class="col-sm-6" style="background-color: #d4e3f1;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #d4e3f1;">
														<font style="color: #990000; font-size: 22px;">총
															결제금액</font>
													</h4>
													<h5 style="text-align: center; font-weight: bold;">
														<font style="color: #0000b3; font-size: large;">${ dto.price }원</font>
													</h5>
												</div>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>
										<div style="width: 100%">
											<div class="row">
												<div class="col-sm-6" style="background-color: #e6f0fa;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #e6f0fa;">
														<font style="color: #528ec7; font-size: 22px;">현재
															보유 캐쉬</font>
													</h4>
													<h5
														style="text-align: center; font-weight: bold; font-size: large;">${ mDto.cash }원</h5>
												</div>
												<div class="col-sm-6" style="background-color: #d4e3f1;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #d4e3f1;">
														<font style="color: #990000; font-size: 22px;">결제 후
															잔액</font>
													</h4>
													<h5 style="text-align: center; font-weight: bold;">
														<c:choose>
															<c:when test="${ mDto.cash-dto.price < 0 }">
																<font style="color: #0000b3; font-size: large;">잔액부족</font>
															</c:when>
															<c:otherwise>
																<font style="color: #0000b3; font-size: large;">${ mDto.cash - dto.price }원</font>
															</c:otherwise>
														</c:choose>
													</h5>
												</div>
											</div>
										</div>
									</th>
								</tr>
							</table>
							<br> <br>

							<div align="center">
								<button type="button" class="btn btn-lg btn-info"
									onclick="getOne('${dto.bookname}', '${mDto.cash-dto.price}', '${dto.num}')">구매하기</button>
							</div>
							<br>

						</div>
					</c:when>

					<c:when test="${ !listc.isEmpty() }">
						<h5 style="font-weight: bold;">▶상품 확인</h5>
						<div>
							<table class="table" style="text-align: center; width: 100%;">
								<thead>
									<tr>
										<th style="text-align: center;">상품명</th>
										<th style="text-align: center;" width="20%">출판사</th>
										<th style="text-align: center;" width="20%">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="sum" value="0" />
									<c:set var="goods" value="0" />
									<c:forEach var="each" items="${ listc }" varStatus="tot">
										<tr>
											<td>
												<div class="media">
													<div class="media-left">
														<img
															src="/bookspace/resources/book/${each.bookname }/${each.img}"
															class="media-object" style="width: 60px">
													</div>
													<div class="media-body">
														<p style="text-align: center;">${ each.bookname }</p>
													</div>
												</div>
											</td>
											<td width="20%">${ each.publisher }</td>
											<td width="20%">${ each.price }</td>

											<c:set var="totG" value="${ goods=tot.index+1 }" />
											<c:set var="totP" value="${ sum=each.price+sum }" />
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<h5 style="font-weight: bold;">▶구매 확인</h5>
							<table style="text-align: center; width: 100%;">
								<tr>
									<th>
										<div style="width: 100%">
											<div class="row">
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
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>
										<div style="width: 100%">
											<div class="row">
												<div class="col-sm-6" style="background-color: #e6f0fa;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #e6f0fa;">
														<font style="color: #528ec7; font-size: 22px;">현재
															보유 캐쉬</font>
													</h4>
													<h5
														style="text-align: center; font-weight: bold; font-size: large;">${ mDto.cash }원</h5>
												</div>
												<div class="col-sm-6" style="background-color: #d4e3f1;">
													<h4
														style="text-align: center; font-weight: bold; background-color: #d4e3f1;">
														<font style="color: #990000; font-size: 22px;">결제 후
															잔액</font>
													</h4>
													<h5 style="text-align: center; font-weight: bold;">
														<c:choose>
															<c:when test="${ mDto.cash-totP < 0 }">
																<font style="color: #0000b3; font-size: large;">잔액부족</font>
															</c:when>
															<c:otherwise>
																<font style="color: #0000b3; font-size: large;">${ mDto.cash - totP }원</font>
															</c:otherwise>
														</c:choose>
													</h5>
												</div>
											</div>
										</div>
									</th>
								</tr>
							</table>
							<br> <br>

							<div align="center">
								<button type="button" class="btn btn-lg btn-info"
									onclick="getAll(${mDto.cash-totP})">구매하기</button>
							</div>
							<br>

						</div>
					</c:when>

					<c:otherwise>
						<!-- 수정 -->

					</c:otherwise>
				</c:choose>

			</div>
			<br>
		</div>

	</div>

	<script type="text/javascript">
      function getOne(bookname, cash, num){
    	 var a = "${direct}";  
         if(cash < 0){
            alert("보유 캐쉬가 부족합니다.");
         }else{
        	 if(a != null){
        		 
        		 var t = confirm("정말 구매하시겠습니까?");
        		 if(t==true){
        			 location.href = "/bookspace/pay/directGet?bookname=" + bookname + "&cash=" + cash ;
        		 }else{ 
        			return; 
        		 }
        	 }else{
        		 var t = confirm("정말 구매하시겠습니까?");
        		 if(t==true){
        		 location.href = "/bookspace/pay/getOne?bookname=" + bookname + "&cash=" + cash + " &num=" + num;
        		 }else{
        			 return;
        		 } 
        	 }
         }
      } 
      function getAll(cash){
         if(cash < 0){
            alert("보유 캐쉬가 부족합니다.");
         }else{
        	 var t = confirm("정말 구매하시겠습니까?");
    		 if(t==true){
            location.href = "/bookspace/pay/getAll?cash=" + cash;
    		 }else{
    			 return;
    		 }
         } 
      }
   </script>

</body>
</html>