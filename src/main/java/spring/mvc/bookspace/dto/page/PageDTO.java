package spring.mvc.bookspace.dto.page;

public class PageDTO {

	// 페이징.

	private int nowPage;
	private int startPage;
	// 5개를 보여준다고 하면 이게 1
	private int endPage;
	// 이게 5
	private int recordDegree;
	// 한 페이지당 노출할 글 갯수

	private int countAllRecord;
	private int startNum; // 하나의 페이지에서 시작되는 글 번호
	private int endNum; // 하나의 페이지에서 끝나는 글 번호

	private int showPageNumberDegree; // 한 페이지 당 노출할 페이지 번호 갯수
	private int showPageNumberBegin; // 페이지 당 노출할 페이지 숫자 시작번호
	private int showPageNumberEnd; // 페이지 당 노출할 페이지 숫자 끝번호

	public PageDTO() {
		// TODO Auto-generated constructor stub
		this.nowPage = 1; // 현재 페이지 기본값 => 선택에 따라 변경됨
		this.recordDegree = 5;
		this.showPageNumberDegree = 3;
	}

	// 페이지 당 보여줄 글 수(recordDegree) 설정
	// -5개로 설정한 경우
	// 현재 1페이지(nowPage) => 1번글 ~ 5번글
	// 현재 2페이지(nowPage) => 6번글 ~ 10번글
	// 현재 3페이지(nowPage) => 11번글 ~ 15번글

	// - 선택된 페이지 당 시작 글번호 계산
	// startNum=(PageNum*recordDegree) - (recordDegree - 1)

	// - 선택된 페이지 당 끝 글번호 계산
	// endNum=(pageNum*recordDegree)
	// = > 단, 전체글 갯수가 끝 글번호보다 작은 경우, endNum=전체 글갯수

	// 전체 페이지 설정
	// - 전체 글에 대한 첫 페이지(startPage) : 1

	// - 전체 글에 대한 마지막 페이지(endPage)
	// -- 전체글 갯수 / 페이지당 보여줄 글 수(recordDegree)
	// =>단, 전체글 갯수 % 페이지당 보여줄 글 수 (recordDegree) 결과가
	// 0이 아니면, 1을 증가시켜야 함

	public void setCountRecord(int cntAllRecord) {

		this.countAllRecord = cntAllRecord;

		// startNum, endNum (nowPage선택에 따른 시작글번호, 끝글번호)
		// 글이 12개라고 치고 한페이지당 5개씩 보여준다고하면
		startNum = (nowPage * recordDegree) - (recordDegree - 1);
		// 2 페이지 글 시작 넘버는 6
		endNum = nowPage * recordDegree;
		if (endNum > countAllRecord) {
			endNum = countAllRecord;
		}

		// 전체 레코드에 대한 전체 페이지
		startPage = 1;
		endPage = countAllRecord / recordDegree;
		if (countAllRecord % recordDegree != 0) {
			endPage++;
		}
		// 보여질 페이지 숫자에 대한 시작과 끝 계산
		showPageNumberBegin = nowPage - (showPageNumberDegree - 1) / 2;
		showPageNumberEnd = nowPage + (showPageNumberDegree - 1) / 2;
		// 전체 페이지가 홀수인 경우일때
		// 현재 페이지를 항상 중간에 놓고 싶어서 처리함.

		if (showPageNumberEnd > endPage) {
			showPageNumberEnd = endPage;
			showPageNumberBegin = showPageNumberEnd - showPageNumberDegree + 1;
			if (recordDegree * showPageNumberDegree > countAllRecord) {
				showPageNumberBegin = showPageNumberEnd - 2;
				// 만약에 글의 갯수가 10개면 페이지는 단지 2개만 필요
				// 여기 어딜 만지면
				// 해결됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
			}
		}

		if (showPageNumberBegin < 1) {
			showPageNumberBegin = 1;
			showPageNumberEnd = showPageNumberDegree;
			if (recordDegree * showPageNumberDegree > countAllRecord) {
				showPageNumberEnd = endPage;
				// 만약에 글의 갯수가 10개면 페이지는 단지 2개만 필요

			}
		}
	}
 
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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

	public int getRecordDegree() {
		return recordDegree;
	}

	public void setRecordDegree(int recordDegree) {
		this.recordDegree = recordDegree;
	}

	public int getCountAllRecord() {
		return countAllRecord;
	}

	public void setCountAllRecord(int countAllRecord) {
		this.countAllRecord = countAllRecord;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getShowPageNumberDegree() {
		return showPageNumberDegree;
	}

	public void setShowPageNumberDegree(int showPageNumberDegree) {
		this.showPageNumberDegree = showPageNumberDegree;
	}

	public int getShowPageNumberBegin() {
		return showPageNumberBegin;
	}

	public void setShowPageNumberBegin(int showPageNumberBegin) {
		this.showPageNumberBegin = showPageNumberBegin;
	}

	public int getShowPageNumberEnd() {
		return showPageNumberEnd;
	}

	public void setShowPageNumberEnd(int showPageNumberEnd) {
		this.showPageNumberEnd = showPageNumberEnd;
	}

}
