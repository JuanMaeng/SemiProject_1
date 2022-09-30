package data.dto;

import java.sql.Timestamp;

public class CartOrderDto {

	private String o_num;
	private String p_num;
	private String m_num;
	private int cnt;
	private int price;
	private Timestamp orderday;
	
	public String getO_num() {
		return o_num;
	}
	public void setO_num(String o_num) {
		this.o_num = o_num;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getOrderday() {
		return orderday;
	}
	public void setOrderday(Timestamp orderday) {
		this.orderday = orderday;
	}
}
