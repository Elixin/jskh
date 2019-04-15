package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.entity.Teacher;


@WebServlet("/teamLeader/addTeacher")
public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddTeacherServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String team = request.getParameter("team");
		String dep = request.getParameter("dep");
		//System.out.println(userName+","+trueName+","+team);
		TeacherDao teacherDao = new TeacherDaoImpl();
		Teacher teacher = new Teacher();
		teacher.setUsername(userName);
		teacher.setTrueName(trueName);
		teacher.setTeam(team);
		teacher.setPassword("123456");
		teacher.setDep(dep);
		int i = teacherDao.addTeacher(teacher);
		if(i==-1) {
			response.sendRedirect("teamAddTeacher.jsp?info=no");
		}else {
		    response.sendRedirect("teamAddTeacher.jsp?info=ok");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
