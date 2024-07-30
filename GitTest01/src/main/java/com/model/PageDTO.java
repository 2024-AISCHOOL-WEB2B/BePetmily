package com.model;

public class PageDTO {
	private int startPage; // 페이징 첫 넘버
	private int endPage; // 페이징 마지막 넘버
	private int curPage; // 현재 페이지 넘버
	private int pageSize = 15; // 보여줄 개체 수
	private int totalCnt; // db에서 가져온 총 갯수
	private boolean next; // 다음 페이징 존재여부
	private boolean prev; // 이전 페이징 존재여부

	public PageDTO(int curPage, int pageSize, int totalCnt) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.totalCnt = totalCnt;

		this.endPage = (int) Math.ceil((double) curPage / 5) * 5; // (현재페이지/보여줄페이지수) 올림 후 *5
		this.startPage = this.endPage - 5 + 1; // 마지막 페이지 - 보여줄페이지수 + 1
		int totalPage = (int) Math.ceil((double) this.totalCnt / pageSize);

		if (this.endPage > totalPage) {
			this.endPage = totalPage;

			this.next = this.endPage < totalPage;
			this.prev = this.startPage > 1;
		}

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

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

}