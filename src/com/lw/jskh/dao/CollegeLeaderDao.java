package com.lw.jskh.dao;

import com.lw.jskh.entity.*;

import java.util.List;

public interface CollegeLeaderDao {

	public CollegeLeader login(String username, String password);

	public List<TeamLeader> getCollegeTeam(int collegeTeamId) ;  //查询管理员所管理的团队成员
//
	/***
	 * 院级领导给团队负责人打分和备注；
	 *id是团队负责人ID，teacherTeamLeader是院级领导给的分，teamLeaderNote是院级领导的备注
	 * 返回1表示成功，-1表示失败
	 */
	public int collegeLeaderTestTeamLeader(int id, String[] teamLeaderScore, String[] teamLeaderNote);
//
//	public List<XingZheng> getTeamXingZheng(int teamLeaderId) ;  //查询管理员所管理的团队成员
//
//	/***
//	 * 团队负责人给教师打分和备注；
//	 *id是教师ID，teacherTeamLeader是团队负责人给的分，teamLeaderNote是团队负责人的备注
//	 * 返回1表示成功，-1表示失败
//	 */
//	public int teamLeaderTestXingZheng(int id, String[] teamLeaderScore, String[] teamLeaderNote);
//
//	public List<Teacher> descOrederTeamScoreTeacher(int teamLeaderId) ; //按得分降序排列
//
//	public List<XingZheng> descOrederTeamScoreXingZheng(int teamLeaderId);
//添加院级负责人
   public int addCollegeLeader(CollegeLeader collegeLeader);
}
