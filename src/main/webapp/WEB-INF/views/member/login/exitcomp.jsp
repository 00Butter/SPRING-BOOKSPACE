<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
<style>

footer {
   margin-top: 200px;
}
</style>
</head>
<script type="text/javascript">
var msg="${msgpop}";
if(msg!=""){
   alert(msg);
   location.href="/bookspace/home";
}
</script>
<body>

   <br>
   <div id="page-wrapper">

      <div class="container-fluid">
         <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
               <br> <br> <br>
                  <b><span style="font-size: large; color: black;">회원탈퇴</span>&nbsp;
                     | &nbsp;탈퇴완료</b>
                  <hr style="border-width: medium; border-color: black;">
                  <br>

                  <div class="form-group" align="center">
                     <b><span style="font-size: large; color: black;">회원탈퇴가 </span>
                     <span style="font-size: large; color: #1a75d1;">완료되었습니다.</span><br><br><br></b>
                     <span style="color: black;">그동안 BookSpace를 이용해 주셔서 감사합니다.</span><br><br>
                     <span style="font-size: small;">보다 나은 서비스로 다시 찾아 뵙겠습니다.</span><br><br>
                     
                  </div>
                  <div class="form-group" align="center">
                     <a href="/bookspace/">
                     <input type="button" class="btn btn-primary" value="BookSpace 첫화면" /></a>
                  </div>

               </div>
<div class="col-sm-2"></div>
            </div>

         </div>
      </div>

   <br>
   <br>

</body>
</html>