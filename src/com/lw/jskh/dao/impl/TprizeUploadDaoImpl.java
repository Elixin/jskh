package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.TprizeUploadDao;
import com.lw.jskh.entity.JiaoShiXiang;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.TprizeUpload;

public class TprizeUploadDaoImpl extends BaseDao implements TprizeUploadDao{

	@Override
	public int add(TprizeUpload tprizeUpload) {
		int id=0;
		delBytPrizePic(tprizeUpload.gettPrizePic());
		try {
			String sql = "insert into tb_tprizeupload(tId,tPrizePic,tPrizeType,note) values(?,?,?,?)";
			Object[]   params={tprizeUpload.getTeacher().getId(),tprizeUpload.gettPrizePic(),tprizeUpload.gettPrizeType(),tprizeUpload.getNote()};
			    int i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("教师上传奖励成功！");
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
	
			String sql = "delete from tb_tprizeupload where id = ? ";
			Object[]   params={id};
			     i=this.executeUpdate(sql, params);
				if(i>0){
					System.out.println("删除奖励记录成功！");
				}
				
		return i ;
		
	}

	@Override
	public int delBytPrizePic(String tPrizePic) {
		int i = -1;
		String sql = "delete from tb_tprizeupload where tPrizePic = ? ";
		Object[]   params={tPrizePic};
		     i=this.executeUpdate(sql, params);
			if(i>0){
				//System.out.println("删除相同奖励记录成功！");
			}
	  return i ;
	
	}

	@Override
	public List<TprizeUpload> queryAllByTid(int tid) {
		//根据教师ID，查询指定教师所传奖励
					List<TprizeUpload> TPUList=new ArrayList<TprizeUpload>();
					try {
						String sql="select * from tb_tprizeupload where tId = ?";
						Object[] params={tid};
						ResultSet rs=this.executeSQL(sql, params);
						TprizeUpload  tprizeUpload;
						Teacher teacher ;
						TeacherDao teacherDao = new TeacherDaoImpl();
						while(rs.next()){
							tprizeUpload = new TprizeUpload();
							tprizeUpload.setId(rs.getInt("id"));
							teacher = teacherDao.getTeacherById(rs.getInt("tId"));
							tprizeUpload.setTeacher(teacher);
							tprizeUpload.settPrizePic(rs.getString("tPrizePic"));
							tprizeUpload.settPrizeType(rs.getInt("tprizeType"));
							tprizeUpload.setNote(rs.getString("note"));
							TPUList.add(tprizeUpload);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						this.closeResource();
					}
					return TPUList;
				}
	

	
	
}
