<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${pubmsg}</div>
							<div>업체 메시지</div>
						</div>
					</div>
				</div>
				<a href="${adminlog !=null ? '/bookspace/admin/board/pubmsg':'#' }">
					<div class="panel-footer">
						<span class="pull-left">업체 게시판</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-envelope fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${memmsg}</div>
							<div>회원 문의</div>
						</div>
					</div>
				</div>
				<a href="${adminlog !=null ?'/bookspace/admin/board/member':'#' }">
					<div class="panel-footer">
						<span class="pull-left">회원 문의 게시판</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-task fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${bookcon }</div>
							<div>도서 등록요청</div>
						</div>
					</div>
				</div>
				<a href="${adminlog !=null ? '/bookspace/admin/book/confirmList':'#' }">
					<div class="panel-footer">
						<span class="pull-left">도서등록요청게시판</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-support fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${bookdel }</div>
							<div>도서 삭제 요청건</div>
						</div>
					</div>
				</div>
				<a href="${adminlog !=null ? '/bookspace/admin/book/deleteList':'#' }">
					<div class="panel-footer">
						<span class="pull-left">도서 삭제 게시판</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>

</body>
</html>