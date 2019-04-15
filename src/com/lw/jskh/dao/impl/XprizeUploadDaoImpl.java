package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.XKHDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.XprizeUploadDao;
import com.lw.jskh.dao.XprizeUploadDao;
import com.lw.jskh.entity.JiaoShiXiang;
import com.lw.jskh.entity.XingZheng;
import com.lw.jskh.entity.XprizeUpload;
import com.lw.jskh.entity.XprizeUpload;

public class XprizeUploadDaoImpl extends BaseDao implements XprizeUploadDao{

	@Override
	public int add(XprizeUpload xprizeUpload) {
		int id=0;
		delBytPrizePic(xprizeUpload.getxPrizePic());
		try {
			String sql = "insert into tb_xprizeupload(xId,xPrizePic,xPrizeType,note) values(?,?,?,?)";
			Object[]   params={xprizeUpload.getXingZheng().getId(),xprizeUpload.getxPrizePic(),xprizeUpload.getxPrizeType(),xprizeUpload.getNote()};
			    int i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("行政人员上传奖励成功！");
				}
				ps=conn.prepareStatement("select LAST_INSERT_ID()"); //返回插入最后一条记录的ID值
				ResultSet rs = ps.executeQuery();
				if (rs.next())id = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		System.out.println(id);
		return  id ;
	}

	@Override
	public int del(int id) {
		int i = -1;
	
			String sql = "delete from tb_xprizeupload where id = ? ";
			Object[]   params={id};
			     i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("删除奖励记录成功！");
				}
				
		return i ;
		
	}

	@Override
	public int delBytPrizePic(String xPrizePic) {
		int i = -1;
		String sql = "delete from tb_xprizeupload where xPrizePic = ? ";
		Object[]   params={xPrizePic};
		     i=this.executeUpdate(sql, params);
			if(i>0){
				//System.out.println("删除相同奖励记录成功！");
			}
	  return i ;
	
	}

	@Override
	public List<XprizeUpload> queryAllByXid(int xid) {
		//根据行政人员ID，查询指定行政人员所传奖励
					List<XprizeUpload> XPUList=new ArrayList<XprizeUpload>();
					try {
						String sql="select * from tb_xprizeupload where xId = ?";
						Object[] params={xid};
						ResultSet rs=this.executeSQL(sql, params);
						XprizeUpload  xprizeUpload;
						XingZheng xingZheng ;
						XKHDao xkhDao = new XKHDaoImpl();
						XingZhengDao xingZhengDao = new XingZhengDaoImpl();
						while(rs.next()){
							xprizeUpload = new XprizeUpload();
							xprizeUpload.setId(rs.getInt("id"));
							xingZheng = xingZhengDao.getXingZheng(rs.getInt("xId"));
							xprizeUpload.setXingZheng(xingZheng);
							xprizeUpload.setxPrizePic(rs.getString("xPrizePic"));
							xprizeUpload.setxPrizeType(rs.getInt("xprizeType"));
							xprizeUpload.setNote(rs.getString("note"));
							XPUList.add(xprizeUpload);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						this.closeResource();
					}
					return XPUList;
				}
	

	
	
}
