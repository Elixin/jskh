package com.lw.jskh.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.XKHDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.XKHDaoImpl;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;

@WebServlet("/xingzheng/xingzhengKh")
public class XingZhengKhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	XingZhengDao xingzhengDao = new XingZhengDaoImpl();
       
     public XingZhengKhServlet() {
        super();
     }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/xingzheng/xingzhengKh");
		request.setCharacterEncoding("utf-8");
		String[] xingZhengMyselft = request.getParameterValues("xingZhengMyself");
		String[] xingZhengMyselfNote = request.getParameterValues("xingZhengMyselfNote");
		int xid =Integer.parseInt(request.getParameter("id"));
		System.out.println(xid);
		XKHDao xkhDao = new XKHDaoImpl();
		int xkh_id = xkhDao.xingzhengMyselfTest(xid, xingZhengMyselft, xingZhengMyselfNote );
		PrintWriter out = response.getWriter();
		if(xkh_id!=0) {
			response.sendRedirect("xingZhengMyself.jsp?id="+xkh_id);
		}else {
			out.print("教师自评失败！");
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
