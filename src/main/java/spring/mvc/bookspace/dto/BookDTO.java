package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("bb")
public class BookDTO {
	private Integer num;
	private String bookname;
	private String writer;
	private String maintype;
	private String subtype;
	private Integer price;
	private String img;
	private String publisher;
	private Integer count;
	private Integer totalstar;
	private String story;
	private String conlist ;
	private String savedate;
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}

	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMaintype() {
		return maintype;
	}
	public void setMaintype(String maintype) {
		this.maintype = maintype;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTotalstar() {
		return totalstar;
	}
	public void setTotalstar(Integer totalstar) {
		this.totalstar = totalstar;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}

	public String getSavedate() {
		return savedate;
	}
	public void setSavedate(String savedate) {
		this.savedate = savedate;
	}
	public String getConlist() {
		return conlist;
	}
	public void setConlist(String conlist) {
		this.conlist = conlist;
	}
	
	
	
}
