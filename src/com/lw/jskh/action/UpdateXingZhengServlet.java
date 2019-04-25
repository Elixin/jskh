package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;
import com.lw.jskh.entity.XingZheng;


@WebServlet("/xingzheng/updateXingZheng")
public class UpdateXingZhengServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateXingZhengServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/xingzheng/updateXingZheng");
		request.setCharacterEncoding("utf-8");
		System.out.println("15");
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String team = request.getParameter("team");
		String dep = request.getParameter("dep");
		String note = request.getParameter("note");
		
		XingZhengDao xingZhengDao = new XingZhengDaoImpl();
		HttpSession session = request.getSession();
		XingZheng xingZheng=(XingZheng)session.getAttribute("xingZheng");
		if(password==null || password.equals("")) {
			 xingZheng.setId(id);
			 xingZheng.setUsername(username);
			 xingZheng.setTrueName(trueName);
			 xingZheng.setLevel(level);
			 xingZheng.setTeam(team);
			 xingZheng.setDep(dep);
			 xingZheng.setNote(note);
			 xingZhengDao.updateXingZhengNotPassword(xingZheng);
		}else {
		     xingZheng.setId(id);
			 xingZheng.setUsername(username);
			 xingZheng.setPassword(password);
			 xingZheng.setTrueName(trueName);
			 xingZheng.setLevel(level);
			 xingZheng.setTeam(team);
			 xingZheng.setDep(dep);
			 xingZheng.setNote(note);
		   xingZhengDao.updateXingZhengNoPic(xingZheng);
		}
		session.setAttribute("xingZheng",xingZheng);
		response.sendRedirect("xingZhengUpPic.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
