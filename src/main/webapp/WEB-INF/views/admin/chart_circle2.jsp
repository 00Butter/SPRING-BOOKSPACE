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
			<ol class="breadcrumb">
				<li><i class="fa fa-bar-chart-o"></i> <a href="/bookspace/admin/chart/all">장르별 전체 선호도</a>
				</li>
				<li class="active" ><i class="fa fa-bar-chart-o"></i><a href="/bookspace/admin/chart/genderChart">성별 선호도</a></li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 여성 선호도
					</h3>
				</div>
				<div class="panel-body">
					<div id="woman" style="height: 250px;"></div>
				</div>

			</div>
		</div>
		<div class="col-lg-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 남성 선호도
					</h3>
				</div>
				<div class="panel-body">
					<div id="man" style="height: 250px;"></div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
	var data1="${man}";
	var data2="${woman}";
	var datalist1=data1.split("/");
	var datalist2=data2.split("/");

var womandata =[ 
    	  ];
for(i=0;i<datalist2.length-1;){
	  var chart={
			  value : datalist2[i+1],
			  label : datalist2[i]
	  };
	
	  i=i+2;
	  womandata.push(chart);
}	  
    	  
new Morris.Donut({
	  element: 'woman',
	  data: womandata,
	  colors: [
	    '#ff9966',
	    '#cc66ff',
	    '#99cc00',
	    '#ff5050',
	    '#3333cc',
	    '#cc3300',
	    '#ffff66'
	  ],
	  formatter: function (x) { return x + "%"}
	}).on('click', function(i, row){
	  console.log(i, row);
	});
var mandata =[       	    
        	  ];
for(i=0;i<datalist1.length-1;){
	  var chart={
			  value : datalist1[i+1],
			  label : datalist1[i]
	  };
	  i=i+2;
	  mandata.push(chart);
}		  
  
    new Morris.Donut({
    	  element: 'man',
    	  data: mandata,
    	  colors: [
    	    '#ff9966',
    	    '#cc66ff',
    	    '#99cc00',
    	    '#ff5050',
    	    '#3333cc',
    	    '#cc3300',
    	    '#ffff66'
    	  ],
    	  formatter: function (x) { return x + "%"}
    	}).on('click', function(i, row){
    	  console.log(i, row);
    	});

</script>
</body>
</html>