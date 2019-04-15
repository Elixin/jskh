package com.lw.jskh.entity;

public class XZKH {  //行政考核

	private int id; 
	private XingZheng xingZheng;
	private String xzName;     //
	private Integer no1_score ; //第一项得分
	private Integer no2_score ; //第二项得分
	private Integer no3_score ; //第三项得分
	private Integer no4_score ; //第四项得分
	private Integer no5_score ; //第五项得分
	private Integer no6_1_score ; //第6.1项得分
	private Integer no6_2_score ; //第6.2项得分
	private Integer no6_3_score ; //第6.3项得分
	private Integer no6_4_score ; //第6.4项得分
	private Integer no6_5_score ; //第6.5项得分
	private Integer no6_6_score ; //第6.6项得分
	private Integer no6_7_score ; //第6.7项得分
	private Integer no6_8_score ; //第6.8项得分
	private Integer no6_9_score ; //第6.9项得分
	private Integer no6_10_score ; //第6.10项得分
	private Integer no6_11_score ; //第6.11项得分
	private Integer no6_12_score ; //第6.12项得分
	private Integer no6_13_score ; //第6.13项得分
	private Integer no6_14_score ; //第6.14项得分
	private Integer no6_15_score ; //第6.15项得分
	private Integer no6_16_score ; //第6.16项得分
	private Integer no6_17_score ; //第6.17项得分
	private Integer no6_18_score ; //第6.18项得分
	private Integer no6_19_score ; //第6.19项得分
	private Integer no6_20_score ; //第6.20项得分
	
	public XZKH() {
		super();
	}

	public XZKH(XingZheng xingZheng, String xzName, Integer no1_score, Integer no2_score, Integer no3_score,
			Integer no4_score, Integer no5_score, Integer no6_1_score, Integer no6_2_score, Integer no6_3_score,
			Integer no6_4_score, Integer no6_5_score, Integer no6_6_score, Integer no6_7_score, Integer no6_8_score,
			Integer no6_9_score, Integer no6_10_score, Integer no6_11_score, Integer no6_12_score, Integer no6_13_score,
			Integer no6_14_score, Integer no6_15_score, Integer no6_16_score, Integer no6_17_score,
			Integer no6_18_score, Integer no6_19_score, Integer no6_20_score) {
		super();
		this.xingZheng = xingZheng;
		this.xzName = xzName;
		this.no1_score = no1_score;
		this.no2_score = no2_score;
		this.no3_score = no3_score;
		this.no4_score = no4_score;
		this.no5_score = no5_score;
		this.no6_1_score = no6_1_score;
		this.no6_2_score = no6_2_score;
		this.no6_3_score = no6_3_score;
		this.no6_4_score = no6_4_score;
		this.no6_5_score = no6_5_score;
		this.no6_6_score = no6_6_score;
		this.no6_7_score = no6_7_score;
		this.no6_8_score = no6_8_score;
		this.no6_9_score = no6_9_score;
		this.no6_10_score = no6_10_score;
		this.no6_11_score = no6_11_score;
		this.no6_12_score = no6_12_score;
		this.no6_13_score = no6_13_score;
		this.no6_14_score = no6_14_score;
		this.no6_15_score = no6_15_score;
		this.no6_16_score = no6_16_score;
		this.no6_17_score = no6_17_score;
		this.no6_18_score = no6_18_score;
		this.no6_19_score = no6_19_score;
		this.no6_20_score = no6_20_score;
	}

