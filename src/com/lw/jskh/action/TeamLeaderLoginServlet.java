package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lw.jskh.dao.TeamLeaderDao;
import com.lw.jskh.dao.impl.TeamLeaderDaoImpl;
import com.lw.jskh.entity.TeamLeader;


@WebServlet("/teamleaderLogin")
public class TeamLeaderLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TeamLeaderLoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("teamLeaderLogin");  
		   request.setCharacterEncoding("utf-8");
		   String username = request.getParameter("username");
		   String password = request.getParameter("password");
		   TeamLeaderDao teamLeaderDao = new TeamLeaderDaoImpl();
		   TeamLeader teamLeader= teamLeaderDao.login(username, password);
		      if(teamLeader == null){   //teamLeader为空，表示用户输入的用户名或密码有错，登录失败!返回首页
			      response.sendRedirect("index_teamLeader.jsp?info=fail");
		      }
		      else {   //teamLeader不为空，表示用户输入的用户名和密码正确，登录成功！将user对象保存在session中，根据用户的类别选择进入不同的网页。
			      
		    	  if(teamLeader.getOpen()==1) {
					   response.sendRedirect("index_teamLeader.jsp?info=open");
				   }else {
		    	  HttpSession session = request.getSession();
			      session.setAttribute("teamLeader", teamLeader);
			      response.sendRedirect("teamLeader/teamLeaderMain.jsp");//
			   }
		   }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
