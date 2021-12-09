<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


	<div class="row" style="margin: 2%">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">${msgtitle}</h3>
				</div>
				<div class="panel-body">
					<c:choose>
					<c:when test="${result !=null }">
						<script type="text/javascript">

						var sys="${syslog}";
						var pub="${publog}";
						if(sys!=""){
							opener.location.href="/bookspace/admin/board/pubmsg";
						}else if(pub!=""){
							opener.location.href="/bookspace/board/msgList";
						}
						alert("${result}");
						self.close();
						</script>
						</c:when>
						<c:when test="${dto !=null }">
						<form method="post" action="${syslog!=null ? '/bookspace/admin/msgForm':'#' }">
							
							<div class="form-group">
								<label>ID </label> <input class="form-control"
									placeholder="Enter text" name="id" value="${dto.id}"
									readonly="readonly">
							</div>
							<div class="form-group">
							<input type="hidden" name="groupnum" value="${dto.groupnum}">
							<input type="hidden" name="boardtype" value="${dto.boardtype}">
								<label>글제목</label> <input class="form-control"
									placeholder="Enter text" value="${dto.title}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>내용:</label>
								<textarea class="form-control" rows="3" readonly="readonly">${dto.content}</textarea>
							</div>
							<div class="form-group">
								<label>날짜</label> <input class="form-control"
									placeholder="Enter text" readonly="readonly"
									value="${dto.regdate}">
							</div>
							<c:choose>
							<c:when test="${publog!=null}">
							<button type="button" class="btn btn-default" onclick="closee()">Close</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-default">답장하기</button>
							</c:otherwise>
							</c:choose>
							</form>
						</c:when>
						<c:when test="${syslog!=null }">
						<form action="/bookspace/admin/msginsert" method="post">
						<input type="hidden" name="groupnum" value="${ddto.groupnum}">
						<input type="hidden" name="receive" value="${ddto.id}">
						<input type="hidden" name="boardtype" value="${ddto.boardtype}">
								<div class="form-group">
									<label>글제목</label> <input class="form-control"
									name="title" placeholder="Enter text">
								</div>
								<div class="form-group">
									<label>내용:</label>
									<textarea class="form-control" name="content" rows="3"></textarea>
								</div>
								<button type="submit" class="btn btn-default">전송</button>
								<button type="button" class="btn btn-default" onclick="closee()">닫기</button>
							</form>
						</c:when>
						<c:when test="${error !=null }">
						<script type="text/javascript">
						alert("잘못된 접근입니다.");
						self.close();
						</script>						
						</c:when>
						
						<c:otherwise>
							<form action="?" method="post">
								<div class="form-group">
								
									<label>글제목</label> <input class="form-control"
									name="title" placeholder="Enter text">
								</div>
								<div class="form-group">
									<label>내용:</label>
									<textarea class="form-control" name="content" rows="3"></textarea>
								</div>
								<button type="submit" class="btn btn-default">전송</button>
								<button type="button" class="btn btn-default" onclick="closee()">닫기</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

function closee() {

	self.close();
}
</script>
</html>