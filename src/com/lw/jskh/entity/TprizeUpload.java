package com.lw.jskh.entity;

public class TprizeUpload {
	private int id;
	private Teacher teacher;
	private String tPrizePic;
	private int tPrizeType;
	private String note;

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

	public String gettPrizePic() {
		return tPrizePic;
	}

	public void settPrizePic(String tPrizePic) {
		this.tPrizePic = tPrizePic;
	}

	public int gettPrizeType() {
		return tPrizeType;
	}

	public void settPrizeType(int tPrizeType) {
		this.tPrizeType = tPrizeType;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
