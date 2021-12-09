package spring.mvc.bookspace.dto.page;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import spring.mvc.bookspace.dto.AccountDTO;
import spring.mvc.bookspace.dto.AdminDTO;
import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.BookRegDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.dto.ReviewDTO;

@Component
public class TableItemDTO {
	private ArrayList<Object> list;

	private ArrayList<String> thead; // 테이블 th
	private ArrayList<String> infoPath;  // 상세 경로들
	private ArrayList<ArrayList<String>> tbody; // 테이블 td
	private String type; // 버튼 색깔 타입
	private String btname; // 삭제 or 등록
	private ArrayList<String> secPath; // 두번재 버튼 경로들


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


	public TableItemDTO() {
		// TODO Auto-generated constructor stub		
		this.nowPage=1;
		this.recordDegree=10;
		this.PageDegree=5;
	}

	public void setAllRecord(int allRecord) { //첫번째 페이지 셋팅
		this.allRecord=allRecord;		
		start=((nowPage-1)*recordDegree);
		end=(nowPage*recordDegree)-1;
		if(end>allRecord) end=allRecord;		
		startPage=1;
		endPage=(int) Math.ceil((double)allRecord/recordDegree);
		showStart=startPage;
		showEnd=PageDegree;
		if(endPage<PageDegree) showEnd=endPage;


	}


	public void setNowPage(int nowPage) {
		showStart=nowPage-2;
		if(showStart<1)showStart=1;
		if(showStart>endPage)showStart=endPage;
		showEnd=showStart+PageDegree-1;
		if(showEnd>endPage) showEnd=endPage;
		this.nowPage = nowPage;
		start=((nowPage-1)*recordDegree);
		end=(nowPage*recordDegree)-1;
		if(end>allRecord) end=allRecord-1;
	}

	public void setPage(String type){
		if(type.equals("next")){
			showStart+=PageDegree;
			setNowPage(showStart);
			showEnd+=PageDegree;
			if(showEnd>endPage) showEnd=endPage;			
		}else{
			showStart-=PageDegree;
			if(showStart<0)showStart=1;
			setNowPage(showStart);
			showEnd-=PageDegree;
		}
	}

	public ArrayList<String> getThead() {
		return thead;
	}

	public void setThead(String type) {
		thead=new ArrayList<>();
		if(type.equals("book")){
			thead.add("출판사명");
			thead.add("도서명");
			thead.add("메뉴");
		}else if(type.equals("member")){
			thead.add("no.");
			thead.add("ID");
			thead.add("등급");
			thead.add("신고건수");
			thead.add("기능");	
		}else if(type.equals("pub")){
			thead.add("no.");
			thead.add("업체명");
			thead.add("담당자");
			thead.add("연락처");
			thead.add("기능");	
		}else if(type.equals("board")){
			thead.add("no.");
			thead.add("ID");
			thead.add("문의종류");
			thead.add("제목");
			thead.add("날짜");
			thead.add("기능");	
		}else if(type.equals("msg")){
			thead.add("no.");
			thead.add("법인ID");
			thead.add("제목");
			thead.add("날짜");
			thead.add("기능");
		}else if(type.equals("pay")){
			thead.add("no.");
			thead.add("법인명");
			thead.add("총 수익");
			thead.add("상세내역");
		}else if(type.equals("complain")){
			thead.add("no.");
			thead.add("ID");
			thead.add("신고컨텐츠");
			thead.add("날짜");
			thead.add("사유내역");
		}else{
			thead.add("이름");
			thead.add("폰번호");
			thead.add("기능");
		}
	}

	public ArrayList<String> getInfoPath() {
		return infoPath;
	}

	public void setInfoPath(ArrayList<String> infoPath) {
		this.infoPath = infoPath;
	}

	public ArrayList<ArrayList<String>> getTbody() {
		return tbody;
	}

