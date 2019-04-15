package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lw.jskh.dao.TprizeUploadDao;
import com.lw.jskh.dao.XprizeUploadDao;
import com.lw.jskh.dao.impl.TprizeUploadDaoImpl;
import com.lw.jskh.dao.impl.XprizeUploadDaoImpl;

/**
 * Servlet implementation class TPrizeUploadDelServlet
 */
@WebServlet("/xingzheng/xPrizeUploadDel")
public class XPrizeUploadDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public XPrizeUploadDelServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		XprizeUploadDao xprizeUploadDao = new XprizeUploadDaoImpl();
		xprizeUploadDao.del(id);
		response.sendRedirect("xingZhengUpload.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
