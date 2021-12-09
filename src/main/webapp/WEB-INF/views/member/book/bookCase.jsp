<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>My BookCase</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
</style>
</head>
<body>
   
   <br>
   <div class="container-fluid bg-3 text-center">
      <div class="container-best bg-5 text-center">
         <div class="row">
            <h2 style="text-align: center; margin-bottom: 20px;">내 책장</h2>
            <hr style="margin-bottom: 100px;">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
               <div class="col-sm-12">
                  <c:choose>
                     <c:when test="${list!=null }">
                        <div class="col-sm-12"
                           style="background-image: url('/bookspace/resources/img/bookcase4.png'); margin-top: -40px; width: 100%;">
                           <c:forEach var="each" items="${list}">
                              <div class="col-sm-3" 
                                 style="margin-bottom: 10px; margin-top: 40px;">
                                 <a
                                    onclick="wow('/bookspace/member/caseOne?bookname=${each.bookname}')">
                                    <img class="img"
                                    src="/bookspace/resources/book/${each.bookname }/${each.img }"
                                    alt="Image" style="width: 100px; height: 150px;">
                                 </a>
                                 <p style="font-size: 16px; color: #fff;">${each.bookname }</p>
                              </div>
                           </c:forEach>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <p style="font-size: 18px; color: #000;">구매한책이없슴니다.</p>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
            <div class="col-sm-2"></div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      function wow(data) {
         var path = data;
         var name = "bookSpace";
         var size = "width=1000px, height=600px, left = 200, top = 30";
         window.open(path, name, size);

      }
   </script>
</body>
</html>