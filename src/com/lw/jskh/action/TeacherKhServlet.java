package com.lw.jskh.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;

@WebServlet("/teacher/teacherKh")
public class TeacherKhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TeacherDao teacherDao = new TeacherDaoImpl();
       
     public TeacherKhServlet() {
        super();
     }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("6");
		String[] teacherMyselft = request.getParameterValues("teacherMyself");
		String[] teacherNote = request.getParameterValues("teacherNote");
		for(String s : teacherNote) {
			System.out.println(s);
		}
		//System.out.println(teacherMyselft.length);
		int id =Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		int  tkh_id = teacherDao.myselfTest(id, teacherMyselft,teacherNote);
		PrintWriter out = response.getWriter();
		if(tkh_id!=0) {
			response.sendRedirect("teacherMyself.jsp?id="+tkh_id);
		}else {
			out.print("教师自评失败！");
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
