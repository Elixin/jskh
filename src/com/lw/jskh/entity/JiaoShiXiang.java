package com.lw.jskh.entity;

/***
 * 考核项类
 */


public class JiaoShiXiang {

	private int id;
	private String khNo; //考核项汉字编号
	private String khName; //考核项名称
	private String khValue;  //考核项对应的最高分值
	private String khStandard;  //考核标准
	private String khGetScorerStandard; //给分依据
	private String khAddScoreStandard; //加分依据
	private String khSubScoreStandard; //扣分依据
	private String khNote;  //备注
	
	public JiaoShiXiang() {
		super();
	}

	public JiaoShiXiang(String khNo, String khName, String khValue, String khStandard, String khGetScorerStandard,
			String khAddScoreStandard, String khSubScoreStandard, String khNote) {
		super();
		this.khNo = khNo;
		this.khName = khName;
		this.khValue = khValue;
		this.khStandard = khStandard;
		this.khGetScorerStandard = khGetScorerStandard;
		this.khAddScoreStandard = khAddScoreStandard;
		this.khSubScoreStandard = khSubScoreStandard;
		this.khNote = khNote;
	}

	public JiaoShiXiang(int id, String khNo, String khName, String khValue, String khStandard,
			String khGetScorerStandard, String khAddScoreStandard, String khSubScoreStandard, String khNote) {
		super();
		this.id = id;
		this.khNo = khNo;
		this.khName = khName;
		this.khValue = khValue;
		this.khStandard = khStandard;
		this.khGetScorerStandard = khGetScorerStandard;
		this.khAddScoreStandard = khAddScoreStandard;
		this.khSubScoreStandard = khSubScoreStandard;
		this.khNote = khNote;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKhNo() {
		return khNo;
	}

	public void setKhNo(String khNo) {
		this.khNo = khNo;
	}

	public String getKhName() {
		return khName;
	}

	public void setKhName(String khName) {
		this.khName = khName;
	}

	public String getKhValue() {
		return khValue;
	}

	public void setKhValue(String khValue) {
		this.khValue = khValue;
	}

	public String getKhStandard() {
		return khStandard;
	}

	public void setKhStandard(String khStandard) {
		this.khStandard = khStandard;
	}

	public String getKhGetScorerStandard() {
		return khGetScorerStandard;
	}

	public void setKhGetScorerStandard(String khGetScorerStandard) {
		this.khGetScorerStandard = khGetScorerStandard;
	}

	public String getKhAddScoreStandard() {
		return khAddScoreStandard;
	}

	public void setKhAddScoreStandard(String khAddScoreStandard) {
		this.khAddScoreStandard = khAddScoreStandard;
	}

	public String getKhSubScoreStandard() {
		return khSubScoreStandard;
	}

	public void setKhSubScoreStandard(String khSubScoreStandard) {
		this.khSubScoreStandard = khSubScoreStandard;
	}

	public String getKhNote() {
		return khNote;
	}

	public void setKhNote(String khNote) {
		this.khNote = khNote;
	}

	
	
}
