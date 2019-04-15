package com.lw.jskh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.lw.jskh.dao.BaseDao;
import com.lw.jskh.dao.JiaoShiXiangDao;
import com.lw.jskh.entity.JiaoShiXiang;


public class JiaoShiXiangDaoImpl extends BaseDao implements JiaoShiXiangDao {

	@Override
	public List<JiaoShiXiang> queryAllJiaoShiXiang() {
		// 查询所有教师考核项
			List<JiaoShiXiang> JSHList=new ArrayList<JiaoShiXiang>();
			try {
				String sql="select * from tb_jiaoshixiang";
				Object[] params={};
				ResultSet rs=this.executeSQL(sql, params);
				while(rs.next()){
					JiaoShiXiang  jsx = new JiaoShiXiang();
					jsx.setId(rs.getInt("id"));
					jsx.setKhNo(rs.getString("khNo"));
					jsx.setKhName(rs.getString("khName"));
					jsx.setKhValue(rs.getString("khValue"));
					jsx.setKhStandard(rs.getString("khStandard"));
					jsx.setKhGetScorerStandard(rs.getString("khGetScorerStandard"));
					jsx.setKhAddScoreStandard(rs.getString("khAddScoreStandard"));
					jsx.setKhSubScoreStandard(rs.getString("khSubScoreStandard"));
					jsx.setKhNote(rs.getString("khNote"));
					JSHList.add(jsx);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally{
				this.closeResource();
			}
			return JSHList;
		}
	

}
