package com.lw.jskh.dao;

import com.lw.jskh.entity.TKH;
import com.lw.jskh.entity.Teacher;

public interface TeacherDao {

	public Teacher login(String username , String password);
	
	public int myselfTest(int id,String[] teacherMyselft,String[] teacherNote);
	
	public Teacher getTeacherById(int id);
	
	public TKH queryTHK(int id);
	
	//在tb_khb中查找有无tid记录,返回记录ID值
	public int queryTid(int tid);
	
	public boolean checkUserIfOpen(String username , String password);
	
	public int updateTeacherAll(Teacher teacher);
	
	public int updateTeacherNotPassword(Teacher teacher);
	
	public int updateTeacherNoPic(Teacher teacher);
	
	public int addTeacher(Teacher teacher);
	
}
