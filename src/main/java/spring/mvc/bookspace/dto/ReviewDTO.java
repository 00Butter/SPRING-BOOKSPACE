package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("rev")
public class ReviewDTO {

	private Integer num;
	private String id;
	private String img;
	private String bookname;
	private String review;
	private Integer star;
	private Integer	recommend; // 추천
	private Integer complain;  // 신고
	private String reviewDate;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public Integer getComplain() {
		return complain;
	}
	public void setComplain(Integer complain) {
		this.complain = complain;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
	
}
