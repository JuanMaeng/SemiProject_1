package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.CartDto;
import db.mysql.DbConnect;

public class CartDao {

	DbConnect db = new DbConnect();

	// 장바구니 목록
	public List<HashMap<String, String>> getCartList(String id){

		List<HashMap<String, String>> list = new ArrayList<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT c.idx, p.name, p.p_num, p.thumbnail, p.price, c.cnt, c.cartday FROM cart c, product p, member m WHERE c.p_num = p.p_num AND c.m_num = m.m_num AND m.id=? ORDER BY idx DESC";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				HashMap<String, String> map = new HashMap<>();

				map.put("idx", rs.getString("idx"));
				map.put("name", rs.getString("name"));
				map.put("p_num", rs.getString("p_num"));
				map.put("thumbnail", rs.getString("thumbnail"));
				map.put("price", rs.getString("price"));
				map.put("cnt", rs.getString("cnt"));
				map.put("cartday", rs.getString("cartday"));

				list.add(map);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}



	// DELETE
	public void deleteCart(String idx) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM cart WHERE idx=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, idx);

			pstmt.execute();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			db.dbClose(pstmt, conn);
		}
	}



	// 제품 상세보기에서 장바구니 등록
	public void InsertCart(CartDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO cart VALUES (null, ?, ?, ?, NOW())";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getP_num());
			pstmt.setString(2, dto.getM_num());
			pstmt.setInt(3, dto.getCnt());

			pstmt.execute();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			db.dbClose(pstmt, conn);
		}
	}
	
	// 장바구니에 담긴 상품의 수 구하기
	
}