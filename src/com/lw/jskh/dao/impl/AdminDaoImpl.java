package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.lw.jskh.entity.Admin;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.dao.AdminDao;
import com.lw.jskh.dao.BaseDao;

public class AdminDaoImpl extends BaseDao implements AdminDao {

	
	//管理员用户登录
	@Override
	public Admin login(String username, String password) {
		Admin admin = null;
		try {
			String sql = "select * from tb_admin where username=? and password=?";
			Object[] params={username,password};
			ResultSet rs=this.executeSQL(sql, params);
			if(rs.next()){
				//封装管理员对象
				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setUsername(username);
				admin.setPassword(password);
				admin.setTrueName(rs.getString("trueName"));
				admin.setPosition(rs.getString("position"));
				admin.setDep(rs.getString("dep"));
				admin.setNote(rs.getString("note"));
				admin.setPic(rs.getString("pic"));
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return admin;
	}
	
	

}
