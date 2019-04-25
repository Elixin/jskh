package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.XingZheng;


@WebServlet("/teamLeader/addXingZheng")
public class AddXingZhengServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddXingZhengServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("2");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String team = request.getParameter("team");
		String dep = request.getParameter("dep");
		XingZhengDao xingZhengDao = new XingZhengDaoImpl();
		XingZheng xingZheng = new XingZheng();
		xingZheng.setUsername(userName);
		xingZheng.setTrueName(trueName);
		xingZheng.setTeam(team);
		xingZheng.setPassword("123456");
		xingZheng.setDep(dep);
		int i = xingZhengDao.addXingZheng(xingZheng);
		if(i==-1) {		//System.out.println(userName+","+trueName+","+team);

			response.sendRedirect("teamAddXingZheng.jsp?info=no");
		}else {
		    response.sendRedirect("teamAddXingZheng.jsp?info=ok");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
