package com.lw.jskh.entity;

import java.util.Date;

public class TKH {   //任课教师考核得分表

	private int id;  //
	private Teacher teacher;  // 任课教师
	private TeamLeader teamLeader;  //团队负责人
	private String teacherName;  //教师名字
	private int[][] noScore ; //第n项得分,加分，减分，自评分，团队负责人给分，院级领导给分
	private String khTime_myself ; //自评时间
	private String khTime_leader ; //团队负责人评分时间
	private String khTime_result ; //院级领导评分时间
    private String[][] noNote ; //各级备注
    private int total_myself; //自评得分
    private int total_leader; //团队负责人评分
    private int total_result; //院级领导评分
	public TKH() {
		noScore = new int[26][5];
		noNote = new String[26][3];
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public TeamLeader getTeamLeader() {
		return teamLeader;
	}
	public void setTeamLeader(TeamLeader teamLeader) {
		this.teamLeader = teamLeader;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int[][] getNoScore() {
		return noScore;
	}
	public void setNoScore(int[][] noScore) {
		this.noScore = noScore;
	}
	public String getKhTime_myself() {
		return khTime_myself;
	}
	public void setKhTime_myself(String khTime_myself) {
		this.khTime_myself = khTime_myself;
	}
	public String getKhTime_leader() {
		return khTime_leader;
	}
	public void setKhTime_leader(String khTime_leader) {
		this.khTime_leader = khTime_leader;
	}
	public String getKhTime_result() {
		return khTime_result;
	}
	public void setKhTime_result(String khTime_result) {
		this.khTime_result = khTime_result;
	}
	public String[][] getNoNote() {
		return noNote;
	}
	public void setNoNote(String[][] noNote) {
		this.noNote = noNote;
	}
	public int getTotal_myself() {
		return total_myself;
	}
	public void setTotal_myself(int total_myself) {
		this.total_myself = total_myself;
	}
	public int getTotal_leader() {
		return total_leader;
	}
	public void setTotal_leader(int total_leader) {
		this.total_leader = total_leader;
	}
	public int getTotal_result() {
		return total_result;
	}
	public void setTotal_result(int total_result) {
		this.total_result = total_result;
	}
    
    
}
