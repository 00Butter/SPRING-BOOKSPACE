package spring.mvc.bookspace.dto;

import org.apache.ibatis.type.Alias;

@Alias("sys")
public class AdminDTO {
	private String sysno;
	private String name;
	private String phone;
	
	
	public String getSysno() {
		return sysno;
	}
	public void setSysno(String sysno) {
		this.sysno = sysno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
