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

	// 아이디를 통해 회원정보 얻어오기
	public MemberDto getMemberInfo(String id){

		MemberDto dto = new MemberDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=?";

		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();

			if(rs.next()) {
				
				dto.setM_num(rs.getString("m_num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegister(rs.getTimestamp("register"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			db.dbClose(rs, pstmt, conn);
		}

		return dto;
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
	public void insertMember(MemberDto dto) 
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql="INSERT INTO member VALUES (null, ?, ?, ?, ?, ?, ?, NOW())";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddr());

			pstmt.execute();

		}catch (SQLException e) {

			e.printStackTrace();

		} finally {

			db.dbClose(pstmt, conn);
		}
	}


	// 아이디 체크
	public int isIdCheck(String id) {

		int isid = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM member WHERE id=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) { // 아이디 존재할 경우 1, 존재하지 않을 경우 0

				/* if(rs.getInt(1) == 1) isid = 1; */
				isid = rs.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			db.dbClose(rs, pstmt, conn);
		}

		return isid;
	}
}