package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.CartOrderDto;
import db.mysql.DbConnect;

public class CartOrderDao {

	DbConnect db = new DbConnect();
	
	// 상품주문
	public void insertOrder(CartOrderDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO cartorder VALUES (null, ?, ?, ?, ?, NOW())";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getP_num());
			pstmt.setString(2, dto.getM_num());
			pstmt.setInt(3, dto.getCnt());
			pstmt.setInt(4, dto.getPrice());
			
			pstmt.execute();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	// 주문목록
	public List<CartOrderDto> getAllList(String m_num){
		
		List<CartOrderDto> list = new ArrayList<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM cartorder WHERE m_num=? ORDER BY o_num DESC";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartOrderDto dto = new CartOrderDto();
				
				dto.setO_num(rs.getString("o_num"));
				dto.setP_num(rs.getString("p_num"));
				dto.setM_num(rs.getString("m_num"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setPrice(rs.getInt("price"));
				dto.setOrderday(rs.getTimestamp("orderday"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
}
