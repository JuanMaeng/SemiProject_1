package db.mysql;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {

	//mysql드라이버.. 8버전은 생략 가능
	static final String MYSQLDRIVER="com.mysql.cj.jdbc.Driver";
	//url
	static final String MYSQL_URL="jdbc:mysql://webservice.cbrdczmpvdiy.ap-northeast-2.rds.amazonaws.com:3306/webservice";
	
	
	//오라클드라이버...생성자..18c버젼은 생략 가능..
	public DbConnect() {

		try {
			Class.forName(MYSQLDRIVER);
			// System.out.println("MYSQL 드라이버 성공!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// System.out.println("MYSQL 드라이버 실패!!");
		}
	}
	
	
	
	//Connection..오라클과 자바 연결
	public Connection getConnection()
	{
		
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(MYSQL_URL, "ssadmin", "wndks0409!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// System.out.println("MYSQL 연결 실패: "+e.getMessage());
		}
		
		return conn;
				
	}
	
	//close메서드 총4개
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		
			try {
				if(rs!=null)	rs.close();
				if(stmt!=null)  stmt.close();
				if(conn!=null)  conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		
			try {
				if(rs!=null)	rs.close();
				if(pstmt!=null)  pstmt.close();
				if(conn!=null)  conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void dbClose(Statement stmt,Connection conn)
	{
		
			try {
				
				if(stmt!=null)  stmt.close();
				if(conn!=null)  conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		
			try {
				
				if(pstmt!=null)  pstmt.close();
				if(conn!=null)  conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}