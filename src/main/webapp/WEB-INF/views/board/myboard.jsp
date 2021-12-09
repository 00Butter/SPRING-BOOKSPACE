<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>							
							<form action="/bookspace/admin/log" method="post">
							<div class="modal-body">
								<jsp:include page="QnAForm.jsp"/>
							</div>
							<div class="modal-footer" align="center">
							<input type="submit" class="btn btn-default"
									data-dismiss="modal" value="인증"/>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div></form>
						</div>

					</div>
				</div>



</body>
</html>