<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 "/>
<title>教师考核系统</title>
<link type="text/css" rel="stylesheet" href="css/index_teacher.css" />
<style type="text/css">
<!--
-->
</style>
</head>

<body>
<%
    request.setCharacterEncoding("utf-8");
    String info =request.getParameter("info");
    if(info!=null && info.equals("fail") ){
        out.println("<br/><font color='red'>用户名或密码不正确！</font>");
    }
    if(info!=null && info.equals("open") ){
        out.println("<br/><font color='red'>没有开放登录权限！</font>");
    }
%>
<div class="wrap" id="wrap">
    <div class="logGet">
        <div class="logD logDtip">
            <p class="p1">教师登录</p>
        </div>
        <form action="teacherLogin" method="post">
            <div class="lgD">
                <input type="text" placeholder="输入用户名" />
            </div>
            <div class="lgD">
                <input type="password" placeholder="输入用户密码" />
            </div>
            <div class="logC">
                <input type="submit" value="登 录"/>
<%--                <a href="index.html" target="_self"><button>登 录</button></a>--%>
            </div>
            <a href="teacherRegister.jsp" class="zc" >开始注册</a>
        </form>
    </div>
</div>
</body>
</html>


<%--<div align="center"   >--%>
<%--<br/><br/><br/>--%>
<%--<h1>任课教师请登录</h1><br/>--%>
<%-- <%--%>
<%--          request.setCharacterEncoding("utf-8");--%>
<%--          String info =request.getParameter("info");--%>
<%--          if(info!=null && info.equals("fail") ){--%>
<%--            out.println("<br/><font color='red'>用户名或密码不正确！</font>");--%>
<%--          }--%>
<%--          if(info!=null && info.equals("open") ){--%>
<%--              out.println("<br/><font color='red'>没有开放登录权限！</font>");--%>
<%--            }--%>
<%--         %>--%>
<%--         <br/><br/>--%>
<%--      <form action="teacherLogin" method="post">--%>
<%--          <p>--%>
<%--             	<p>用户名：<input type="text" name="username" id="username"  required /></p><br>--%>
<%--               	<p>密码：<input type="password" name="password" id="password"   required/></p><br>--%>
<%--               	<p><input type="submit" value="提交" />　　　<input type="reset" value="取消" />--%>
<%--        </form> --%>
<%--        <br/>--%>
<%--         <font color='red' size='4'><a href="teacherRegister.jsp">教师注册</a></font> --%>
<%-- </div>      --%>
