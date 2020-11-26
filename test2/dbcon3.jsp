<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
  Connection conn = null;
 
 try {
    Context init = new InitialContext();
    Context env = (Context)init.lookup("java:comp/env");
    DataSource ds = (DataSource) env.lookup("jdbc/maria");
    conn = ds.getConnection();
    
    out.println("<h3>Connection Success</h3>");
 }catch(Exception e){
  out.println("<h3>Connection Fail</h3>");
  e.printStackTrace();
  }
%>
