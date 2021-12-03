<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product Input</title>
</head>
<script>
	function Insert()
	{
		var InsertForm = document.productInsertForm;
		if(!InsertForm.productName.value) {
			alert("상품 이름을 입력해주세요.");
			InsertForm.productName.focus();
			return ;
		}
		if(!InsertForm.productID.value) {
			alert("상품 ID를 입력해주세요.");
			InsertForm.productID.focus();
			return ;
		}
		if(!InsertForm.supplierName.value) {
			alert("공급자 이름을 입력해주세요.");
			InsertForm.supplierName.focus();
			return ;
		}
		if(InsertForm.productID.value.length != 8) {
			alert("상품 ID를 형식에 맞게 입력해주세요.");
			InsertForm.supplierName.focus();
			return ;
		}
		
		InsertForm.submit();
	}
</script>
<body>
	<form name="productInsertForm" id="productInsertForm" action="productInsert.jsp">
		<br>
		상품 이름
		<br>
		<input type="text" name="productName" id="productName" maxlength="30">
		<br>
		상품 ID (########)
		<br>
		<input type="text" name="productID" id="productID" size="8" maxlength="8">
		<br>
		공급자 이름
		<br>
		<input type="text" name="supplierName" id="supplierName" maxlength="30">
		<br>
	</form>
	<input type="button" value="입력" id="productInput" OnClick="javascript:Insert();">
</body>
</html>