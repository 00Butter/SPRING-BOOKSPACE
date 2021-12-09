<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
var msg="${msg}";
if(msg!=""){
	alert(msg);
	opener.location.href="/bookspace/admin/book/allList";
	self.close();
}
</script>
</head>
<body>

<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin: 2%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">도서 정보</h2>
				</div>
				<div class="panel-body">
					<form action="/bookspace/admin/bookup" method="post" name="updatefr">
						<div class="row">
								<div class="form-group">
									<div class="col-xs-4">
										 <input type="text"	class="form-control" id="maintype" value="${dto.maintype}" name="maintype"	readonly="readonly">
									</div>
									<div class="col-xs-4">
										 <input type="text"	class="form-control" id="subtype" value="${dto.subtype}" name="subtype"	readonly="readonly">
									</div>
									<div class="col-xs-1">
										 <button type="button" 	data-toggle="modal" data-target="#typemodal" class="btn btn-primary" onclick="selectGo()">분류 변경</button>
									</div>
								</div>
							</div>
							<hr>
				
							<div class="form-group">
								<label for="usr">도서명 :</label> 
								<input type="text"	class="form-control" id="bookname" value="${dto.bookname}" name="bookname" readonly="readonly">
							</div>
							<input type="hidden" name="num" value="${dto.num }">
						
								<div class="form-group">
										<label for="usr">작가 : </label> <input type="text"
											class="form-control" id="writer" value="${dto.writer}" name="writer">
								</div>
								<div class="form-group">
										<label for="usr">출판사 :</label> <input type="text"
											class="form-control" readonly="readonly" name="publisher" value="${dto.publisher}" name="publisher">
								</div>
							<div class="form-group">
								<label for="usr">가격 :</label>
								<input type="text" id="price" class="form-control" name="price" value="${dto.price}">
							</div>
							<div class="form-group">
								<label for="usr">줄거리:</label> 
									<textarea name="story" class="form-control" rows="5">${dto.story }</textarea>
							</div>
							<div class="form-group">
								<label for="usr">목차:</label> 
									<textarea name="conlist" class="form-control" rows="5">${dto.conlist }</textarea>
							</div>
							<c:if test="${all !=null }">
							<div class="form-group">
								<label for="usr">등록일 :</label> <input type="text"
									class="form-control" name="savedate" value="${dto.savedate}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="usr">구매건수 :</label> <input type="text"
									class="form-control" name="count" value="${dto.count}">
							</div>
							<div class="form-group">
								<label for="usr">별점 :</label> <input type="text"
									class="form-control" name="totalstar" value="${dto.totalstar}" readonly="readonly">
								<input type="hidden" name="img" value="${dto.img}">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" onclick="updateGo()">수정</button>
							</div>
							</c:if>
						</div>
					</form>
				</div>
			</div>

			</div></div>
<div class="modal fade" id="typemodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">분류변경</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							 <label for="maintype">주 항목</label>
								<select class="form-control" onchange="submenu()" id="newmaintype" name="newmaintype">
									<option value="00"></option>
									<option value="잡지">잡지</option>
									<option value="소설">소설</option>
									<option value="만화">만화</option>
									<option value="자기계발">자기계발</option>
									<option value="여행">여행</option>
									<option value="외국어">외국어</option>
									<option value="종교">종교</option>
								</select>
								</div>
					</div></div>
					<div class="row">
					<div class="form-group">
						<div class="col-xs-6">
							<label for="subtype">보조 항목</label>
								<select class="form-control" id="newsubtype" name="newsubtype" disabled="disabled"></select>
									
						<p id="com"></p>
						</div>
					</div></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" id="change"  onclick="typeChange()">변경</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>



<script type="text/javascript">
function submenu() {
	var maintype = document.getElementById("newmaintype").value;
	if(maintype == "잡지"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='경영'>경영</option>"
						 + "<option value='교양'>교양</option>"
						 + "<option value='패션,뷰티'>패션,뷰티</option>"
						 + "<option value='취미'>취미</option>"
						 + "<option value='성인'>성인</option>");
	}else if(maintype == "소설"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='추리'>추리</option>"
						 + "<option value='로맨스'>로맨스</option>"
						 + "<option value='판타지'>판타지</option>"
						 + "<option value='역사'>역사</option>"
						 + "<option value='고전'>고전</option>");
	}else if(maintype == "만화"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='순정'>순정</option>"
						 + "<option value='무협'>무협</option>"
						 + "<option value='판타지'>판타지/SF</option>"
						 + "<option value='성인'>성인</option>"
						 + "<option value='액션/스포츠'>액션/스포츠</option>"
						 + "<option value='코믹'>코믹</option>"
						 + "<option value='공포'>공포</option>");
	}else if(maintype == "자기계발"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='성공'>성공</option>"
						 + "<option value='리더십'>리더십</option>"
						 + "<option value='창업'>창업</option>"
						 + "<option value='인간관계'>인간관계</option>");
	}else if(maintype == "여행"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='국내'>국내</option>"
						 + "<option value='해외'>해외</option>");
	}else if(maintype == "외국어"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='영어'>영어</option>"
						 + "<option value='중국어'>중국어</option>"
						 + "<option value='일본어'>일본어</option>"
						 + "<option value='기타'>기타</option>");
	}else if(maintype == "종교"){
		$("#newsubtype").removeAttr("disabled");
		$("#newsubtype").html("<option value='가톨릭'>가톨릭</option>"
						 + "<option value='기독교'>기독교</option>"
						 + "<option value='불교'>불교</option>"
						 + "<option value='그 외'>그 외</option>");
	}
	
}

function typeChange() {
	var main=$("#newmaintype").val();
	var sub=$("#newsubtype").val();
	$("#maintype").val(main);
	$("#subtype").val(sub);
	$("#change").attr("data-dismiss","modal");
	
}

function updateGo() {
	if($("#writer").val()!="" && $("#price").val()!="" && $("#stroy").val() !="" && 
			$("#conlist").val() !="" && $("#count").val()!=""){
		document.updatefr.submit();
	}else{
		alert("다시확인해주세요");
	}
}

</script>



</body>
</html>