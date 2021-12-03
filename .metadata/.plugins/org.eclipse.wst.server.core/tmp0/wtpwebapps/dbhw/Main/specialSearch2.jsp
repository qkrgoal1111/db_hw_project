<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Special Search Result</title>
</head>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String searchDate = request.getParameter("transactionDate");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;	
	
	// 2. SQL - 데이터 추가, 수정, 삭제 - 실행할 객체 생성 
	Statement stmt = conn.createStatement();
	
	String sql = 
			"SELECT product.name, product.productID, SUM(transaction.price) "
				+ "FROM product, transaction "
				+ "WHERE transaction.date < ? AND product.productID = transaction.productID "
				+ "GROUP BY transaction.productID "
				+ "HAVING SUM(transaction.price) >= ALL ("
				+	"SELECT SUM(transaction.price) "
				+	"FROM transaction "
				+	"WHERE transaction.date < ? "
				+	"GROUP BY transaction.productID)";
	pstmt = conn.prepareStatement(sql);
	
	try {
		pstmt.setString(1, searchDate);
		pstmt.setString(2, searchDate);
		rs = pstmt.executeQuery();
		
		
		if (!rs.next()) {
			out.println("해당하는 정보가 없습니다.");
			return ;
		} else {
			rs = pstmt.executeQuery();
		}
		
		out.print("<p>" + searchDate + " 이전에 가장 많은 거래가 이루어진 상품");
		out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
                + "center " + "bordercolor =" + "red " + "cellspacing ="
                + "2 " + " bordercolor =" + "red >");
		out.print("<tr>");
        out.print("<th>" + "Product Name" + "</th>");
        out.print("<th>" + "Product ID" + "</th>");
        out.print("<th>" + "Sum of Price" + "</th>");
        out.print("</tr>");
        
        while(rs.next()) {
			String name = rs.getString("product.name");
			String productID = rs.getString("product.productID");
			String price = rs.getString("SUM(transaction.price)");
			
			out.print("<tr>");
			out.println("<td>" + name + "</td>");
	        out.println("<td>" + productID + "</td>");
	        out.println("<td>" + price + "</td>");
	        out.print("</tr>");
		}
	} catch(SQLException e){
	    out.println(e.toString());
	}
%>
<body>

</body>
</html>