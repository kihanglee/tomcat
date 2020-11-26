<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>JDBC driver test</h2>

<%
  Connection conn=null;

  try{
	 String jdbcUrl = "jdbc:mariadb://192.168.16.48:3306/employees";
     String dbId = "mtp3";
     String dbPass = "mtp3";
	
	 Class.forName("org.mariadb.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 out.println("success.");
  }catch(Exception e){ 
	 e.printStackTrace();
  }
%>
