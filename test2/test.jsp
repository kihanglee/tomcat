<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%
  response.setContentType("text/html;charset=UTF-8;");
  request.setCharacterEncoding("UTF-8");     //charset, Encoding 설정
  Class.forName("com.mysql.jdbc.Driver");    // Mysql Driver load
  String DB_URL = 
          // "jdbc:mysql://192.168.16.48:3306/test?useUnicode=true&characterEncoding=utf-8";
		  "jdbc:mysql://192.168.16.48:3306/test?useUnicode=true&characterEncoding=utf-8";

  String DB_USER = "jinho";
  String DB_PASSWORD= "jinho";

  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;

  try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = conn.createStatement();

      String query = "SELECT userID, userPassword, userName FROM user";
      rs = stmt.executeQuery(query);
 %>

<!-- form action="delete.jsp" method="post" -->
<form action="" method="post"></form>
    <table border="1" cellspacing="0">
        <tr>
            <td style="width:100px; background-color: pink">UID</td>
            <td style="width:200px; background-color: pink">Password</td>
            <td style="width:200px; background-color: pink">Alias</td>
        </tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체 Return
%>
        <tr>
            <!--  td><%=rs.getString(1)%></td -->
            <td><%=rs.getString("userID")%></td>
            <td><%=rs.getString("userPassword")%></td>
            <td><%=rs.getString("username")%></td>
            <!--  td><a href='delete.jsp?del=<%=rs.getString("ID")%>'>Delete</a></td -->
        </tr>
<%
    } // end while
%>
    </table>
</form>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>