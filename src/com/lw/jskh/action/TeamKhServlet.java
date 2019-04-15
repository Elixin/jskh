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
import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.XKHDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;
import com.lw.jskh.dao.impl.XKHDaoImpl;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;

@WebServlet("/teamLeader/teamKh")
public class TeamKhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	      
     public TeamKhServlet() {
        super();
     }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/xingzheng/xingzhengKh");
		request.setCharacterEncoding("utf-8");
		String[] xingZhengTeam = request.getParameterValues("xingZhengTeam");
		String[] xingZhengTeamNote = request.getParameterValues("xingZhengTeamNote");
		int xid =Integer.parseInt(request.getParameter("id"));
		System.out.println(xid);
		TeamLeaderDao tlkhDao = new TeamLeaderDaoImpl();
		int xkh_id = tlkhDao.teamLeaderTestXingZheng(xid, xingZhengTeam, xingZhengTeamNote);
		PrintWriter out = response.getWriter();
		if(xkh_id!=0) {
			response.sendRedirect("teamLeaderToXingZheng.jsp?id="+xid);
		}else {
			out.print("团队负责人给分失败！");
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
