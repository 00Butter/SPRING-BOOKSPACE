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
						<i class="fa fa-bar-chart-o"></i> 일별 방문자수
					</h3>
				</div>
				<div class="panel-body">
					<div id="gra" style="height: 250px;"></div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
	var data="${data}";
	var datalist=data.split("/");
var quarter_data = [
                    
                  ];
      for(var i=0;i<datalist.length-1;){
    	  var visit={
    			  "date" : datalist[i],
    			  "people" : datalist[i+1]
    	  }
    	  i=i+2;
    	  quarter_data.push(visit);
      }            
        
                  
new Morris.Line({
	  element: 'gra',
	  data: quarter_data,
	  xkey: 'date',
	  ykeys: ['people'],
	  labels: ['people']
	});

</script>
</body>
</html>