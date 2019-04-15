package com.lw.jskh.dao;

import java.util.List;

import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.TeamLeader;
import com.lw.jskh.entity.XingZheng;

public interface TeamLeaderDao {

	public TeamLeader login(String username , String password);
	
	public List<Teacher> getTeamTeacher(int teamLeaderId) ;  //查询管理员所管理的团队成员
	
	/***
	 * 团队负责人给教师打分和备注；
	 *id是教师ID，teacherTeamLeader是团队负责人给的分，teamLeaderNote是团队负责人的备注
	 * 返回1表示成功，-1表示失败
	 */
	public int teamLeaderTestTeacher(int id,String[] teamLeaderScore,String[] teamLeaderNote); 
	
	public List<XingZheng> getTeamXingZheng(int teamLeaderId) ;  //查询管理员所管理的团队成员
	
	/***
	 * 团队负责人给教师打分和备注；
	 *id是教师ID，teacherTeamLeader是团队负责人给的分，teamLeaderNote是团队负责人的备注
	 * 返回1表示成功，-1表示失败
	 */
	public int teamLeaderTestXingZheng(int id,String[] teamLeaderScore,String[] teamLeaderNote); 
	
	public List<Teacher> descOrederTeamScoreTeacher(int teamLeaderId) ; //按得分降序排列
	
	public List<XingZheng> descOrederTeamScoreXingZheng(int teamLeaderId);
}
