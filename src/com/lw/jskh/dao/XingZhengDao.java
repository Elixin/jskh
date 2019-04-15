package com.lw.jskh.dao;

import com.lw.jskh.entity.TKH;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.XKH;
import com.lw.jskh.entity.XingZheng;

public interface XingZhengDao {

	public XingZheng login(String username , String password);
	
	public XingZheng getXingZheng(int id);
	
    public int queryXid(int xid);
	
	public boolean checkUserIfOpen(String username , String password);
	
	public int updateXingZhengAll(XingZheng xingZheng);
	
	public int updateXingZhengNotPassword(XingZheng xingZheng);
	
	public int updateXingZhengNoPic(XingZheng xingZheng);
	
	public int addXingZheng(XingZheng xingZheng);
	
	public XKH queryXHK(int id);
}
