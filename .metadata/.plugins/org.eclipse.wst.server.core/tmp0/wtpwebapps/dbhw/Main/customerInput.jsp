<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Customer Input</title>
</head>

<script>
	function Insert()
	{
		var InsertForm = document.customerInsertForm;
		if(!InsertForm.customerName.value) {
			alert("이름을 입력해주세요.");
			InsertForm.customerName.focus();
			return ;
		}
		
		if(!InsertForm.customerPhone1.value) {
			alert("핸드폰 번호를 입력해주세요.");
			InsertForm.customerPhone1.focus();
			return ;
		}
		if(!InsertForm.customerPhone2.value) {
			alert("핸드폰 번호를 입력해주세요.");
			InsertForm.customerPhone2.focus();
			return ;
		}
		if(!InsertForm.customerPhone3.value) {
			alert("핸드폰 번호를 입력해주세요.");
			InsertForm.customerPhone3.focus();
			return ;
		}
		
		if(!InsertForm.customerAddress.value) {
			alert("주소를 입력해주세요.");
			InsertForm.customerAddress.focus();
			return ;
		}
		
		if(!InsertForm.customerGender.value) {
			alert("성별을 입력해주세요.");
			InsertForm.customerGender.focus();
			return ;
		}
		
		if(!(InsertForm.customerGender.value == "Female" || InsertForm.customerGender.value == "Male")) {
			alert("성별을 형식에 맞게 입력해주세요.");
			InsertForm.customerGender.focus();
			return ;
		}
		
		InsertForm.submit();
	}
</script>
<body>
	<form name="customerInsertForm" id="customerInsertForm" action="customerInsert.jsp">
		<br>
		이름
		<br>
		<input type="text" name="customerName" id="customerName" maxlength="30">
		<br>
		핸드폰 번호 (###-###-####)
		<br>
		<input type="text" name="customerPhone1" id="customerPhone1" size="3" maxlength="3">
		<input type="text" name="customerPhone2" id="customerPhone2" size="3" maxlength="3">
		<input type="text" name="customerPhone3" id="customerPhone3" size="3" maxlength="4">
		<br>
		주소
		<br>
		<input type="text" name="customerAddress" id="customerAddress" maxlength="40">
		<br>
		성별 (Female / Male)
		<br>
		<input type="text" name="customerGender" id="customerGender" maxlength="10">
		<br>
	</form>
	<input type="button" value="입력" id="customerInput" OnClick="javascript:Insert();">
</body>
</html>