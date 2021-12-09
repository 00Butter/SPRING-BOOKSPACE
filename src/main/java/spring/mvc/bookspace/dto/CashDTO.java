package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("cashdto")
public class CashDTO {
	private Integer num;
	private String id;
	private String 	cashType;
	private Integer price;
	private String cashDate;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCashType() {
		return cashType;
	}
	public void setCashType(String cashType) {
		this.cashType = cashType;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCashDate() {
		return cashDate;
	}
	public void setCashDate(String cashDate) {
		this.cashDate = cashDate;
	}
	
	
	
}
