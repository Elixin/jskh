package com.lw.jskh.entity;

/***
 * 部门类
 */

public class Dep {   //部门
     private int id;
     private String depName;  //部门名称
     private String depleader; //部门领导
	
     public Dep() {
		super();
	}
	
     public Dep(String depName, String depleader) {
		super();
		this.depName = depName;
		this.depleader = depleader;
	}
	
     public Dep(int id, String depName, String depleader) {
	    super();
		this.id = id;
		this.depName = depName;
		this.depleader = depleader;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getDepleader() {
		return depleader;
	}

	public void setDepleader(String depleader) {
		this.depleader = depleader;
	}

}