	public XZKH(int id, XingZheng xingZheng, String xzName, Integer no1_score, Integer no2_score, Integer no3_score,
			Integer no4_score, Integer no5_score, Integer no6_1_score, Integer no6_2_score, Integer no6_3_score,
			Integer no6_4_score, Integer no6_5_score, Integer no6_6_score, Integer no6_7_score, Integer no6_8_score,
			Integer no6_9_score, Integer no6_10_score, Integer no6_11_score, Integer no6_12_score, Integer no6_13_score,
			Integer no6_14_score, Integer no6_15_score, Integer no6_16_score, Integer no6_17_score,
			Integer no6_18_score, Integer no6_19_score, Integer no6_20_score) {
		super();
		this.id = id;
		this.xingZheng = xingZheng;
		this.xzName = xzName;
		this.no1_score = no1_score;
		this.no2_score = no2_score;
		this.no3_score = no3_score;
		this.no4_score = no4_score;
		this.no5_score = no5_score;
		this.no6_1_score = no6_1_score;
		this.no6_2_score = no6_2_score;
		this.no6_3_score = no6_3_score;
		this.no6_4_score = no6_4_score;
		this.no6_5_score = no6_5_score;
		this.no6_6_score = no6_6_score;
		this.no6_7_score = no6_7_score;
		this.no6_8_score = no6_8_score;
		this.no6_9_score = no6_9_score;
		this.no6_10_score = no6_10_score;
		this.no6_11_score = no6_11_score;
		this.no6_12_score = no6_12_score;
		this.no6_13_score = no6_13_score;
		this.no6_14_score = no6_14_score;
		this.no6_15_score = no6_15_score;
		this.no6_16_score = no6_16_score;
		this.no6_17_score = no6_17_score;
		this.no6_18_score = no6_18_score;
		this.no6_19_score = no6_19_score;
		this.no6_20_score = no6_20_score;
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

	public String getXzName() {
		return xzName;
	}

	public void setXzName(String xzName) {
		this.xzName = xzName;
	}

	public Integer getNo1_score() {
		return no1_score;
	}

	public void setNo1_score(Integer no1_score) {
		this.no1_score = no1_score;
	}

	public Integer getNo2_score() {
		return no2_score;
	}

	public void setNo2_score(Integer no2_score) {
		this.no2_score = no2_score;
	}

	public Integer getNo3_score() {
		return no3_score;
	}

	public void setNo3_score(Integer no3_score) {
		this.no3_score = no3_score;
	}

	public Integer getNo4_score() {
		return no4_score;
	}

	public void setNo4_score(Integer no4_score) {
		this.no4_score = no4_score;
	}

	public Integer getNo5_score() {
		return no5_score;
	}

	public void setNo5_score(Integer no5_score) {
		this.no5_score = no5_score;
	}

	public Integer getNo6_1_score() {
		return no6_1_score;
	}

	public void setNo6_1_score(Integer no6_1_score) {
		this.no6_1_score = no6_1_score;
	}

	public Integer getNo6_2_score() {
		return no6_2_score;
	}

	public void setNo6_2_score(Integer no6_2_score) {
		this.no6_2_score = no6_2_score;
	}

	public Integer getNo6_3_score() {
		return no6_3_score;
	}

	public void setNo6_3_score(Integer no6_3_score) {
		this.no6_3_score = no6_3_score;
	}

	public Integer getNo6_4_score() {
		return no6_4_score;
	}

	public void setNo6_4_score(Integer no6_4_score) {
		this.no6_4_score = no6_4_score;
	}

	public Integer getNo6_5_score() {
		return no6_5_score;
	}

	public void setNo6_5_score(Integer no6_5_score) {
		this.no6_5_score = no6_5_score;
	}

	public Integer getNo6_6_score() {
		return no6_6_score;
	}

	public void setNo6_6_score(Integer no6_6_score) {
		this.no6_6_score = no6_6_score;
	}

	public Integer getNo6_7_score() {
		return no6_7_score;
	}

	public void setNo6_7_score(Integer no6_7_score) {
		this.no6_7_score = no6_7_score;
	}

	public Integer getNo6_8_score() {
		return no6_8_score;
	}

	public void setNo6_8_score(Integer no6_8_score) {
		this.no6_8_score = no6_8_score;
	}

	public Integer getNo6_9_score() {
		return no6_9_score;
	}

	public void setNo6_9_score(Integer no6_9_score) {
		this.no6_9_score = no6_9_score;
	}

	public Integer getNo6_10_score() {
		return no6_10_score;
	}

	public void setNo6_10_score(Integer no6_10_score) {
		this.no6_10_score = no6_10_score;
	}

	public Integer getNo6_11_score() {
		return no6_11_score;
	}

	public void setNo6_11_score(Integer no6_11_score) {
		this.no6_11_score = no6_11_score;
	}

	public Integer getNo6_12_score() {
		return no6_12_score;
	}

	public void setNo6_12_score(Integer no6_12_score) {
		this.no6_12_score = no6_12_score;
	}

	public Integer getNo6_13_score() {
		return no6_13_score;
	}

	public void setNo6_13_score(Integer no6_13_score) {
		this.no6_13_score = no6_13_score;
	}

	public Integer getNo6_14_score() {
		return no6_14_score;
	}

	public void setNo6_14_score(Integer no6_14_score) {
		this.no6_14_score = no6_14_score;
	}

	public Integer getNo6_15_score() {
		return no6_15_score;
	}

	public void setNo6_15_score(Integer no6_15_score) {
		this.no6_15_score = no6_15_score;
	}

	public Integer getNo6_16_score() {
		return no6_16_score;
	}

	public void setNo6_16_score(Integer no6_16_score) {
		this.no6_16_score = no6_16_score;
	}

	public Integer getNo6_17_score() {
		return no6_17_score;
	}

	public void setNo6_17_score(Integer no6_17_score) {
		this.no6_17_score = no6_17_score;
	}

	public Integer getNo6_18_score() {
		return no6_18_score;
	}

	public void setNo6_18_score(Integer no6_18_score) {
		this.no6_18_score = no6_18_score;
	}

	public Integer getNo6_19_score() {
		return no6_19_score;
	}

	public void setNo6_19_score(Integer no6_19_score) {
		this.no6_19_score = no6_19_score;
	}

	public Integer getNo6_20_score() {
		return no6_20_score;
	}

	public void setNo6_20_score(Integer no6_20_score) {
		this.no6_20_score = no6_20_score;
	}
	
	
	
	
}
