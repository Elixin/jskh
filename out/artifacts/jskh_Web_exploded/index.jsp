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
<link type="text/css" rel="stylesheet" href="css/index.css" />
<style type="text/css">
<!--
-->
</style>
</head>

<body>
<div align="center"   >
<br/><br/><br/>
<h2>教职工年度考核填报系统</h2><br/><br/>
     <a href="index_teacher.jsp">我是教师</a>　｜
     <a href="index_xingzheng.jsp">我是行政人员</a>　｜
     <a href="index_teamLeader.jsp">我是团队负责人</a>　｜
     <a href="#">我是院领导</a>
 </div>
</body>
</html>