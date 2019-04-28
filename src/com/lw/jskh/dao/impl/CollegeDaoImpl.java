package com.lw.jskh.dao.impl;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.TeamDao;
import com.lw.jskh.entity.Team;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CollegeDaoImpl extends BaseDao implements TeamDao {
 
	@Override
	public List<Team> queryAllTeam() {
		//查询所有的团队
		List<Team> teams=new ArrayList<Team>();
		try {
			String sql="select * from tb_team ";
			Object[] params={};
			ResultSet rs=this.executeSQL(sql, params);
			Team team = null;
			while(rs.next()){
				team = new Team();
				team.setId(rs.getInt("id"));
				team.setTeamName(rs.getString("teamName"));
				team.setTeamLeader(rs.getString("teamLeader"));
				team.setDep(rs.getString("dep"));
				team.setType(rs.getString("type"));
				teams.add(team);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return teams;
	}

	

}
