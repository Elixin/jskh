package com.lw.jskh.entity;

/***
 * 团队类
 */

public class Team {
    private int id;
    private String teamName;  //团队名称
    private String teamLeader ; //姓名
    private String dep; //学院
    private String type;  //工作
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamLeader() {
		return teamLeader;
	}
	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
    
    
}
