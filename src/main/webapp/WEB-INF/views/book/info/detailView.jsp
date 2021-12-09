<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>상세보기</title>
<meta charset="utf-8">
 <meta charset="utf-8">


<style>

.btn-default {
      box-shadow: 1px 2px 5px #000000;
  }
  
.top { position:fixed;right:10px;bottom:15px; z-index:999; display:none;}
  
  
</style>
<script>
	//TOP버튼
  $(document).ready(function()
    {
        var speed = 700; // 스크롤되는 속도
        $("#top_move").css("cursor", "pointer").click(function()
        {
            $('body, html').animate({scrollTop:0}, speed);
        });
        
        $(window).scroll(function() {  //탑 메뉴 보이고 사라지게 하기
        if($(this).scrollTop() > 50) {
         $('.move').fadeIn();
        } else {
         $('.move').fadeOut();
        }
       });
        
    });
	
</script>

</head>
<body>
<div class="row">
<div class="col-sm-2" ></div>
	<div class="col-sm-8" style="margin-top: 5%;">
	<c:choose>
	<c:when test="${dto != null }">
		<div align="center">
		
		<img src="/bookspace/resources/book/${dto.bookname}/${dto.img}" class="img-thumbnail"
			alt="Cinque Terre" width="200" height="350" align="middle">
			&nbsp;
			
			</div>
			
		<div class="container-fluid">
		
			<div class="row">
			
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">책 제목</div>
				</div>
					<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${dto.bookname }</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">작가 이름</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${dto.writer}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">출판사</div>
				</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${dto.publisher}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">원가</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${dto.price}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">목차</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 15px;">${dto.conlist}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">줄거리</div>
				<div style="text-align: right;
					font-size: 15px;">${dto.story}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">책 이미지</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${dto.img}</div>
				<hr>
			<div class="col-sm-12" align="right">
				<button type="button" class="btn btn-default btn-lg" onclick="javascript:selgo()">이전</button>
			</div>
				
				<br><br><br><br><br>
				</c:when>
				<c:when test="${alldto != null }">
		<div align="center">
		
		<img src="/bookspace/resources/book/${alldto.bookname}/${alldto.img}" class="img-thumbnail"
			alt="Cinque Terre" width="200" height="350" align="middle">
			&nbsp;
			
			</div>
			
		<div class="container-fluid">
		
			<div class="row">
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">책 제목</div>
				</div>
					<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${alldto.bookname }</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">작가 이름</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${alldto.writer}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">출판사</div>
				</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${alldto.publisher}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">원가</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${alldto.price}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">목차</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 15px;">${alldto.conlist}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">줄거리</div>
				<div style="text-align: right;
					font-size: 15px;">${alldto.story}</div>
				<hr>
				<div style="margin: 20px;
					margin-bottom: 5px;
					letter-spacing: 10px;
					font-size: 30px;
					font-style: italic;
					text-align: left;">책 이미지</div>
				<div style="text-align: right;
					letter-spacing: 10px;
					font-size: 20px;">${alldto.img}</div>
				<hr>
			<div class="col-sm-12" align="right">
				<button type="button" class="btn btn-default btn-lg" style="margin-right: 10px" id="dubdelete" name="dubdelete" onclick="javascript:deletego('${alldto.num}', '${alldto.bookname}')">삭제요청 </button>
				<button type="button" class="btn btn-default btn-lg" onclick="javascript:selgo()">이전</button>
			</div>
				
				<br><br><br><br><br>
				</c:when>
				<c:otherwise>
					정보가 없습니다.
				</c:otherwise>
				</c:choose>
			</div>
			<div class="col-sm-2" ></div>
			</div>
	
	
<!--     	TOP버튼 -->
        <div class="move" style="position:fixed;right:10px;bottom:15px; z-index:999; display:none;">
        <button type="button" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-arrow-up" id="top_move" style="float:right;">top</span></button></div>
    <script type="text/javascript">
       function deletego(num, bookname){
        if(confirm("삭제요청 하시겠습니까?")){
         $.post("/bookspace/book/dubdelete?bookname="+bookname, {
            }, function(res) {
               if (res == "0") {
                	  alert("삭제요청 되었습니다.");
                	  delgo(num);
                  
               } else {
                  alert("이미 삭제요청 되었습니다.");
               }
            });
        }
         
         }
       function delgo(num) {
    	   location.href="/bookspace/book/delete?data="+num;
	}
       function selgo(){
          location.href="/bookspace/book/corpList";
       }
   </script> 
</body>
</html>