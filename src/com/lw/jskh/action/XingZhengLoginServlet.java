package com.lw.jskh.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lw.jskh.dao.TeacherDao;
import com.lw.jskh.dao.XingZhengDao;
import com.lw.jskh.dao.impl.TeacherDaoImpl;
import com.lw.jskh.dao.impl.XingZhengDaoImpl;
import com.lw.jskh.entity.Teacher;
import com.lw.jskh.entity.XingZheng;

@WebServlet("/xingzhengLogin")
public class XingZhengLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XingZhengLoginServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("xingzhengLogin");  
		   request.setCharacterEncoding("utf-8");
		   String username = request.getParameter("username");
		   String password = request.getParameter("password");
		   XingZhengDao xingZhengDao = new XingZhengDaoImpl();
		   XingZheng xingZheng= xingZhengDao.login(username, password);
		   if(xingZheng == null){   //为空，表示用户输入的用户名或密码有错，登录失败!返回首页
			   response.sendRedirect("index_xingzheng.jsp?info=fail");
		   }
		   else {   //不为空，表示用户输入的用户名和密码正确，登录成功！
			   HttpSession session = request.getSession();
			   session.setAttribute("xingZheng", xingZheng);
			   response.sendRedirect("xingzheng/xingzhengMain.jsp");//进入行政人员考核主页
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
