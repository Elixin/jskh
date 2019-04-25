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

/**
 * 登陆验证
 */
@WebServlet("/teacherLogin")
public class TeacherLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TeacherLoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("teacherLogin");
		request.setCharacterEncoding("utf-8");
		   String username = request.getParameter("username");
		   String password = request.getParameter("password");
		   TeacherDao teacherDao = new TeacherDaoImpl();
		  
		   
	  	      Teacher teacher= teacherDao.login(username, password);
		      if(teacher == null){   //teacher为空，表示用户输入的用户名或密码有错，登录失败!返回首页
			      response.sendRedirect("index_teacher.jsp?info=fail");
		      }
		      else {   //user不为空，表示用户输入的用户名和密码正确，登录成功！将user对象保存在session中，根据用户的类别选择进入不同的网页。
		    	  if(teacherDao.checkUserIfOpen(username, password)==false) {
					   response.sendRedirect("index_teacher.jsp?info=open");
				   }else {
				  HttpSession session = request.getSession();
			      session.setAttribute("teacher", teacher);
			      response.sendRedirect("teacher/teacherMain.jsp");//进入新闻管理员主页
				   }
			   }
		   }
	

}
