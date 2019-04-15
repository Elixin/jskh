package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.DepDao;
import com.lw.jskh.entity.Dep;


public class DepDaoImpl extends BaseDao implements DepDao {

	@Override
	public List<Dep> queryAllDep() {
		//查询所有的部门
				List<Dep> deps=new ArrayList<Dep>();
				try {
					String sql="select * from tb_dep ";
					Object[] params={};
					ResultSet rs=this.executeSQL(sql, params);
					Dep dep = null;
					while(rs.next()){
						dep = new Dep();
						dep.setId(rs.getInt("id"));
						dep.setDepName(rs.getString("depName"));
						dep.setDepleader(rs.getString("depLeader"));
						deps.add(dep);
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}finally{
					this.closeResource();
				}
				return deps;
	}

}
