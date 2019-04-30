package com.lw.jskh.action;

import com.lw.jskh.dao.CollegeLeaderDao;
import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.impl.CollegeLeaderDaoImpl;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/teamLeader/collegeLeaderToTeamLeaderKH")
public class CollegeLeaderToTeamLeaderKHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TeamLeaderDao teamLeaderDao = new TeamLeaderDaoImpl();
	CollegeLeaderDao collegeLeaderDao=new CollegeLeaderDaoImpl();

    public CollegeLeaderToTeamLeaderKHServlet() {
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
		System.out.println("我是 ID  "+id);
		int  tkh_id = collegeLeaderDao.collegeLeaderTestTeamLeader(id, teacherTeamLeader,teamLeaderNote);
		PrintWriter out = response.getWriter();
		System.out.println("我是   "+tkh_id);
		if(tkh_id!=0) {
			response.sendRedirect("TeamLeaderCollegeLeader.jsp?id="+id);
		}else {
			out.print("考核失败！");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
