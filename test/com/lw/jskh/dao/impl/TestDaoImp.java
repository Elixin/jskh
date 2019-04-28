package com.lw.jskh.dao.impl;

import java.util.List;

import com.lw.jskh.dao.*;
import org.junit.Test;

import com.lw.jskh.entity.Admin;
import com.lw.jskh.entity.JiaoShiXiang;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.TeamLeader;
import com.lw.jskh.entity.XingZheng;

public class TestDaoImp {
	
	TeacherDao teacherDao = new TeacherDaoImpl();
	AdminDao adminDao = new AdminDaoImpl();
	XingZhengDao xingZhengDao = new XingZhengDaoImpl();
	TeamLeaderDao tlDao = new TeamLeaderDaoImpl();
	JiaoShiXiangDao jsxDao = new JiaoShiXiangDaoImpl();
	CollegeLeaderDao clDao= new CollegeLeaderDaoImpl();

	
	@Test
	public void  TestTeacherlogin() {
		Teacher teacher = teacherDao.login("2018800396", "800396");
		System.out.println(teacher.toString());
	}
	
	@Test
	public void  TestAdminlogin() {
		Admin admin = adminDao.login("yang", "123");
		System.out.println(admin.toString());
	}
	
	@Test
	public void  TestXingZhenglogin() {
		XingZheng xingzheng = xingZhengDao.login("li", "123");
		System.out.println(xingzheng.toString());
	}
	
	@Test
	public void  TestTeamLeaderlogin() {
		TeamLeader tl = tlDao.login("xie", "123");
		System.out.println(tl.toString());
	}

	
	@Test
	public void  TestQueryAllKSH() {
		List<JiaoShiXiang>  jsxList = jsxDao.queryAllJiaoShiXiang();
		for(JiaoShiXiang jsx : jsxList) {
			System.out.println(jsx.getId()+","+jsx.getKhNo()+","+jsx.getKhName()+","+jsx.getKhValue()+","+jsx.getKhStandard()+","+jsx.getKhGetScorerStandard()+","+jsx.getKhAddScoreStandard()+","+jsx.getKhSubScoreStandard()+","+jsx.getKhNote());
		}
		
	}
	
}
