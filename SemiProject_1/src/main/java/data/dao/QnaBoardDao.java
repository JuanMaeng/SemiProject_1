package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.QnaBoardDto;
import db.mysql.DbConnect;

public class QnaBoardDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertQna(QnaBoardDto dto) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt= null;
			 
			String sql = "insert into qnaboard(id, subject, content, writeday) values(?,?,?,now())";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getSubject());
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
	public List<QnaBoardDto> getAllQnas() {
			List<QnaBoardDto> list = new Vector<>();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from qnaboard order by num desc"; //최신글이 맨 위로 올라오도록 desc로 설정
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					QnaBoardDto dto = new QnaBoardDto();
					dto.setNum(rs.getString("num"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					//리스트에 추가
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
	
}
