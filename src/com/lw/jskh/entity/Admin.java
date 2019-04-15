package com.lw.jskh.entity;

public class Admin {
	private int id;
	private String username;//用户名
	private String password;
	private String trueName;//真实姓名
	private String position; //职务
	private String  dep; //二级学院名
	private String  note; //备注
	private String pic;// 个人标准照

	
	
	@Override
	public String toString() {
		String s = id +","+ username+","+password +","+ trueName+","+position +","+ dep+","+ note+","+pic;
		return s;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
