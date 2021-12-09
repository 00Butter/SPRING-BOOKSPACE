<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>bookspace</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
 <div id="page-wrapper" style="margin-top: 8%">

            <div class="container-fluid">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">

  <div class="page-header">
  <h2>업체 등록</h2>
  </div>
  <p>e-book 대표 사이트 BookSpace를 통해 많은 독자들을 만나보세요</p>
  <form name="joinfr" method="post" action="?">
   <jsp:include page="Lisence.jsp"/>
   <div class="checkbox">
      <label><input type="checkbox" name="agree" id="agree">동의함</label>
   </div>
   	<div class="col-sm-8">  
     <div class="form-group">
       <label for="usr">업체명:</label>
       <input type="text" class="form-control" id="name" name="name">
     </div>
  	<div class="row">
      <div class="form-group">
      	<div class="col-xs-8">  
	       <label for="usr">사업자번호:</label>
	       <input type="text" size="5" class="form-control" placeholder="사업자번호10자리입력"
	       maxlength="10" id="license" name="license">
		</div> 
	  </div>
	 <div class="form-group">
    	<div class="col-xs-2" style="padding-top: 20px">  
      	  <input type="button" class="btn btn-warning btn-sm" id="lich" value="확인" />
      	</div>
     </div>
   </div>  
   <div class="row">
      <div class="form-group">
      	<div class="col-xs-8">  
       <label for="usr">ID :</label>
       <input type="text" class="form-control" id="id" name="id">
     </div></div>
     <div class="form-group">
    	<div class="col-xs-2" style="padding-top: 20px">  
      	  <input type="button"  class="btn btn-success btn-sm" value="중복확인" id="idch"/>
      	</div>
     </div></div>
      <div class="form-group">
       <label for="pwd">Password:</label>
       <input type="password" placeholder="숫자,영문,특수문자혼합 8자이상 15자이하" onkeyup="pwpattern()" class="form-control" name="pw" id="pw">
       <p id="comm"></p>
     </div>
     <div class="form-group">
       <label for="pwd">Password 확인:</label>
       <input type="password" class="form-control" id="pwch" onkeyup="pwcheck()">
        <p id="comm2"></p>
     </div>
      <div class="form-group">
       <label for="usr">담당자이름:</label>
       <input type="text" class="form-control" id="employee" name="employee" >
     </div>
      <div class="form-group">
       <label for="usr">연락처:</label>
       <input type="text" class="form-control" id="phone" name="phone">
     </div>
      <div class="form-group">
       <label for="usr">주소:</label>
       <input type="text" class="form-control" id="address" name="address" >
     </div>
     <div class="form-group">
     <label for="usr">계좌:</label>  
       <select class="form-control" id="sel1" name="bank">
        <option value="00">은행명</option>
        <option value="국민">국민</option>
        <option value="신한">신한</option>
        <option value="농협">농협</option>
        <option value="하나">하나</option>
      </select>
     </div>
     <div class="form-group">            
       <input type="text" class="form-control" id="banknum" name="banknum">
     </div>
     <div class="form-group"></div>
     <hr>
     <div class="form-group">
     <button type="button" class="btn btn-primary" onclick="joingo()">등록</button>
     </div>
    </div>
  </form></div>
</div></div></div>
</body>
<script type="text/javascript">
var idcheck=false;
var lichc=false;

$("#idch").click(function(){
	var idpt=/^[a-zA-Z]{4,10}$/g;
	if(!idpt.test($("#id").val())){ alert("영문대소문자로 4~10자사이로 입력해주세요."); return;}
	
	$.post("/bookspace/login/check/id",{
		"id" : $("#id").val()
	},function(data){		
		if(data=="ok"){
			if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
			idcheck=true;
			$("#id").attr("readonly","readonly");
			}
		}else{
			alert("사용불가능한 아이디 입니다.");
		}
	});
});

$("#lich").click(function(){
	var lipt=/^[0-9]{10}$/g;
	if(!lipt.test($("#license").val())){ alert("사업자번호10자리를 정확히 입력해주세요"); return;}
	
	$.post("/bookspace/login/check/license",{
		"license" : $("#license").val()
	},function(data){
		if(data=="ok"){
			if(confirm("등록가능한 사업자 번호입니다. 사용하시겠습니까?")){
			lichc=true;
			$("#license").attr("readonly","readonly");
			}
		}else{
			alert("이미 등록된 사업자 번호입니다.");
		}
	});
});

function joingo() {
	var agree=$("#agree").prop("checked");
	if(agree==false){
		alert("약관에 동의해주세요.");
		return;
	}else if(!idcheck){
		alert("아이디 중복확인해주세요.");
		return;
	}else if(!lichc){
		alert("사업자번호 확인해주세요.");
		return;
	}
	
	var regphone=/^010-?\d{4}-?\d{4}$/; //핸드폰번호
	var banknum=/^[0-9]{1,}$/g; // 은행계좌는 숫자만
	var id=$("#id").val;
	var join=document.joinfr;
	if(join.bank.value!="00" && banknum.test(join.banknum.value)
		 && regphone.test(join.phone.value)&& join.employee.value!="" && join.address != ""){
		join.submit();
	}else{
		alert("다시 확인해주세요");
	}
	
}
function pwcheck(){
	var  pw=document.getElementById("pw").value;
	var pwch=document.getElementById("pwch").value;
	if(pw==pwch){
		document.getElementById("comm2").innerHTML="일치합니다.";
		document.getElementById("comm2").style.color = "green";
	}else{
		document.getElementById("comm2").innerHTML="일치하지않습니다.";
		document.getElementById("comm2").style.color = "red";
	}
}
function pwpattern() {
	var  pw=document.getElementById("pw").value;
	var pwreg = /^((?=.*\d)(?=.*[a-z]).{8,15})$/g; // 숫자 영문 특수문자혼합
	if(pwreg.test(pw)){
		document.getElementById("comm").innerHTML="이 암호는 안전합니다.";
		document.getElementById("comm").style.color = "green";
	}else{
		document.getElementById("comm").innerHTML="형식에 맞춰주세요 영문대소문자,특수문자, 숫자 포함 8자이상 15자이하";
		document.getElementById("comm").style.color = "red";
	}	
}
</script>
</html>