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
<body>
<div class="col-sm-2"></div>
<div class="col-sm-8" style="margin-top: 10%">
<h3> 월 매출 현황</h3><hr>
<div class="row" >
<form name="frm">
		<div class="col-lg-3">
			<div class="form-group">
      <select class="form-control" id="sel1" name="year">
       <option value="00">년도</option>
       <c:if test="${years!=null }">
<c:forEach var="year" items="${years }">
	<option value="${year}">${year}</option>
</c:forEach></c:if>
      </select>
	</div>
	</div>
	<div class="col-lg-3">
			<div class="form-group">
      <select class="form-control" id="sel2" name="mon">
       <option value="00">월</option>
       <c:forEach begin="1" end="12" var="i" step="1">
          <option value="${i}">${i}</option>
       </c:forEach>
      </select>
	</div>
	</div>
	<div class="col-lg-1">
	 <button type="button" class="btn btn-default" onclick="daygo()"><span class="glyphicon glyphicon-search"></span></button>	
	</div></form>
	<script type="text/javascript">
	function daygo() {
		var sell=$("#sel1").val();
		var sell2=$("#sel2").val();
		if(sell!="00" && sell2!="00"){
		location.href="/bookspace/corp/account?day="+sell+"-"+sell2;
		}
	}
	</script>
</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 일별 매출 현황(최근 1개월 )
					</h3>
				</div>
				<div class="panel-body">
					<div id="actgrp" style="height: 250px;"></div>
				</div>

			</div>
		</div>
	</div>

	<hr>
	<div class="col-lg-8" align="center">
		<h3>일별 상세 매출 (날짜)</h3>
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>날짜</th>
						<th>정가</th>
						<th>순수익</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${ list!=null}">
					<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.regdate}</td>
						<td>${dto.price } 원</td>
						<td>${dto.cost } 원</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3">매출내역없음</td>
					</tr>
				</c:otherwise>
				</c:choose>
					
				</tbody>
			</table>
		</div>
	</div>
</div>



	<script type="text/javascript">
	var data="${chart}";
	var datalist=data.split("/");
var quarter_data = [
                  ];
for(var i=0;i<datalist.length-1;){
	  var visit={
			  "date" : datalist[i],
			  "cost" : datalist[i+1]
	  }
	  i=i+2;
	  quarter_data.push(visit);
}
new Morris.Line({
	  element: 'actgrp',
	  data: quarter_data,
	  xkey: 'date',
	  ykeys: ['cost'],
	  labels: ['매출']
}).on('click', function(i,row){
	
});


</script>
</body>
</html>