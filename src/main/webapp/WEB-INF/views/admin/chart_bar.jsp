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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 회원가입통계(최근 2개월)
					</h3>
				</div>
				<div class="panel-body">
					<div id="bar" style="height: 250px;"></div>
				</div>
				

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" align="center">
			<ul class="pager">
    		<li><a href="/bookspace/admin/member/selectChart?date=${now-1}"><span class="glyphicon glyphicon-chevron-left"></span> Previous</a></li>&nbsp;&nbsp;
    		<li><a href="/bookspace/admin/member/selectChart?date=${now+1}">Next <span class="glyphicon glyphicon-chevron-right"></span></a></li>
    		</ul>
		</div>
	</div>
	<jsp:element name=""></jsp:element>
	<script type="text/javascript">
	
	var rcv="${data}";
	var rcve=rcv.split("/");
	
	var bardata =[ ];
	                	  
	for(i=0;i<rcve.length-1;){
		var data=new Object();
		data.y=rcve[i];
		data.a=rcve[i+1];
		data.b=rcve[i+2];
		bardata.push(data);
		i=i+3;
	}               	  
	new Morris.Bar({
		  element: 'bar',
		  data: bardata,
		  xkey: 'y',
		  ykeys: ['a', 'b'],
		  labels: ['여자', '남자'],
		  barColors: ['#ff5050','#8080ff']
		}).on('click', function(i, row){
		  
		});

</script>
</body>
</html>