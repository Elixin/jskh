package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.entity.Teacher;


@WebServlet("/teacher/updateTeacher")
public class UpdateTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateTeacherServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String team = request.getParameter("team");
		String dep = request.getParameter("dep");
		String note = request.getParameter("note");
		
		TeacherDao teacherDao = new TeacherDaoImpl();
		HttpSession session = request.getSession();
		Teacher teacher=(Teacher)session.getAttribute("teacher");
		if(password==null || password.equals("")) {
			 teacher.setId(id);
			 teacher.setUsername(username);
			 teacher.setTrueName(trueName);
			 teacher.setLevel(level);
			 teacher.setTeam(team);
			 teacher.setDep(dep);
			 teacher.setNote(note);
			 teacherDao.updateTeacherNotPassword(teacher);
		}else {
		     teacher.setId(id);
			 teacher.setUsername(username);
			 teacher.setPassword(password);
			 teacher.setTrueName(trueName);
			 teacher.setLevel(level);
			 teacher.setTeam(team);
			 teacher.setDep(dep);
			 teacher.setNote(note);
		   teacherDao.updateTeacherNoPic(teacher);
		}
		session.setAttribute("teacher",teacher);
		response.sendRedirect("teacherUpPic.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
