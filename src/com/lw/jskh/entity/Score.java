package com.lw.jskh.entity;

public class Score {

	private Integer add;
	private Integer sub;
	private Integer myself;
	private Integer leader;
	private Integer result;
	private String note; //备注
	public Score() {
		super();
	}
	public Score(Integer add, Integer sub, Integer myself, Integer leader, Integer result, String note) {
		super();
		this.add = add;
		this.sub = sub;
		this.myself = myself;
		this.leader = leader;
		this.result = result;
		this.note = note;
	}
	public Integer getAdd() {
		return add;
	}
	public void setAdd(Integer add) {
		this.add = add;
	}
	public Integer getSub() {
		return sub;
	}
	public void setSub(Integer sub) {
		this.sub = sub;
	}
	public Integer getMyself() {
		return myself;
	}
	public void setMyself(Integer myself) {
		this.myself = myself;
	}
	public Integer getLeader() {
		return leader;
	}
	public void setLeader(Integer leader) {
		this.leader = leader;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
}
