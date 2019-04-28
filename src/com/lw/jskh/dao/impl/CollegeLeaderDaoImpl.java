package com.lw.jskh.dao.impl;

import com.lw.jskh.dao.*;
import com.lw.jskh.entity.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class CollegeLeaderDaoImpl extends BaseDao implements CollegeLeaderDao {

	TeacherDao teacherDao ;
	XingZhengDao xingZhengDao ;

	public CollegeLeaderDaoImpl() {
		teacherDao = new TeacherDaoImpl();
		xingZhengDao = new XingZhengDaoImpl();
	}
	
	
	//用户登录
	@Override
	public CollegeLeader login(String username, String password) {
		CollegeLeader collegeLeader=null;
		try {
			String  sql = "select * from tb_collegeleader where username=? and password=? and open=0";
			Object[] params={username,password};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装团队负责人对象
				collegeLeader = new CollegeLeader();
				collegeLeader.setId(rs.getInt("id"));
				collegeLeader.setUsername(username);
				collegeLeader.setPassword(password);
				collegeLeader.setTrueName(rs.getString("trueName"));
				collegeLeader.setPosition(rs.getString("position"));
				collegeLeader.setDep(rs.getString("dep"));
				collegeLeader.setNote(rs.getString("note"));
				collegeLeader.setOpen(rs.getInt("open"));
				collegeLeader.setPic(rs.getString("pic"));
				collegeLeader.setTeamType(rs.getString("teamType"));
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return collegeLeader;
	}


//
//	@Override
//	public List<TeamLeader> getCollegeTeam(int collegeTeamId) {
//		return null;
//	}
//
//	@Override
//	public List<Teacher> getTeamTeacher(int teamLeaderId)  {
//		List<Teacher> teachers = new ArrayList<Teacher>();
//		try {
//			String sql = "select * from tb_teacher where tb_teacher.team = (select managerTeam  from tb_teamleader where id = ? ) ";
//			Object[] params={teamLeaderId};
//			ResultSet rs=this.executeSQL(sql, params);
//			while(rs.next()){
//				//封装教师对象
//				Teacher teacher = new Teacher();
//				teacher.setId(rs.getInt("id"));
//				teacher.setUsername(rs.getString("userName"));
//				teacher.setTrueName(rs.getString("trueName"));
//				teacher.setLevel(rs.getString("level"));
//				teacher.setTeam(rs.getString("team"));
//				teacher.setDep(rs.getString("dep"));
//				teacher.setNote(rs.getString("note"));
//				teacher.setOpen(rs.getInt("open"));
//				teacher.setPic(rs.getString("pic"));
//				teachers.add(teacher);
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}finally{
//			this.closeResource();
//		}
//		return teachers;
//	}
//
//	@Override
//	public int teamLeaderTestTeacher(int tid, String[] teamLeaderScore, String[] teamLeaderNote) {
//		Teacher teacher = teacherDao.getTeacherById(tid);
//		int tkh_id=0;
//		try {
//			long t = System.currentTimeMillis();
//			Date time=new Date(t);
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			System.out.println(sdf.format(time));
//
//			int total_leader = 0 ;
//
//			for( String s : teamLeaderScore) {
//				int x = Integer.parseInt(s);
//				total_leader += x;
//			}
//
//			System.out.println(total_leader);
//
//			int id = teacherDao.queryTid(tid);
//
//			String sql = "";
//			if(id ==-1) {  //考核表中无记录，添加新记录
//
//			  sql="insert into tb_tkh(tid,teacherName,no1_leader,no2_leader,no3_leader,no4_leader,no5_leader,no6_leader,no7_leader,no8_leader,no9_leader,no10_leader,"
//					+ "no11_leader,no12_leader,no13_leader,no14_leader,no15_leader,no16_leader,no17_leader,no18_leader,no19_leader,no20_leader,no21_leader,no22_leader,"
//					+ "no23_leader,no24_leader,no25_leader,no26_leader,total_leader,khTime_leader,no1_leader_note,no2_leader_note,no3_leader_note,no4_leader_note,"
//					+ "no5_leader_note,no6_leader_note,no7_leader_note,no8_leader_note,no9_leader_note,no10_leader_note,no11_leader_note,no12_leader_note,no13_leader_note,"
//					+ "no14_leader_note,no15_leader_note,no16_leader_note,no17_leader_note,no18_leader_note,no19_leader_note,no20_leader_note,no21_leader_note,no22_leader_note,"
//					+ "no23_leader_note,no24_leader_note,no25_leader_note,no26_leader_note) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
//					+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//			  Object[]   params={teacher.getId(),teacher.getTrueName(),teamLeaderScore[0],teamLeaderScore[1],teamLeaderScore[2],teamLeaderScore[3],teamLeaderScore[4],teamLeaderScore[5],teamLeaderScore[6],teamLeaderScore[7],teamLeaderScore[8],teamLeaderScore[9],teamLeaderScore[10],teamLeaderScore[11],teamLeaderScore[12],teamLeaderScore[13],
//						teamLeaderScore[14],teamLeaderScore[15],teamLeaderScore[16],teamLeaderScore[17],teamLeaderScore[18],teamLeaderScore[19],teamLeaderScore[20],teamLeaderScore[21],
//						teamLeaderScore[22],teamLeaderScore[23],teamLeaderScore[24],teamLeaderScore[25],total_leader,sdf.format(time),teamLeaderNote[0],teamLeaderNote[1],teamLeaderNote[2],
//						teamLeaderNote[3],teamLeaderNote[4],teamLeaderNote[5],teamLeaderNote[6],teamLeaderNote[7],teamLeaderNote[8],teamLeaderNote[9],teamLeaderNote[10],teamLeaderNote[11],teamLeaderNote[12],
//						teamLeaderNote[13],teamLeaderNote[14],teamLeaderNote[15],teamLeaderNote[16],teamLeaderNote[17],teamLeaderNote[18],teamLeaderNote[19],teamLeaderNote[20],teamLeaderNote[21],teamLeaderNote[22],
//						teamLeaderNote[23],teamLeaderNote[24],teamLeaderNote[25]};
//			    int i=this.executeUpdate(sql, params);
//				if(i>0){
//					System.out.println("教师自评成功！");
//				}
//				ps=conn.prepareStatement("select LAST_INSERT_ID()"); //返回插入最后一条记录的ID值
//				ResultSet rs = ps.executeQuery();
//				if (rs.next())tkh_id = rs.getInt(1);
//			}else {    //考核表已有记录，修改记录
//				 sql="update tb_tkh set tid=?,teacherName=?,no1_leader=?,no2_leader=?,no3_leader=?,no4_leader=?,no5_leader=?,no6_leader=?,no7_leader=?,no8_leader=?,no9_leader=?,no10_leader=?,"
//							+ "no11_leader=?,no12_leader=?,no13_leader=?,no14_leader=?,no15_leader=?,no16_leader=?,no17_leader=?,no18_leader=?,no19_leader=?,no20_leader=?,no21_leader=?,no22_leader=?,"
//							+ "no23_leader=?,no24_leader=?,no25_leader=?,no26_leader=?,total_leader=?,khTime_leader=?,no1_leader_note=?,no2_leader_note=?,no3_leader_note=?,no4_leader_note=?,"
//							+ "no5_leader_note=?,no6_leader_note=?,no7_leader_note=?,no8_leader_note=?,no9_leader_note=?,no10_leader_note=?,no11_leader_note=?,no12_leader_note=?,no13_leader_note=?,"
//							+ "no14_leader_note=?,no15_leader_note=?,no16_leader_note=?,no17_leader_note=?,no18_leader_note=?,no19_leader_note=?,no20_leader_note=?,no21_leader_note=?,no22_leader_note=?,"
//							+ "no23_leader_note=?,no24_leader_note=?,no25_leader_note=?,no26_leader_note=? where id=?";
//				 Object[]  params={teacher.getId(),teacher.getTrueName(),teamLeaderScore[0],teamLeaderScore[1],teamLeaderScore[2],teamLeaderScore[3],teamLeaderScore[4],teamLeaderScore[5],teamLeaderScore[6],teamLeaderScore[7],teamLeaderScore[8],teamLeaderScore[9],teamLeaderScore[10],teamLeaderScore[11],teamLeaderScore[12],teamLeaderScore[13],
//							teamLeaderScore[14],teamLeaderScore[15],teamLeaderScore[16],teamLeaderScore[17],teamLeaderScore[18],teamLeaderScore[19],teamLeaderScore[20],teamLeaderScore[21],
//							teamLeaderScore[22],teamLeaderScore[23],teamLeaderScore[24],teamLeaderScore[25],total_leader,sdf.format(time),teamLeaderNote[0],teamLeaderNote[1],teamLeaderNote[2],
//							teamLeaderNote[3],teamLeaderNote[4],teamLeaderNote[5],teamLeaderNote[6],teamLeaderNote[7],teamLeaderNote[8],teamLeaderNote[9],teamLeaderNote[10],teamLeaderNote[11],teamLeaderNote[12],
//							teamLeaderNote[13],teamLeaderNote[14],teamLeaderNote[15],teamLeaderNote[16],teamLeaderNote[17],teamLeaderNote[18],teamLeaderNote[19],teamLeaderNote[20],teamLeaderNote[21],teamLeaderNote[22],
//							teamLeaderNote[23],teamLeaderNote[24],teamLeaderNote[25],id};
//				  int i=this.executeUpdate(sql, params);
//					if(i>0){
//						System.out.println("团队负责人打分成功！");
//					}
//					tkh_id = id;
//			}
//
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			this.closeResource();
//		}
//
//		System.out.println(tkh_id);
//
//
//		return tkh_id;
//
//	}
//
//
//	@Override
//	public List<XingZheng> getTeamXingZheng(int teamLeaderId) {
//		List<XingZheng> xingZhengs = new ArrayList<XingZheng>();
//		try {
//			String sql = "select * from tb_xingzheng where tb_xingzheng.team = (select managerTeam  from tb_teamleader where id = ? ) ";
//			Object[] params={teamLeaderId};
//			ResultSet rs=this.executeSQL(sql, params);
//			while(rs.next()){
//				//封装行政人员对象
//				XingZheng xingZheng = new XingZheng();
//				xingZheng.setId(rs.getInt("id"));
//				xingZheng.setUsername(rs.getString("userName"));
//				xingZheng.setTrueName(rs.getString("trueName"));
//				xingZheng.setLevel(rs.getString("level"));
//				xingZheng.setTeam(rs.getString("team"));
//				xingZheng.setDep(rs.getString("dep"));
//				xingZheng.setNote(rs.getString("note"));
//				xingZheng.setOpen(rs.getInt("open"));
//				xingZheng.setPic(rs.getString("pic"));
//				xingZhengs.add(xingZheng);
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}finally{
//			this.closeResource();
//		}
//		return xingZhengs;
//
//	}
//
//
//	@Override
//	public int teamLeaderTestXingZheng(int xid, String[] teamLeaderScore, String[] teamLeaderNote) {
//		XingZheng xingzheng = getXingZhengById(xid);
//		int xkh_id=0;
//		try {
//			int total_team = 0 ;
//
//			for( String s : teamLeaderScore) {
//				int x = Integer.parseInt(s);
//				total_team += x;
//			}
//
//			System.out.println(total_team);
//
//			int id = queryXid(xid);
//
//			String sql = "";
//			if(id ==-1) {  //考核表中无记录，添加新记录
//
//			  sql="insert into tb_xkh(xid,xingzhengName,kh1_team,kh2_team,kh3_team,kh4_team,kh5_team,kh6_team,kh7_team,kh8_team,kh9_team,kh10_team,"
//					+ "kh11_team,kh12_team,kh13_team,kh14_team,kh15_team,kh16_team,kh17_team,kh18_team,kh19_team,kh20_team,kh21_team,kh22_team,"
//					+ "kh23_team,kh24_team,total_team,kh1Note_team,kh2Note_team,kh3Note_team,kh4Note_team,kh5Note_team,kh6Note_team,"
//					+ "kh7Note_team,kh8Note_team,kh9Note_team,kh10Note_team,kh11Note_team,kh12Note_team,kh13Note_team,kh14Note_team,kh15Note_team,kh16Note_team,"
//					+ "kh17Note_team,kh18Note_team,kh19Note_team,kh20Note_team,kh21Note_team,kh22Note_team,kh23Note_team,kh24Note_team"
//					+ ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//			  Object[]   params={xingzheng.getId(),xingzheng.getTrueName(),teamLeaderScore[0],teamLeaderScore[1],teamLeaderScore[2],teamLeaderScore[3],teamLeaderScore[4],
//					  teamLeaderScore[5],teamLeaderScore[6],teamLeaderScore[7],teamLeaderScore[8],teamLeaderScore[9],teamLeaderScore[10],teamLeaderScore[11],teamLeaderScore[12],
//					  teamLeaderScore[13],teamLeaderScore[14],teamLeaderScore[15],teamLeaderScore[16],teamLeaderScore[17],teamLeaderScore[18],teamLeaderScore[19],teamLeaderScore[20],
//					  teamLeaderScore[21],teamLeaderScore[22],teamLeaderScore[23],total_team,teamLeaderNote[0],teamLeaderNote[1],teamLeaderNote[2],teamLeaderNote[3],teamLeaderNote[4],
//					  teamLeaderNote[5],teamLeaderNote[6],teamLeaderNote[7],teamLeaderNote[8],teamLeaderNote[9],teamLeaderNote[10],teamLeaderNote[11],teamLeaderNote[12],teamLeaderNote[13],
//					  teamLeaderNote[14],teamLeaderNote[15],teamLeaderNote[16],teamLeaderNote[17],teamLeaderNote[18],teamLeaderNote[19],teamLeaderNote[20],teamLeaderNote[21],teamLeaderNote[22],
//					  teamLeaderNote[23]};
//			    int i=this.executeUpdate(sql, params);
//				if(i>0){
//					System.out.println("行政新增团队评价成功！");
//				}
//				ps=conn.prepareStatement("select LAST_INSERT_ID()"); //返回插入最后一条记录的ID值
//				ResultSet rs = ps.executeQuery();
//				if (rs.next())xkh_id = rs.getInt(1);
//			}else {    //考核表已有记录，修改记录
//				 sql="update tb_xkh set xid=?,xingzhengName=?,kh1_team=?,kh2_team=?,kh3_team=?,kh4_team=?,kh5_team=?,kh6_team=?,kh7_team=?,kh8_team=?,kh9_team=?,kh10_team=?,"
//				 		+ "kh11_team=?,kh12_team=?,kh13_team=?,kh14_team=?,kh15_team=?,kh16_team=?,kh17_team=?,kh18_team=?,kh19_team=?,kh20_team=?,kh21_team=?,kh22_team=?,"
//				 		+ "kh23_team=?,kh24_team=?,total_team=?,kh1Note_team=?,kh2Note_team=?,kh3Note_team=?,kh4Note_team=?,kh5Note_team=?,kh6Note_team=?,"
//				 		+ "kh7Note_team=?,kh8Note_team=?,kh9Note_team=?,kh10Note_team=?,kh11Note_team=?,kh12Note_team=?,kh13Note_team=?,kh14Note_team=?,kh15Note_team=?,kh16Note_team=?,"
//				 		+ "kh17Note_team=?,kh18Note_team=?,kh19Note_team=?,kh20Note_team=?,kh21Note_team=?,kh22Note_team=?,kh23Note_team=?,kh24Note_team=? where id=?";
//
//				 Object[]  params={xid,xingzheng.getTrueName(),teamLeaderScore[0],teamLeaderScore[1],teamLeaderScore[2],teamLeaderScore[3],teamLeaderScore[4],
//						  teamLeaderScore[5],teamLeaderScore[6],teamLeaderScore[7],teamLeaderScore[8],teamLeaderScore[9],teamLeaderScore[10],teamLeaderScore[11],teamLeaderScore[12],
//						  teamLeaderScore[13],teamLeaderScore[14],teamLeaderScore[15],teamLeaderScore[16],teamLeaderScore[17],teamLeaderScore[18],teamLeaderScore[19],teamLeaderScore[20],
//						  teamLeaderScore[21],teamLeaderScore[22],teamLeaderScore[23],total_team,teamLeaderNote[0],teamLeaderNote[1],teamLeaderNote[2],teamLeaderNote[3],teamLeaderNote[4],
//						  teamLeaderNote[5],teamLeaderNote[6],teamLeaderNote[7],teamLeaderNote[8],teamLeaderNote[9],teamLeaderNote[10],teamLeaderNote[11],teamLeaderNote[12],teamLeaderNote[13],
//						  teamLeaderNote[14],teamLeaderNote[15],teamLeaderNote[16],teamLeaderNote[17],teamLeaderNote[18],teamLeaderNote[19],teamLeaderNote[20],teamLeaderNote[21],teamLeaderNote[22],
//						  teamLeaderNote[23],id};
//				  int i=this.executeUpdate(sql, params);
//					if(i>0){
//						System.out.println("行政修改团队评价成功！");
//					}
//					xkh_id = id;
//			}
//
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			this.closeResource();
//		}
//
//		//System.out.println(xkh_id);
//		return  xkh_id ;
//	}
//
//	public XingZheng getXingZhengById(int id) {
//		XingZheng xingZheng = null;
//		try {
//			String sql = "select * from tb_xingzheng where id=?";
//			Object[] params={id};
//			ResultSet rs=this.executeSQL(sql, params);
//			if(rs.next()){
//				//封装行政人员对象
//				xingZheng = new XingZheng();
//				xingZheng.setId(rs.getInt("id"));
//				xingZheng.setUsername(rs.getString("userName"));
//				xingZheng.setPassword(rs.getString("password"));
//				xingZheng.setTrueName(rs.getString("trueName"));
//				xingZheng.setLevel(rs.getString("level"));
//				xingZheng.setTeam(rs.getString("team"));
//				xingZheng.setDep(rs.getString("dep"));
//				xingZheng.setNote(rs.getString("note"));
//				xingZheng.setPic(rs.getString("pic"));
//
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}finally{
//			this.closeResource();
//		}
//		return xingZheng;
//	}
//
//	public int queryXid(int xid) {
//		int id = -1 ;
//		  try {
//				String sql = "select * from tb_xkh where xid=? ";
//				Object[] params={xid};
//				ResultSet rs=this.executeSQL(sql, params);
//				if(rs.next()){
//					id = rs.getInt("id");
//				}
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}finally{
//				this.closeResource();
//			}
//			return id;
//	}
//
//	 public int queryTeacherTeamScore(int tid) {
//		 int total_team = Integer.MIN_VALUE ;
//		  try {
//				String sql = "select total_leader from tb_tkh where tid=? ";
//				Object[] params={tid};
//				ResultSet rs=this.executeSQL(sql, params);
//				if(rs.next()){
//					total_team = rs.getInt("total_leader");
//				}
//			}catch (SQLException e) {
//				e.printStackTrace();
//			}finally{
//				this.closeResource();
//			}
//			return total_team;
//	 }
//
//
//	@Override
//	public List<Teacher> descOrederTeamScoreTeacher(int teamLeaderId) {
//		List<Teacher> teachers = this.getTeamTeacher(teamLeaderId);
//		TKH tkh = null;
//		for(Teacher teacher : teachers) {
//			tkh = teacherDao.queryTHK(teacher.getId());
//			if(tkh!=null) {
//			teacher.setMyselftScore(tkh.getTotal_myself());
//			teacher.setTeamScore(tkh.getTotal_leader());
//			teacher.setAdminScore(tkh.getTotal_result());
//			}else {
//				teacher.setMyselftScore(0);
//				teacher.setTeamScore(0);
//				teacher.setAdminScore(0);
//			}
//		}
//		Collections.sort(teachers,Collections.reverseOrder()); //排序
//		for(Teacher teacher : teachers) {
//			System.out.println(teacher.getAdminScore()+","+teacher.getTeamScore()+","+teacher.getMyselftScore());
//		}
//	    return teachers;
//	}
//
//	@Override
//	public List<XingZheng> descOrederTeamScoreXingZheng(int teamLeaderId) {
//		List<XingZheng> xingZhengs = this.getTeamXingZheng(teamLeaderId);
//		XKH xkh = null;
//		for(XingZheng xingZheng : xingZhengs) {
//			xkh = xingZhengDao.queryXHK(xingZheng.getId());
//			if(xkh!=null) {
//			xingZheng.setMyselftScore(xkh.getTotal_myself());
//			xingZheng.setTeamScore(xkh.getTotal_team());
//			xingZheng.setAdminScore(xkh.getTotal_admin());
//			}else {
//				xingZheng.setMyselftScore(0);
//				xingZheng.setTeamScore(0);
//				xingZheng.setAdminScore(0);
//			}
//		}
//		Collections.sort(xingZhengs,Collections.reverseOrder()); //排序
//		for(XingZheng xingZheng : xingZhengs) {
//			System.out.println(xingZheng.getAdminScore()+","+xingZheng.getTeamScore()+","+xingZheng.getMyselftScore());
//		}
//	    return xingZhengs;
//	}

	//添加院级领导
	@Override
	public int addCollegeLeader(CollegeLeader collegeLeader) {
		int i = -1;
		if (checkTeamLeaderUserName(collegeLeader.getUsername())) {
			String sql = "insert into tb_collegeleader(username,password,trueName,position,teamType,dep,note,open,pic) values(?,?,?,?,?,?,?,?,?) ";
			Object[] params = {collegeLeader.getUsername(),collegeLeader.getPassword(),collegeLeader.getTrueName(),collegeLeader.getPosition(),collegeLeader.getTeamType(),collegeLeader.getDep(),collegeLeader.getNote(),collegeLeader.getOpen(),collegeLeader.getPic()};
			i = this.executeUpdate(sql, params);
		}
		return i;
	}
	//检查用户名是否可用，true可用，false不可用。
	public boolean checkTeamLeaderUserName(String userName) {
		String sql = "select * from tb_collegeleader where username=?";
		Object[] params={userName};
		ResultSet rs=this.executeSQL(sql, params);
		boolean b = true;
		try {
			if(rs.next()){
				b = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b ;
	}
}