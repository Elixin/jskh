package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.entity.TKH;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.dao.BaseDao;

public class TeacherDaoImpl extends BaseDao implements TeacherDao {

	
	
	
	@Override
	public boolean checkUserIfOpen(String username, String password) {
		boolean b = false;
		try {
			String sql = "select * from tb_teacher where username=? and password=? ";
			Object[] params={username,password};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				if(rs.getInt("open")==0) b=true;
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return b;
	}




	//教师用户登录
	@Override
	public Teacher login(String username, String password) {
		Teacher teacher = null;
		try {
			String sql = "select * from tb_teacher where username=? and password=? ";
			Object[] params={username,password};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装教师对象
				teacher = new Teacher();
				teacher.setId(rs.getInt("id"));
				teacher.setUsername(username);
				teacher.setPassword(password);
				teacher.setTrueName(rs.getString("trueName"));
				teacher.setLevel(rs.getString("level"));
				teacher.setTeam(rs.getString("team"));
				teacher.setDep(rs.getString("dep"));
				teacher.setNote(rs.getString("note"));
				teacher.setOpen(rs.getInt("open"));
				teacher.setPic(rs.getString("pic"));
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return teacher;
	}

	
	
	
  @Override
	public int queryTid(int tid) {
	  int id = -1 ;
	  try {
			String sql = "select * from tb_tkh where tid=? ";
			Object[] params={tid};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				id = rs.getInt("id");
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return id;
	}




/***
  *  id :登录教师的ID;teacherMyselft:各项自评打分；teacherNote：各项自评备注
  *  写入tb_tkh中。如果tb_tkh中tid已有，就修改记录，否则就插入记录。
  *  返回值为1为自评打分成功，-1为打分失败
  */
 	@Override
	public int myselfTest(int tid ,String[] teacherMyselft,String[] teacherNote) {
		
		Teacher teacher = this.getTeacherById(tid);
		int tkh_id=0;
		try {
			long t = System.currentTimeMillis();
			Date time=new Date(t);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(sdf.format(time));
			
			int total_myself = 0 ;
			
			for( String s : teacherMyselft) {
				int x = Integer.parseInt(s);
				total_myself += x;
			}
			
			System.out.println(total_myself);
			
			int id = queryTid(tid);
			
			String sql = "";
			if(id ==-1) {  //考核表中无记录，添加新记录
			
			  sql="insert into tb_tkh(tid,teacherName,no1_myself,no2_myself,no3_myself,no4_myself,no5_myself,no6_myself,no7_myself,no8_myself,no9_myself,no10_myself,"
					+ "no11_myself,no12_myself,no13_myself,no14_myself,no15_myself,no16_myself,no17_myself,no18_myself,no19_myself,no20_myself,no21_myself,no22_myself,"
					+ "no23_myself,no24_myself,no25_myself,no26_myself,total_myself,khTime_myself,no1_myself_note,no2_myself_note,no3_myself_note,no4_myself_note,"
					+ "no5_myself_note,no6_myself_note,no7_myself_note,no8_myself_note,no9_myself_note,no10_myself_note,no11_myself_note,no12_myself_note,no13_myself_note,"
					+ "no14_myself_note,no15_myself_note,no16_myself_note,no17_myself_note,no18_myself_note,no19_myself_note,no20_myself_note,no21_myself_note,no22_myself_note,"
					+ "no23_myself_note,no24_myself_note,no25_myself_note,no26_myself_note) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
					+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			  Object[]   params={teacher.getId(),teacher.getTrueName(),teacherMyselft[0],teacherMyselft[1],teacherMyselft[2],teacherMyselft[3],teacherMyselft[4],teacherMyselft[5],
						teacherMyselft[6],teacherMyselft[7],teacherMyselft[8],teacherMyselft[9],teacherMyselft[10],teacherMyselft[11],teacherMyselft[12],teacherMyselft[13],
						teacherMyselft[14],teacherMyselft[15],teacherMyselft[16],teacherMyselft[17],teacherMyselft[18],teacherMyselft[19],teacherMyselft[20],teacherMyselft[21],
						teacherMyselft[22],teacherMyselft[23],teacherMyselft[24],teacherMyselft[25],total_myself,sdf.format(time),teacherNote[0],teacherNote[1],teacherNote[2],
						teacherNote[3],teacherNote[4],teacherNote[5],teacherNote[6],teacherNote[7],teacherNote[8],teacherNote[9],teacherNote[10],teacherNote[11],teacherNote[12],
						teacherNote[13],teacherNote[14],teacherNote[15],teacherNote[16],teacherNote[17],teacherNote[18],teacherNote[19],teacherNote[20],teacherNote[21],teacherNote[22],
						teacherNote[23],teacherNote[24],teacherNote[25]};
			    int i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("教师自评成功！");
				}
				ps=conn.prepareStatement("select LAST_INSERT_ID()"); //返回插入最后一条记录的ID值
				ResultSet rs = ps.executeQuery();
				if (rs.next())tkh_id = rs.getInt(1);
			}else {    //考核表已有记录，修改记录
				 sql="update tb_tkh set tid=?,teacherName=?,no1_myself=?,no2_myself=?,no3_myself=?,no4_myself=?,no5_myself=?,no6_myself=?,no7_myself=?,no8_myself=?,no9_myself=?,no10_myself=?,"
							+ "no11_myself=?,no12_myself=?,no13_myself=?,no14_myself=?,no15_myself=?,no16_myself=?,no17_myself=?,no18_myself=?,no19_myself=?,no20_myself=?,no21_myself=?,no22_myself=?,"
							+ "no23_myself=?,no24_myself=?,no25_myself=?,no26_myself=?,total_myself=?,khTime_myself=?,no1_myself_note=?,no2_myself_note=?,no3_myself_note=?,no4_myself_note=?,"
							+ "no5_myself_note=?,no6_myself_note=?,no7_myself_note=?,no8_myself_note=?,no9_myself_note=?,no10_myself_note=?,no11_myself_note=?,no12_myself_note=?,no13_myself_note=?,"
							+ "no14_myself_note=?,no15_myself_note=?,no16_myself_note=?,no17_myself_note=?,no18_myself_note=?,no19_myself_note=?,no20_myself_note=?,no21_myself_note=?,no22_myself_note=?,"
							+ "no23_myself_note=?,no24_myself_note=?,no25_myself_note=?,no26_myself_note=? where id=?";
				 Object[]  params={teacher.getId(),teacher.getTrueName(),teacherMyselft[0],teacherMyselft[1],teacherMyselft[2],teacherMyselft[3],teacherMyselft[4],teacherMyselft[5],
							teacherMyselft[6],teacherMyselft[7],teacherMyselft[8],teacherMyselft[9],teacherMyselft[10],teacherMyselft[11],teacherMyselft[12],teacherMyselft[13],
							teacherMyselft[14],teacherMyselft[15],teacherMyselft[16],teacherMyselft[17],teacherMyselft[18],teacherMyselft[19],teacherMyselft[20],teacherMyselft[21],
							teacherMyselft[22],teacherMyselft[23],teacherMyselft[24],teacherMyselft[25],total_myself,sdf.format(time),teacherNote[0],teacherNote[1],teacherNote[2],
							teacherNote[3],teacherNote[4],teacherNote[5],teacherNote[6],teacherNote[7],teacherNote[8],teacherNote[9],teacherNote[10],teacherNote[11],teacherNote[12],
							teacherNote[13],teacherNote[14],teacherNote[15],teacherNote[16],teacherNote[17],teacherNote[18],teacherNote[19],teacherNote[20],teacherNote[21],teacherNote[22],
							teacherNote[23],teacherNote[24],teacherNote[25],id};
				  int i=this.executeUpdate(sql, params);
					if(i>0){
						System.out.println("教师自评成功！");
					}
					tkh_id = id;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		System.out.println(tkh_id);
		return  tkh_id ;
	}

	@Override
	public Teacher getTeacherById(int id) {
		Teacher teacher = null;
		try {
			String sql = "select * from tb_teacher where id=?";
			Object[] params={id};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装教师对象
				teacher = new Teacher();
				teacher.setId(rs.getInt("id"));
				teacher.setUsername(rs.getString("userName"));
				teacher.setPassword(rs.getString("password"));
				teacher.setTrueName(rs.getString("trueName"));
				teacher.setLevel(rs.getString("level"));
				teacher.setTeam(rs.getString("team"));
				teacher.setDep(rs.getString("dep"));
				teacher.setNote(rs.getString("note"));
				teacher.setPic(rs.getString("pic"));
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return teacher;
	}

	@Override
	public TKH queryTHK(int tid) {
		TKH tkh = null;
		try {
			String sql = "select * from tb_tkh where tid=?";
			Object[] params={tid};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装教师考核项对象
				tkh = new TKH();
				tkh.setId(rs.getInt("id"));
				Teacher teacher = getTeacherById(rs.getInt("tid"));
				tkh.setTeacher(teacher);
				tkh.setTeacherName(teacher.getTrueName());
				int [][] noScore = new int[26][5];
				for(int i=0 ; i<26 ;i++) {
					noScore[i][0] = rs.getInt("no"+(i+1)+"_add");
					noScore[i][1] = rs.getInt("no"+(i+1)+"_sub");
					noScore[i][2] = rs.getInt("no"+(i+1)+"_myself");
					noScore[i][3] = rs.getInt("no"+(i+1)+"_leader");
					noScore[i][4] = rs.getInt("no"+(i+1)+"_result");
				}
				tkh.setNoScore(noScore);
				String[][] noNote = new String[26][3];
				for(int i=0 ; i<26 ;i++) {
					noNote[i][0] = rs.getString("no"+(i+1)+"_myself_note");
					noNote[i][1] = rs.getString("no"+(i+1)+"_leader_note");
					noNote[i][2] = rs.getString("no"+(i+1)+"_result_note");
				}
				tkh.setNoNote(noNote);
				tkh.setKhTime_myself(rs.getString("khTime_myself"));
				tkh.setKhTime_leader(rs.getString("khTime_leader"));
				tkh.setKhTime_result(rs.getString("khTime_result"));
				tkh.setTotal_myself(rs.getInt("total_myself"));
				tkh.setTotal_leader(rs.getInt("total_leader"));
				tkh.setTotal_result(rs.getInt("total_result"));
				
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return tkh;
	}




	@Override
	public int updateTeacherAll(Teacher teacher) {
		 
		String sql = "update tb_teacher set username=? , password=?, trueName=?,level=?,team=?,dep=?,note=?,pic=? where id=?";
		Object[] params={teacher.getUsername(),teacher.getPassword(),teacher.getTrueName(),teacher.getLevel(),teacher.getTeam(),teacher.getDep(),teacher.getNote(),teacher.getPic(),teacher.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}




	@Override
	public int updateTeacherNotPassword(Teacher teacher) {
		String sql = "update tb_teacher set username=? , trueName=?,level=?,team=?,dep=?,note=?,pic=? where id=?";
		Object[] params={teacher.getUsername(),teacher.getTrueName(),teacher.getLevel(),teacher.getTeam(),teacher.getDep(),teacher.getNote(),teacher.getPic(),teacher.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}


	@Override
	public int updateTeacherNoPic(Teacher teacher) {
		 
		String sql = "update tb_teacher set username=? , password=?, trueName=?,level=?,team=?,dep=?,note=? where id=?";
		Object[] params={teacher.getUsername(),teacher.getPassword(),teacher.getTrueName(),teacher.getLevel(),teacher.getTeam(),teacher.getDep(),teacher.getNote(),teacher.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}




	@Override
	public int addTeacher(Teacher teacher) {  //添加新的老师，在添加前先做用户名是否已经存在的判断
		int	i = -1 ;
		if(checkTeacherUserName(teacher.getUsername())) {
		  String sql = "insert into tb_teacher(username,password,trueName,level,team,dep,note,open,pic) values(?,?,?,?,?,?,?,?,?) ";
		  Object[] params={teacher.getUsername(),teacher.getPassword(),teacher.getTrueName(),teacher.getLevel(),teacher.getTeam(),teacher.getDep(),teacher.getNote(),teacher.getOpen(),teacher.getPic()};
		  i=this.executeUpdate(sql, params);
		}
		return i;
  }

	  //检查用户名是否可用，true可用，false不可用。
	 public boolean checkTeacherUserName(String userName) {
		   String sql = "select * from tb_teacher where username=?";
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
