package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("data")
public class TableDataDTO {
	private String visitdate;
	private Integer count;
	
	private String joindate;
	private Integer Man;
	private Integer Woman;
	public String getVisitdate() {
		return visitdate;
	}
	public void setVisitdate(String visitdate) {
		this.visitdate = visitdate;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public Integer getMan() {
		return Man;
	}
	public void setMan(Integer man) {
		Man = man;
	}
	public Integer getWoman() {
		return Woman;
	}
	public void setWoman(Integer woman) {
		Woman = woman;
	}

}
