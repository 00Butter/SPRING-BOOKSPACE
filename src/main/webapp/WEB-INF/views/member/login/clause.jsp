<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3 align="left"><b>
<span style="color: rgb(255, 94, 0);">*</span>ȸ�� ����</b></h3>
	<hr>
 <div id="page-wrapper">

            <div class="container-fluid">
<div class="row">
<div class="col-sm-2">
</div>
<div class="col-sm-8">
		<h2>��� ����</h2>
		<p>
			<strong>�Ͻ����̽� ���� ������ ���ؼ� �ʼ������� ������ �ּž� �մϴ�.</strong>
		<div class="panel-group" id="accordion"><br>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">�Ͻ����̽� �̿��� *�ʼ�</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">< �̿��� v2.6 ><br>
��1�� �� Ģ<br>
��1�� [�� ��]<br>
�� ����� �Ͻ����̽� �ֽ�ȸ��(���� ��ȸ�硱�� �մϴ�)�� ��ϴ� �Ͻ����̽�(www.bookspace.com)�� ���Ͽ� �����ϴ� ��ǰ �� ������������ ����
(���� �����񽺡��� �մϴ�)�� �̿�� �����Ͽ� �̿����� �Ǹ�, �ǹ� �� å�ӻ��� ���� �������� �������� �մϴ�.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2">�Ͻ����̽� ��������ó����ħ *�ʼ�</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
1. �Ϲ�/�ܱ��� ȸ������<br>
1) ����<br>
���� ������ ���� ��� ����<br>
���� ������ ���� �������<br>
ȸ������<br>
�ű� ���� ����<br>
�����ÿ��� Ȱ��<br>
2) �׸�<br>
�̸�, ���̵�, ��й�ȣ, �̸��� �ּ�, ����, ����<br>
3) �����Ⱓ<br>
ȸ��Ż��ñ��� (��. ���� ���ɿ� ���� �Ϻ� ������ �����˴ϴ�.)<br>
2. ���� ȸ�� �� �� �ֹ� ��<br>
1) ����<br>
��ȭ�� ���, ��Ȱ�� �����<br>
2) �׸�<br>
�ּ�, ������ȭ��ȣ, �޴���ȭ��ȣ, �̸��� �ּ�<br>
3) �����Ⱓ<br>
ȸ��Ż��ñ��� (��. ���� ���ɿ� ���� �Ϻ� ������ �����˴ϴ�.)<br>
					</div>
				</div>
			</div>
		</div>
	<div></div>	
	<input id="ch" type="checkbox">��� ����<br>
	<button type="button" onclick="agree()" class="btn btn-primary"
		style="width: 200px" >����</button><br>
		<hr>
</div></div>
	</div></div>
	
<script type="text/javascript">
function agree(){
	var check=document.getElementById("ch").checked;
	if(check!=""){
		location.href="/bookspace/login/choiceJoin";
	}
}
</script>

</body>
</html>