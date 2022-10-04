package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import data.dto.MemberDto;
import db.mysql.DbConnect;

import java.sql.ResultSet;

public class MemberDao {

DbConnect db=new DbConnect();
	
	//1. 아이디를 통해 name 을 얻는다
	
	public String getName(String id)
	{
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member where id=?";
		String name="";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				name=rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	
	}

	//필수로그인: id에 맞는 pw인지 확인하는
	public boolean isLogin(String id,String pw)
	{
		boolean b=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=? and pw=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
		
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				b=true;
			}
			
		}	catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;	
	}

	//회원가입
	public int join(MemberDto memberDto) 
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="insert into member values (?, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getName());
			pstmt.setString(2, memberDto.getId());
			pstmt.setString(3, memberDto.getPw());
			pstmt.setString(4, memberDto.getEmail());
			pstmt.setString(5, memberDto.getPhone());
			pstmt.setString(6, memberDto.getAddr());
			pstmt.setTimestamp(7, memberDto.getRegister());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; //db오류
	}
}