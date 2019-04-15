package com.lw.jskh.dao;

import java.util.List;

import com.lw.jskh.entity.XprizeUpload;

public interface XprizeUploadDao {

	//添加一条新的获奖证书信息，返回记录的ID值，如果获奖证书名称相同，先删除以前的证书，再添加新的证书
	public int add(XprizeUpload xprizeUpload);
	
	public int del(int id);
	
	//删除相同获奖证书名称的记录
	public int delBytPrizePic(String xPrizePic);
	
	//根据行政人员ID，查询指定教师所传奖励
	public List<XprizeUpload> queryAllByXid(int xid);
	
	
	
}
