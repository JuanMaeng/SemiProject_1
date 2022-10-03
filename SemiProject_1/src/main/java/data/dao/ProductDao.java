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
		
		String sql="insert into product(name, category, collection, description, hand, size, platform, price, thumbnail, regdate) values(?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getCollection());
			pstmt.setString(4, dto.getDescription());
			pstmt.setString(5, dto.getHand());
			pstmt.setString(6, dto.getSize());
			pstmt.setString(7, dto.getPlatform());
			pstmt.setInt(8, dto.getPrice());
			pstmt.setString(9, dto.getThumbnail());
			pstmt.setString(10, dto.getRegdate());
			
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
		
		String sql="select * from product order by p_num desc";
		
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
				dto.setHand(rs.getString("hand"));
				dto.setSize(rs.getString("size"));
				dto.setPlatform(rs.getString("platform"));
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
}
