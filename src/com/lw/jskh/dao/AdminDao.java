package com.lw.jskh.dao;

import com.lw.jskh.entity.Admin;

public interface AdminDao {

	public Admin login(String username , String password);
	
}
