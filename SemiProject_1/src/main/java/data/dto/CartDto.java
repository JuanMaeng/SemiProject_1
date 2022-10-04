package data.dto;

import java.sql.Timestamp;

public class CartDto {
	
	private String idx;
	private String p_num;
	private String m_num;
	private int cnt;
	private Timestamp cartday;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public Timestamp getCartday() {
		return cartday;
	}
	public void setCartday(Timestamp cartday) {
		this.cartday = cartday;
	}
}
