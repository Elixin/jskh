package com.lw.jskh.action;

import com.lw.jskh.dao.CollegeLeaderDao;
import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.impl.CollegeLeaderDaoImpl;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;
import com.lw.jskh.entity.CollegeLeader;
import com.lw.jskh.entity.TeamLeader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/regCollegeLeader")
public class RegCollegeLeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public RegCollegeLeaderServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("333");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String note = request.getParameter("note");
		String dep = request.getParameter("dep");
		String teamType=request.getParameter("teamType");
		//System.out.println(userName+","+trueName+","+team);
		CollegeLeaderDao collegeLeaderDao=new CollegeLeaderDaoImpl();
		CollegeLeader collegeLeader=new CollegeLeader();
		collegeLeader.setUsername(userName);  //用户名
		collegeLeader.setTrueName(trueName);     //真实姓名
		collegeLeader.setPassword(password);  //密码
		collegeLeader.setDep(dep);  //二级学院名
		collegeLeader.setNote(note);  //备注
		collegeLeader.setPosition(level);  //职位
		collegeLeader.setTeamType(teamType); //团队类型
		System.out.println("用户名 "+userName);
		System.out.println("密码 "+password);
		System.out.println("姓名 "+trueName);
		System.out.println("二级学院名 "+dep);
		System.out.println("备注 "+note);
		System.out.println("职位 "+level);
		System.out.println("团队类型 "+teamType);
		int i=collegeLeaderDao.addCollegeLeader(collegeLeader);
		System.out.println(i);
		if(i==-1) {
			response.sendRedirect("collegeLeaderRegister.jsp?info=no");
		}else {
		    response.sendRedirect("index_collegeLeader.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
