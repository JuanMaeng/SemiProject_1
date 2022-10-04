package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.DetailProductDto;
import db.mysql.DbConnect;

public class DetailProductDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertProduct(DetailProductDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into detailproduct(p_num, photo1, photo2, photo3, photo4) values(?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getP_num());
			pstmt.setString(2, dto.getPhoto1());
			pstmt.setString(3, dto.getPhoto2());
			pstmt.setString(4, dto.getPhoto3());
			pstmt.setString(5, dto.getPhoto4());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
