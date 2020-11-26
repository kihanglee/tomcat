<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%

    // JNDI 부터 DataSource 얻자
    Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/maria");
 
    Connection conn = null;
    Statement stmt = null;
 
    try {
        // 데이터소스와 DB연결해서 명령객체를 가지고 오자.
        conn = ds.getConnection();
        stmt = c.createStatement();
   
        // 쿼리문 실행
        try {
   
            // Create a statement and execute the query on it
            stmt.execute("select * from emp");
   
            // 결과레코드및 메타데이터
            ResultSet r = stmt.getResultSet();
            while (r.next()) {
                    out.println("<BR />" + r.getString("empno"));
                    out.println("<BR />" + r.getString("ename"));              
            }
   
            // Clean up
            stmt.close();
            conn.close();
   
        } catch (SQLException se) {
            out.println(se.toString());
        } catch (Exception e) {
            out.println(e.toString());
        }
   
    } finally {
      
        try { if(stmt != null) stme.close(); } catch (Exception e) {}
        try { if(conn != null) conn.close(); } catch (Exception e) {}
    }
%>
