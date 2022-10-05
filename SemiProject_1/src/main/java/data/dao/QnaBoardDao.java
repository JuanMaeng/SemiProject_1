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
	
	//pagingList
	//페이징 처리 1. 전체 갯수 구하기
		public int getTotalCount() {
		int n =0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from qnaboard";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				n=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
			
		}
				
		return n;
	}
		
		
	//페이징처리에 필요한 리스트만 내보내기 2.getList(0,5) -> 0 다음부터 5개 출력 
	public List<QnaBoardDto> getList(int start, int perpage){
		List<QnaBoardDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from qnaboard order by num desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
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
	
	//num에 맞는 데이터 출력
		public QnaBoardDto getData(String num) {
			QnaBoardDto dto = new QnaBoardDto();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from qnaboard where num=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setWriteday(rs.getTimestamp("writeday"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return dto;
		}
		
	
	
	
	//readcount - 조회 수
		public void updateReadCount(String num) { //내가 3번 글을 누르면 3번의 readcount가 1 증가해야 하니까 num이 넘어와야 함
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update qnaboard set readcount=readcount+1 where num=?"; //좋아요도 같은 원리
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
	//update
		public void updateQna(QnaBoardDto dto) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update qnaboard set subject=?, content=? where num=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getNum());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		
	//delete
		public void deleteQna(String num) {
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "delete from qnaboard where num=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
	
}
