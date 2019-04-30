package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.TeamLeader;


@WebServlet("/regTeamLeader")
public class RegTeamLeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RegTeamLeaderServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("3");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String team = request.getParameter("managerTeam");
		String note = request.getParameter("note");
		String dep = request.getParameter("dep");
		String teamType=request.getParameter("teamType");
		//System.out.println(userName+","+trueName+","+team);
		TeamLeaderDao teamLeaderDao=new TeamLeaderDaoImpl();
		TeamLeader teamLeader=new TeamLeader();
		teamLeader.setUsername(userName);  //用户名
		teamLeader.setTrueName(trueName);     //真实姓名
		teamLeader.setManagerTeam(team);    //管理团队
		teamLeader.setPassword(password);  //密码
		teamLeader.setDep(dep);  //二级学院名
		teamLeader.setNote(note);  //备注
		teamLeader.setPosition(level);  //职位
		teamLeader.setTeamType(teamType); //团队类型

		int i=teamLeaderDao.addTeamLeader(teamLeader);
		if(i==-1) {
			response.sendRedirect("teacherRegister.jsp?info=no");
		}else {
		    response.sendRedirect("index_teamLeader.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
