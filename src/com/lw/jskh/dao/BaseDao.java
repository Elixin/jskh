package com.lw.jskh.dao;

import com.lw.jskh.entity.Dep;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
//
//import com.lw.jskh.entity.Dep;
//import com.mysql.jdbc.Connection;
//import com.mysql.jdbc.PreparedStatement;
//import com.mysql.jdbc.Statement;

import java.sql.ResultSet;

//基类：数据库操作通用类
public class BaseDao {
	protected Connection conn;
	protected PreparedStatement ps;
	protected Statement stmt;
	protected ResultSet rs;

	// 获取数据库连接
	public boolean getConnection() {
		// 读出配置信息
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/jskh?userUnicode=true&characterEncoding=utf-8";
		String username="root";
		String password= "1475693";
		// 加载JDBC驱动
		try {
			//Class.forName(driver);
			Class.forName(driver);
			// 与数据库建立连接
			conn = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// 增删改 
	public int executeUpdate(String sql, Object[] params) {
		int updateRows = 0;
		getConnection();
		try {
			ps=conn.prepareStatement(sql);
			//填充占位符
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			updateRows=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateRows;
	}

	// 查询
	public ResultSet executeSQL(String sql,Object[] params) {
		getConnection();
		try {
			ps=conn.prepareStatement(sql);
			//填充占位符
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			rs=ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 关闭资源
	public boolean closeResource() {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	public List<Dep> queryAll() {
		// TODO Auto-generated method stub
		return null;
	}
 }
