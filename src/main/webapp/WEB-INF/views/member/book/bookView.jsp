<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
   width: 70%;
   margin: auto;
}
</style>

<script>
   var rcv = "${dto.bookmark}";
   $(document).ready(function() {
      if (rcv != "") {
         var t = confirm("책갈피가 존재합니다. 해당 페이지로 이동하시겠습니까?");
         if (t == true) {
            $('#first').removeClass('item active');
            $('#first').addClass('item');
            document.getElementById(rcv).className ="item active";
            document.getElementById("now").value=rcv;
         }
      }
   });
</script>
</head>
<body>
   <div style="height: 80px;">
      <h2 style="margin-left: 20px; font-weight: bold;"></h2>
      <div style="margin-left: 20px;">
         <div class="btn btn-default" style="width: 40px; text-align: center;">
            <input type="text" value="1" id="now"
               style="width: 20px; border-color: #fff;">
         </div>
         /
         <div class="btn btn-default" style="width: 60px; text-align: center;">
            <input type="text" value="${length }" id="total" readonly="readonly"
               style="width: 40px; border-color: #fff;">
         </div>
      </div>
      <div>
         <div class="btn btn-default"
            style="width: 120px; text-align: center;" id="bookmark"
            onclick="javascript:bookmark()">책갈피</div>
      </div>
   </div>
   <div class="panel" style="height: 600px;">
      <br>
      <div id="myCarousel" class="carousel slide" data-ride="carousel"
         data-interval="false">
         <div class="col-sm-12">
            <div class="col-sm-1" style="height: 600px;" id="well">
               <button class="left carousel-control"
                  onclick="javascript:previous()" href="#myCarousel" role="button"
                  data-slide="prev" style="height: 100%; width: 95px;">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
               </button>
            </div>

            <c:choose>
               <c:when test="${cartoon != null }">
                  <div class="col-sm-10">
                     <div class="carousel-inner" role="listbox">
                        <div class="item active"  id="first">
                           <img src="/bookspace/resources/book/${dto.bookname }/${page[0]}"
                              alt="Chania" style="height: 600px; width: 1000px;"
                             >
                        </div>
                        <c:forEach var="i" begin="1" end="${length}" items="${page}" varStatus="state" step="1">
                           <div class="item " id="${state.index+1}">
                              <img src="/bookspace/resources/book/${dto.bookname }/${i}"
                                 alt="Chania" style="height: 600px; width: 1000px;"
                                >
                           </div>
                        </c:forEach>
                     </div>

                  </div>
               </c:when>
               <c:otherwise>
                  <div class="col-sm-10">
                     <div class="carousel-inner" role="listbox">
                        <div class="item active "  id="first">
                           <img src="/bookspace/resources/book/${dto.bookname }/${page[0]}"
                              alt="Chania" style="height: 600px; width: 460px;"
                             >
                        </div>
                        <c:forEach var="i" begin="1" end="${length}" varStatus="state" items="${page}"
                           step="1">
                           <div class="item" id="${state.index+1}">
                              <img src="/bookspace/resources/book/${dto.bookname }/${i}"
                                 alt="Chania" style="height: 600px; width: 460px;" 
                                 >
                           </div>
                        </c:forEach>
                     </div>
                  </div>
               </c:otherwise>
            </c:choose>

            <!-- Left and right controls -->
    <div class="col-sm-1" style="height: 600px;" id="woll">
               <button class="right carousel-control" onclick="javascript:next()"
                  href="#myCarousel" role="button" data-slide="next" id="gogo"
                  style="height: 100%; width: 95px;">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
               </button>
            </div>
         </div>
      </div>
      <hr>
   </div>
   <script type="text/javascript">
      var finalNum = "${length}";
      function next(){
         var target = document.getElementById("now");
         var num = document.getElementById("now").value;

         if (num == finalNum) {
            alert("마지막 페이지입니다.");
            target.value=1;
         }else{
         target.value = parseInt(num) + 1;
         }
      }
      function previous() {

         var target = document.getElementById("now");
         var num = $("#now").val();
         if (num == "2") {
        	 target.value = num - 1;
        	 alert("첫번째 페이지입니다");
            return;
         }else if(num=="1"){
        	 alert("첫번째 페이지입니다ssss");
        	 $("#now").val(finalNum);
         }else{
        	 target.value = num - 1;
         }
         

      }

      function bookmark() {

         var num = document.getElementById("now").value;
         var bookname = "${dto.bookname}";
         var id = "${login}";

         $.post("/bookspace/member/bookmark", {
            "id" : id,
            "bookname" : bookname,
            "num" : num
         }, function(data) { 
            if (data != "") {
               alert("책갈피가 추가되었습니다.");
            } else {
               alert("실패");
            }
            self.close();
         }); 
      }
   </script>

</body>
</html>
