<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
  Connection conn = null;
 
 try {
    Context init = new InitialContext();
    Context env = (Context)init.lookup("java:comp/env");
    DataSource ds = (DataSource) env.lookup("jdbc/test_DB");
    conn = ds.getConnection();
    
    out.println("<h3>연결되었습니다.</h3>");
 }catch(Exception e){
  out.println("<h3>연결에 실패하였습니다.</h3>");
  e.printStackTrace();
  }
%>
