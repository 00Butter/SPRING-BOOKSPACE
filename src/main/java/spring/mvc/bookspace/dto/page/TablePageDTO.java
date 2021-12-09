package spring.mvc.bookspace.dto.page;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class TablePageDTO {

	
	private ArrayList<Object> list;
	
	
	private int nowPage; // 현재 페이지 숫자
	private int start; // 레코드 시작 넘버
	private int end;   // 레코드 끝 넘버
	private int recordDegree; // 한페이지당 레코드 수 
	
	
	private int allRecord;  // 전체 레코드수
	private int startPage; // 페이지전체시작넘버
	private int endPage;   // 페이지전체끝넘버
	private int PageDegree;
	private int showStart;  //현재페이지시작넘버
	private int showEnd;   // 현재페이지 끝넘버
	
	public TablePageDTO() {
		// TODO Auto-generated constructor stub
		
		nowPage=1;
		PageDegree=3;
		recordDegree=5;
		//3쪽 5개씩
	}
	
	public ArrayList<Object> getList() {
		return list;
	}
	public void setList(ArrayList<Object> list) {
		this.list = list;
		this.allRecord=list.size();
		this.start=0;
		this.end=recordDegree-1;
		if(end>allRecord)end=allRecord;
		this.startPage=1;
		this.endPage=(int) Math.ceil((double)(allRecord)/recordDegree);
		if(endPage==0)endPage=1;
		this.showStart=startPage;
		this.showEnd= endPage <PageDegree ? endPage:PageDegree;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		if(endPage==1) return;
		this.nowPage = nowPage;
		if(nowPage<1){
			nowPage=startPage;
		}else if(nowPage>endPage){
			nowPage=endPage;
		}
		start=(nowPage-1)*recordDegree;
		if(start>allRecord) start=allRecord;
		end=nowPage*recordDegree-1;
		if(end>allRecord) end=allRecord;
		showStart=nowPage-1;
		if(showStart<startPage) showStart=startPage;
		showEnd=nowPage+1;
		if(showEnd>endPage) showEnd=endPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getRecordDegree() {
		return recordDegree;
	}
	public void setRecordDegree(int recordDegree) {
		this.recordDegree = recordDegree;
	}
	public int getAllRecord() {
		return allRecord;
	}
	public void setAllRecord(int allRecord) {
		this.allRecord = allRecord;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageDegree() {
		return PageDegree;
	}
	public void setPageDegree(int pageDegree) {
		PageDegree = pageDegree;
	}
	public int getShowStart() {
		return showStart;
	}
	public void setShowStart(int showStart) {
		this.showStart = showStart;
	}
	public int getShowEnd() {
		return showEnd;
	}
	public void setShowEnd(int showEnd) {
		this.showEnd = showEnd;
	}
	
	
	
	
	
	
	
}
