<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Flot Examples: Visitors</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>
<script type="text/javascript">
function searchGo() {
	var year=document.acc.year.value;
	var month=document.acc.month.value;
	if(year != "00" && month !="00"){
		document.acc.action="/bookspace/admin/account/search";
		document.acc.submit();
	}
}
</script>
<body>
<div class="row">
<form name="acc">
		<div class="col-lg-3">
			<div class="form-group">
      <select class="form-control" id="sel1" name="year">
       <option value="00">년도</option>
       <c:forEach var="i" items="${yearlist}">
        <option value="${i}">${i}</option>
        </c:forEach>
      </select>
	</div>
	</div>
	<div class="col-lg-3">
			<div class="form-group">
      <select class="form-control" id="sel1" name="month">
       <option value="00">월</option>
       <c:forEach var="i" begin="1" end="12" step="1">
        <option value="${i}">${i}</option>
        </c:forEach>
      </select>
	</div>
	</div>
	<div class="col-lg-1">
	 <button type="button" class="btn btn-default" onclick="searchGo()"><span class="glyphicon glyphicon-search"></span></button>	
	</div></form>
</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 월별 매출 현황(최근 1년)
					</h3>
				</div>
				<div class="panel-body">
					<div id="actgrp" style="height: 250px;"></div>
				</div>

			</div>
		</div>
	</div>

	<hr>
<c:if test="${dtolist !=null}">
	<div class="col-lg-8">
		<h2>일별 상세 매출 (날짜)</h2>
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>날짜</th>
						<th>출판사</th>
						<th>정가</th>
						<th>순수익</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${dtolist}" >
				<tr>
						<td>${dto.regdate}</td>
						<td>${dto.publisher}</td>
						<td>${dto.price} 원</td>
						<td>${dto.price-dto.cost} 원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>

<hr>



	<script type="text/javascript">
	var data="${data}";
	var datalist=data.split("/");
var quarter_data = [
                    {"date": "2016-10-22", "account": 2342300},
                    {"date": "2016-10-17", "account": 3351000},
                    {"date": "2016-10-10", "account": 3269000},
                    {"date": "2016-09-09", "account": 2342300},
                    {"date": "2016-09-22", "account": 3407000},
                    {"date": "2016-08-17", "account": 3234300},
                    {"date": "2016-08-10", "account": 326900},
                    {"date": "2016-08-09", "account": 324600}

                  ];
                  
for(var i=0;i<datalist.length-1;){
	  var visit={
			  "date" : datalist[i],
			  "account" : datalist[i+1]
	  }
	  i=i+2;
	  quarter_data.push(visit);
}            
                  
new Morris.Line({
	  element: 'actgrp',
	  data: quarter_data,
	  xkey: 'date',
	  ykeys: ['account'],
	  labels: ['매출']
}).on('click', function(i,row){
	  alert(i+"----"+row.date); // 몇번째 , 클릭한 날짜
});


</script>
</body>
</html>