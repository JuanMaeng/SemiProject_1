package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.DetailProductDto;
import db.mysql.DbConnect;

public class DetailProductDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertProduct(DetailProductDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into detailproduct(p_num, photo1, photo2, photo3, photo4, description, sysreq, components) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getP_num());
			pstmt.setString(2, dto.getPhoto1());
			pstmt.setString(3, dto.getPhoto2());
			pstmt.setString(4, dto.getPhoto3());
			pstmt.setString(5, dto.getPhoto4());
			pstmt.setString(6, dto.getDescription());
			pstmt.setString(7, dto.getSysreq());
			pstmt.setString(8, dto.getComponents());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//해당 1개의 dto 리턴
	public DetailProductDto getData(String p_num) {
		DetailProductDto dto = new DetailProductDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from detailproduct where p_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, p_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setP_num(rs.getString("p_num"));
				dto.setPhoto1(rs.getString("photo1"));
				dto.setPhoto2(rs.getString("photo2"));
				dto.setPhoto3(rs.getString("photo3"));
				dto.setPhoto4(rs.getString("photo4"));
				dto.setDescription(rs.getString("description"));
				dto.setSysreq(rs.getString("sysreq"));
				dto.setComponents(rs.getString("components"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
}
