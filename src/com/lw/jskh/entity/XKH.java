package com.lw.jskh.entity;

public class XKH {   //行政人员考核得分表

	private int id;  //
	private XingZheng xingZheng;  // 行政人员
	private String xingZhengName;  //行政人员名字
	private int[][] khx ; //第n项自评分，团队负责人给分，院级领导给分
	private String[][] khxNote; //各项考核备注
	
	private int total_myself; //自评得分
    private int total_team; //团队负责人评分
    private int total_admin; //院级领导评分
    
	public XKH() {
		khx= new int[24][3];
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public XingZheng getXingZheng() {
		return xingZheng;
	}
	public void setXingZheng(XingZheng xingZheng) {
		this.xingZheng = xingZheng;
	}
	public String getXingZhengName() {
		return xingZhengName;
	}
	public void setXingZhengName(String xingZhengName) {
		this.xingZhengName = xingZhengName;
	}
	
	public int[][] getKhx() {
		return khx;
	}
	public void setKhx(int[][] khx) {
		this.khx = khx;
	}
	
	public int getTotal_myself() {
		return total_myself;
	}
	public void setTotal_myself(int total_myself) {
		this.total_myself = total_myself;
	}
	
	public int getTotal_team() {
		return total_team;
	}
	public void setTotal_team(int total_team) {
		this.total_team = total_team;
	}
	public int getTotal_admin() {
		return total_admin;
	}
	public void setTotal_admin(int total_admin) {
		this.total_admin = total_admin;
	}
	public String[][] getKhxNote() {
		return khxNote;
	}
	public void setKhxNote(String[][] khxNote) {
		this.khxNote = khxNote;
	}
	
	
    
}
