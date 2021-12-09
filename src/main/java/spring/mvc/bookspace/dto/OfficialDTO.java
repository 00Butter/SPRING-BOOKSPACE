package spring.mvc.bookspace.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("ofd")
public class OfficialDTO {

	private Integer num;
	private String title;
	private String writer;
	private String content;
	private String savedate;  

	public OfficialDTO(Integer num, String title, String writer, String content, String btype, String savedate) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.savedate = savedate;
	}

	public OfficialDTO() {
		// TODO Auto-generated constructor stub
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSavedate() {
		return savedate;
	}

	public void setSavedate(String savedate) {
		this.savedate = savedate;
	}

}