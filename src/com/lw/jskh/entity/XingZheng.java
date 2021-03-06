package com.lw.jskh.entity;

public class XingZheng implements Comparable<XingZheng> {
	private int id;
	private String username;//用户名
	private String password;
	private String trueName;//真实姓名
	private String level; //职称
	private String  team; //行政部门名
	private String  dep; //二级学院名
	private String  note; //备注
	private String pic;// 个人标准照
	private int open; //权限开放
	private int myselftScore; //自评得分
	private int teamScore; //团队负责人给分
	private int adminScore; //院级领导给分
	
	@Override
	public String toString() {
		String s = id +","+ username+","+password +","+ trueName+","+level +","+ team+","+ dep+","+ note+","+pic;
		return s;
	}
	
	//用于对教师得分排序,选按院级领导打分 -- 团队负责人打分  -- 自评打分顺序
		@Override
		public int compareTo(XingZheng o) {
			if(this.adminScore!=0) {
				return this.adminScore - o.adminScore;
			}else if(this.teamScore!=0) {
				return this.teamScore - o.teamScore;
			}else {
				return this.myselftScore - o.myselftScore;
			}
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getMyselftScore() {
		return myselftScore;
	}

	public void setMyselftScore(int myselftScore) {
		this.myselftScore = myselftScore;
	}

	public int getTeamScore() {
		return teamScore;
	}

	public void setTeamScore(int teamScore) {
		this.teamScore = teamScore;
	}

	public int getAdminScore() {
		return adminScore;
	}

	public void setAdminScore(int adminScore) {
		this.adminScore = adminScore;
	}
	
	
	
}
