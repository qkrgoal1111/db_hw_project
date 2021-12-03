<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Search Result</title>
</head>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String tableName = request.getParameter("search");
	String attribute = request.getParameter("selectAttr");
	String searchValue = request.getParameter("searchValue");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	// 2. SQL - 데이터 추가, 수정, 삭제 - 실행할 객체 생성 
	Statement stmt = conn.createStatement();
	
	if (tableName.equals("Customer")) {
		String sql = "select * from customer where "+ attribute + "='"+searchValue+"'";
		pstmt = conn.prepareStatement(sql);
		
		try{
			rs = pstmt.executeQuery();
			
			
			if (!rs.next()) {
				out.println("해당하는 고객 정보가 없습니다.");
				return ;
			} else {
				rs = pstmt.executeQuery();
			}
			
			
			out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
	                + "center " + "bordercolor =" + "red " + "cellspacing ="
	                + "2 " + " bordercolor =" + "red >");
			out.print("<tr>");
	        out.print("<th>" + "name" + "</th>");
	        out.print("<th>" + "phone" + "</th>");
	        out.print("<th>" + "address" + "</th>");
	        out.print("<th>" + "gender" + "</th>");
	        out.print("</tr>");
			while(rs.next()) {
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String gender = rs.getString("gender");
				
				out.print("<tr>");
				out.println("<td>" + name + "</td>");
		        out.println("<td>" + phone + "</td>");
		        out.println("<td>" + address + "</td>");
		        out.println("<td>" + gender + "</td>");
		        out.print("</tr>");
			}
			
		}catch(SQLException e){
		    out.println(e.toString());
		}
	}
	else if (tableName.equals("Transaction")) {
		String sql = "select * from transaction where "+ attribute + "='"+searchValue+"'";
		pstmt = conn.prepareStatement(sql);
		
		try{
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				out.println("해당하는 거래 정보가 없습니다.");
				return ;
			} else {
				rs = pstmt.executeQuery();
			}
			
			out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
	                + "center " + "bordercolor =" + "red " + "cellspacing ="
	                + "2 " + " bordercolor =" + "red >");
			out.print("<tr>");
	        out.print("<th>" + "transactionNumber" + "</th>");
	        out.print("<th>" + "productID" + "</th>");
	        out.print("<th>" + "price" + "</th>");
	        out.print("<th>" + "date" + "</th>");
	        out.print("<th>" + "customerName" + "</th>");
	        out.print("</tr>");
			while(rs.next()) {
				String transactionNumber = rs.getString("transactionNumber");
				String productID = rs.getString("productID");
				String price = rs.getString("price");
				String date = rs.getString("date");
				String customerName = rs.getString("customerName");
				
				out.print("<tr>");
				out.println("<td>" + transactionNumber + "</td>");
		        out.println("<td>" + productID + "</td>");
		        out.println("<td>" + price + "</td>");
		        out.println("<td>" + date + "</td>");
		        out.println("<td>" + customerName + "</td>");
		        out.print("</tr>");
			}
			
		}catch(SQLException e){
		    out.println(e.toString());
		}
	}
	else if (tableName.equals("Product")) {
		String sql = "select * from product where "+ attribute + "='"+searchValue+"'";
		pstmt = conn.prepareStatement(sql);
		
		try{
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				out.println("해당하는 상품 정보가 없습니다.");
				return ;
			} else {
				rs = pstmt.executeQuery();
			}
			
			out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
	                + "center " + "bordercolor =" + "red " + "cellspacing ="
	                + "2 " + " bordercolor =" + "red >");
			out.print("<tr>");
	        out.print("<th>" + "name" + "</th>");
	        out.print("<th>" + "productID" + "</th>");
	        out.print("<th>" + "supplierName" + "</th>");
	        out.print("</tr>");
			while(rs.next()) {
				String name = rs.getString("name");
				String productID = rs.getString("productID");
				String supplierName = rs.getString("supplierName");
				
				out.print("<tr>");
				out.println("<td>" + name + "</td>");
		        out.println("<td>" + productID + "</td>");
		        out.println("<td>" + supplierName + "</td>");
		        out.print("</tr>");
			}
			
		}catch(SQLException e){
		    out.println(e.toString());
		}
	}
%>
<body>
</body>
</html>