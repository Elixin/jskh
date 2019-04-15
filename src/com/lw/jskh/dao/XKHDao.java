package com.lw.jskh.dao;

import com.lw.jskh.entity.XKH;

public interface XKHDao {
     
	//根据行政人员ID值，得到考核信息
	public XKH getXKH(int xid);
	
	//添加新行政考核项
	public int addXKH(XKH xkh);
	
	//修改行政考核项
	public int updateXKH(XKH xkh);
	
	public int xingzhengMyselfTest(int tid ,String[] xingZhengMyself,String[] xingZhengNote);
}
