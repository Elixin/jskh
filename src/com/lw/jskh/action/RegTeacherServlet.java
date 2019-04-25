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


@WebServlet("/regTeacher")
public class RegTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RegTeacherServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("3");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String team = request.getParameter("team");
		String note = request.getParameter("note");
		String dep = request.getParameter("dep");
		//System.out.println(userName+","+trueName+","+team);
		TeacherDao teacherDao = new TeacherDaoImpl();
		Teacher teacher = new Teacher();
		teacher.setUsername(userName);
		teacher.setTrueName(trueName);
		teacher.setTeam(team);
		teacher.setPassword(password);
		teacher.setDep(dep);
		teacher.setNote(note);
		teacher.setLevel(level);
		int i = teacherDao.addTeacher(teacher);
		if(i==-1) {
			response.sendRedirect("teacherRegister.jsp?info=no");
		}else {
		    response.sendRedirect("index_teacher.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
