package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;
import com.lw.jskh.entity.XingZheng;


@WebServlet("/regXingZheng")
public class RegXingZhengServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RegXingZhengServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("4");
		String userName = request.getParameter("userName");
		String trueName = request.getParameter("trueName");
		String password = request.getParameter("password");
		String level = request.getParameter("level");
		String team = request.getParameter("team");
		String note = request.getParameter("note");
		String dep = request.getParameter("dep");
		//System.out.println(userName+","+trueName+","+team);
		XingZhengDao xingZhengDao = new XingZhengDaoImpl();
		XingZheng xingZheng = new XingZheng();
		xingZheng.setUsername(userName);
		xingZheng.setTrueName(trueName);
		xingZheng.setTeam(team);
		xingZheng.setPassword(password);
		xingZheng.setDep(dep);
		xingZheng.setNote(note);
		xingZheng.setLevel(level);
		int i = xingZhengDao.addXingZheng(xingZheng);
		if(i==-1) {
			response.sendRedirect("xingZhengRegister.jsp?info=no");
		}else {
		    response.sendRedirect("index_xingzheng.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
