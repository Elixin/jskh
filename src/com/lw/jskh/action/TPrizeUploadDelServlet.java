package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TprizeUploadDao;
import com.lw.jskh.dao.impl.TprizeUploadDaoImpl;

/**
 * Servlet implementation class TPrizeUploadDelServlet
 */
@WebServlet("/teacher/tPrizeUploadDel")
public class TPrizeUploadDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TPrizeUploadDelServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("13");
		int id = Integer.parseInt(request.getParameter("id"));
		TprizeUploadDao tprizeUploadDao = new TprizeUploadDaoImpl();
		tprizeUploadDao.del(id);
		response.sendRedirect("teacherUpload.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
