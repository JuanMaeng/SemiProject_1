package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.QnaAnswerDto;
import db.mysql.DbConnect;

public class QnaAnswerDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertAnswer(QnaAnswerDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into qnaanswer values(null, ?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getContent());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
