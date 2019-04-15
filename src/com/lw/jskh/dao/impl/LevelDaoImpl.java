package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.LevelDao;
import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.entity.Level;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.TprizeUpload;

public class LevelDaoImpl extends BaseDao implements LevelDao {

	@Override
	public List<Level> getAll() {
		List<Level> levels=new ArrayList<Level>();
		try {
			String sql="select * from tb_level ";
			Object[] params={};
			ResultSet rs=this.executeSQL(sql, params);
			Level level = null;
			while(rs.next()){
				level = new Level();
				level.setId(rs.getInt("id"));
				level.setLevel(rs.getString("level"));
				levels.add(level);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return levels;
	}

	

}
