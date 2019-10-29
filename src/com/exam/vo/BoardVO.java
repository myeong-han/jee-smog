package com.exam.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int num;
	private int boardnum;
	private String username;
	private String subject;
	private String content;
	private int readcount;
	private String ip;
	private Timestamp regDate;
	private int reRef;
	private int reLev;
	private int reSeq;
	private int rownum;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReRef() {
		return reRef;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public int getReLev() {
		return reLev;
	}
	public void setReLev(int reLev) {
		this.reLev = reLev;
	}
	public int getReSeq() {
		return reSeq;
	}
	public void setReSeq(int reSeq) {
		this.reSeq = reSeq;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardVO [num=").append(num).append(", boardnum=").append(boardnum)
				.append(", username=").append(username).append(", subject=").append(subject)
				.append(", content=").append(content).append(", readcount=").append(readcount).append(", ip=")
				.append(ip).append(", regDate=").append(regDate).append(", reRef=").append(reRef).append(", reLev=")
				.append(reLev).append(", reSeq=").append(reSeq).append(", rownum=").append(rownum).append("]");
		return builder.toString();
	}
}
