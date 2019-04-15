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
<link type="text/css" rel="stylesheet" href="css/common.css" />
<style type="text/css">
<!--
-->
</style>
</head>

<body>
<div align="center"   >
<br/><br/><br/>
<h1>院级领导请登录</h1><br/>
 <%
          request.setCharacterEncoding("utf-8");
          String info =request.getParameter("info");
          if(info!=null && info.equals("fail") ){
            out.println("<br/><font color='red'>用户名或密码不正确！</font>");
          }
         %>
         <br/><br/>
      <form action="<%=basePath%>adminLogin" method="post">
           <p>
             	<p>用户名：<input type="text" name="username" id="username"  required /></p><br>
               	<p>密码：<input type="password" name="password" id="password"   required/></p><br>
               	<p><input type="submit" value="提交" />　　　<input type="reset" value="取消" />
        </form>
</div>
</body>
</html>