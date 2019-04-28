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
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/collegeleaderLogin")
public class CollegeLeaderLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public CollegeLeaderLoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("collegeLeaderLogin");
		System.out.println("11");
		request.setCharacterEncoding("utf-8");
		   String username = request.getParameter("username");
		   String password = request.getParameter("password");
		CollegeLeaderDao collegeLeaderDao=new CollegeLeaderDaoImpl();
		CollegeLeader collegeLeader=collegeLeaderDao.login(username,password);
		      if(collegeLeader == null){   //teamLeader为空，表示用户输入的用户名或密码有错，登录失败!返回首页
			      response.sendRedirect("index_collegeLeader.jsp?info=fail");
		      }
		      else {   //teamLeader不为空，表示用户输入的用户名和密码正确，登录成功！将user对象保存在session中，根据用户的类别选择进入不同的网页。
			      
		    	  if(collegeLeader.getOpen()==1) {
					   response.sendRedirect("index_collegeLeader.jsp?info=open");
				   }else {
		    	  	System.out.println("我输出了");
		    	  HttpSession session = request.getSession();
			      session.setAttribute("collegeLeader", collegeLeader);
			      response.sendRedirect("collegeLeader/collegeLeaderMain.jsp");//
			   }
		   }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
