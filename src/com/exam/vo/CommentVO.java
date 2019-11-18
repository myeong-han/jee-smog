package com.exam.vo;

public class CommentVO {
	
	private int seq;
	private String id;
	private String content;
	private int bno;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentVO [seq=").append(seq).append(", id=").append(id).append(", content=").append(content)
				.append(", bno=").append(bno).append("]");
		return builder.toString();
	}
}
