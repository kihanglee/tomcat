package jsp.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;

import jsp.util.DBConnection;


public class MemberDAO 
{
	private static MemberDAO instance;
	
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		if(instance==null)
			instance=new MemberDAO();
		return instance;
	}
	
	public Date stringToDate(MemberBean member)
	{
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();
		
		Date birthday = Date.valueOf(year+"-"+month+"-"+day);
		
		return birthday;
		
	} 
	
	public void insertMember(MemberBean member) throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into JSP_MEMBER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");		
			stringToDate(member);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			
			pstmt.executeUpdate();
			conn.commit(); 
			
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			conn.rollback(); 
			
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		} 
	} 
}