	public void setTbody(ArrayList<ArrayList<String>> tbody) {
		this.tbody = tbody;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBtname() {
		return btname;
	}

	public void setBtname(String btname) {
		this.btname = btname;
	}

	public ArrayList<String> getSecPath() {
		return secPath;
	}

	public void setSecPath(ArrayList<String> secPath) {
		this.secPath = secPath;
	}

	public int getNowPage() {
		return nowPage;
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

	public int getAllRecord() {
		return allRecord;
	}
	public void setPageSetting( ArrayList<Object> list,String type,String urlpath ){
		String info;
		String path;
		ArrayList<ArrayList<String>> tbody=new ArrayList<>();
		ArrayList<String> infoPath=new ArrayList<>();
		ArrayList<String> secPath=new ArrayList<>();
		this.list=list;
		if(urlpath.equals("book")){
			this.setType("danger");
			this.setBtname("삭제요청");
			info="/bookspace/admin/book/Info";
			path="/bookspace/admin/book/del";
			if(type.equals("all")){
				this.setBtname("삭제처리");
				info="/bookspace/admin/book/allInfo";
				path="/bookspace/admin/book/alldel";
				for(Object obj: list){
					BookDTO dto=(BookDTO)obj;								
					ArrayList<String> body=new ArrayList<>();
					body.add(dto.getPublisher());
					body.add(dto.getBookname());
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
				}
			}else{ 
				if(type.equals("confirm")){
					this.setType("success");
					this.setBtname("등록요청");
					path="/bookspace/admin/bookinsert";
				}
				for(Object obj: list){
					BookRegDTO dto=(BookRegDTO)obj;								
					ArrayList<String> body=new ArrayList<>();
					body.add(dto.getPublisher());
					body.add(dto.getBookname());
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
				}}

		}else if(urlpath.equals("member")){
			this.setType("danger");
			this.setBtname("강제탈퇴");
			info="/bookspace/admin/member/Info";
			path="/bookspace/admin/member/del";

			for(Object obj: list){
				MemberDTO dto=(MemberDTO) obj;
				ArrayList<String> body=new ArrayList<>();
				body.add("no."+dto.getNum());
				body.add(dto.getId());
				body.add(dto.getGrade()!=null?dto.getGrade():"없음");
				if(dto.getComplain()==null||dto.getComplain()==0)body.add("0 건");
				else body.add(dto.getComplain()+"건");
				tbody.add(body);
				infoPath.add(info+"?num="+dto.getNum());
				secPath.add(path+"?num="+dto.getNum());

			}
		}else if(urlpath.equals("pub")){
			this.setType("danger");
			this.setBtname("계약철회");
			info="/bookspace/admin/pub/Info";
			path="/bookspace/admin/pub/del";
			if(type.equals("pay")){
				int i=0;
				for(Object obj: list){
					AccountDTO dto=(AccountDTO) obj;
					ArrayList<String> body=new ArrayList<>();
					body.add(i+"");
					body.add(dto.getPublisher());
					body.add(dto.getCost()+"원");
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getPublisher());
					secPath.add(path+"?num="+dto.getPublisher());
					i++;
				}
			}else{				
				for(Object obj: list){
					PublisherDTO dto=(PublisherDTO) obj;			
					ArrayList<String> body=new ArrayList<>();
					body.add(dto.getNum()+"");
					body.add(dto.getName());
					body.add(dto.getEmployee());
					body.add(dto.getPhone());
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
				}
			}
		}else if(urlpath.equals("board")){
			this.setType("danger");
			this.setBtname("삭제");
			info="/bookspace/admin/board/"+type+"Info";
			path="/bookspace/admin/board/del";

			if(type.equals("member")){
				int i=0;
				for(Object obj: list){
					BoardDTO dto=(BoardDTO) obj;		
					ArrayList<String> body=new ArrayList<>();
					body.add("no."+dto.getNum());
					body.add(dto.getId());
					body.add(dto.getBoardtype().equals("one")? "1:1문의":"출판사문의");
					body.add(dto.getTitle());
					body.add(dto.getRegdate()+"");
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
				}	
			}else if(type.equals("complain")){
				this.setType("danger");
				this.setBtname("블라인드");
				int i=0;
				for(Object obj: list){
					ReviewDTO dto=(ReviewDTO) obj;		
					ArrayList<String> body=new ArrayList<>();
					body.add("no."+dto.getNum());
					body.add(dto.getId());
					body.add(dto.getBookname());
					body.add(dto.getReviewDate());
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
				}	
			}else if(type.equals("pubmsg")){
				int i=0;
				for(Object obj: list){
					BoardDTO dto=(BoardDTO) obj;			
					ArrayList<String> body=new ArrayList<>();
					body.add("no."+i);
					body.add(dto.getId());
					body.add(dto.getTitle());
					body.add(dto.getRegdate()+"");
					tbody.add(body);
					infoPath.add(info+"?num="+dto.getNum());
					secPath.add(path+"?num="+dto.getNum());
					i++;
				}
			}
		}else if(type.equals("setting")){
			this.setType("danger");
			this.setBtname("삭제");
			info=null;
			path="/bookspace/admin/"+type+"/addel";
			for(Object obj:list){
				AdminDTO dto=(AdminDTO) obj;
				ArrayList<String> body=new ArrayList<>();
				body.add(dto.getName());
				body.add(dto.getPhone().substring(0, 9)+"****");
				tbody.add(body);
				infoPath.add(info);
				secPath.add(path+"?num="+dto.getSysno());
			}


		}
		this.setAllRecord(list.size());
		this.setInfoPath(infoPath);
		this.setSecPath(secPath);
		this.setTbody(tbody);		

	}

	public ArrayList<Object> getList() {
		return list;
	}

	public void setList(ArrayList<Object> list) {
		this.list = list;
	}



}
