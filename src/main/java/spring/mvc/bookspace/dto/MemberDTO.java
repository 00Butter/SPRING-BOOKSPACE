package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("memdto")
public class MemberDTO {
	
	private Integer num; 
	private String id;
	private String pw; 
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String joindate;
	private String grade;
	private Integer complain;
	private Integer cash;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String id, String pw, String name, String birth, String gender, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
	}
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Integer getComplain() {
		return complain;
	}
	public void setComplain(Integer complain) {
		this.complain = complain;
	}
	public Integer getCash() {
		return cash;
	}
	public void setCash(Integer cash) {
		this.cash = cash;
	}

		
}
