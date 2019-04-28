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
    <link type="text/css" rel="stylesheet" href="css/index_collegeLeader.css" />
</head>

<body>

<div class="wrap" id="wrap">
    <div class="logGet">
        <div class="logD logDtip">
            <p class="p1">院长登录</p>
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
        </div>
        <form action="<%=basePath%>collegeleaderLogin" method="post">
        <div class="lgD">
            <input type="text" placeholder="输入用户名" id="username" name="username" required/>
        </div>
        <div class="lgD">
            <input type="password" placeholder="输入用户密码" id="password" name="password" required/>
        </div>
        <div class="logC">
            <input type="submit" value="登录" class="login">
        </div>
            <a href="collegeLeaderRegister.jsp" class="zc" >开始注册</a>
        </form>
    </div>
</div>

</body>

</html>