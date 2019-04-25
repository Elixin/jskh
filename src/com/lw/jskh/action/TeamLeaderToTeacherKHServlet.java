package com.lw.jskh.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;


@WebServlet("/teamLeader/teamLeaderToteacherKh")
public class TeamLeaderToTeacherKHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TeamLeaderDao teamLeaderDao = new TeamLeaderDaoImpl();  
   
    public TeamLeaderToTeacherKHServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("12");
		String[] teacherTeamLeader = request.getParameterValues("teacherTeamLeader");
		String[] teamLeaderNote = request.getParameterValues("teamLeaderNote");
		for(String s : teamLeaderNote) {
			System.out.println(s);
		}
		//System.out.println(teacherMyselft.length);
		int id =Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		int  tkh_id = teamLeaderDao.teamLeaderTestTeacher(id, teacherTeamLeader,teamLeaderNote);
		PrintWriter out = response.getWriter();
		if(tkh_id!=0) {
			response.sendRedirect("teacherTeamLeader.jsp?id="+id);
		}else {
			out.print("教师自评失败！");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
