package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.QnaAnswerDto;
import data.dto.QnaBoardDto;
import db.mysql.DbConnect;

public class QnaAnswerDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertAnswer(QnaAnswerDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into qnaanswer (num, id, content, writeday) values (?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체 출력
	public List<QnaAnswerDto> getAllAnswers(String num){
		
		List<QnaAnswerDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from qnaanswer where num=? order by num desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaAnswerDto dto = new QnaAnswerDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
		
	}
	
	//update
	
	//delete
	public void deleteAnswer(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql= "delete from qnaanswer where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(pstmt, conn);
		}
		
	}
}
