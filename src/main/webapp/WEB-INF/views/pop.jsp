<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

   <script> 
      var t = "${no}";
      if (t != "") {
         self.close();
      }
   </script>
   <div align="center" ><a onclick="csgo()">
      <img src="/bookspace/resources/img/pop.png"
         style="margin-bottom: -20px; width: 70%;height: 70%;"></a>
         <hr>
      <button class="btn btn-default" type="button" onclick="quit()">닫기</button>
      <button class="btn btn-default" type="button" onclick="nopop()">일주일간 보지 않기</button>
   </div>


   <script type="text/javascript">
      function nopop() {
         location.href = "/bookspace/nopop"
      }
      function quit() {
         self.close();
      }
      function csgo() {
		opener.location.href="/bookspace/cshome";
		quit();
	}
   </script>
</body>
</html>