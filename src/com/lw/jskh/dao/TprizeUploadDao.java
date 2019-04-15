package com.lw.jskh.dao;

import java.util.List;

import com.lw.jskh.entity.TprizeUpload;

public interface TprizeUploadDao {

	//添加一条新的获奖证书信息，返回记录的ID值，如果获奖证书名称相同，先删除以前的证书，再添加新的证书
	public int add(TprizeUpload tprizeUpload);
	
	public int del(int id);
	
	//删除相同获奖证书名称的记录
	public int delBytPrizePic(String tPrizePic);
	
	//根据教师ID，查询指定教师所传奖励
	public List<TprizeUpload> queryAllByTid(int tid);
	
	
	
}
