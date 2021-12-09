package spring.mvc.bookspace.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("board")
public class BoardDTO {
	private Integer num;
	private String id;
	private String boardtype;
	private String title;
	private String content;
	private String regdate;  
	private String receive;  
	private Integer groupnum;
	private Integer replynum; 
	private Integer count;
	private String bookname;
	
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
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public Integer getGroupnum() {
		return groupnum;
	}
	public void setGroupnum(Integer groupnum) {
		this.groupnum = groupnum;
	}
	public Integer getReplynum() {
		return replynum;
	}
	public void setReplynum(Integer replynum) {
		this.replynum = replynum;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

}
