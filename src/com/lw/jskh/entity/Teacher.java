package com.lw.jskh.entity;

/***
 * 教师用户类
 *
 */

public class Teacher implements Comparable<Teacher>{
	private int id;
	private String username;//用户名
	private String password;
	private String trueName;//真实姓名
	private String level; //职称
	private String  team; //教学团队名
	private String  dep; //二级学院名
	private String  note; //备注
	private int open;//开 放权限
	private String pic;//个人标准照
	private int myselftScore; //自评得分
	private int teamScore; //团队负责人给分
	private int adminScore; //院级领导给分


//	//团队负责人排序用
//	public Teacher(int id, String trueName, int teamScore, int myselftScore) {
//		super();
//		this.id=id;
//		this.trueName=trueName;
//		this.teamScore=teamScore;
//		this.myselftScore=myselftScore;
//	}

	public Teacher(String username, String password, String trueName, String level, String team, String dep,
			String note,int open) {
		super();
		this.username = username;
		this.password = password;
		this.trueName = trueName;
		this.level = level;
		this.team = team;
		this.dep = dep;
		this.note = note;
		this.open = open;
	}

	public Teacher(int id, String username, String password, String trueName, String level, String team, String dep,
			String note) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.trueName = trueName;
		this.level = level;
		this.team = team;
		this.dep = dep;
		this.note = note;
	}
	
	
	
	public Teacher(int id, String username, String trueName, String level, String team, String dep, String note) {
		super();
		this.id = id;
		this.username = username;
		this.trueName = trueName;
		this.level = level;
		this.team = team;
		this.dep = dep;
		this.note = note;
		
	}

	public Teacher() {

	}

	@Override
	public String toString() {
		String s = id +","+ username+","+password +","+ trueName+","+level +","+ team+","+ dep+","+ note;
		return s;
	}
	
	
	
	//用于对教师得分排序,选按院级领导打分 -- 团队负责人打分  -- 自评打分顺序
	@Override
	public int compareTo(Teacher o) {
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
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
