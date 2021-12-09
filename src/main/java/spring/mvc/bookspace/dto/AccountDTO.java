package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("acc")
public class AccountDTO {
	
	// 매출 확인.
	private Integer num;
	private String publisher;
	private Integer price;
	private Integer cost;
	private String regdate;
//  장르 선호도 조사를 위한.	
	private String gender;
	private String booktype;
	
	
	public void setBook(BookDTO dto){
		this.price=dto.getPrice();
		this.cost=dto.getPrice()/2;
		this.publisher=dto.getPublisher();
		this.booktype=dto.getMaintype();
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBooktype() {
		return booktype;
	}
	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}


}
