package com.lw.jskh.dao.impl;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.entity.XKH;
import com.lw.jskh.entity.XingZheng;

import java.sql.ResultSet;
import java.sql.SQLException;

public class XingZhengDaoImpl extends BaseDao implements XingZhengDao {

	
	//行政用户登录
	@Override
	public XingZheng login(String username, String password) {
		XingZheng xingZheng = null;
		try {
			String sql = "select * from tb_xingzheng where username=? and password=? and open = 0";
			Object[] params={username,password};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装行政对象
				xingZheng = new XingZheng();
				xingZheng.setId(rs.getInt("id"));
				xingZheng.setUsername(username);
				xingZheng.setPassword(password);
				xingZheng.setTrueName(rs.getString("trueName"));
				xingZheng.setLevel(rs.getString("level"));
				xingZheng.setTeam(rs.getString("team"));
				xingZheng.setDep(rs.getString("dep"));
				xingZheng.setNote(rs.getString("note"));
				xingZheng.setPic(rs.getString("pic"));
				
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return xingZheng;
	}

	@Override
	public XingZheng getXingZheng(int id) {
		XingZheng xingZheng = null;
		try {
			String sql = "select * from tb_xingzheng where id=?";
			Object[] params={id};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装行政对象
				xingZheng = new XingZheng();
				xingZheng.setId(rs.getInt("id"));
				xingZheng.setUsername(rs.getString("username"));
				xingZheng.setPassword(rs.getString("password"));
				xingZheng.setTrueName(rs.getString("trueName"));
				xingZheng.setLevel(rs.getString("level"));
				xingZheng.setTeam(rs.getString("team"));
				xingZheng.setDep(rs.getString("dep"));
				xingZheng.setNote(rs.getString("note"));
				xingZheng.setPic(rs.getString("pic"));
				
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return xingZheng;
	}

	@Override
	public int queryXid(int xid) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public boolean checkUserIfOpen(String username, String password) {
		boolean b = false;
		try {
			String sql = "select * from tb_xingzheng where username=? and password=? ";
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
	
	@Override
	public int updateXingZhengAll(XingZheng xingZheng) {
		 
		String sql = "update tb_xingzheng set username=? , password=?, trueName=?,level=?,team=?,dep=?,note=?,pic=? where id=?";
		Object[] params={xingZheng.getUsername(),xingZheng.getPassword(),xingZheng.getTrueName(),xingZheng.getLevel(),xingZheng.getTeam(),xingZheng.getDep(),xingZheng.getNote(),xingZheng.getPic(),xingZheng.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}




	@Override
	public int updateXingZhengNotPassword(XingZheng xingZheng) {
		String sql = "update tb_xingzheng set username=? , trueName=?,level=?,team=?,dep=?,note=?,pic=? where id=?";
		Object[] params={xingZheng.getUsername(),xingZheng.getTrueName(),xingZheng.getLevel(),xingZheng.getTeam(),xingZheng.getDep(),xingZheng.getNote(),xingZheng.getPic(),xingZheng.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}


	@Override
	public int updateXingZhengNoPic(XingZheng xingZheng) {
		 
		String sql = "update tb_xingzheng set username=? , password=?, trueName=?,level=?,team=?,dep=?,note=? where id=?";
		Object[] params={xingZheng.getUsername(),xingZheng.getPassword(),xingZheng.getTrueName(),xingZheng.getLevel(),xingZheng.getTeam(),xingZheng.getDep(),xingZheng.getNote(),xingZheng.getId()};
		int	i=this.executeUpdate(sql, params);
		return i;
	}

	@Override
	public int addXingZheng(XingZheng xingZheng) {
		int	i = -1 ;
		if(checkXingZhengUserName(xingZheng.getUsername())) {
			String sql = "insert into tb_xingzheng(username,password,trueName,level,team,dep,note,open,pic) values(?,?,?,?,?,?,?,?,?) ";
		    Object[] params={xingZheng.getUsername(),xingZheng.getPassword(),xingZheng.getTrueName(),xingZheng.getLevel(),xingZheng.getTeam(),xingZheng.getDep(),xingZheng.getNote(),xingZheng.getOpen(),xingZheng.getPic()};
		    i=this.executeUpdate(sql, params);
		}
		return i;
	}

	  //检查用户名是否可用，true可用，false不可用。
	 public boolean checkXingZhengUserName(String userName) {
		   String sql = "select * from tb_xingzheng where userName=?";
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
	 public XKH queryXHK(int xid) {
		 XKH xkh = null;
			try {
				String sql = "select * from tb_xkh where xid=?";
				Object[] params={xid};
				ResultSet rs=this.executeSQL(sql, params);
				if(rs.next()){
					//封装教师考核项对象
					xkh = new XKH();
					xkh.setId(rs.getInt("id"));
					XingZheng xingZheng = getXingZheng(rs.getInt("xid"));
					xkh.setXingZheng(xingZheng);
					xkh.setXingZhengName(xingZheng.getTrueName());
					int [][] khx = new int[24][3];
					for(int i=0 ; i<24 ;i++) {
						khx[i][0] = rs.getInt("kh"+(i+1)+"_myself");
						khx[i][1] = rs.getInt("kh"+(i+1)+"_team");
						khx[i][2] = rs.getInt("kh"+(i+1)+"_admin");
					}
					xkh.setKhx(khx);
					String[][] khxNote = new String[24][3];
					for(int i=0 ; i<24 ;i++) {
						khxNote[i][0] = rs.getString("kh"+(i+1)+"Note_myself");
						khxNote[i][1] = rs.getString("kh"+(i+1)+"Note_team");
						khxNote[i][2] = rs.getString("kh"+(i+1)+"Note_admin");
					}
					xkh.setKhxNote(khxNote);
					xkh.setTotal_myself(rs.getInt("total_myself"));
					xkh.setTotal_team(rs.getInt("total_team"));
					xkh.setTotal_admin(rs.getInt("total_admin"));
				}
			}catch (SQLException e) {			
				e.printStackTrace();
			}finally{
				this.closeResource();
			}
			return xkh;
	 }
}
