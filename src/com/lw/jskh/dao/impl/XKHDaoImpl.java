package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.XKHDao;
import com.lw.jskh.entity.TKH;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.XKH;
import com.lw.jskh.entity.XingZheng;

public class XKHDaoImpl extends BaseDao implements XKHDao {

	@Override
	public XKH getXKH(int xid) {
		XKH xkh = null;
		try {
			String sql = "select * from tb_xkh where xid=?";
			Object[] params={xid};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装行政人员考核项对象
				xkh = new XKH();
				xkh.setId(rs.getInt("id"));
				XingZheng xingZheng = getXingZhengById(rs.getInt("xid"));
				xkh.setXingZheng(xingZheng);
				xkh.setXingZhengName(xingZheng.getTrueName());
				int [][] khx = new int[24][3];
				for(int i=0 ; i<24 ;i++) {
					khx[i][0] = rs.getInt("kh"+(i+1)+"_myself");
					khx[i][1] = rs.getInt("kh"+(i+1)+"_team");
					khx[i][2] = rs.getInt("kh"+(i+1)+"_admin");
				}
				xkh.setKhx(khx);
				String [][] khxNote = new String[24][3];
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

	public XingZheng getXingZhengById(int id) {
		XingZheng xingZheng = null;
		try {
			String sql = "select * from tb_xingzheng where id=?";
			Object[] params={id};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装行政人员对象
				xingZheng = new XingZheng();
				xingZheng.setId(rs.getInt("id"));
				xingZheng.setUsername(rs.getString("userName"));
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
	public int addXKH(XKH xkh) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateXKH(XKH xkh) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int xingzhengMyselfTest(int xid, String[] xingZhengMyself, String[] xingZhengNote) {
		XingZheng xingzheng = getXingZhengById(xid);
		int xkh_id=0;
		try {
			int total_myself = 0 ;
			
			for( String s : xingZhengMyself) {
				int x = Integer.parseInt(s);
				total_myself += x;
			}
			
			System.out.println(total_myself);
			
			int id = queryXid(xid);
			
			String sql = "";
			if(id ==-1) {  //考核表中无记录，添加新记录
			
			  sql="insert into tb_xkh(xid,xingzhengName,kh1_myself,kh2_myself,kh3_myself,kh4_myself,kh5_myself,kh6_myself,kh7_myself,kh8_myself,kh9_myself,kh10_myself,"
					+ "kh11_myself,kh12_myself,kh13_myself,kh14_myself,kh15_myself,kh16_myself,kh17_myself,kh18_myself,kh19_myself,kh20_myself,kh21_myself,kh22_myself,"
					+ "kh23_myself,kh24_myself,total_myself,kh1Note_myself,kh2Note_myself,kh3Note_myself,kh4Note_myself,kh5Note_myself,kh6Note_myself,"
					+ "kh7Note_myself,kh8Note_myself,kh9Note_myself,kh10Note_myself,kh11Note_myself,kh12Note_myself,kh13Note_myself,kh14Note_myself,kh15Note_myself,kh16Note_myself,"
					+ "kh17Note_myself,kh18Note_myself,kh19Note_myself,kh20Note_myself,kh21Note_myself,kh22Note_myself,kh23Note_myself,kh24Note_myself"
					+ ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			  Object[]   params={xingzheng.getId(),xingzheng.getTrueName(),xingZhengMyself[0],xingZhengMyself[1],xingZhengMyself[2],xingZhengMyself[3],xingZhengMyself[4],
					  xingZhengMyself[5],xingZhengMyself[6],xingZhengMyself[7],xingZhengMyself[8],xingZhengMyself[9],xingZhengMyself[10],xingZhengMyself[11],xingZhengMyself[12],
					  xingZhengMyself[13],xingZhengMyself[14],xingZhengMyself[15],xingZhengMyself[16],xingZhengMyself[17],xingZhengMyself[18],xingZhengMyself[19],xingZhengMyself[20],
					  xingZhengMyself[21],xingZhengMyself[22],xingZhengMyself[23],total_myself,xingZhengNote[0],xingZhengNote[1],xingZhengNote[2],xingZhengNote[3],xingZhengNote[4],
					  xingZhengNote[5],xingZhengNote[6],xingZhengNote[7],xingZhengNote[8],xingZhengNote[9],xingZhengNote[10],xingZhengNote[11],xingZhengNote[12],xingZhengNote[13],
					  xingZhengNote[14],xingZhengNote[15],xingZhengNote[16],xingZhengNote[17],xingZhengNote[18],xingZhengNote[19],xingZhengNote[20],xingZhengNote[21],xingZhengNote[22],
					  xingZhengNote[23]};
			    int i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("行政新增自评成功！");
				}
				ps=conn.prepareStatement("select LAST_INSERT_ID()"); //返回插入最后一条记录的ID值
				ResultSet rs = ps.executeQuery();
				if (rs.next())xkh_id = rs.getInt(1);
			}else {    //考核表已有记录，修改记录
				 sql="update tb_xkh set xid=?,xingzhengName=?,kh1_myself=?,kh2_myself=?,kh3_myself=?,kh4_myself=?,kh5_myself=?,kh6_myself=?,kh7_myself=?,kh8_myself=?,kh9_myself=?,kh10_myself=?,"
				 		+ "kh11_myself=?,kh12_myself=?,kh13_myself=?,kh14_myself=?,kh15_myself=?,kh16_myself=?,kh17_myself=?,kh18_myself=?,kh19_myself=?,kh20_myself=?,kh21_myself=?,kh22_myself=?,"
				 		+ "kh23_myself=?,kh24_myself=?,total_myself=?,kh1Note_myself=?,kh2Note_myself=?,kh3Note_myself=?,kh4Note_myself=?,kh5Note_myself=?,kh6Note_myself=?,"
				 		+ "kh7Note_myself=?,kh8Note_myself=?,kh9Note_myself=?,kh10Note_myself=?,kh11Note_myself=?,kh12Note_myself=?,kh13Note_myself=?,kh14Note_myself=?,kh15Note_myself=?,kh16Note_myself=?,"
				 		+ "kh17Note_myself=?,kh18Note_myself=?,kh19Note_myself=?,kh20Note_myself=?,kh21Note_myself=?,kh22Note_myself=?,kh23Note_myself=?,kh24Note_myself=? where id=?";
				 		
				 Object[]  params={xid,xingzheng.getTrueName(),xingZhengMyself[0],xingZhengMyself[1],xingZhengMyself[2],xingZhengMyself[3],xingZhengMyself[4],
						  xingZhengMyself[5],xingZhengMyself[6],xingZhengMyself[7],xingZhengMyself[8],xingZhengMyself[9],xingZhengMyself[10],xingZhengMyself[11],xingZhengMyself[12],
						  xingZhengMyself[13],xingZhengMyself[14],xingZhengMyself[15],xingZhengMyself[16],xingZhengMyself[17],xingZhengMyself[18],xingZhengMyself[19],xingZhengMyself[20],
						  xingZhengMyself[21],xingZhengMyself[22],xingZhengMyself[23],total_myself,xingZhengNote[0],xingZhengNote[1],xingZhengNote[2],xingZhengNote[3],xingZhengNote[4],
						  xingZhengNote[5],xingZhengNote[6],xingZhengNote[7],xingZhengNote[8],xingZhengNote[9],xingZhengNote[10],xingZhengNote[11],xingZhengNote[12],xingZhengNote[13],
						  xingZhengNote[14],xingZhengNote[15],xingZhengNote[16],xingZhengNote[17],xingZhengNote[18],xingZhengNote[19],xingZhengNote[20],xingZhengNote[21],xingZhengNote[22],
						  xingZhengNote[23],id};
				  int i=this.executeUpdate(sql, params);
					if(i>0){
						System.out.println("行政修改自评成功！");
					}
					xkh_id = id;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		//System.out.println(xkh_id);
		return  xkh_id ;
	}

	public int queryXid(int xid) {
		int id = -1 ;
		  try {
				String sql = "select * from tb_xkh where xid=? ";
				Object[] params={xid};
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

	
	
}
