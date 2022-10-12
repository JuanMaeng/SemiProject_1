package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ProductDto;
import db.mysql.DbConnect;

public class ProductDao {

	DbConnect db = new DbConnect();
	//insert
	public void insertProduct(ProductDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into product(name, category, collection, description, filter, price, thumbnail, regdate) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getCollection());
			pstmt.setString(4, dto.getDescription());
			pstmt.setString(5, dto.getFilter());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setString(7, dto.getThumbnail());
			pstmt.setString(8, dto.getRegdate());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체출력
	public List<ProductDto> getAllProduct() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		String sql="select * from product order by regdate desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDto dto = new ProductDto();
				dto.setP_num(rs.getString("p_num"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setCollection(rs.getString("collection"));
				dto.setDescription(rs.getString("description"));
				dto.setFilter(rs.getString("filter"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setRegdate(rs.getString("regdate"));
				
				//list에 추가
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//해당 1개의 dto 리턴
	public ProductDto getData(String p_num) {
		ProductDto dto = new ProductDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from product where p_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, p_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setP_num(rs.getString("p_num"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setCollection(rs.getString("collection"));
				dto.setDescription(rs.getString("description"));
				dto.setFilter(rs.getString("filter"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public ProductDto getLastData() {
		ProductDto dto = new ProductDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from product order by p_num desc limit 1";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setP_num(rs.getString("p_num"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setCollection(rs.getString("collection"));
				dto.setDescription(rs.getString("description"));
				dto.setFilter(rs.getString("filter"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	
	
	// 검색결과
	public List<ProductDto> getSearchResult(String keyword){
		
		List<ProductDto> list = new ArrayList<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product WHERE name like ? OR category like ? OR description like ? OR filter like ? ORDER BY p_num DESC";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDto dto = new ProductDto();
				
				dto.setP_num(rs.getString("p_num"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setCollection(rs.getString("collection"));
				dto.setDescription(rs.getString("description"));
				dto.setFilter(rs.getString("filter"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setRegdate(rs.getString("regdate"));
				
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
