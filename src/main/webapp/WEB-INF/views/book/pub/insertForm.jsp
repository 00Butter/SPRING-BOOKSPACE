<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상품등록</title>
<meta charset="utf-8">
</head>
<body>

	
	<div class="col-sm-12" align="center"
	style="margin-top: 45px;">
		<h2>상품등록페이지</h2>
		<form method="post" enctype="multipart/form-data" id="frm" name="frm">
		<table class="table" style="width: 400px; height: 600px">
			<thead>
				<tr>
					<th colspan="3">상품등록페이지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookname">책 이름</label>
						</div>
					</td>
							<td><input type="text" class="form-control" id="bookname" name="bookname"/>
							<button type="button" class="btn btn-default btn-sm" id="dubcheck" name="dubcheck">
							<font color="black">중복확인</font></button></td>
						
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="publisher">출판사</label>
						</div>
					</td>
					<td><input type="text" class="form-control" name="publisher" value="${publisher }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="writername">작가 이름</label>
						</div>
					</td>
					<td><input type="text" class="form-control" id="writer" name="writer"></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="booktype">장 르</label>
						</div>
					</td>
					<td>
					
						 <div class="col-xs-6">
						 <label for="maintype">주 항목</label>
								<select class="form-control" onchange="submenu()" id="maintype" name="maintype">
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
							<div class="col-xs-6">
							<label for="subtype">보조 항목</label>
								<select class="form-control" id="subtype" name="subtype" disabled="disabled">
									
								</select>
								
							</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="price">원 가</label>
						</div>
					</td>
					<td><input type="text" class="form-control" id="price" name="price"></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="booktitle">책 표지<br>등록</label>
						</div>
					</td>
					<td><input type="file" id="img" name="img"></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="bookorder">목차 입력</label>
						</div>
					</td>
					<td><textarea class="form-control" id="conlist" name="conlist"></textarea></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="story">줄거리 입력</label>
						</div>
					</td>
					<td><textarea class="form-control" id="story" name="story"></textarea></td>
				</tr>
				<tr colspan="2" style="text-align: right">
					<td></td>
					<td>
					<button type="button" class="btn btn-default btn-lg" onclick="rcvData()">등록하기</button>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	
<script type="text/javascript">
var submg="dd";
function submenu() {
	var maintype = document.getElementById("maintype").value;
	if(maintype == "잡지"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='경영'>경영</option>"
						 + "<option value='교양'>교양</option>"
						 + "<option value='패션,뷰티'>패션,뷰티</option>"
						 + "<option value='취미'>취미</option>"
						 + "<option value='성인'>성인</option>");
	}else if(maintype == "소설"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='추리'>추리</option>"
						 + "<option value='로맨스'>로맨스</option>"
						 + "<option value='판타지'>판타지</option>"
						 + "<option value='역사'>역사</option>"
						 + "<option value='고전'>고전</option>");
	}else if(maintype == "만화"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='순정'>순정</option>"
						 + "<option value='무협'>무협</option>"
						 + "<option value='판타지'>판타지/SF</option>"
						 + "<option value='성인'>성인</option>"
						 + "<option value='액션/스포츠'>액션/스포츠</option>"
						 + "<option value='코믹'>코믹</option>"
						 + "<option value='공포'>공포</option>");
	}else if(maintype == "자기계발"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='성공'>성공</option>"
						 + "<option value='리더십'>리더십</option>"
						 + "<option value='창업'>창업</option>"
						 + "<option value='인간관계'>인간관계</option>");
	}else if(maintype == "여행"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='국내'>국내</option>"
						 + "<option value='해외'>해외</option>");
	}else if(maintype == "외국어"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='영어'>영어</option>"
						 + "<option value='중국어'>중국어</option>"
						 + "<option value='일본어'>일본어</option>"
						 + "<option value='기타'>기타</option>");
	}else if(maintype == "종교"){
		$("#subtype").removeAttr("disabled");
		$("#subtype").html("<option value='가톨릭'>가톨릭</option>"
						 + "<option value='기독교'>기독교</option>"
						 + "<option value='불교'>불교</option>"
						 + "<option value='그 외'>그 외</option>");
	}
	
}

// 	타입 String 변환 메소드
function rcvData(){
	var priceReg=/[0-9]{1,}/;
	if($("#bookname").val() == "" || !ok){
		alert("책 이름을 입력 & 중복확인");
		return;
	}else if($("#publisher").val() == ""){
		alert("출판사 이름을 입력하세요.");
		return;
	}else if($("#writer").val() == ""){
		alert("작가 이름을 입력하세요.");
		return;
	}else if($("#maintype").val() == "00"){
		alert("장르를 입력하세요.");
		return;
	}else if($("#price").val() == ""){
		alert("원가 입력하세요.");
		return;
	}else if($("#img").val() == ""){
		alert("파일을 등록하세요.");
		return;
	}else if($("#conlist").val() == ""){
		alert("목차를 입력하세요.");
		return;
	}else if($("#story").val() == ""){
		alert("줄거리를 입력하세요.");
		return;
	}else if(priceReg.test($("#price").val())){
	
	$("#frm").submit();
	}else{
		alert("다시한번확인해주세요");
	}
	
}

var ok = false;
	$("#dubcheck").click(function() {
		if($("#bookname").val() == ""){
			alert("책 이름을 입력하세요");
			return;
		}
		$.post("/bookspace/book/dubcheck", {
			"bookname" : $("#bookname").val()
		}, function(res) {
			if (res == ""|| res=="0") {
				if (confirm("등록 가능합니다.")) {
					ok = true;
					$("#bookname").attr("readonly", "readonly");

				}
			} else {
				alert("등록된 책 이름 입니다.");
			}
		});
		
	});

</script>
</body>
</html>
