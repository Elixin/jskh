package com.lw.jskh.entity;

public class XingZhengXiang {   //行政考核项

	private int id;
	private String khNo;        //考核项汉字编码
	private String khName;      //考核项名
	private String khValue;     //基础分值
	private String khStandard;  //考核说明
	private String[] khSubScore ;  //减分项
	private String[] khAddbScore ;  //加分项
	private String khNote;          //备注
	
	public XingZhengXiang() {
		super();
	}
	
	public XingZhengXiang(String khNo, String khName, String khValue, String khStandard, String[] khSubScore,
			String[] khAddbScore, String khNote) {
		super();
		this.khNo = khNo;
		this.khName = khName;
		this.khValue = khValue;
		this.khStandard = khStandard;
		this.khSubScore = khSubScore;
		this.khAddbScore = khAddbScore;
		this.khNote = khNote;
	}
	
	public XingZhengXiang(int id, String khNo, String khName, String khValue, String khStandard, String[] khSubScore,
			String[] khAddbScore, String khNote) {
		super();
		this.id = id;
		this.khNo = khNo;
		this.khName = khName;
		this.khValue = khValue;
		this.khStandard = khStandard;
		this.khSubScore = khSubScore;
		this.khAddbScore = khAddbScore;
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
	public String[] getKhSubScore() {
		return khSubScore;
	}
	public void setKhSubScore(String[] khSubScore) {
		this.khSubScore = khSubScore;
	}
	public String[] getKhAddbScore() {
		return khAddbScore;
	}
	public void setKhAddbScore(String[] khAddbScore) {
		this.khAddbScore = khAddbScore;
	}
	public String getKhNote() {
		return khNote;
	}
	public void setKhNote(String khNote) {
		this.khNote = khNote;
	}
	
	
	
}
