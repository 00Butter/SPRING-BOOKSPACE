<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2">
				<!--             �԰� ���߱� ���ؼ� ���ܵ� -->
			</div>
			<div class="col-sm-8 text-left" style="margin-top: 70px;">
				<h3 style="background-color: white; color: #0066cc; font-style: normal; letter-spacing: normal;">
					<font style="font-size: xx-large; font-weight: bold;"># 1:1 ����</font>
				</h3>
				<br> <br>

				<c:choose>
					<c:when test="${ !listc.isEmpty() }">
						<table class="table" id="report">
							<thead>
								<tr>
									<th style="width: 5%">��ȣ</th>
									<th style="text-align: center;" width="24%">����</th>
									<th style="text-align: center;" width="15%">�ۼ���</th>
									<th style="text-align: center;" width="7%">�ۼ� ��¥</th>
									<th style="text-align: center;" width="8%">����</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list!=null }">
									<c:forEach var="each" items="${ list }" varStatus="num">
									<tr>
										<td style="text-align: left;" width="5%">${ each.num }</td>
										<td style="text-align: center;" width="10%"><a onclick="QnApop('${each.num}')">${ each.title }</a></td>
										<td style="text-align: center;" width="8%">${each.id=="admin" ? "������": each.id}
										</td>
										<td style="text-align: center;">${each.regdate }</td>
										<td style="text-align: center;" width="8%">
												<button type="button" class="btn btn-info btn-sm"
													onclick="javascript:QnADelet('${each.num}')">����</button>
										</td>
									</tr>
								</c:forEach></c:if>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<h4 style="background-color: white;">
							<font style="color: black; font-size: 35px;">�ۼ��� ���ǰ� �����ϴ�.</font>
						</h4>
					</c:otherwise>
				</c:choose>
				<br>
				<div align="center">
					<a onclick="writeForm('${login}')">
						<button type="button" class="btn btn-info btn-sm">�����ڿ��� ����</button>
					</a>
				</div>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
							<ul class="pager" id="num">
									<c:if test="${dto.nowPage >1}">
										<li class="previous"><a
											href="/bookspace/board/QnAList?nowPage=${dto.nowPage-1}">Previous</a></li>
									</c:if>
								<%--===================================================================================== --%>
								<c:forEach var="i" begin="${dto.showPageNumberBegin }"
									end="${dto.showPageNumberEnd }" step="1">
									<li class="numli" id="1"><a
										href="/bookspace/board/QnAList?nowPage=${i}">${i}</a></li>
								</c:forEach>
								<%--===================================================================================== --%>
									<c:if test="${dto.nowPage < dto.showPageNumberEnd}">
										<li class="next"><a
											href="/bookspace/board/QnAList?nowPage=${dto.nowPage }">Next</a></li>
									</c:if>
							</ul>
						</td>
					</tr>
				</tfoot>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<script type="text/javascript">
		function QnADelet(num) {
			deleteCh = confirm("�����Ͻðڽ��ϱ�?");

			if (deleteCh) {
				location.href = "/bookspace/board/QnADelete?num="+ num;
			} else {
				return;
			}
		}
		function writeForm(id) {
			var url="/bookspace/board/QnAForm";
			var name="�����ϱ�"
			var size="width=600px, height=400px";
			window.open(url,name,size);
		}
		
		function QnApop(pagenum) {
			var url="/bookspace/board/QnApop?num="+pagenum;
			var name="���� ����"
			var size="width=400px, height=400px";
			window.open(url,name,size);
		}
	</script>
	

</body>
</html>